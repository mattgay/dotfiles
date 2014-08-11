set nocompatible

" vundle

filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" make more awesomer

Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ton/vim-bufsurf'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'Shougo/neocomplcache.vim'

" editing

Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'

" language extensions

Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
Bundle 'tpope/vim-fireplace'
Bundle 'amdt/vim-niji'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-sexp-mappings-for-regular-people'

" colourschemes

Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'chriskempson/base16-vim'
Bundle 'w0ng/vim-hybrid'

" vundling complete, carry on

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

if has("gui_running")
  set guioptions=egmrt
endif

set noshowmode
set laststatus=2
set nowrap
set scrolloff=4
set ruler
set number
set numberwidth=4
set guifont=Monaco:h13
set bg=dark
colorscheme Tomorrow-Night

" use greyscale for clojure

autocmd FileType clojure colorscheme base16-grayscale
autocmd FileType clojure highlight LineNr guibg='#101010' guifg='#222222'

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
set smartindent
set smarttab

" natural split open positions

set splitbelow
set splitright

" keep undo history between buffer changes

set hidden

" leaders

nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = "'"

" shortcuts

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>, :CtrlP<CR>
nnoremap <leader>< :CtrlPBuffer<CR>
nnoremap \ :GitGrep<SPACE>
nnoremap <silent><bar> :GitGrepWord<CR>
vnoremap <silent><bar> y:GitGrep <C-R>"<CR>

" homerow escape

inoremap kj <Esc>

" tab to bounce between paired delims

nnoremap <tab> %
vnoremap <tab> %

" reselect visual block after indent

vnoremap < <gv
vnoremap > >gv

" unhighlight matches

nnoremap <leader>/ :noh<cr>

" move between splits with ctrl-motion

noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k

" buffer surfing

nnoremap gb :BufSurfBack<CR>
nnoremap gn :BufSurfForward<CR>

" airline theme

let g:airline_theme='tomorrow'

" ctrlp
" return on selection opens in new tab, c-cr opens in current split

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-cr>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" fugitive

autocmd QuickFixCmdPost *grep* cwindow

" netrw

let g:netrw_liststyle=3 " Use tree-mode as default view

" easymotion

let g:EasyMotion_leader_key = '<leader>'

" weird file extensions

au BufNewFile,BufRead *.rabl setf ruby

" highlight unwanted whitespace

set list listchars=tab:→\ ,trail:·
hi SpecialKey guifg=red ctermfg=red

" git grep

function! s:GitGrep(terms)
  let expr = 'git grep -n "'.a:terms.'"'
  cgetexpr system(expr)
  cwin
  echo 'Number of matches: ' . len(getqflist())
endfunction

function! s:GitGrepWord()
  call s:GitGrep(expand("<cword>"))
endfunction

command! -nargs=0 GitGrepWord :call s:GitGrepWord()
command! -nargs=+ GitGrep     :call s:GitGrep(<q-args>)

