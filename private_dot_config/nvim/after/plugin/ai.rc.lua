require("copilot").setup({
	panel = {
		enabled = true,
		auto_refresh = false,
		keymap = {
			jump_prev = "[[",
			jump_next = "]]",
			accept = "<CR>",
			refresh = "gr",
			open = "<M-CR>",
		},
		layout = {
			position = "right", -- | top | left | right
			ratio = 0.4,
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
		keymap = {
			accept = "<C-CR>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		norg = false,
		["."] = false,
	},
	copilot_node_command = "node", -- Node.js version must be > 16.x
	server_opts_overrides = {},
})

require("avante").setup({
	provider = "copilot",
	-- auto_suggestions_provider = "copilot",
	copilot = {
		model = "claude-3.5-sonnet",
		-- temperature = 0,
		-- max_tokens = 4096,
	},
	-- behaviour = {
	-- 	auto_suggestions = true,
	-- },
	mappings = {
		submit = {
			normal = "<CR>",
			insert = "<C-CR>",
		},
	},
	hints = { enabled = true },
	windows = {
		ask = {
			floating = false,
			border = "rounded",
		},
	},
})

-- require("codecompanion").setup({
-- 	adapters = {
-- 		gemini = function()
-- 			return require("codecompanion.adapters").extend("gemini", {
-- 				env = {
-- 					api_key = "GEMINI_API_KEY",
-- 					-- model = "gemini-pro",
-- 				},
-- 			})
-- 		end,
-- 		copilot = function()
-- 			return require("codecompanion.adapters").extend("copilot", {
-- 				schema = {
-- 					model = {
-- 						default = "claude-3.5-sonnet",
-- 					},
-- 				},
-- 			})
-- 		end,
-- 	},
-- 	strategies = {
-- 		chat = {
-- 			adapter = "copilot",
-- 			slash_commands = {
-- 				["file"] = {
-- 					callback = "strategies.chat.slash_commands.file",
-- 					description = "Insert a file",
-- 					opts = {
-- 						contains_code = true,
-- 						-- max_lines = 1000,
-- 						provider = "telescope", -- default|telescope|mini_pick|fzf_lua
-- 					},
-- 				},
-- 				["buffer"] = {
-- 					callback = "strategies.chat.slash_commands.buffer",
-- 					description = "Insert open buffers",
-- 					opts = {
-- 						contains_code = true,
-- 						provider = "telescope", -- default|telescope|mini_pick|fzf_lua
-- 					},
-- 				},
-- 			},
-- 		},
-- 		inline = {
-- 			adapter = "copilot",
-- 		},
-- 	},
-- 	display = {
-- 		chat = {
-- 			show_references = true,
-- 			show_settings = true,
-- 		},
-- 		diff = {
-- 			provider = "mini_diff",
-- 		},
-- 	},
-- })
