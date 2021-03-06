if not pcall(require, "nvim-treesitter") then
  return
end
-- alt+<space>, alt+p -> swap next
-- alt+<backspace>, alt+p -> swap previous
-- swap_previous = {
--   ["<M-s><M-P>"] = "@parameter.inner",
--   ["<M-s><M-F>"] = "@function.outer",
-- },
-- local swap_next, swap_prev = (function()
--   local swap_objects = {
--     p = "@parameter.inner",
--     f = "@function.outer",
--     e = "@element",
--   }

--   local n, p = {}, {}
--   for key, obj in pairs(swap_objects) do
--     n[string.format("<M-Space><M-%s>", key)] = obj
--     p[string.format("<M-BS><M-%s>", key)] = obj
--   end

--   return n, p
-- end)()

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    --enable = true,
    disable = {},
  },
  ensure_installed = {
    "lua",
    "vim",
    "tsx",
    "typescript",
    "go",
    "python",
    "css",
    "json",
    "yaml",
    "html",
    "rust",
    "dart",
    "graphql",
    "bash",
    "dockerfile",
    "markdown",
  },
  rainbow = {
    enable = true,
    -- disable = { "tsx" }, -- list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
      "#fb4934",
      "#b8bb26",
      "#fabd2f",
      "#83a598",
      "#d3869b",
    }, -- table of hex strings
    -- https://github.com/morhetz/gruvbox-contrib/blob/master/color.table
    -- termcolors = {} -- table of colour name strings
  },
  context_commentstring = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<M-w>", -- maps in normal mode to init the node/scope selection
      node_incremental = "<M-w>", -- increment to the upper named parent
      node_decremental = "<M-C-w>", -- decrement to the previous node
      scope_incremental = "<M-q>", -- increment to the upper scope (as defined in locals.scm)
    },
  },
  autotag = {
    enable = true
  },
  -- textobjects = {
  --   move = {
  --     enable = true,
  --     set_jumps = true,

  --     goto_next_start = {
  --       ["]p"] = "@parameter.inner",
  --       ["]m"] = "@function.outer",
  --       ["]]"] = "@class.outer",
  --     },
  --     goto_next_end = {
  --       ["]M"] = "@function.outer",
  --       ["]["] = "@class.outer",
  --     },
  --     goto_previous_start = {
  --       ["[p"] = "@parameter.inner",
  --       ["[m"] = "@function.outer",
  --       ["[["] = "@class.outer",
  --     },
  --     goto_previous_end = {
  --       ["[M"] = "@function.outer",
  --       ["[]"] = "@class.outer",
  --     },
  --   },

  --   select = {
  --     enable = true,
  --     keymaps = {
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",

  --       ["ac"] = "@conditional.outer",
  --       ["ic"] = "@conditional.inner",

  --       ["aa"] = "@parameter.outer",
  --       ["ia"] = "@parameter.inner",

  --       ["av"] = "@variable.outer",
  --       ["iv"] = "@variable.inner",
  --     },
  --   },
  --   swap = {
  --     enable = true,
  --     swap_next = swap_next,
  --     swap_previous = swap_prev,
  --   },
  -- },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- Darker gruvbox colours:

--       "#cc241d",
--       "#98971a",
--       "#d79921",
--       "#458588",
--       "#b16286",
