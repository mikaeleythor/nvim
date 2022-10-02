local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Set space to leader
keymap('', '<space>', '<leader>', {})

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- New line up/down from insert mode
--keymap('i', '<c-j>', '<Esc>o', opts)
--keymap('i', '<c-k>', '<Esc>O', opts)

-- Nerdtree
keymap('n', '<c-n>', ':NERDTreeToggle<Return>', opts)
keymap('v', '<c-n>', ':NERDTreeToggle<Return>', opts)

-- Tagbar
keymap('n', '<c-b>', ':TagbarToggle<Return>', opts)
keymap('v', '<c-b>', ':TagbarToggle<Return>', opts)

-- Move selection up/down
keymap('i', '<a-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<a-k>', '<Esc>:m .-2<CR>==gi', opts)
keymap('v', '<a-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<a-k>', ":m '>-2<CR>gv=gv", opts)

-- Move cursor between windows
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Move windows
keymap('n', '<a-h>', '<c-w>H', opts)
keymap('n', '<a-j>', '<c-w>J', opts)
keymap('n', '<a-k>', '<c-w>K', opts)
keymap('n', '<a-l>', '<c-w>L', opts)

-- New tab
keymap('n', '<c-t>', ':tabnew<Return>', opts)
keymap('i', '<c-t>', ':tabnew<Return>', opts)

-- Close tab
keymap('n', '<c-w>', ':tabc<Return>', opts)
keymap('i', '<c-w>', ':tabc<Return>', opts)

-- Traverse tabs
keymap('n', '<c-s-l>', 'gt', opts)
keymap('v', '<c-s-l>', 'gt', opts)
keymap('n', '<c-s-h>', 'gT', opts)
keymap('v', '<c-s-h>', 'gT', opts)

-- Keymap for normal mode
local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gb', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
-- nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

-- Formatting
nkeymap('<leader>fo', ':lua vim.lsp.buf.formatting()<cr>')

-- Telescope
nkeymap('<leader>ff', ':Telescope find_files<cr>')
nkeymap('<leader>fg', ':Telescope live_grep<cr>')
nkeymap('<leader>fb', ':Telescope buffers<cr>')
nkeymap('<leader>fh', ':Telescope oldfiles<cr>')

keymap('n', '<A-o>', "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
keymap('n', 'rv', "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
keymap('v', 'rv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
keymap('n', 'rc', "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
keymap('v', 'rc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
keymap('v', 'rm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)


-- If using nvim-dap
-- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
--nnoremap <leader>df <Cmd>lua require'jdtls'.test_class()<CR>
--nnoremap <leader>dn <Cmd>lua require'jdtls'.test_nearest_method()<CR>

nkeymap("<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>")
nkeymap("<leader>df", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")

nkeymap("<F5>", "<Cmd>lua require'dap'.continue()<CR>")
nkeymap("<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
nkeymap("<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
nkeymap("<F12>", "<Cmd>lua require'dap'.step_out()<CR>")
nkeymap("<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
nkeymap("<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
nkeymap("<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
nkeymap("<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>")
nkeymap("<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>")
