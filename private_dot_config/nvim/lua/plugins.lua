return {
	"ellisonleao/gruvbox.nvim",
	"rafamadriz/friendly-snippets",
	"hrsh7th/vim-vsnip",
	"kyazdani42/nvim-tree.lua",
	"stevearc/oil.nvim",
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- python = { "isort", "black" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				svelte = { "prettierd", "prettier", stop_after_first = true },
				go = { "gofmt", "goimports" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = { timeout_ms = 500 },
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
	},
	-- "hrsh7th/cmp-vsnip",
	"onsails/lspkind.nvim",
	"glepnir/lspsaga.nvim",
	-- "folke/trouble.nvim",
	"j-hui/fidget.nvim",
	"zbirenbaum/copilot.lua",
	-- {
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			keymaps = {
	-- 				accept_suggestion = "<C-CR>",
	-- 				clear_suggestion = "<C-]>",
	-- 				accept_word = "<M-CR>",
	-- 			},
	-- 			disable_inline_completion = true,
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"olimorris/codecompanion.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		-- The following are optional:
	-- 		{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
	-- 	},
	-- 	config = true,
	-- },
	{
		-- dir = "~/code/avante.nvim",
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	"ray-x/lsp_signature.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	-- "mfussenegger/nvim-dap",
	-- "rcarriga/nvim-dap-ui",
	-- "leoluz/nvim-dap-go",
	-- "theHamsta/nvim-dap-virtual-text",
	-- "nvim-telescope/telescope-dap.nvim",
	"kdheepak/lazygit.nvim",
	{
		"NeogitOrg/neogit",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = true,
	},
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"numToStr/Comment.nvim",
	"tpope/vim-rhubarb",
	"tpope/vim-eunuch",
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	config = function()
	-- 		require("neoscroll").setup({
	-- 			easing_function = "sine",
	-- 			-- respect_scrolloff = true,
	-- 			duration_multiplier = 0.25,
	-- 			-- post_hook = function()
	-- 			-- 	vim.cmd("normal! zz")
	-- 			-- end,
	-- 		})
	-- 	end,
	-- },
	"mbbill/undotree",
	"NvChad/nvim-colorizer.lua",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"monaqa/dial.nvim",
	"tommcdo/vim-exchange",
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"RRethy/nvim-treesitter-endwise",
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
	-- {
	--   "nvim-neorg/neorg",
	--   ft = { "norg" },
	--   build = ":Neorg sync-parsers",
	--   cmd = { "Neorg" },
	--   dependencies = {
	--     { "nvim-neorg/neorg-telescope" },
	--   },
	-- },
	{
		"renerocksai/telekasten.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-telekasten/calendar-vim",
		},
		config = function()
			require("telekasten").setup({
				home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		opts = {},
	},
	-- {
	-- 	"folke/flash.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	keys = {
	-- 		{
	-- 			"s",
	-- 			mode = { "n", "x", "o" },
	-- 			function()
	-- 				require("flash").jump()
	-- 			end,
	-- 			desc = "Flash",
	-- 		},
	-- 		{
	-- 			"S",
	-- 			mode = { "n", "x", "o" },
	-- 			function()
	-- 				require("flash").treesitter()
	-- 			end,
	-- 			desc = "Flash Treesitter",
	-- 		},
	-- 		-- { "r",         mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
	-- 		-- { "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	-- 		-- { "<leader>s", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	-- 	},
	-- },
	{
		"mikesmithgh/kitty-scrollback.nvim",
		enabled = true,
		lazy = true,
		cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
		event = { "User KittyScrollbackLaunch" },
		config = function()
			require("kitty-scrollback").setup()
		end,
	},
	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
		cmd = { "Browse" },
		init = function()
			vim.g.netrw_nogx = 1 -- disable netrw gx
		end,
		config = function()
			require("gx").setup({
				open_browser_app = "xdg-open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
				-- open_browser_args = {}, -- specify any arguments, such as --background for macOS' "open".
				handlers = {
					plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
					github = true, -- open github issues
					-- brewfile = true,                    -- open Homebrew formulaes and casks
					package_json = true, -- open dependencies from package.json
					search = true, -- search the web/selection on the web if nothing else is found
				},
				handler_options = {
					-- search_engine = "google",                           -- you can select between google, bing, duckduckgo, and ecosia
					search_engine = "http://localhost/search?q=", -- or you can pass in a custom search engine
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		init = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			lang = "typescript",
		},
	},
	"kyazdani42/nvim-web-devicons",
}
