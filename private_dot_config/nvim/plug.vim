" PLUGINS

" install vim-plug if it isnt there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter *   PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
" Snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'

" File tree
Plug 'kyazdani42/nvim-tree.lua'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'onsails/lspkind.nvim'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'simrat39/inlay-hints.nvim'
Plug 'folke/trouble.nvim'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'zbirenbaum/copilot.lua'
Plug 'ray-x/lsp_signature.nvim'


" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'leoluz/nvim-dap-go'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

" Formatting
Plug 'sbdchd/neoformat'

" Theme
" Plug 'gruvbox-community/gruvbox'
Plug 'ellisonleao/gruvbox.nvim'

" Git
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
" Plug 'kylechui/nvim-surround'
Plug 'tpope/vim-repeat'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree'
Plug 'NvChad/nvim-colorizer.lua'
Plug 'aserowy/tmux.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'monaqa/dial.nvim'
Plug 'tommcdo/vim-exchange'
Plug 'mhinz/vim-startify'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/playground'

Plug 'sheerun/vim-polyglot'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'junegunn/goyo.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dbeniamine/cheat.sh-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'prisma/vim-prisma'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
