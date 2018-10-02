set nocompatible              " required
filetype off                  " required
set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8
set relativenumber
set nu
set clipboard=unnamed

set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

map <C-n> :NERDTreeToggle<CR>
" Plugins
Plugin 'dracula/vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
"Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
" Plugin 'davidhalter/jedi-vim'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'terryma/vim-multiple-cursors'
Plugin 'farmergreg/vim-lastplace'
Plugin 'Yggdroot/indentLine'
Plugin 'slashmili/alchemist.vim'

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_quit_key='<Esc>'

let g:syntastic_python_flake8_args='--ignore=F821,E302,E501,E402'

filetype plugin indent on

autocmd Filetype php setlocal sts=4 sw=4 expandtab
autocmd Filetype blade setlocal sts=2 sw=2 expandtab
autocmd Filetype perl setlocal sts=4 sw=4 expandtab
autocmd Filetype sh setlocal sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal sts=2 sw=2 expandtab
autocmd Filetype euphoria3 setlocal sts=2 sw=2 expandtab
autocmd Filetype css setlocal sts=2 sw=2 expandtab
autocmd Filetype sql setlocal sts=2 sw=2 expandtab
autocmd Filetype lua setlocal sts=2 sw=2 expandtab
autocmd Filetype haskell setlocal sts=2 sw=2 expandtab
autocmd Filetype scss setlocal sts=2 sw=2 expandtab
autocmd Filetype html setlocal sts=2 sw=2 expandtab
autocmd Filetype jinja setlocal sts=2 sw=2 expandtab syntax=html
autocmd Filetype python setlocal sts=4 sw=4 expandtab
autocmd Filetype c setlocal sts=8 sw=8
autocmd Filetype cpp setlocal sts=8 sw=8
autocmd Filetype go setlocal sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal sts=2 sw=2 expandtab
autocmd Filetype vcl setlocal sts=4 sw=4 expandtab
autocmd Filetype json setlocal sts=4 sw=4 expandtab
autocmd Filetype yaml setlocal sts=4 sw=4 expandtab
autocmd Filetype erb setlocal sts=4 sw=4 expandtab
autocmd Filetype xml setlocal sts=2 sw=2 expandtab
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown


"python with virtualenv support
"py << EOF
"import os
"import sys
 "if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

syntax on

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
color dracula
color monokai
"hi Normal ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
hi NonText ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
hi Cursorline ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE
hi LineNr ctermbg=NONE ctermfg=NONE guifg=NONE guibg=NONE

" Removing whitespaces
autocmd FileType  BufWritePre * %s/\s\+$//e
set shortmess+=c

"Tabs
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap H gT
nnoremap L gt

noremap <Leader>q q
noremap q <Nop>

set ttyfast
set cursorline!
set list
set listchars=nbsp:¬,tab:»·,trail:·,eol:$,extends:>,precedes:<
highlight NonText term=standout cterm=bold ctermfg=0  guifg=Black
hi CursorLine gui=underline cterm=underline
