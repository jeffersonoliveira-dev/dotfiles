local dap = require("dap")
local dapui = require("dapui")

require("nvim-dap-virtual-text").setup({})

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

local function setup_js_ts_debug()
	local ok, dap_vscode_js = pcall(require, "dap-vscode-js")
	if not ok then
		return
	end

	local debugger_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/vscode-js-debug"
	if vim.fn.isdirectory(debugger_path) == 0 then
		vim.notify(
			"vscode-js-debug not found. Open Neovim once to install plugins.",
			vim.log.levels.WARN
		)
		return
	end

	dap_vscode_js.setup({
		debugger_path = debugger_path,
		adapters = {
			"pwa-node",
			"node-terminal",
			"pwa-chrome",
			"pwa-msedge",
			"pwa-extensionHost",
		},
	})

	local js_ts_configurations = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Node: current file",
			program = "${file}",
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			console = "integratedTerminal",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Node: npm run dev",
			runtimeExecutable = "npm",
			runtimeArgs = { "run", "dev" },
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Node: attach process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Bun: current file",
			runtimeExecutable = "bun",
			runtimeArgs = { "${file}" },
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			console = "integratedTerminal",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Bun: run dev",
			runtimeExecutable = "bun",
			runtimeArgs = { "run", "dev" },
			cwd = "${workspaceFolder}",
			sourceMaps = true,
			console = "integratedTerminal",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Bun: attach process",
			processId = require("dap.utils").pick_process,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "launch",
			name = "Node: debug current test file",
			runtimeExecutable = "node",
			runtimeArgs = { "--test", "${file}" },
			cwd = "${workspaceFolder}",
			console = "integratedTerminal",
		},
	}

	for _, language in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
		dap.configurations[language] = js_ts_configurations
	end
end

setup_js_ts_debug()

-- Go debugger via Delve (requires `dlv` installed on PATH).
dap.adapters.go = function(callback, _)
	local port = 38697
	local handle
	local pid_or_err

	handle, pid_or_err = vim.loop.spawn("dlv", {
		args = { "dap", "-l", "127.0.0.1:" .. port },
		detached = true,
	}, function()
		if handle then
			handle:close()
		end
	end)

	if not handle then
		vim.notify("Failed to start delve: " .. tostring(pid_or_err), vim.log.levels.ERROR)
		return
	end

	vim.defer_fn(function()
		callback({ type = "server", host = "127.0.0.1", port = port })
	end, 100)
end

dap.configurations.go = {
	{
		type = "go",
		name = "Debug current file",
		request = "launch",
		program = "${file}",
	},
	{
		type = "go",
		name = "Debug current package",
		request = "launch",
		program = "${fileDirname}",
	},
	{
		type = "go",
		name = "Debug current test",
		request = "launch",
		mode = "test",
		program = "${file}",
	},
}
