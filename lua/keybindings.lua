local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
vim.g.mapleader = "æ"

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

keymap('i', '<c-j>', '<Esc>o', opts)
keymap('i', '<c-k>', '<Esc>O', opts)

keymap('n', '<c-n>', ':NERDTreeToggle<Return>', opts)
keymap('v', '<c-n>', ':NERDTreeToggle<Return>', opts)

keymap('n', '<c-b>', ':TagbarToggle<Return>', opts)
keymap('v', '<c-b>', ':TagbarToggle<Return>', opts)

keymap('i', '<a-j>', '<Esc>:m .+1<CR>==gi', opts)
keymap('i', '<a-k>', '<Esc>:m .-2<CR>==gi', opts)
keymap('v', '<a-j>', ":m '>+1<CR>gv=gv", opts)
keymap('v', '<a-k>', ":m '>-2<CR>gv=gv", opts)

keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

keymap('n', '<a-h>', '<c-w>H', opts)
keymap('n', '<a-j>', '<c-w>J', opts)
keymap('n', '<a-k>', '<c-w>K', opts)
keymap('n', '<a-l>', '<c-w>L', opts)

keymap('n', '<c-t>', ':tabnew<Return>', opts)
keymap('i', '<c-t>', ':tabnew<Return>', opts)

keymap('n', '<c-w>', ':tabc<Return>', opts)
keymap('i', '<c-w>', ':tabc<Return>', opts)

keymap('n', '<c-s-l>', 'gt', opts)
keymap('v', '<c-s-l>', 'gt', opts)
keymap('n', '<c-s-h>', 'gT', opts)
keymap('v', '<c-s-h>', 'gT', opts)

keymap('n', '<c-o>', ':ColorToggle', opts)
keymap('v', '<c-o>', ':ColorToggle', opts)

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
--nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
