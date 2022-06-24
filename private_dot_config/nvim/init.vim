set showmatch               " show matching
set ignorecase              " case insensitive
set smartcase
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set smarttab
set shiftwidth=4            " width for autoindents
set smartindent
set autoindent
set relativenumber
set nu
set nohlsearch
set hidden
set nowrap
set noswapfile
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
" set colorcolumn=80
set encoding=UTF-8
set wildmode=longest,list,full
set wildmenu
set foldmethod=indent   
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set foldnestmax=10
set nofoldenable
set foldlevel=2
set title
" set cmdheight=2
set mouse=a
set lazyredraw " Faster macros
set noshowmode
set splitbelow
set splitright

set nobackup
set nowritebackup

filetype plugin indent on

set signcolumn=yes

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set path+=**
set wildignore+=*/node_modules/*
set wildignore+=**/.git/*

" let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
"let g:indentLine_char = '•'
"let g:indentLine_showFirstIndentLevel = 0
"let g:indentLine_concealcursor = ''

let mapleader = " "

" IMPORTS
" ---------------------------------------------------

runtime ./plug.vim
runtime ./maps.vim

" ---------------------------------------------------

set termguicolors
set background=dark
syntax enable
colorscheme gruvbox

" Short highlight on yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
