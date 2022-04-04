"
" .vimrc
" Noah Roufus
"

syntax on
filetype plugin indent on

call plug#begin()
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdcommenter'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-scripts/gmlua.vim'
call plug#end()

set t_Co=256
set t_ut=
set notermguicolors

colorscheme onedark
highlight Normal ctermbg=NONE


set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions+=P
set mouse-=a
set clipboard=unnamedplus
set viminfofile=NONE

set wildmenu
set wildmode=longest:full,full

set nocompatible
set number
set relativenumber
set cursorline
set noshowmode
set noruler
set noshowcmd
set laststatus=2
set shortmess+=F
set ignorecase
set smartcase
set hlsearch
set incsearch
set noerrorbells
set novisualbell
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set splitright
set splitbelow
set nowrap

function! GetHunkString()
    let branch = gitbranch#name()
    if branch != ""
        let [a,m,r] = GitGutterGetHunkSummary()
        return printf("(%s) [+%d ~%d -%d]", branch, a, m, r)
    endif

    return ""
endfunction
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \  'left': [ [ ], [ 'mode', 'readonly' ], [ 'filename' ] ],
    \  'right': [ [ 'lineinfo'], [ 'filetype' ], [ 'githunk' ] ]
    \ },
    \ 'component_function': {
    \  'githunk': 'GetHunkString'
    \ }
\ }

let g:gitgutter_preview_win_floating=1
let g:better_whitespace_guicolor="#b87b7b"

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeNaturalSort = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize = 35
let NERDTreeDirArrowExpandable = "+"
let NERDTreeDirArrowCollapsible = "-"

function NewTab()
    :silent tabnew
    :silent NERDTreeToggle
endfunction

let mapleader = "\<Space>"

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <LeftMouse> <Nop>
noremap <MiddleMouse> <Nop>
noremap <RightMouse> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <LeftMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <RightMouse> <Nop>

noremap J <C-d>
noremap K <C-U>
noremap H ^
noremap L g$

noremap <Leader>q :q!<Enter>
noremap <Leader>w :w!<Enter>
noremap <Leader>W :wq!<Enter>

noremap <Leader>N :call NewTab()<Enter>
noremap <Leader>H :tabp<Enter>
noremap <Leader>L :tabn<Enter>

noremap <Leader>bn :bn<Enter>
noremap <Leader>bp :bp<Enter>
noremap <Leader>bl :ls<Enter>

noremap <Leader>sh :new<Enter>
noremap <Leader>sv :vnew<Enter>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <Leader>CL :nohl<Enter>

noremap <Leader>f :NERDTreeToggle<Enter>

