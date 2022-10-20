local dap = require('dap')

local dapui = require('dapui')
dapui.setup()

require('dap-go').setup()
require('nvim-dap-virtual-text').setup()

vim.keymap.set("n", "<F1>", dap.step_back)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F6>", dapui.toggle)

vim.keymap.set("n", '<leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set("n", '<leader>B', function()
  dap.set_breakpoint(vim.fn.input '[DAP] Condition > ')
end)
