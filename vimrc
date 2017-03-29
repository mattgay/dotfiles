set nocompatible

" vundle

filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" make more awesomer

Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ton/vim-bufsurf'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'Shougo/neocomplcache.vim'

" editing

Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'

" language extensions

Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'digitaltoad/vim-jade'

" Plugin 'tpope/vim-haml'
" Plugin 'guns/vim-clojure-static'
" Plugin 'guns/vim-clojure-highlight'
" Plugin 'tpope/vim-fireplace'
" Plugin 'tpope/vim-leiningen'
" Plugin 'amdt/vim-niji'
" Plugin 'guns/vim-sexp'
" Plugin 'tpope/vim-sexp-mappings-for-regular-people'

" colourschemes

Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'chriskempson/base16-vim'
Plugin 'w0ng/vim-hybrid'

" vundling complete, carry on

call vundle#end()
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
let loaded_matchparen = 1

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
" autocmd FileType clojure colorscheme base16-grayscale
" autocmd FileType clojure highlight LineNr guibg='#101010' guifg='#222222'

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
nnoremap <leader>l :CtrlP<CR>
nnoremap <leader>L :CtrlPBuffer<CR>
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

