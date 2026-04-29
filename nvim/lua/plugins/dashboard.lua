local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

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

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
	dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("e", "  Explorer", "<cmd>NvimTreeToggle<CR>"),
	dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

dashboard.section.footer.val = "Use f/r to start"
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
