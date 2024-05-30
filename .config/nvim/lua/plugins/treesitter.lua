return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "python",
        "r",
        "json",
        "yaml",
        "vim",
        "html",
        "cmake",
        "cpp",
        "gitignore",
        "go",
        "markdown",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
    },
  },
}
