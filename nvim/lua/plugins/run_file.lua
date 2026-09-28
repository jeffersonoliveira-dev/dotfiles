local M = {}

local function detect_project_dir()
	local current_file = vim.api.nvim_buf_get_name(0)
	if current_file ~= "" then
		local buffer_dir = vim.fs.dirname(current_file)

		local git_dir = vim.fs.find(".git", { path = buffer_dir, upward = true, type = "directory" })[1]
		if git_dir then
			return vim.fs.dirname(git_dir)
		end

		local marker = vim.fs.find({ "package.json", "pyproject.toml", "go.mod", "Cargo.toml", "Makefile" }, {
			path = buffer_dir,
			upward = true,
		})[1]
		if marker then
			return vim.fs.dirname(marker)
		end

		return buffer_dir
	end

	return vim.fn.getcwd()
end

local function first_executable(candidates)
	for _, name in ipairs(candidates) do
		if vim.fn.executable(name) == 1 then
			return name
		end
	end
end

local function shell_quote(path)
	return vim.fn.shellescape(path)
end

local function build_command(file, ft, cwd)
	if ft == "http" or ft == "rest" then
		return "kulala"
	end

	local quoted = shell_quote(file)

	if ft == "python" then
		local py = first_executable({ "python3", "python" })
		return py and ("%s %s"):format(py, quoted)
	end

	if ft == "go" then
		return vim.fn.executable("go") == 1 and ("go run %s"):format(quoted)
	end

	if ft == "lua" then
		local lua = first_executable({ "luajit", "lua" })
		return lua and ("%s %s"):format(lua, quoted)
	end

	if ft == "ruby" then
		return vim.fn.executable("ruby") == 1 and ("ruby %s"):format(quoted)
	end

	if ft == "php" then
		return vim.fn.executable("php") == 1 and ("php %s"):format(quoted)
	end

	if ft == "elixir" then
		return vim.fn.executable("elixir") == 1 and ("elixir %s"):format(quoted)
	end

	if ft == "javascript" or ft == "javascriptreact" then
		if vim.fn.executable("bun") == 1 then
			return ("bun run %s"):format(quoted)
		end
		local node = first_executable({ "node" })
		return node and ("%s %s"):format(node, quoted)
	end

	if ft == "typescript" or ft == "typescriptreact" then
		if vim.fn.executable("bun") == 1 then
			return ("bun run %s"):format(quoted)
		end
		local tsx = first_executable({ "tsx", "npx" })
		if tsx == "tsx" then
			return ("tsx %s"):format(quoted)
		end
		if tsx == "npx" then
			return ("npx tsx %s"):format(quoted)
		end
		local deno = first_executable({ "deno" })
		return deno and ("%s run %s"):format(deno, quoted)
	end

	if ft == "rust" then
		if vim.fn.executable("cargo") == 1 and vim.fs.find("Cargo.toml", { path = cwd, upward = true })[1] then
			return "cargo run"
		end
		if vim.fn.executable("rustc") == 1 then
			local out = shell_quote(vim.fn.fnamemodify(file, ":r"))
			return ("rustc %s -o %s && %s"):format(quoted, out, out)
		end
	end

	if ft == "sh" or ft == "bash" or ft == "zsh" or ft == "fish" then
		local shell = first_executable({ ft, "bash", "sh" })
		return shell and ("%s %s"):format(shell, quoted)
	end

	return nil
end

function M.run()
	local file = vim.api.nvim_buf_get_name(0)
	if file == "" then
		vim.notify("Salve o buffer antes de rodar.", vim.log.levels.WARN)
		return
	end

	local ft = vim.bo.filetype
	local cwd = detect_project_dir()
	local cmd = build_command(file, ft, cwd)

	if not cmd then
		vim.notify(("Sem runner para filetype '%s'."):format(ft), vim.log.levels.WARN)
		return
	end

	if cmd == "kulala" then
		local ok, kulala = pcall(require, "kulala")
		if not ok then
			vim.notify("kulala.nvim não disponível.", vim.log.levels.ERROR)
			return
		end
		kulala.run()
		return
	end

	local ok_toggle, toggleterm = pcall(require, "toggleterm")
	if not ok_toggle then
		vim.notify("toggleterm.nvim não disponível.", vim.log.levels.ERROR)
		return
	end

	toggleterm.exec(cmd, 1, 15, cwd, "horizontal", "run-file", true, true)
end

vim.keymap.set("n", "<leader>rr", function()
	M.run()
end, { desc = "Run current file", noremap = true, silent = true })

return M
