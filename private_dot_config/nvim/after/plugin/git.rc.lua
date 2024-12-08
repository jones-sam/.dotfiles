-- LazyGit toggle
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

-- Fugitive commands
vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { silent = true })
vim.keymap.set("n", "<leader>gf", ":G fetch<CR>", { silent = true })
vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit<CR>", { silent = true })
vim.keymap.set("n", "<leader>gw", ":GBrowse<CR>", { silent = true })
