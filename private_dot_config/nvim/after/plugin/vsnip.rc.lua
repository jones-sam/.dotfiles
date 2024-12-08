-- Function to handle vsnip expand or jump
local function vsnip_expand_or_jump()
	if vim.fn["vsnip#available"](1) == 1 then
		return "<Plug>(vsnip-expand-or-jump)"
	else
		return "<C-j>"
	end
end

-- Function to handle vsnip jump backwards
local function vsnip_jump_prev()
	if vim.fn["vsnip#jumpable"](-1) == 1 then
		return "<Plug>(vsnip-jump-prev)"
	else
		return "<C-k>"
	end
end

-- Expand or jump forward
vim.keymap.set("i", "<C-j>", vsnip_expand_or_jump, { expr = true })
vim.keymap.set("s", "<C-j>", vsnip_expand_or_jump, { expr = true })

-- Jump backward
vim.keymap.set("i", "<C-k>", vsnip_jump_prev, { expr = true })
vim.keymap.set("s", "<C-k>", vsnip_jump_prev, { expr = true })
