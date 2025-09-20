vim.lsp.config.tailwindcss = {
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = { [[\bclass:\s*'([^']*)']], [[\bclass:\s*\"([^"]*)"]] }
      }
    }
  }
}
