return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato",
      transparent_background = true,
      styles = {
        comments = { "italic" },
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    name = "nightfox",
    priority = 1000,
  },
}
