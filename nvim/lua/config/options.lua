vim.opt.shortmess:append("c")

vim.opt.cmdheight = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.updatetime = 4000
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,menuone,noselect,popup"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.conceallevel = 2

require("vim._core.ui2").enable({})
