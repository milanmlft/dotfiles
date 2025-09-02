return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      prettier = {
        options = {
          ext_parsers = {
            qmd = "markdown",
          },
        },
      },
    },
    formatters_by_ft = {
      quarto = { "prettierd", "prettier" },
      markdown = { "prettierd", "prettier" },
      python = { "ruff" },
    },
  },
}
