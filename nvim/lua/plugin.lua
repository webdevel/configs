-- install plugin manager
local clone_packer = function()

  local clone_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  local empty_path = 1

  if empty_path == vim.fn.empty(vim.fn.glob(clone_path)) then

    vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', clone_path})
    vim.cmd.packadd('packer.nvim')

    return true
  end

  return false
end
local is_packer_cloned = clone_packer()

return require('packer').startup(function(use)

  -- plugin manager
  use 'wbthomason/packer.nvim'

  -- fuzzy finder
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- colorscheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  -- code language parser with syntax highlight
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- quickly switch between files
  use('theprimeagen/harpoon')

  -- undo history tree
  use('mbbill/undotree')

  -- git integration
  use('tpope/vim-fugitive')

  -- language server manager
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
  -- on initial install
  if is_packer_cloned then

    -- update and compile
    require('packer').sync()
  end
end)
