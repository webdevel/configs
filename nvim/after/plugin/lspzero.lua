-- https://github.com/VonHeikemen/lsp-zero.nvim
local lsp = require('lsp-zero').preset({})

lsp.set_preferences({sign_icons = {}})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
