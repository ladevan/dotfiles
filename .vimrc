set nocompatible

" Helps force plugins to load correctly when it's turned back on below
filetype off
" plugin load here

filetype plugin indent on
syntax on

set background=dark
colorscheme molokai

let mapleader=","

" Formating
set number
set relativenumber
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set nojoinspaces
"set textwidth=79

" alwasy show status
set laststatus=2
" easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

set showmatch		" Show matching brackets/parenthesis
set incsearch		" Find as you type search
set hlsearch		" Highlight search term
set ignorecase		" Case insensitive search

set visualbell
set ruler
