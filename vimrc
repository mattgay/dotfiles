set nocompatible
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

" meta key

set macmeta

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
colorscheme Tomorrow-Night-Bright

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

inoremap kj <Esc>

" turn off the retarded smart indenting

set smartindent
" set nocindent
" set nosmartindent
set autoindent
" set indentexpr=
" filetype indent off
" filetype plugin indent off

vnoremap < <gv
vnoremap > >gv

" shortcuts

let mapleader = ","

nnoremap <leader>l :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

" ctrlp settings

let g:ctrlp_map = ',<space>'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

set wildignore+=*/tmp/

" ack settings

nnoremap <leader>a :Ack

" netrw settings

let g:netrw_liststyle=3 " Use tree-mode as default view

" vim-indent-guides config
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222 ctermbg=4

" easymotion

let g:EasyMotion_leader_key = '<leader>'
