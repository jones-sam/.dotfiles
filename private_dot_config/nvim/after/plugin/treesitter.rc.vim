if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
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
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
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
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF

"Darker gruvbox colours:

      "#cc241d",
      "#98971a",
      "#d79921",
      "#458588",
      "#b16286",
