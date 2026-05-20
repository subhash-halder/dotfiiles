local dapJsTable = { "javascript", "typescript", "typescriptreact" }
local function selectPort()
	local portList = {
		"Default port: {9229}",
		"Search Service teflon: {9233}",
		"Search Service Prod: {9237}",
	}
	local port = require("dap.ui").pick_one(portList, "Select port: ")
	return port:match("%d+")
end

local dap = require("dap")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = "node",
		-- 💀 Make sure to update this path to point to your installation
		args = { "/Users/subhash/Documents/work/js-debug/src/dapDebugServer.js", "${port}" },
	},
}

for _, v in ipairs(dapJsTable) do
	dap.configurations[v] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-node",
			request = "attach",
			name = "Attach",
			processId = require("dap.utils").pick_process,
			port = selectPort,
			cwd = "${workspaceFolder}",
		},
		{
			type = "pwa-chrome",
			request = "launch",
			name = 'Start Chrome with "localhost"',
			url = "http://localhost:3000",
			webRoot = "${workspaceFolder}",
			userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
		},
	}
end
