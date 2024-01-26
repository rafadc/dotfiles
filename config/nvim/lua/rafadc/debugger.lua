local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

require('dap-go').setup()


vim.keymap.set('n', '<leader>dt', dapui.toggle, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dc', dap.continue, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dn', dap.step_over, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>di', dap.step_into, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>do', dap.step_out, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ds', dap.stop, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dl', dap.run_last, { noremap = true, silent = true })

