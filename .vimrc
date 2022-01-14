set shiftwidth=2 tabstop=2 expandtab  " Default indent with 2 spaces
set number relativenumber             " Show hybrid line number
set colorcolumn=80                    " Highlight 80th column
set nocompatible                      " be iMproved, required
set cursorline                        " Highlight cursor line
set incsearch                         " Highlight search result
set hidden                            " Open other buffers without saving current one

" Amazing Plugins
call plug#begin('~/.vim/plugged')
"" Awesome Git
Plug 'tpope/vim-fugitive'
"" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" Emmet
Plug 'mattn/emmet-vim'
"" Make jsx prettry
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
"" Coc is love
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Beautiful text colors
syntax on
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

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
nmap <leader>bd <Cmd>%bd<bar>b#<CR>|                  " Close all buffers except the current one
nmap <leader>fo <Cmd>Files<CR>|                       " Fuzzy find file
nmap <leader>ff <Cmd>Ag<CR>|                          " Fuzzy find text
nmap <C-m> <Cmd>b#<CR>|                               " Ctrl-m => Toggle between current and previous buffers
nmap <C-j> i<CR><Esc>|                                " New line at cursor
map! <C-c> <Esc>|                                     " Ctrl-c => Escape in Insert and Command-line Modes
map <C-c> <Esc>|                                      " Ctrl-c => Escape in Normal, Visual, Select and Operator-pending Modes
nmap Y y$|                                            " Yank to end of line

" Indentation for different file types
autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4 tabstop=4 expandtab
