local whichkey = require("which-key")

whichkey.register({
  f = {
    name = 'file',
    f = { 'find' },
    r = { 'recent' },
    t = { 'neotree' },
  },
  p = { name = 'project' },
  s = {
    name = 'search',
    g = 'grep',
    h = 'help',
  },
  a = { name = 'navigate' },
  g = { name = 'git' },
  u = { name = 'undotree' },
  h = {
    name = 'hugo',
    i = { 'image' },
    l = { 'link' },
  },
}, { prefix = '<leader>' })


