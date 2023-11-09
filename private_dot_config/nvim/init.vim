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

set conceallevel=2

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

let g:polyglot_disabled = ['norg', 'ftdetect']

let mapleader = " "
let maplocalleader = ","

" IMPORTS
" ---------------------------------------------------

runtime ./plug.vim
runtime ./maps.vim

" ---------------------------------------------------

set termguicolors
set background=dark
syntax enable

lua << EOF
-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = {
--      strings = false,
--      operators = false,
--      comments = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = true,
-- })

require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})
EOF

colorscheme kanagawa

" highlight Normal ctermbg=NONE guibg=NONE
" highlight NormalFloat ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE
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
    " autocmd FileType svelte setlocal shiftwidth=2 tabstop=2
augroup END
