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
set scrolloff=4
set ruler
set relativenumber
set numberwidth=4

colorscheme mustang

if has("gui_running")
    set guioptions=egmrt
endif

set guifont=Monaco:h13
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

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround
set backspace=indent,eol,start
set copyindent
set smarttab

inoremap jk <Esc>

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

" ctrlp settings

let g:ctrlp_map = ',p'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" ack settings

nnoremap <leader>a :Ack
