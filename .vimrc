" based on setting from Douglas Black
let mapleader=","       " leader is comma
" Misc {{{
set backspace=indent,eol,start " Allow backspacing over everything in insert mode
set clipboard=unnamed
" }}}
" Spaces & Tabs {{{
set smarttab
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set nomodeline
filetype indent on
filetype plugin on
set smartindent
" }}}
" UI Layout {{{
set number              " show line numbers
set relativenumber
set showcmd             " show command in bottom bar
set cursorline        " highlight current line
set wildmenu
set lazyredraw
set fillchars+=vert:┃
set laststatus=2        " only show status in multi-windows mode
set noshowmode
set splitbelow
set splitright
" }}}
" Searching {{{
set showmatch           " highlight matching parenthesis
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
set noswapfile
set writebackup
set spelllang=en_us
set nospell
set autochdir
set undofile
set backupdir=~/.vim/.backup//
" set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set visualbell
set history=1000
set autoread
set listchars=tab:__,trail:_,nbsp:_,extends:>,precedes:<
set list
set gdefault
set wrap
set formatoptions=cql
" }}}

" key mappings {{{
" move vertically by visual line
"nnoremap j gj
"nnoremap k gk
"nnoremap gV `[v`]
inoremap jj <esc>
nnoremap B ^
nnoremap E $
nnoremap Y y$
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
imap <c-s> <Esc><c-s>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession<CR>

" System clipboard interaction.  Mostly from:
" https://github.com/henrik/dotfiles/blob/master/vim/config/mappings.vim
noremap <leader>y "*y
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>
vnoremap <leader>y "*ygv

" Emac binding in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
noremap Q <nop>
" Close all
noremap QA :qa<CR>
nmap <F8> :TagbarToggle<CR>
" }}}
" Plugins
" Install vim-plug if not available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'justmao945/vim-clang'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" need shfmt command
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'fs111/pydoc.vim', { 'for': 'py' }
Plug 'thinca/vim-quickrun'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sheerun/vim-wombat-scheme'
" Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" Colors {{{
syntax enable           " enable syntax processing
set termguicolors
set background=dark
colorscheme wombat
" }}}

"Plugin specific
" lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'tag': '%{gutentags#statusline()}'
    \   },
    \ }
let g:shfmt_fmt_on_save = 1
let g:ale_fixers = {
            \    '*': ['remove_trailing_lines', 'trim_whitespace'],
            \    'python': ['yapf']
            \}
let g:ale_fix_on_save = 1
let g:UltiSnipsExpandTrigger='<c-l>'

" abberate
iabbrev ddate <C-r>=strftime("%F")<CR>
" Others
runtime macros/matchit.vim
map <tab> %
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif
autocmd Filetype c setlocal makeprg=gcc\ %\ -o\ %<
