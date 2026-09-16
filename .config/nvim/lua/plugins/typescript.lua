return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "deno",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          enabled = true,
        },
      },
    },
  },
}
