--- https://github.com/hedyhli/outline.nvim
--- Code outline sidebar powered by LSP.
return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>o", ":Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    symbol_folding = {
      -- Depth past which nodes will be folded by default. Set to false to unfold all on open.
      outofold_depth = 1,
    },
  },
}
