-- Set keymap for toggling undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Set focus when toggle option
vim.g.undotree_SetFocusWhenToggle = 1
