-- vim-visual-multi: `vim.g` must be set before `vim.pack.add` loads the plugin
-- (see top of config/plugins.lua). Neovim 0.12.x is fine — same as older versions here.
vim.g.VM_default_mappings = 1

-- Estilo VS Code: Ctrl+D na palavra, depois Ctrl+D de novo para cada próxima ocorrência.
-- Nota: isso ocupa <C-d> no normal (deixa de ser "scroll half page"; use <C-u> ou zz, etc.).
vim.g.VM_maps = {
	["Find Under"] = "<C-d>",
	["Find Next"] = "<C-d>",
}
