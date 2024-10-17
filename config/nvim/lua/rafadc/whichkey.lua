local whichkey = require("which-key")

whichkey.add({
    { "<leader>a",  group = "navigate" },
    { "<leader>f",  group = "file" },
    { "<leader>ff", desc = "find" },
    { "<leader>fr", desc = "recent" },
    { "<leader>ft", desc = "neotree" },
    { "<leader>g",  group = "git" },
    { "<leader>p",  group = "project" },
    { "<leader>s",  group = "search" },
    { "<leader>sg", desc = "grep" },
    { "<leader>sh", desc = "help" },
    { "<leader>u",  group = "undotree" },
}, { prefix = '<leader>' })
