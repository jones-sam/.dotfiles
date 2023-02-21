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
" set foldmethod=indent   
set cursorline              " highlight current cursorline
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2
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

set updatetime=100

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" set completeopt=menu,menuone,noselect

set path+=**
set wildignore+=*/node_modules/*
set wildignore+=**/.git/*

let g:startify_skiplist = ["/private/tmp/kitty_scrollback_buffer"]

let mapleader = " "

" IMPORTS
" ---------------------------------------------------

runtime ./plug.vim
runtime ./maps.vim

" ---------------------------------------------------

set termguicolors
set background=dark
syntax enable

" let g:gruvbox_italic = 1
lua << EOF
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
EOF

colorscheme gruvbox

" highlight Normal ctermbg=NONE guibg=NONE
" highlight NormalFloat ctermbg=NONE guibg=NONE
" " highlight SignColumn ctermbg=NONE guibg=NONE
" highlight TreesitterContext ctermbg=NONE guibg=#504945

" Short highlight on yanked text
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup two_space_langs 
    autocmd!
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
    autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
    autocmd FileType lua setlocal shiftwidth=2 tabstop=2
augroup END
