vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2
--require 'jdtls_setup'.setup()
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', '.gitignore'})
local home = os.getenv('HOME')
local workspace_dir = home .. "/.workspace" .. project_name
--local jar_patterns = {
--'/.config/nvim/.extensions/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
--'/.config/nvim/.extensions/vscode-java-test/server/*.jar',
--}

--local bundles = {}
--for _, jar_pattern in ipairs(jar_patterns) do
--for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then table.insert(bundles, bundle)
--end
--end
--end


-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {

		-- 💀
		'java', -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xms1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

		-- 💀
		'-jar', home .. '/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

		-- 💀
		'-configuration', home .. '/.local/share/nvim/lsp_servers/jdtls/config_LINUX', -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.


		-- 💀
		-- See `data directory configuration` section in the README
		'-data', workspace_dir,
	},

	-- 💀
	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = root_dir,

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
		}
	},

	-- Language server `initializationOptions`
	-- You need to extend the `bundles` with paths to jar files
	-- if you want to use additional eclipse.jdt.ls plugins.
	--
	-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
	--
	-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
	init_options = {
		--bundles = {
		--vim.fn.glob(home .. '/.config/nvim/.extensions/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar')
		--},
		extendedClientCapabilities = require 'jdtls'.extendedClientCapabilities,
	},
}

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
	vim.fn.glob(home .. '/.config/nvim/.extensions/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar')
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. '/.config/nvim/.extensions/vscode-java-test/server/*.jar'), "\n"))
config['init_options'] = {
	bundles = bundles;
}

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
require 'jdtls'.setup_dap({ hotcodereplace = "auto" })
--require('jdtls.dap').setup_dap_main_class_configs()
require 'jdtls.setup'.add_commands()
