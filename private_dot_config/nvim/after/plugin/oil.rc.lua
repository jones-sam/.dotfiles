require("oil").setup({
  view_options = {
    show_hidden = true
  },
  keymaps = {
    ["<C-s>"] = false,
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-p>"] = false,
    ["gv"] = "actions.select_vsplit",
    ["gV"] = "actions.select_split",
    ["<M-r>"] = "actions.refresh",
    ["<M-p>"] = "actions.preview"
  },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
