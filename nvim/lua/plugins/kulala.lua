local ok, kulala = pcall(require, "kulala")
if not ok then
	return
end

-- REST client: .http files (IntelliJ / VS Code REST Client style). Requires `curl`.
-- Docs: https://neovim.getkulala.net
kulala.setup({
	global_keymaps = true,
	global_keymaps_prefix = "<leader>R",
	kulala_keymaps_prefix = "",
})
