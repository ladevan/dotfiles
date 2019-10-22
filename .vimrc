" based on setting from Douglas Black
let mapleader=","       " leader is comma
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>m :silent make\|redraw!\|cw<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>s :mksession<CR>

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
inoremap jj <esc>
" }}}
" Line Shortcuts {{{
" move vertically by visual line
"nnoremap j gj
"nnoremap k gk
"nnoremap gV `[v`]
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" other key mappings
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR><CR>}<up><tab>
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
imap <c-s> <Esc><c-s>
" }}}
"
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'psf/black'
Plug 'ervandew/supertab'
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }
Plug 'fs111/pydoc.vim', { 'for': 'py' }
call plug#end()

"Plug in specific
" lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
let g:shfmt_fmt_on_save = 1
runtime ftplugin/man.vim
"这样选中你要运行的代码<leader>te 就会发到python shell里
"your runing code could send to python shell

nnoremap <leader>te V:call SendToTerminal()<CR>$
vnoremap <leader>te <Esc>:call SendToTerminal()<CR>
function! SendToTerminal()
    let buff_n = term_list()
    if len(buff_n) > 0
        let buff_n = buff_n[0] " sends to most recently opened terminal
        let lines = getline(getpos("'<")[1], getpos("'>")[1])
        let indent = match(lines[0], '[^ \t]') " check for removing unnecessary indent
        for l in lines
            let new_indent = match(l, '[^ \t]')
            if new_indent == 0
                call term_sendkeys(buff_n, l. "\<CR>")
            else
                call term_sendkeys(buff_n, l[indent:]. "\<CR>")
            endif
            sleep 10m
        endfor
    endif
endfunction
