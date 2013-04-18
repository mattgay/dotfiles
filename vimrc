" plugins - powerline, command-t, vim-easymotion, vim-indent-guides, vim-yankstack, vim-coffee-script, vim-fugitive

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

if has("gui_running")
    set guioptions=egmrt
endif

set guifont=Monaco:h13
set bg=dark
colorscheme Tomorrow-Night-Bright

" highlight unwanted whitespace

set list listchars=tab:→\ ,trail:·
hi SpecialKey guifg=red

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

" homerow escape

inoremap kj <Esc>

" turn off the retarded smart indenting

set smartindent
" set nocindent
" set nosmartindent
set autoindent
" set indentexpr=
" filetype indent off
" filetype plugin indent off

" reselect visual block after indent

vnoremap < <gv
vnoremap > >gv

" make Y behave like other caps

nnoremap Y y$

" shortcuts

nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <tab> %
vnoremap <tab> %

" unhighlight matches

nnoremap <leader>, :noh<cr>

" natural split open positions
set splitbelow
set splitright

" move between splits with ctrl-motion
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k

" ctrlp settings

"let g:ctrlp_map = ',<space>'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

" Command-T settings

nnoremap <silent> <Leader>l :CommandT<CR>

let g:CommandTMatchWindowReverse=1
let g:CommandTAcceptSelectionMap='<C-b>'
let g:CommandTAcceptSelectionTabMap='<cr>'

set wildignore+=*/tmp/,tmp/**

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

" weird file extensions

au BufNewFile,BufRead *.rabl setf ruby
