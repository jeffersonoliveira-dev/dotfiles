local ok, aerial = pcall(require, "aerial")
if not ok then
	return
end

aerial.setup({
	backends = { "lsp", "treesitter", "markdown", "man" },
	layout = {
		min_width = 28,
		default_direction = "right",
	},
	show_guides = true,
	filter_kind = false,
})
