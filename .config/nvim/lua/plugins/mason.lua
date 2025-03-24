return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "clang-format",
      "pyright",
      "ruff",
      "ruff-lsp",
      "prettier",
      "prettierd",
      "cmake-language-server",
      "cmakelang",
      "sqlfluff",
    },
  },
}
