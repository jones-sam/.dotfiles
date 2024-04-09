local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

-- I switched ctrl-p to find_files instaead of git files because it was annoying to
-- try to find a file which hasn't yet been added to git
vim.keymap.set("n", "<C-p>", builtin.find_files)
vim.keymap.set("n", "<leader>pg", builtin.git_files)
vim.keymap.set("n", "<leader>ps", builtin.live_grep)
vim.keymap.set("n", "<leader>pw", function ()
  builtin.grep_string({ search = vim.fn.expand("<cword>")})
end)
vim.keymap.set("n", "<leader>ph", function ()
  builtin.find_files({hidden = true})
end)
vim.keymap.set("n", "<leader>pi", builtin.help_tags)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)
vim.keymap.set("n", "<leader>gC", builtin.git_bcommits)

telescope.setup {
  defaults = {
    file_sorter = sorters.fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
    mappings = {
      n = {
	["q"] = actions.close
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension("fzy_native")
-- telescope.load_extension("dap")
telescope.load_extension("file_browser")
