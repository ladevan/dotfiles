" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'Valloric/YouCompleteMe'
 "NeoBundle 'klen/python-mode'
 NeoBundle 'honza/vim-snippets'
 NeoBundle 'SirVer/UltiSnips'
 NeoBundle 'lervag/vim-latex'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'bling/vim-bufferline'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'vim-scripts/sessionman.vim'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'flazz/vim-colorschemes'
 NeoBundle 'Raimondi/delimitMate'

 call neobundle#end()

 " Required:
filetype plugin indent on
syntax enable

set background=dark
colorscheme molokai

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck

" alwasy show status
set laststatus=2
" change leader
let mapleader=','
let maplocalleader='_'
" easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

set showmatch		" Show matching brackets/parenthesis
set incsearch		" Find as you type search
set hlsearch		" Highlight search term
set ignorecase		" Case insensitive search

" Formating
set rnu
set nowrap
set autoindent
set shiftwidth=4
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set nojoinspaces
"set textwidth=79

" remap Ultisnips for compatibility for YCM
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltisnipsJumpForwardTrigger='<C-j>'
let g:UltisnipsJumpBackwardTrigger='<C-j>'
" use single <leader> for easymotion
map <Leader> <Plug>(easymotion-prefix)
" YouCompleteMe keymapping
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" SessionMan		
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>
nmap <leader>sc :SessionClose<CR>
