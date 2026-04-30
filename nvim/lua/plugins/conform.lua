require("conform").setup({
	format_on_save = function(bufnr)
		local max_size = 200 * 1024
		local file = vim.api.nvim_buf_get_name(bufnr)
		if file ~= "" then
			local stat = vim.uv.fs_stat(file)
			if stat and stat.size > max_size then
				return nil
			end
		end

		return {
			timeout_ms = 300,
			lsp_fallback = false,
		}
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "jq" },
		rust = { "rustfmt" },
		python = { "ruff_format", "black" },
		htmldjango = { "djlint" },
		html = { "djlint" },
		javascript = { "prettierd", "prettier" },
		typescript = { "prettierd", "prettier" },
		javascriptreact = { "prettierd", "prettier" },
		typescriptreact = { "prettierd", "prettier" },
	},
})
