vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.cmd.colorscheme "ayu"

require("ayu").setup({
    mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
    overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
})

