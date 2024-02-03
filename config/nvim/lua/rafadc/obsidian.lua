require("obsidian").setup({
  workspaces = {
    {
      name = "personal",
      path = "~/Google Drive/Apps/Obsidian/Notes",
    },
  },
})

vim.keymap.set('n', '<leader>oq', ":ObsidianQuickSwitch<CR>")
vim.keymap.set('n', '<leader>os', ":ObsidianSearch<CR>")
