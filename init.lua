require('keybindings')
require('packages')
require('options')

local configs = require'nvim-treesitter.configs'
configs.setup { 
  ensure_installed = { 
    maintained = true, 
  }, 
  highlight = { 
    enable = true,
  },
  indent = {
    enable = true,
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "sumneko_lua" then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {'vim', 'use' }
          },
        }
      }
    }
  end
  server:setup(opts)
end)

local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<c-g>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<c-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<c-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<c-y>'] = cmp.config.disable,
    ['<c-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({select = true}),
  },
  sources = cmp.config.sources(
    { { name = 'nvim_lsp' }, },
    { { name = 'buffer' }, }
  )
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources(
    { { name = 'path' } },
    { { name = 'cmdline' } }
  )
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['jdtls'].setup {
capabilities = capabilities
}
require('lspconfig')['sumneko_lua'].setup {
capabilities = capabilities
}
require('lspconfig')['jedi_language_server'].setup {
capabilities = capabilities
}
require('lspconfig')['jsonls'].setup {
capabilities = capabilities
}
require('lspconfig')['marksman'].setup {
capabilities = capabilities
}
require('lspconfig')['bashls'].setup {
capabilities = capabilities
}
require('lspconfig')['dockerls'].setup {
capabilities = capabilities
}
require('lspconfig')['eslint'].setup {
capabilities = capabilities
}
require('lspconfig')['texlab'].setup {
capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
capabilities = capabilities
}
require('lspconfig')['cssls'].setup {
capabilities = capabilities
}
