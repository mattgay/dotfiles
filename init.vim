set nocompatible

" Plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Lokaltog/vim-easymotion'
Plug 'ton/vim-bufsurf'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" language extensions

Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'digitaltoad/vim-jade'

" colourschemes

Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

" Done Pluggin

call plug#end()

filetype plugin indent on
syntax on

" turn off annoyances

set visualbell
set noerrorbells
set nobackup
set noswapfile
let loaded_matchparen = 1

" UI prettiness

set mouse=a
set noshowmode
set laststatus=2
set nowrap
set scrolloff=4
set ruler
set number
set numberwidth=4
set guifont=Monaco:h13
set bg=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

hi EasyMotionTarget ctermbg=none ctermfg=darkred
hi EasyMotionTarget2First ctermbg=none ctermfg=red
hi EasyMotionTarget2Second ctermbg=none ctermfg=red

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

" homerow escape

inoremap kj <Esc>

" shortcuts

nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>l :CtrlP<CR>
nnoremap <leader>L :CtrlPBuffer<CR>
nnoremap \ :GitGrep<SPACE>
nnoremap <silent><bar> :GitGrepWord<CR>
vnoremap <silent><bar> y:GitGrep <C-R>"<CR>

" copypaste

vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

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

" ctrlp
" return on selection opens in new tab, c-cr opens in current split

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-cr>'],
  \ 'AcceptSelection("h")': ['<c-x>', '<c-s>'],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" netrw

let g:netrw_liststyle=3 " Use tree-mode as default view

" easymotion

let g:EasyMotion_leader_key = '<leader>'

" highlight unwanted whitespace

set list listchars=tab:→\ ,trail:·
hi SpecialKey guifg=red ctermfg=red

" git gutter

let g:gitgutter_enabled = 0
nmap <leader>gu :GitGutterToggle<CR>

" fugitive

nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q %:p<CR>
nnoremap <leader>gd :Gdiff<CR>

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

