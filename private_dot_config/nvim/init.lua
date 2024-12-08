-- Basic Options
vim.opt.showmatch = true -- show matching
vim.opt.ignorecase = true -- case insensitive
vim.opt.smartcase = true
vim.opt.incsearch = true -- incremental search
vim.opt.tabstop = 4 -- number of columns occupied by a tab
vim.opt.softtabstop = 4 -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true -- converts tabs to white space
vim.opt.smarttab = true
vim.opt.shiftwidth = 4 -- width for autoindents
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undodir/")
vim.opt.undofile = true
vim.opt.scrolloff = 8
vim.opt.encoding = "UTF-8"
vim.opt.wildmode = "longest,list,full"
vim.opt.wildmenu = true
vim.opt.cursorline = true -- highlight current cursorline
vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.lazyredraw = true -- Faster macros
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 100

vim.opt.path:append("**")
vim.opt.wildignore:append("*/node_modules/*")
vim.opt.wildignore:append("**/.git/*")

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Load keymaps
require("keymaps")

-- Setup lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Colorscheme

-- Default options:
require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "hard", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})

vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox")

-- Highlight settings
-- vim.cmd([[
-- highlight Normal ctermbg=NONE guibg=NONE
-- highlight NormalFloat ctermbg=NONE guibg=NONE
-- highlight SignColumn ctermbg=NONE guibg=NONE
-- highlight TreesitterContext ctermbg=NONE guibg=#504945
-- ]])

-- Short highlight on yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 40 })
	end,
	pattern = "*",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
})

-- Two-space indentation for specific file types
local two_space_group = vim.api.nvim_create_augroup("two_space_langs", { clear = true })
local two_space_types = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"lua",
	"elixir",
	"svelte",
}

for _, ft in ipairs(two_space_types) do
	vim.api.nvim_create_autocmd("FileType", {
		pattern = ft,
		group = two_space_group,
		callback = function()
			vim.bo.shiftwidth = 2
			vim.bo.tabstop = 2
		end,
	})
end

-- Neorg settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	group = vim.api.nvim_create_augroup("neorg", { clear = true }),
	callback = function()
		vim.wo.conceallevel = 2
		vim.wo.wrap = true
		vim.wo.linebreak = true
		vim.wo.spell = true
	end,
})
