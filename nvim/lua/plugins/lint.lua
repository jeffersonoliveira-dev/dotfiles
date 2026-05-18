local ok, lint = pcall(require, "lint")
if not ok then
	return
end

local function has(bin)
	return vim.fn.executable(bin) == 1
end

local linters_by_ft = {
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	rust = { "clippy" },
	java = { "checkstyle" },
}

-- golangci-lint is optional; without it nvim-lint raises ENOENT on every :w
if has("golangci-lint") then
	linters_by_ft.go = { "golangcilint" }
elseif has("staticcheck") then
	linters_by_ft.go = { "staticcheck" }
elseif has("revive") then
	linters_by_ft.go = { "revive" }
end

lint.linters_by_ft = linters_by_ft

local group = vim.api.nvim_create_augroup("nvim_lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	group = group,
	callback = function()
		lint.try_lint()
	end,
})
