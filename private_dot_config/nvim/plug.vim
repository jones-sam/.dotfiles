" PLUGINS

" install vim-plug if it isnt there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter *   PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'mhinz/vim-startify'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Coc and formatting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yaegassy/coc-tailwindcss3', {'do': 'yarn install --frozen-lockfile'}
Plug 'sbdchd/neoformat'

" Theme
Plug 'gruvbox-community/gruvbox'

" Git
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-eunuch'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
Plug 'vuciv/vim-bujo'
Plug 'aserowy/tmux.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
"Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'dbeniamine/cheat.sh-vim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
