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
Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/nerdtree'
Bundle 'austintaylor/vim-indentobject'
Bundle 'tpope/vim-rails'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ton/vim-bufsurf'

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
set guifont=Monaco:h13
set bg=dark
colorscheme Tomorrow-Night

if has("gui_running")
  set guioptions=egmrt
endif

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

" natural split open positions

set splitbelow
set splitright

" keep undo history between buffer changes

set hidden

" shortcuts

nnoremap <SPACE> <Nop>
let mapleader = " "

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

nnoremap <leader>, :noh<cr>

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
" return on selection opens in new tab

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" fugitive

autocmd QuickFixCmdPost *grep* cwindow

" netrw

let g:netrw_liststyle=3 " Use tree-mode as default view

" vim-indent-guides

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

