local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local function git_or_find_files()
	local ok = pcall(builtin.git_files, { show_untracked = true })
	if not ok then
		builtin.find_files({ hidden = true })
	end
end

vim.keymap.set("n", "<C-p>", git_or_find_files)
vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({ no_ignore = true, hidden = true })
end)
vim.keymap.set("n", "<leader>ps", builtin.live_grep)
vim.keymap.set("n", "<leader>pw", function()
	builtin.grep_string({ search = vim.fn.expand("<cword>") })
end)
vim.keymap.set("n", "<leader>pi", builtin.help_tags)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)
vim.keymap.set("n", "<leader>gC", builtin.git_bcommits)
vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)

telescope.setup({
	defaults = {
		file_sorter = sorters.fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,

		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

telescope.load_extension("fzy_native")
-- telescope.load_extension("dap")
telescope.load_extension("file_browser")
