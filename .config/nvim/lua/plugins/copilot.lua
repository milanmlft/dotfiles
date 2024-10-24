-- Disable Copilot by default
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  command = "Copilot disable",
})

return {
  "zbirenbaum/copilot.lua",
  -- Only start Copilot when running 'Copilot' command
  cmd = "Copilot",
  keys = {
    {
      "<leader>cp",
      function()
        if require("copilot.client").is_disabled() then
          require("copilot.command").enable()
        else
          require("copilot.command").disable()
        end
      end,
      desc = "Toggle (Copilot)",
    },
  },
}
