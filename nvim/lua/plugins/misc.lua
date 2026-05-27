require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.icons").setup()

require("tiny-inline-diagnostic").setup()

require("bufferline").setup({
	options = {
		mode = "buffers",
		numbers = "none",
		separator_style = "thin",
		modified_icon = "●",
		show_modified_icon = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				separator = true,
			},
		},
		name_formatter = function(buf)
			local filename = vim.fn.fnamemodify(buf.name, ":t")
			if filename == "" then
				return "[No Name]"
			end
			return filename
		end,
	},
})
