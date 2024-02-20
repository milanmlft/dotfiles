return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d fewer lines" },
          { find = "%d more lines" },
          { find = "%d lines <ed %d time[s]?" },
          { find = "%d lines >ed %d time[s]?" },
          { find = "%d lines yanked" },
        },
        view = "mini",
      },
    },
  },
}
