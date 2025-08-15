require('lspconfig').tailwindcss.setup{
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = { [[\bclass:\s*'([^']*)']], [[\bclass:\s*\"([^"]*)"]] }
      }
    }
  }
}

