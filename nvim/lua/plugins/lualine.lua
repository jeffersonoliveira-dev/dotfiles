local function shorten_path_keep_filename(path)
	local sep = package.config:sub(1, 1)
	local parts = {}

	for part in string.gmatch(path, "([^" .. sep .. "]+)") do
		table.insert(parts, part)
	end

	if #parts <= 1 then
		return path
	end

	local result = {}
	for i = 1, #parts - 1 do
		table.insert(result, parts[i]:sub(1, 1))
	end
	table.insert(result, parts[#parts])

	return table.concat(result, sep)
end

require("lualine").setup({
	options = {
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"branch",
				fmt = function(str)
					if #str > 5 then
						return str:sub(1, 5) .. "…"
					end
					return str
				end,
			},
			"diff",
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
				fmt = shorten_path_keep_filename,
			},
		},
		lualine_x = { "diagnostics", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_c = { { "filename", path = 1, file_status = true } },
	},
	winbar = {
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
				newfile_status = true,
				symbols = {
					modified = " ●",
					readonly = " ",
					unnamed = "[No Name]",
					newfile = " [New]",
				},
				fmt = shorten_path_keep_filename,
			},
		},
	},
	inactive_winbar = {
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
				newfile_status = true,
				symbols = {
					modified = " ●",
					readonly = " ",
					unnamed = "[No Name]",
					newfile = " [New]",
				},
				fmt = shorten_path_keep_filename,
			},
		},
	},
	extensions = {},
})
