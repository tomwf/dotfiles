set shiftwidth=2 tabstop=2 expandtab  " Default indent with 2 spaces
set number relativenumber             " Show hybrid line number
set colorcolumn=80                    " Highlight 80th column
set nocompatible                      " be iMproved, required
set ignorecase                        " Ignore case when searching
set cursorline                        " Highlight cursor line
set hidden                            " Open other buffers without saving current one
set smartindent                       " Autoindent in new line
set completeopt=menu,menuone,noselect


call plug#begin('~/.vim/plugged')

"" Syntax Highlight
Plug 'joshdick/onedark.vim'

"" Beautiful Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"" Superpowers
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

"" Coc is love
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Time Tracking
Plug 'wakatime/vim-wakatime'

"" Emmet
Plug 'mattn/emmet-vim'

if has('nvim')
  " Tree sitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " LSP
  Plug 'neovim/nvim-lspconfig'

  " Auto-complete engine
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'saadparwaiz1/cmp_luasnip'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

endif

call plug#end()

" Enable Syntax Highlight
syntax on
colorscheme onedark
" iTerm2 Transparent Background
highlight Normal ctermbg=None
highlight LineNr ctermfg=DarkGrey

" Leader key
let g:mapleader = ' '

" Emmet settings
let g:user_emmet_leader_key = 'ù'  " Redefine Emmet trigger key
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \}

" Airline settings
let g:airline#extensions#tabline#enabled = 1  " Enable tabline

" Keymaps
nmap <leader>g <Cmd>vertical Git<bar>%bd!<bar>b#<CR>|     " Git
nmap <leader>e <Cmd>CocCommand explorer<CR>|              " Coc Explorer
nmap <C-k> <Cmd>bd<bar>bp<CR>|                            " Delete buffer
nmap <C-l> <Cmd>bn<CR>|                                   " Next buffer
nmap <C-h> <Cmd>bp<CR>|                                   " Previous buffer
nmap <CR> <Cmd>b#<CR>|                                    " Toggle last buffer with Enter key
nmap <C-j> i<CR><Esc>|                                    " New line at cursor
map! <C-c> <Esc>|                                         " Ctrl-c => Escape in Insert and Command-line Modes
map <C-c> <Esc>|                                          " Ctrl-c => Escape in Normal, Visual, Select and Operator-pending Modes
nmap =G =Gzz|                                             " Indent until end of file
nmap Y y$|                                                " Yank to end of line

" Telescope keymaps
nmap <leader>fo <Cmd>Telescope find_files<CR>|            " Fuzzy find file
nmap <leader>ff <Cmd>Telescope live_grep<CR>|             " Fuzzy find text

" LSP keymaps
nmap <leader>dj <Cmd>lua vim.diagnostic.goto_next()<CR>|  " Jump to next diagnostic line
nmap <leader>dk <Cmd>lua vim.diagnostic.goto_prev()<CR>|  " Jump to previous diagnostic line
nmap <leader>r <Cmd>lua vim.lsp.buf.rename()<CR>|         " Rename all references under cursor
nmap gd <Cmd>lua vim.lsp.buf.definition()<CR>|            " Go to definition
nmap K <Cmd>lua vim.lsp.buf.hover()<CR>|                  " Show definition

" Code formatting
nmap =g <Cmd>lua vim.lsp.buf.formatting()<CR>             " Indent buffer

" Indentation for different file types
autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4 tabstop=4 expandtab

lua << EOF
require'lspconfig'.tsserver.setup{
on_attach = function()
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer=0})
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer=0})
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0})
end
}
EOF

lua <<EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
  -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
  },
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
  },
mapping = cmp.mapping.preset.insert({
['<C-b>'] = cmp.mapping.scroll_docs(-4),
['<C-f>'] = cmp.mapping.scroll_docs(4),
['<C-Space>'] = cmp.mapping.complete(),
['<C-e>'] = cmp.mapping.abort(),
['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    }, {
    { name = 'buffer' },
    })
  })

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
  { name = 'buffer' },
  })
})

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
      }
    })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
    { name = 'path' }
    }, {
    { name = 'cmdline' }
    })
  })

-- Setup lspconfig.
local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require'lspconfig'['tsserver'].setup {
  capabilities = capabilities
  }
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "css",  "html", "javascript", "json", "markdown", "php", "python", "scss", "svelte", "todotxt", "tsx", "typescript", "vim", "vue" },
  auto_install = true,
  highlight = {
    enable = true
    }
  }
EOF

lua <<EOF
require'telescope'.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
        ["<C-f>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist
        }
      }
    }
  }
EOF

lua <<EOF
require'lspconfig'.clangd.setup{}
EOF

lua <<EOF
require'lspconfig'.html.setup{}
EOF

