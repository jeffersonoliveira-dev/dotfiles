local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

trouble.setup({
	focus = true,
	warn_no_results = false,
	open_no_results = false,
})
