set nocompatible
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" turn off annoyances

set visualbell
set noerrorbells
set nobackup
set noswapfile

" UI prettiness

set noshowmode
set laststatus=2
set nowrap
set smarttab
set scrolloff=4
set ruler
set relativenumber
set numberwidth=4

colorscheme mustang

if has("gui_running")
    set guioptions=egmrt
endif

set guifont=Menlo:h14
set bg=dark
colorscheme sunburst

" search

set hlsearch
set incsearch
set gdefault
set showmatch
set ignorecase
set smartcase

" editing

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set backspace=indent,eol,start
set copyindent

" turn off the retarded smart indenting

set nocindent
set nosmartindent
set autoindent
set indentexpr=
filetype indent off
filetype plugin indent off

" shortcuts

let mapleader = ","

nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

let g:ctrlp_map = ',p'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }
