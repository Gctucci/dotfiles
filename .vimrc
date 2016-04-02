set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git commands for vim
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
" Static checking for multiple languages
Plugin 'scrooloose/syntastic'
" Fuzzy finder
Plugin 'kien/ctrlp.vim'
"Custom tab config
Plugin 'gcmt/taboo.vim'
"Add bottom line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Vim Theme
Plugin 'tomasr/molokai'
"Autocomplete
Plugin 'valloric/youcompleteme'
"Javascript config
Plugin 'pangloss/vim-javascript'
Plugin 'bronson/vim-trailing-whitespace'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"NERTREE configuration for starting on vim opening
autocmd VimEnter * NERDTree

"Statusline Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Mapping for CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
set laststatus=2

"Set default file encoding
set encoding=utf-8
"Set default tab indentation
set expandtab
set shiftwidth=2
set softtabstop=2

"Better window navigation
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

"Custom tab configuration
set guioptions-=e
let g:taboo_tab_format = " %N) %f%m "
"Background theme and UI config
let g:rehash256 = 1
set t_Co=256
set number
syntax enable
set background=dark
colorscheme molokai
