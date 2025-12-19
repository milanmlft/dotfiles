return { 
    "EdenEast/nightfox.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('nightfox').setup {
        options = {
            styles = {
              comments = "italic",
              keywords = "bold",
              types = "italic,bold",
            }
        }
      }

      -- Load the colorscheme here.
      vim.cmd.colorscheme 'nightfox'
    end,
}
