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

-- Move between windows
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Yank error
vim.keymap.set("n", "<leader>ye", function()
	local msg = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })[1]
	if msg then
		vim.fn.setreg("+", msg.message) -- Copy to system clipboard
		print("Error yanked to clipboard!")
	else
		print("No diagnostic on this line.")
	end
end)
