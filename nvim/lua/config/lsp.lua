-- CodeLens (tsserver / gopls): `editor.action.showReferences` vem do servidor.
local function lsp_cmd_show_references(command, ctx)
	local args = command.arguments or {}
	local locations = args[3]
	if not locations or #locations == 0 then
		return
	end
	local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
	local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
	vim.fn.setloclist(0, {}, " ", { title = command.title, items = items, context = ctx })
	vim.cmd.lopen()
end

vim.lsp.commands["editor.action.showReferences"] = lsp_cmd_show_references

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
	callback = function(args)
		local client_id = args.data.client_id
		if not client_id then
			return
		end

		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(client_id)
		if not client then
			return
		end

		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
		end

		map("n", "K", vim.lsp.buf.hover, "LSP Hover")
		map("n", "gd", vim.lsp.buf.definition, "Go to definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
		map("n", "gr", vim.lsp.buf.references, "References")
		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		map("n", "<leader>f", function()
			require("conform").format({
				async = true,
				lsp_fallback = true,
			})
		end, "Format buffer")

		-- Neovim 0.12+: use |vim.lsp.codelens.enable()| (refresh() is deprecated).
		-- O provider reage a mudanças de linhas/recarga do buffer; não precisa de autocmd extra.
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_codeLens) then
			vim.lsp.codelens.enable(true, { bufnr = bufnr })
		end

		-- Inlay hints (TS/vtsls, gopls): o servidor já recebe settings; o cliente precisa habilitar por buffer.
		if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink and blink.get_lsp_capabilities then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

local ts_ls_bin = vim.fn.exepath("typescript-language-server")
if ts_ls_bin == "" then
	ts_ls_bin = "typescript-language-server"
end
local ts_ls_entry = vim.uv.fs_realpath(ts_ls_bin) or ts_ls_bin
local vtsls_bin = vim.fn.exepath("vtsls")
if vtsls_bin == "" then
	vtsls_bin = "vtsls"
end
local vtsls_entry = vim.uv.fs_realpath(vtsls_bin) or vtsls_bin
local node_bin = "/usr/bin/node"
if vim.fn.executable(node_bin) ~= 1 then
	node_bin = vim.fn.exepath("node")
end

local ts_server_name = vim.fn.executable(vtsls_entry) == 1 and "vtsls" or "ts_ls"

local function ts_js_inlay()
	return {
		parameterNames = { enabled = "literals" },
		parameterTypes = { enabled = true },
		variableTypes = { enabled = true },
		propertyDeclarationTypes = { enabled = true },
		functionLikeReturnTypes = { enabled = true },
		enumMemberValues = { enabled = true },
	}
end

local ts_js_prefs = {
	includeCompletionsForModuleExports = true,
	includeCompletionsForImportStatements = true,
}

-- Arquivos TS/JS fora de tsconfig: módulo estilo Node costuma alinhar resolução e ATA (@types/node).
-- Se ainda faltar `console`/`process`, use `npm i -D @types/node` no diretório ou um tsconfig/jsconfig mínimo.
local ts_settings = {
	["js/ts.implicitProjectConfig.module"] = "NodeNext",
	["js/ts.implicitProjectConfig.target"] = "ES2022",
	typescript = {
		suggest = { autoImports = true },
		preferences = ts_js_prefs,
		tsserver = { maxTsServerMemory = 8192 },
		inlayHints = ts_js_inlay(),
	},
	javascript = {
		suggest = { autoImports = true },
		preferences = ts_js_prefs,
		inlayHints = ts_js_inlay(),
	},
}

if ts_server_name == "vtsls" then
	ts_settings.vtsls = {
		autoUseWorkspaceTsdk = true,
		experimental = {
			completion = { enableServerSideFuzzyMatch = true },
		},
	}
end

local ts_server_config = {
	capabilities = capabilities,
	init_options = { hostInfo = "neovim" },
	settings = ts_settings,
}

if ts_server_name == "vtsls" then
	ts_server_config.cmd = { node_bin, vtsls_entry, "--stdio" }
