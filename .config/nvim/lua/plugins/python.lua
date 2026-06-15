-- Required: Enable the language server
vim.lsp.enable("ty")

-- Disable pyright
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = false,
          autostart = false,
        },
      },
    },
  },
}
