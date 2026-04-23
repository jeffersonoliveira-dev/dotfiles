vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local function set_wrap()
	vim.opt.wrap = true
	vim.opt.linebreak = true
	vim.keymap.set("n", "j", "gj")
	vim.keymap.set("n", "k", "gk")
end

local function set_nowrap()
	vim.opt.wrap = false
	vim.opt.linebreak = false
	vim.keymap.set("n", "j", "j")
	vim.keymap.set("n", "k", "k")
end

vim.keymap.set("n", "<leader>w", set_wrap)
vim.keymap.set("n", "<leader>W", set_nowrap)

vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

vim.keymap.set("n", "Y", "yy")
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set("n", "<leader>ge", function()
	vim.diagnostic.jump({ count = 1 })
end)
vim.keymap.set("n", "<leader>gE", function()
	vim.diagnostic.jump({ count = -1 })
end)

vim.keymap.set("n", "<leader>sn", ":cnext<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sp", ":cprev<CR>", { noremap = true })

-- IDE-like tree/file navigation
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle explorer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFindFile<CR>", { desc = "Reveal current file in explorer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFocus<CR>", { desc = "Focus explorer", noremap = true, silent = true })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus left window", noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus lower window", noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus upper window", noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus right window", noremap = true, silent = true })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer", noremap = true, silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers", noremap = true, silent = true })
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1", noremap = true, silent = true })
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2", noremap = true, silent = true })
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3", noremap = true, silent = true })
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4", noremap = true, silent = true })
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5", noremap = true, silent = true })
vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6", noremap = true, silent = true })
vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7", noremap = true, silent = true })
vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8", noremap = true, silent = true })
vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9", noremap = true, silent = true })
vim.keymap.set("n", "gt", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gT", "<cmd>bprevious<CR>", { noremap = true, silent = true })

-- Debug (DAP)
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Debug continue" })
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "Debug step over" })
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "Debug step into" })
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "Debug step out" })
vim.keymap.set("n", "<leader>db", function()
	require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dB", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional breakpoint" })
vim.keymap.set("n", "<leader>du", function()
	require("dapui").toggle({})
end, { desc = "Toggle debug UI" })
vim.keymap.set("n", "<leader>dr", function()
	require("dap").repl.open()
end, { desc = "Open debug REPL" })
