" Noah Roufus - init.vim
" Neovim configuration file

" Disable Vi compatibility fluff
set nocompatible

" VimPlug
call plug#begin()
    " Color scheme
    Plug 'nlknguyen/papercolor-theme'
    Plug 'itchyny/lightline.vim'

    " Language support
    Plug 'sheerun/vim-polyglot'
    Plug 'mattn/emmet-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Utility stuffs
    Plug 'scrooloose/nerdtree'
    Plug 'majutsushi/tagbar'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'itchyny/vim-gitbranch'
    Plug 'tpope/vim-surround'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'scrooloose/nerdcommenter'
call plug#end()

" Enable filetype and indent detection
syntax on
filetype plugin indent on

" General stuff
set clipboard+=unnamedplus
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set laststatus=2
set shortmess=aFIoOtT
set splitright
set splitbelow

" Line numbers
set number
set relativenumber

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tabs
set autoindent
set expandtab
set smartindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=0

" Unset
set nobackup
set noerrorbells
set noshowcmd
set noshowmode
set noswapfile
set novisualbell
set nowb
set nowrap

" Color scheme
set cursorline
set termguicolors
set t_Co=256
set background=dark
colorscheme PaperColor
hi Normal guibg=NONE
hi LineNr guibg=NONE guifg=gray

"
" Key binds
"
let mapleader = "\<Space>"

" Save/Quit
noremap <Leader>w :w<Enter>
noremap <Leader>W :wq<Enter>
noremap <Leader>q :q!<Enter>

" Toggles
noremap <Leader>f :NERDTreeFocus<Enter>
noremap <Leader>F :NERDTreeToggle<Enter>
noremap <Leader>t :TagbarToggle<Enter>

" Cursor movement
noremap J <C-d>
noremap K <C-u>
noremap H 0
noremap L $
nnoremap <Leader>sc :call CenterCursor()<Enter>

" Buffer management
noremap <Leader>bn :bnext<Enter>
noremap <Leader>bp :bprev<Enter>
noremap <Leader>bq :bp<bar>sp<bar>bn<bar>bd<Enter>

" Split management
noremap <Leader>sh :new<Enter>
noremap <Leader>sv :vnew<Enter>

" Window management
noremap <C-j> <C-W><C-j>
noremap <C-k> <C-W><C-k>
noremap <C-h> <C-W><C-h>
noremap <C-l> <C-W><C-l>

" Clear highlights
noremap <Leader>CL :nohl<Enter>

" CoC binds
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> gt <Plug>(coc-definition)

"
" Plugin config
"

" Emmet
let g:user_emmet_leader_key = '<C-e>'

" NERDTree
let NERDTreeQuitOnOpen          = 0
let NERDTreeMinimalUI           = 1
let NERDTreeNaturalSort         = 1
let NERDTreeShowHidden          = 1
let NERDTreeShowLineNumbers     = 1
let NERDTreeWinSize             = 35
let NERDTreeDirArrowExpandable  = "+"
let NERDTreeDirArrowCollapsible = "-"

" Lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \  'left': [ [ ], [ 'mode', 'readonly' ], [ 'filename' ] ],
    \  'right': [ [ 'lineinfo'], [ 'filetype' ], [ 'tabstop' ], [ 'githunk' ] ]
    \ },
    \ 'component_function': {
    \  'githunk': 'GetHunkString'
    \ },
    \ 'component': {
    \  'tabstop': '%{&expandtab?shiftwidth()."-S":"-T"}'
    \ }
\ }

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function GetHunkString()
    let branch = gitbranch#name()
    if branch != ""
        let [a,m,r] = GitGutterGetHunkSummary()
        return printf("(br:%s)[+%d ~%d -%d]", branch, a, m, r)
    endif

    return ""
endfunction

function ActionStart()
  :TagbarOpen
  if argc() < 1
    :NERDTree
  endif
endfunction
autocmd VimEnter * :call ActionStart()

augroup CenterCursor
    au!
    au OptionSet *,*.*
        \ if exists('#CenterCursor#WinEnter,WinNew,VimResized')|
        \   au! CenterCursor WinEnter,WinNew,VimResized|
        \ endif
augroup END
function CenterCursor()
    normal zz<CR>
    if !exists('#CenterCursor#WinEnter,WinNew,VimResized')
        let s:override_scrolloff=winheight(win_getid()) / 2

        let &scrolloff=s:override_scrolloff
        au CenterCursor WinEnter,WinNew,VimResized *,*.*
            \ let &scrolloff=s:override_scrolloff
    else
        au! CenterCursor WinEnter,WinNew,VimResized
        let &scrolloff=6
    endif
endfunction

