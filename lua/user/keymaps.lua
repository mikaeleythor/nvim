local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- map space as leader key
keymap("n", "<space>", "", opts)
vim.g.mapleader = " "
vim.g.maclocalleader = " "

keymap("i", "<c-BS>", "<c-w>", opts)

-- Move selection up/down
keymap('n', '<A-j>', ':MoveLine(1)<CR>', opts)
keymap('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
keymap('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
keymap('n', '<A-l>', ':MoveHChar(1)<CR>', opts)

-- Visual-mode commands
keymap('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
keymap('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
keymap('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
keymap('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- Move windows
keymap("n", "<a-Left>", "<c-w>H", opts)
keymap("n", "<a-Down>", "<c-w>J", opts)
keymap("n", "<a-Up>", "<c-w>K", opts)
keymap("n", "<a-Right>", "<c-w>L", opts)

-- Move cursor between windows
keymap("n", "<c-h>", "<c-w>h", opts)
keymap("n", "<c-j>", "<c-w>j", opts)
keymap("n", "<c-k>", "<c-w>k", opts)
keymap("n", "<c-l>", "<c-w>l", opts)

-- New tab
keymap("n", "<c-t>", ":tabnew<Return>", opts)
keymap("n", "<c-w>", ":tabc<Return>", opts)

-- Traverse tabs
keymap("n", "<c-s-l>", "gt", opts)
keymap("v", "<c-s-l>", "gt", opts)
keymap("n", "<c-s-h>", "gT", opts)
keymap("v", "<c-s-h>", "gT", opts)

keymap("n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
keymap("n", "gD", ":lua vim.lsp.buf.declaration()<cr>", opts)
keymap("n", "gi", ":lua vim.lsp.buf.implementation()<cr>", opts)
keymap("n", "gw", ":lua vim.lsp.buf.document_symbol()<cr>", opts)
keymap("n", "gw", ":lua vim.lsp.buf.workspace_symbol()<cr>", opts)
keymap("n", "gr", ":lua vim.lsp.buf.references()<cr>", opts)
keymap("n", "gb", ":lua vim.lsp.buf.type_definition()<cr>", opts)
keymap("n", "K", ":lua vim.lsp.buf.hover()<cr>", opts)
keymap("n", "<leader>af", ":lua vim.lsp.buf.code_action()<cr>", opts)
-- keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)

function _G.set_terminal_keymaps()
  local topts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], topts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], topts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], topts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], topts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], topts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], topts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
