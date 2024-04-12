return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "vim-pandoc/vim-pandoc" },
  { "vim-pandoc/vim-pandoc-syntax" },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          -- Disable line length cheking for markdown
          args = { "--disable", "MD013", "--" },
        },
      },
    },
  },
}
