local ok, lint = pcall(require, "lint")
if not ok then
	return
end

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	go = { "golangcilint" },
	rust = { "clippy" },
	java = { "checkstyle" },
}

local group = vim.api.nvim_create_augroup("nvim_lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	group = group,
	callback = function()
		lint.try_lint()
	end,
})
