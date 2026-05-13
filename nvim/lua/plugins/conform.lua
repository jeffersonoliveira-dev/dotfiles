local function has(bin)
	return vim.fn.executable(bin) == 1
end

local js_formatters = {}
if has("prettierd") then
	js_formatters = { "prettierd", "prettier" }
elseif has("prettier") then
	js_formatters = { "prettier" }
end

local go_formatters = {}
if has("gofumpt") then
	go_formatters = { "gofumpt", "gofmt" }
elseif has("gofmt") then
	go_formatters = { "gofmt" }
end

local formatters_by_ft = {
	lua = { "stylua" },
	json = { "jq" },
	rust = { "rustfmt" },
	python = { "ruff_format", "black" },
	htmldjango = { "djlint" },
	html = { "djlint" },
	javascript = js_formatters,
	typescript = js_formatters,
	javascriptreact = js_formatters,
	typescriptreact = js_formatters,
}
if #go_formatters > 0 then
	formatters_by_ft.go = go_formatters
end

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
	formatters_by_ft = formatters_by_ft,
})
