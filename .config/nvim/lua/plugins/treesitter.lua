return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cmake",
        "cpp",
        "gitignore",
        "go",
        "html",
        "html",
        "json",
        "lua",
        "markdown",
        "python",
        "r",
        "sql",
        "vim",
        "yaml",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
    },
  },
}
