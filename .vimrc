set shiftwidth=2 tabstop=2 expandtab  " Default indent with 2 spaces
set number relativenumber             " Show hybrid line number
set colorcolumn=80                    " Highlight 80th column
set nocompatible                      " be iMproved, required
set ignorecase                        " Ignore case when searching
set cursorline                        " Highlight cursor line
set incsearch                         " Highlight search result
set hidden                            " Open other buffers without saving current one


" Amazing Plugins
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
"" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"" Time Tracking
Plug 'wakatime/vim-wakatime'

" Frontend Frameworks
"" HTML
Plug 'mattn/emmet-vim'
"" REACT
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
"" VUE
Plug 'leafOfTree/vim-vue-plugin'
"" SVELTE
Plug 'leafOfTree/vim-svelte-plugin'

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
nmap <leader>g <Cmd>vertical Git<bar>%bd<bar>b#<CR>|  " Git
nmap <leader>e <Cmd>CocCommand explorer<CR>|          " Coc Explorer
nmap <leader>fo <Cmd>Files<CR>|                       " Fuzzy find file
nmap <leader>ff <Cmd>Ag<CR>|                          " Fuzzy find text
nmap <C-k> <Cmd>bd<bar>bp<CR>|                        " Delete buffer
nmap <C-l> <Cmd>bn<CR>|                               " Next buffer
nmap <C-h> <Cmd>bp<CR>|                               " Previous buffer
nmap <CR> <Cmd>b#<CR>|                                " Toggle last buffer with Enter key
nmap <C-j> i<CR><Esc>|                                " New line at cursor
map! <C-c> <Esc>|                                     " Ctrl-c => Escape in Insert and Command-line Modes
map <C-c> <Esc>|                                      " Ctrl-c => Escape in Normal, Visual, Select and Operator-pending Modes
nmap Y y$|                                            " Yank to end of line

" Indentation for different file types
autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4 tabstop=4 expandtab

" Enable Vue plugin
let g:vim_vue_plugin_load_full_syntax = 1
