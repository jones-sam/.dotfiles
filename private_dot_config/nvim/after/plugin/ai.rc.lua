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

-- Add keybinding to switch AI models
vim.keymap.set(
	"n",
	"<leader>am",
	":SwitchAIModel<CR>",
	{ noremap = true, silent = true, desc = "Switch Copilot AI Model" }
)

local available_models = {
	"claude-3.7-sonnet",
	"claude-3.7-sonnet-thinking",
	"claude-3.5-sonnet",
	"gpt-4o",
	"gpt-4.1",
	"gpt-4.5",
	"gpt-o1",
	"gpt-o3",
	"gpt-o3-mini",
	"gpt-o4",
	"gpt-o4-mini",
	"gpt-o3",
	"gpt-o3-mini",
	"gemini-2.0-flash",
	"gemini-2.5-pro",
}

-- Store the base configuration
local avante_config = {
	provider = "copilot",
	-- auto_suggestions_provider = "copilot",
	copilot = {
		model = "claude-3.7-sonnet",
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
	web_search_engine = {
		provider = "searxng",
	},
}

-- Function to switch models
local function switch_model()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values

	local picker = pickers.new({}, {
		prompt_title = "Copilot Model",
		finder = finders.new_table({
			results = available_models,
		}),
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				local selection = action_state.get_selected_entry()
				actions.close(prompt_bufnr)

				-- Update the config with the new model while preserving other settings
				local updated_config = vim.tbl_deep_extend("force", avante_config, {
					copilot = {
						model = selection[1],
					},
				})
				require("avante").setup(updated_config)

				vim.notify("Switched to model: " .. selection[1], vim.log.levels.INFO)
			end)
			return true
		end,
	})
	picker:find()
end

-- Create a vim command to call the function
vim.api.nvim_create_user_command("SwitchAIModel", switch_model, {})

require("avante").setup(avante_config)
