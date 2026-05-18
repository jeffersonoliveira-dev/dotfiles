vim.opt.shortmess:append("c")

vim.g.experimental_ui2 = vim.env.NVIM_UI2 ~= "0"
if vim.g.experimental_ui2 then
	local ok_ui2, ui2 = pcall(require, "vim._core.ui2")
	if ok_ui2 then
		ui2.enable({
			enable = true,
			msg = {
				targets = "msg",
				msg = { timeout = 3000 },
			},
		})
	end
	vim.opt.cmdheight = 0
else
	vim.opt.cmdheight = 2
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.updatetime = 500
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
-- Default border for LSP hovers, signature help, etc. (Neovim 0.11+). Plugins can override.
if vim.fn.has("nvim-0.11") == 1 then
	vim.o.winborder = "rounded"
end
vim.opt.completeopt = "menu,menuone,noselect,popup"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.conceallevel = 2

-- Visible whitespace (built-in); subtle via |hl-Whitespace| after colorscheme loads
vim.opt.list = true
vim.opt.listchars = "tab:▸ ,space:·,trail:·,extends:>,precedes:<,nbsp:+"
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Whitespace", { fg = "#4b5263" })
	end,
})
