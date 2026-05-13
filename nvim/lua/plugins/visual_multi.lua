-- vim-visual-multi: `vim.g` must be set before `vim.pack.add` loads the plugin
-- (see top of config/plugins.lua). Neovim 0.12.x is fine — same as older versions here.
vim.g.VM_default_mappings = 1

-- Multi-cursor: Alt+D na palavra, depois Alt+D em cada próxima ocorrência (estilo VS Code).
-- <C-d> fica livre para o padrão do Vim (meia página para baixo no normal).
-- Se o terminal não enviar Alt+d corretamente, troque para "<leader>vd" ou "<C-S-n>" aqui.
vim.g.VM_maps = {
	["Find Under"] = "<M-d>",
	["Find Next"] = "<M-d>",
}
