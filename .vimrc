" based on setting from Douglas Black
let mapleader=","       " leader is comma
" Colors {{{
syntax enable           " enable syntax processing
set termguicolors
" }}}
" Misc {{{
set backspace=indent,eol,start
set clipboard=unnamed
" }}}
" Spaces & Tabs {{{
set smarttab
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set smartindent
" }}}
" UI Layout {{{
set number              " show line numbers
set relativenumber
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set fillchars+=vert:┃
set laststatus=2        " only show status in multi-windows mode
set noshowmode
" }}}
" Searching {{{
set showmatch           " higlight matching parenthesis
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
nnoremap <leader><space> :nohlsearch<CR>
set smartcase
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Edit {{{
set backup
set writebackup
set spell spelllang=en_us
set autochdir
set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set visualbell
set history=1000
set autoread
set listchars=tab:__,trail:_,nbsp:_,extends:>,precedes:<
set list
" }}}
" key mappings {{{
" move vertically by visual line
"nnoremap j gj
"nnoremap k gk
"nnoremap gV `[v`]
inoremap jj <esc>
nnoremap B ^
nnoremap E $
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
imap <c-s> <Esc><c-s>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession<CR>
" }}}
" Plugins
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
" need shfmt command
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'fs111/pydoc.vim', { 'for': 'py' }
" Plug 'skywind3000/asyncrun.vim'
Plug 'thinca/vim-quickrun'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"Plugin specific
" lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
let g:shfmt_fmt_on_save = 1
let g:ale_completion_enabled=1
let g:asyncrun_open = 6

" Others
"
