local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function list_directories(path)
	local dirs = {}
	local handle = vim.uv.fs_scandir(path)
	if not handle then
		return dirs
	end

	while true do
		local name, entry_type = vim.uv.fs_scandir_next(handle)
		if not name then
			break
		end
		if entry_type == "directory" then
			table.insert(dirs, name)
		end
	end

	table.sort(dirs)
	return dirs
end

local function build_language_buttons()
	local base = vim.fn.expand("~/workspace/self/code")
	local lang_dirs = list_directories(base)
	local keys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "a", "s", "d", "z", "x", "c", "v" }
	local buttons = {}

	for i, language in ipairs(lang_dirs) do
		local key = keys[i]
		if not key then
			break
		end

		local dir = base .. "/" .. language
		local cmd = string.format("<cmd>cd %s | Telescope find_files<CR>", vim.fn.fnameescape(dir))
		local label = string.format("  %s", language)
		table.insert(buttons, dashboard.button(key, label, cmd))
	end

	return buttons
end

dashboard.section.header.val = {
	"                                                     ",
	" _   _      _ _         _____     _                _ ",
	"| | | | ___| | | ___   |  ___| __(_) ___ _ __   __| |",
	"| |_| |/ _ \\ | |/ _ \\  | |_ | '__| |/ _ \\ '_ \\ / _` |",
	"|  _  |  __/ | | (_) | |  _|| |  | |  __/ | | | (_| |",
	"|_| |_|\\___|_|_|\\___/  |_|  |_|  |_|\\___|_| |_|\\__,_|",
	"                                                     ",
	"                hello, friend.                       ",
	"                                                     ",
}

local buttons = {
	dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
	dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("p", "  Projects", "<cmd>Telescope projects<CR>"),
	dashboard.button("e", "  Explorer", "<cmd>NvimTreeToggle<CR>"),
	dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

for _, button in ipairs(build_language_buttons()) do
	table.insert(buttons, button)
end

dashboard.section.buttons.val = buttons
dashboard.section.footer.val = "Use p or numeric keys for language folders"
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)

-- Ensure dashboard is shown when Neovim starts without file arguments.
if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
	vim.schedule(function()
		pcall(vim.cmd, "Alpha")
	end)
end
