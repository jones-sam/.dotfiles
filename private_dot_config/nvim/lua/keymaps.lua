local map = vim.keymap.set

-- Moving lines up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- :W as alias for :w
vim.cmd("command! W w")

-- Delete without yanking
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

-- Paste without yanking in visual mode
map("v", "<leader>p", '"_dP')

-- Yank to system clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Save with Ctrl+S in normal and insert mode
map("n", "<C-s>", ":w<CR>")
map("i", "<C-s>", "<Esc>:w<CR>")

-- Center cursor when moving half-page up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Toggle completion
map("n", "<leader>cf", function()
	require("cmp").setup.buffer({ enabled = false })
end)
map("n", "<leader>ct", function()
	require("cmp").setup.buffer({ enabled = true })
end)
