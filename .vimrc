if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'jelera/vim-javascript-syntax'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

set autowrite
set hidden
let mapleader = ","
set showcmd

syntax on
syntax enable
imap <C-c> <esc>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab
set smartindent
set ruler
set relativenumber
set ttyfast
set autoread
set more
set cursorline!
set list
set listchars=nbsp:¬,tab:»·,trail:·,eol:$,extends:>,precedes:<

set statusline=                                     " Override default
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%2*\ %f\ %m\ %r%*                   " Show filename/path
set statusline+=%3*%=%*
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%4*%l/%L:%v%*
set statusline+=%5*\ %*                             " Set ending space

let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_syntax_checker=["jsxhint"]
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1

"set noerrorbells
"set novisualbell
set timeoutlen=500
set hlsearch
set incsearch
set magic
set showmatch
set matchtime=2
set laststatus=2

if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
set viminfo^=%

map 0 ^

nmap <leader><cr> i<cr><Esc>

cmap w!! %!sudo tee > /dev/null %

map <silent> <F5> <esc>:w<CR><esc>:!./%<CR>

map <silent> <C-F7> :only<CR>:set invnumber invlist number?<CR>
map <silent> <F7> :set invpaste paste?<CR>i

command! Q q
command! W w

map Q <Nop>
let loaded_matchparen = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|(node_modules)$',
    \ 'file': '\v\.(exe|so|dll|ico|png|jpe?g|DS_Store)$',
    \ }
nmap <silent> <C-D> :NERDTreeToggle<CR>

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

autocmd FileType javascript set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType php set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
