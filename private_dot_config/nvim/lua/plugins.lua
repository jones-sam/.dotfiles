return {
  "rebelot/kanagawa.nvim",
  -- "rafamadriz/friendly-snippets",
  -- "hrsh7th/vim-vsnip",
  "kyazdani42/nvim-tree.lua",
  "stevearc/oil.nvim",
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-file-browser.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  -- "hrsh7th/cmp-vsnip",
  "onsails/lspkind.nvim",
  "glepnir/lspsaga.nvim",
  -- "folke/trouble.nvim",
  "j-hui/fidget.nvim",
  "zbirenbaum/copilot.lua",
  "ray-x/lsp_signature.nvim",
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "leoluz/nvim-dap-go",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",
  "sbdchd/neoformat",
  "kdheepak/lazygit.nvim",
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "numToStr/Comment.nvim",
  "tpope/vim-rhubarb",
  "tpope/vim-eunuch",
  {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup({
        easing_function = "sine",
      })
    end
  },
  "mbbill/undotree",
  "NvChad/nvim-colorizer.lua",
  "aserowy/tmux.nvim",
  -- "ggandor/lightspeed.nvim",
  "ThePrimeagen/harpoon",
  "monaqa/dial.nvim",
  "tommcdo/vim-exchange",
  "mhinz/vim-startify",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "windwp/nvim-ts-autotag",
  "nvim-treesitter/playground",
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  "nvim-lualine/lualine.nvim",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  "dbeniamine/cheat.sh-vim",
  "AndrewRadev/splitjoin.vim",
  "prisma/vim-prisma",
  {
    "nvim-neorg/neorg",
    ft = { "norg" },
    build = ":Neorg sync-parsers",
    cmd = { "Neorg" },
    dependencies = {
      { "nvim-neorg/neorg-telescope" },
    },
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    opts = {}
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r",         mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      -- { "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<leader>s", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  {
    "chrishrb/gx.nvim",
    event = { "BufEnter" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gx").setup {
        open_browser_app = "xdg-open",     -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
        -- open_browser_args = {}, -- specify any arguments, such as --background for macOS' "open".
        handlers = {
          plugin = true,                      -- open plugin links in lua (e.g. packer, lazy, ..)
          github = true,                      -- open github issues
          -- brewfile = true,                    -- open Homebrew formulaes and casks
          package_json = true,                -- open dependencies from package.json
          search = true,                      -- search the web/selection on the web if nothing else is found
        },
        handler_options = {
          search_engine = "google",                           -- you can select between google, bing, duckduckgo, and ecosia
          -- search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
        },
      }
    end,
  },
  "kyazdani42/nvim-web-devicons"
}
