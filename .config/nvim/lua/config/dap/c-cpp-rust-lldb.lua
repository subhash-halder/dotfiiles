-- Download lldb from https://github.com/vadimcn/codelldb/releases/tag/v1.12.2
-- unzip the file like unzip codelldb-darwin-arm64.vsix -d codelldb
-- copy the codelldb to ~/opt/
-- use the file from ~/opt/codelldb/extension/adapter/codelldb
local dap = require("dap")
dap.adapters.codelldb = {
	type = "executable",
	command = "/Users/subhash/opt/codelldb/extension/adapter/codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

	-- On windows you may have to uncomment this:
	-- detached = false,
}
dap.configurations.c = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
