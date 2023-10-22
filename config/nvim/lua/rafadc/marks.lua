local builtin = require('telescope.builtin')

require("marks").setup {
  default_mappings = false,
  mappings = {
    set = "m,",
    delete = "md",
    toggle = "m.",
  }
}

vim.keymap.set('n', 'mf', builtin.marks)

