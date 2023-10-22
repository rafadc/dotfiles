local whichkey = require("which-key")

whichkey.register({
  f = { 
    name = 'file',
    f = { 'find' },
    r = { 'recent' },
  },
  p = { name = 'project' },
  s = { name = 'search' },
  a = { name = 'navigate' },
  g = { name = 'git' },
  u = { name = 'undotree' },
}, { prefix = '<leader>' })


