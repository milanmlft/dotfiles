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
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
    },
  },
}
