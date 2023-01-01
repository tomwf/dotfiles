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
  -- Git magic
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'APZelos/blamer.nvim'
  -- Coc is love
  use { 'neoclide/coc.nvim', branch = 'release' }
  -- Format code
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
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
  -- LSP
  use 'neovim/nvim-lspconfig'
  -- Auto-complete engine
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- Outline window
  use 'stevearc/aerial.nvim'
end)
