set nocompatible

" vundle

filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'chriskempson/base16-vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'altercation/vim-colors-solarized'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'kien/ctrlp.vim'

Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'

" config

filetype plugin indent on
syntax on

" meta key

if has("gui_running")
  set macmeta
endif

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

if has("gui_running")
  set guioptions=egmrt
endif

set guifont=Monaco:h13

set bg=dark

colorscheme Tomorrow-Night

" airline theme

let g:airline_theme='tomorrow'

" highlight unwanted whitespace

set list listchars=tab:→\ ,trail:·
hi SpecialKey guifg=red ctermfg=red 

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

" turn off the retarded smart indenting

set smartindent
set autoindent

" natural split open positions

set splitbelow
set splitright

" shortcuts

nnoremap <SPACE> <Nop>
let mapleader = " "

" homerow escape

inoremap kj <Esc>

nnoremap <tab> %
vnoremap <tab> %

" reselect visual block after indent

vnoremap < <gv
vnoremap > >gv

" make Y behave like other caps

nnoremap Y y$

" unhighlight matches

nnoremap <leader>, :noh<cr>

" move between splits with ctrl-motion

noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k

" ctrlp settings

let g:ctrlp_map = '<leader>l'

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" silver searcher

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" ack settings

nnoremap <leader>a :Ack

" netrw settings

let g:netrw_liststyle=3 " Use tree-mode as default view

" vim-indent-guides config

if has("gui_running")
  let g:indent_guides_auto_colors = 0
  let g:indent_guides_enable_on_vim_startup = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#515151
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222
endif

" easymotion

let g:EasyMotion_leader_key = '<leader>'

" weird file extensions

au BufNewFile,BufRead *.rabl setf ruby
