-- configure more treesitter parsers
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "cpp",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "html",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "rust",
      "vim",
      "yaml",
    },
  },
}
