local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = {
            'progress'
        },
        lualine_z = {
            'string.format("%d/%d", unpack(vim.api.nvim_win_get_cursor(0)), vim.api.nvim_buf_line_count(0))',
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
            }
        },
        lualine_x = { 'location', 'filesize' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'nvim-tree', 'fugitive', 'nvim-dap-ui' }
}
