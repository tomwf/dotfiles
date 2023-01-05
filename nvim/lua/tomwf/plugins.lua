-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Syntax Highlight
  use 'navarasu/onedark.nvim'
  -- Beautiful Statusline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- Superpowers
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  -- Git magic
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'APZelos/blamer.nvim'
  -- Coc is love
  use { 'neoclide/coc.nvim', branch = 'release' }
  -- Time Tracking
  use 'wakatime/vim-wakatime'
  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }
  -- LSP + autocompletion + snippets
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-cmdline' },
      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  -- Linters & formatters
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Outline window
  use 'stevearc/aerial.nvim'
end)
