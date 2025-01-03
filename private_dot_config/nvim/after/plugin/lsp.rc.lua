require("fidget").setup()

require("mason").setup()
require("mason-lspconfig").setup()

local lsp_fixcurrent = require("lsp_fixcurrent")

local lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	lightbulb = {
		enable = true,
		virtual_text = false,
	},
})

require("lsp_signature").setup()

local signs = { Error = "", Warn = "", Hint = "󰌶", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set('n', '<space>wl', function()
	--   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	vim.keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	vim.keymap.set("n", "<space>qf", lsp_fixcurrent, bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
	vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
	vim.keymap.set("n", "gs", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
	vim.keymap.set("n", "gs", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gv", "<cmd> vsplit | lua vim.lsp.buf.definition()<CR>", bufopts)
	vim.keymap.set("n", "gV", "<cmd> split | lua vim.lsp.buf.definition()<CR>", bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", bufopts)
	vim.keymap.set("n", "]g", function()
		require("lspsaga.diagnostic"):goto_next()
	end, bufopts)
	vim.keymap.set("n", "[g", function()
		require("lspsaga.diagnostic"):goto_prev()
	end, bufopts)
	vim.keymap.set("n", "]e", function()
		require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, bufopts)
	vim.keymap.set("n", "[e", function()
		require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, bufopts)
	vim.keymap.set("n", "<leader>e", "<cmd>Telescope diagnostics<cr>", bufopts)
	vim.keymap.set("n", "<leader>r", "<cmd>Lspsaga rename<CR>", bufopts)
	vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("typescript-tools").setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lsp["eslint"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["gopls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
	-- settings = {
	--   gopls = {
	--     hints = {
	--       assignVariableTypes = true,
	--       compositeLiteralFields = true,
	--       compositeLiteralTypes = true,
	--       constantValues = true,
	--       functionTypeParameters = true,
	--       parameterNames = true,
	--       rangeVariableTypes = true,
	--     },
	--   },
	-- },
})

lsp["intelephense"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp["bashls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["pylsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["elixirls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

-- lsp['nextls'].setup {
-- capabilities = capabilities,
--   on_attach = on_attach,
--   flags = lsp_flags,
-- }

lsp["prismals"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["svelte"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["ruby_lsp"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

lsp["solargraph"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	flags = lsp_flags,
})

local ok, lspkind = pcall(require, "lspkind")
if not ok then
	return
end

lspkind.init()

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			-- Snippet engine is required
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	completion = {
		completeopt = "menu,menuone,noinsert,noselect",
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		["<C-b>"] = cmp.mapping.scroll_docs(-5),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	experimental = {
		ghost_text = false,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "vsnip" },
		{ name = "neorg" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				path = "[path]",
				neorg = "[neorg]",
				vsnip = "[snip]",
			},
		}),
	},
	-- preselect = cmp.PreselectMode.None,
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,

			function(entry1, entry2)
				local _, entry1_under = entry1.completion_item.label:find("^_+")
				local _, entry2_under = entry2.completion_item.label:find("^_+")
				entry1_under = entry1_under or 0
				entry2_under = entry2_under or 0
				if entry1_under > entry2_under then
					return false
				elseif entry1_under < entry2_under then
					return true
				end
			end,

			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
