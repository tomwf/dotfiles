require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "js" },
})

-- Configure dapui
require("dapui").setup()
local dap, dapui = require("dap"), require("dapui")
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

-- Adapters
dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		args = {
			vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
			"${port}",
		},
	},
}

-- Configurations
dap.configurations.javascript = {
	{
		name = "Launch JS file",
		type = "pwa-node",
		request = "launch",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
}
dap.configurations.typescript = {
	{
		name = "Launch TS file",
		type = "pwa-node",
		request = "launch",
		program = "${file}",
		runtimeExecutable = "deno",
		runtimeArgs = {
			"run",
			"--inspect-wait",
			"--allow-all",
		},
		cwd = "${workspaceFolder}",
		attachSimplePort = 9229,
	},
	{
		name = "Launch NestJS",
		type = "pwa-node",
		request = "launch",
		runtimeExecutable = "npm",
		runtimeArgs = { "run", "start:debug" },
		args = { "${workspaceFolder}/src/main.ts" },
		envFile = "${workspaceFolder}/.env",
		cwd = "${workspaceFolder}",
		sourceMaps = true,
		protocol = "inspector",
		outFiles = { "${workspaceFolder}/dist/**/*.js" },
		console = "integratedTerminal",
		internalConsoleOptions = "neverOpen",
	},
	{
		name = "Launch NestJS tests",
		type = "pwa-node",
		request = "launch",
		runtimeExecutable = "npm",
		runtimeArgs = { "run", "test" },
		cwd = "${workspaceFolder}",
		sourceMaps = true,
		protocol = "inspector",
		outFiles = { "${workspaceFolder}/dist/**/*.js" },
		console = "integratedTerminal",
		internalConsoleOptions = "neverOpen",
	},
}
