vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
	callback = function(args)
		local client_id = args.data.client_id
		if not client_id then
			return
		end

		local bufnr = args.buf
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
			vim.lsp.buf.format({ async = true })
		end, "Format buffer")
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_blink, blink = pcall(require, "blink.cmp")
if ok_blink and blink.get_lsp_capabilities then
	capabilities = blink.get_lsp_capabilities(capabilities)
end

local servers = {
	gopls = {
		capabilities = capabilities,
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
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
					diagnosticMode = "workspace",
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
					command = "clippy",
				},
			},
		},
	},
	solargraph = {
		capabilities = capabilities,
		cmd = { "solargraph", "stdio" },
	},
	ts_ls = {
		capabilities = capabilities,
		settings = {
			typescript = {
				suggest = {
					autoImports = true,
				},
				preferences = {
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},
			},
			javascript = {
				suggest = {
					autoImports = true,
				},
				preferences = {
					includeCompletionsForModuleExports = true,
					includeCompletionsForImportStatements = true,
				},
			},
		},
	},
}

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
	virtual_text = {
		spacing = 2,
		source = "if_many",
		prefix = "●",
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