else
	ts_server_config.cmd = { node_bin, ts_ls_entry, "--stdio" }
	-- typescript-language-server: ações "source.*" e rename de extração
	ts_server_config.handlers = {
		["_typescript.rename"] = function(_, result, ctx)
			local c = assert(vim.lsp.get_client_by_id(ctx.client_id))
			vim.lsp.util.show_document({
				uri = result.textDocument.uri,
				range = {
					start = result.position,
					["end"] = result.position,
				},
			}, c.offset_encoding)
			vim.lsp.buf.rename()
			return vim.NIL
		end,
	}
	ts_server_config.commands = {
		["editor.action.showReferences"] = lsp_cmd_show_references,
	}
	ts_server_config.on_attach = function(client, bufnr)
		vim.api.nvim_buf_create_user_command(bufnr, "LspTypescriptSourceAction", function()
			local cap = client.server_capabilities.codeActionProvider
			local kind_list = type(cap) == "table" and cap.codeActionKinds
			if not kind_list then
				vim.notify("Source actions: servidor não expõe codeActionKinds", vim.log.levels.INFO)
				return
			end
			local source_actions = vim.tbl_filter(function(action)
				return vim.startswith(action, "source.")
			end, kind_list)
			if vim.tbl_isempty(source_actions) then
				return
			end
			vim.lsp.buf.code_action({
				context = { only = source_actions, diagnostics = {} },
			})
		end, {})
		vim.api.nvim_buf_create_user_command(bufnr, "LspTypescriptGoToSourceDefinition", function()
			local win = vim.api.nvim_get_current_win()
			local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
			client:exec_cmd({
				command = "_typescript.goToSourceDefinition",
				title = "Go to source definition",
				arguments = { params.textDocument.uri, params.position },
			}, { bufnr = bufnr }, function(err, result)
				if err then
					vim.notify("Go to source definition failed: " .. err.message, vim.log.levels.ERROR)
					return
				end
				if not result or vim.tbl_isempty(result) then
					vim.notify("No source definition found", vim.log.levels.INFO)
					return
				end
				vim.lsp.util.show_document(result[1], client.offset_encoding, { focus = true })
			end)
		end, { desc = "Go to source definition" })
	end
end

local json_schemas = {}
local yaml_schemas = {}
do
	local ok_ss, schemastore = pcall(require, "schemastore")
	if ok_ss then
		local okj, j = pcall(function()
			return schemastore.json.schemas()
		end)
		if okj and j then
			json_schemas = j
		end
		local oky, y = pcall(function()
			return schemastore.yaml.schemas()
		end)
		if oky and y then
			yaml_schemas = y
		end
	end
end

local servers = {
	gopls = {
		capabilities = capabilities,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
					shadow = true,
				},
				staticcheck = true,
				gofumpt = true,
				semanticTokens = true,
				usePlaceholders = true,
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},
	jdtls = {
		capabilities = capabilities,
		cmd = { "jdtls" },
		filetypes = { "java" },
		root_markers = {
			".git",
			"gradlew",
			"mvnw",
			"pom.xml",
			"build.gradle",
			"build.gradle.kts",
			"settings.gradle",
			"settings.gradle.kts",
		},
		single_file_support = false,
	},
	pyright = {
		capabilities = capabilities,
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "openFilesOnly",
					typeCheckingMode = "basic",
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
	rust_analyzer = {
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					command = "check",
				},
			},
		},
	},
	solargraph = {
		capabilities = capabilities,
		cmd = { "solargraph", "stdio" },
	},
}

servers[ts_server_name] = ts_server_config

local jsonls_bin = vim.fn.exepath("vscode-json-language-server")
if jsonls_bin ~= "" then
	servers.jsonls = {
		capabilities = capabilities,
		cmd = { jsonls_bin, "--stdio" },
		filetypes = { "json", "jsonc" },
		init_options = { provideFormatter = true },
		root_markers = { ".git" },
		single_file_support = true,
		settings = {
			json = {
				validate = { enable = true },
				schemas = json_schemas,
			},
		},
	}
end

local emmet_ls_bin = vim.fn.exepath("emmet-ls")
if emmet_ls_bin ~= "" then
	servers.emmet_ls = {
		capabilities = capabilities,
		cmd = { emmet_ls_bin, "--stdio" },
		filetypes = {
			"css",
			"eruby",
			"html",
			"htmldjango",
			"javascriptreact",
			"less",
			"pug",
			"sass",
			"scss",
			"typescriptreact",
			"htmlangular",
		},
		root_markers = { ".git" },
		single_file_support = true,
	}
end

local yamlls_bin = vim.fn.exepath("yaml-language-server")
if yamlls_bin ~= "" then
	servers.yamlls = {
		capabilities = capabilities,
		cmd = { yamlls_bin, "--stdio" },
		filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
		root_markers = { ".git" },
		single_file_support = true,
		settings = {
			redhat = { telemetry = { enabled = false } },
			yaml = {
				format = { enable = true },
				schemaStore = { enable = false, url = "" },
				schemas = yaml_schemas,
			},
		},
		on_init = function(client)
			client.server_capabilities.documentFormattingProvider = true
		end,
	}
end

for name, config in pairs(servers) do
	vim.lsp.config(name, config)
end

vim.lsp.enable(vim.tbl_keys(servers))

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	float = {
		border = "rounded",
		source = "if_many",
	},
	underline = true,
	virtual_text = false,
	jump = {
		float = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
		},
	},
})
