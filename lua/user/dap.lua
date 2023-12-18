vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/cinder/Downloads/cpptools-linux/extension/debugAdapters/OpenDebugAD7",
}

dap.configurations.cpp = {
	{
		name = "gdbserver",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		cwd = "${workspaceFolder}",
		miDebuggerPath = "/usr/bin/gdb",
		-- miDebuggerArgs = "-x ./.gdbinit",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		stopAtEntry = true,
	},
	{
		name = "Launch (vscode-cpptools)",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
}

dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			command = "/home/cinder/.virtualenvs/debugpy/bin/python",
			args = { "-m", "debugpy.adapter" },
			options = {
				source_filetype = "python",
			},
		})
	end
end

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
			local cwd = vim.fn.getcwd()
			local venv = os.getenv("VIRTUAL_ENV")
			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
				return cwd .. "/venv/bin/python"
			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
				return cwd .. "/.venv/bin/python"
			elseif venv == nil or venv == "" then
				return "/usr/bin/python3"
			else
				return os.getenv("VIRTUAL_ENV") .. "/bin/python"
			end
		end,
	},
}

-- NOTE: Django confs
table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "Django",
	program = vim.fn.getcwd() .. "/manage.py", -- NOTE: Adapt path to manage.py as needed
	args = { "runserver", "--noreload" },
})

dap.configurations.java = {
	{
		-- You need to extend the classPath to list your dependencies.
		-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
		classPaths = { "$Auto" },

		-- If using multi-module projects, remove otherwise.
		-- projectName = "yourProjectName",

		javaExec = "/usr/bin/java",
		-- mainClass = "com.cinder.Mergesort",
		mainClass = function()
			return vim.fn.input("your.package.name.MainClassName: ", "com.cinder.")
		end,

		-- If using the JDK9+ module system, this needs to be extended
		-- `nvim-jdtls` would automatically populate this property
		modulePaths = { "$Auto" },
		name = "Launch YourClassName",
		request = "launch",
		type = "java",
		stopOnEntry = true,
	},
}
