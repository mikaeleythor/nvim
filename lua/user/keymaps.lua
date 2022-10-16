M = {}
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap


-- map space as leader key
keymap('n', '<space>', '', opts)
vim.g.mapleader = " "
vim.g.maclocalleader = " "

keymap('n', '<c-s>', ':w<CR>', opts)
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

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
keymap('n', '<c-w>', ':tabc<Return>', opts)

-- Traverse tabs
keymap('n', '<c-s-l>', 'gt', opts)
keymap('v', '<c-s-l>', 'gt', opts)
keymap('n', '<c-s-h>', 'gT', opts)
keymap('v', '<c-s-h>', 'gT', opts)

keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
keymap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
keymap('n', 'gr', ':lua vim.lsp.buf.references()<cr>', opts)
keymap('n', 'gb', ':lua vim.lsp.buf.type_definition()<cr>', opts)
keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
-- keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)

-- Formatting
keymap('n', '<leader>fo', ':lua vim.lsp.buf.format { async = true }<cr>', opts)

-- Telescope
keymap('n', '<leader>ff', ':Telescope find_files<cr>', opts)
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<cr>', opts)
keymap('n', '<leader>fh', ':Telescope oldfiles<cr>', opts)

keymap('n', '<A-o>', "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
keymap('n', 'rv', "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
keymap('v', 'rv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
keymap('n', 'rc', "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
keymap('v', 'rc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
keymap('v', 'rm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)


keymap('n', "<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
keymap('n', "<leader>df", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)

keymap('n', "<F5>", "<Cmd>lua require'dap'.continue()<CR>", opts)
keymap('n', "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", opts)
keymap('n', "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", opts)
keymap('n', "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", opts)
keymap('n', "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap('n', "<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap('n', "<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap('n', "<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", opts)
keymap('n', "<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", opts)
