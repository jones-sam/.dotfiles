require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-s>"] = false,
		["<C-h>"] = false,
		["<C-l>"] = false,
		["<C-p>"] = false,
		["gv"] = "actions.select_vsplit",
		["gV"] = "actions.select_split",
		["<M-r>"] = "actions.refresh",
		["<M-p>"] = "actions.preview",
	},
	win_options = {
		winbar = "%#@attribute.builtin#%{substitute(v:lua.require('oil').get_current_dir(), '^' . $HOME, '~', '')}",
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
