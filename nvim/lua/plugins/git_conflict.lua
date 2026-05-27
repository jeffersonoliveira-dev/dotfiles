-- Inline conflict highlights + accept ours/theirs/both (buffer-local keys in conflicted files).
require("git-conflict").setup({
	default_mappings = true,
	default_commands = true,
	disable_diagnostics = true,
	list_opener = "copen",
	highlights = {
		incoming = "DiffAdd",
		current = "DiffText",
	},
})

local function git_root()
	local git_dir = vim.fs.find(".git", { path = vim.uv.cwd(), upward = true, type = "directory" })[1]
	if not git_dir then
		return nil
	end
	return vim.fs.dirname(git_dir), git_dir
end

local function unmerged_files(root)
	local lines = vim.fn.systemlist({ "git", "-C", root, "diff", "--name-only", "--diff-filter=U" })
	if vim.v.shell_error ~= 0 then
		return {}
	end
	return lines
end

local function merge_in_progress(git_dir)
	return vim.fn.filereadable(git_dir .. "/MERGE_HEAD") == 1
		or vim.fn.isdirectory(git_dir .. "/rebase-merge") == 1
		or vim.fn.isdirectory(git_dir .. "/rebase-apply") == 1
		or vim.fn.filereadable(git_dir .. "/CHERRY_PICK_HEAD") == 1
end

local function notify_project_conflicts()
	local root, git_dir = git_root()
	if not root then
		return
	end

	local files = unmerged_files(root)
	local n = #files
	if n == 0 and not merge_in_progress(git_dir) then
		return
	end

	local msg
	if n > 0 then
		msg = string.format("Git: %d unmerged file(s). <leader>gm → Diffview, :GitConflictListQf → list.", n)
	else
		msg = "Git: merge/rebase in progress (no unmerged paths listed yet). <leader>gm → Diffview."
	end
	vim.notify(msg, vim.log.levels.WARN, { title = "Merge conflicts" })
end

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
	group = vim.api.nvim_create_augroup("git_conflict_status", { clear = true }),
	callback = function()
		vim.schedule(notify_project_conflicts)
	end,
})

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("git_conflict_detected", { clear = true }),
	pattern = "GitConflictDetected",
	callback = function(ev)
		local file = vim.fn.fnamemodify(ev.file or vim.api.nvim_buf_get_name(0), ":t")
		vim.notify("Conflict markers in " .. file .. " — co/ct/cb/c0 to resolve, ]x/[x to jump.", vim.log.levels.WARN)
	end,
})
