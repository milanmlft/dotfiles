-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local wk = require("which-key")

-- Move lines up and down in Visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in same position for various operations
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Disable q and Q!
map("n", "q", "<nop>")
map("n", "Q", "<nop>")

wk.add({
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>W", group = "Write" },
    { "<leader>Ww", "<cmd>w<cr>", desc = "Write" },
    { "<leader>Wq", "<cmd>wq<cr>", desc = "Write and quit" },
    { "<leader>Wqa", "<cmd>wqa<cr>", desc = "Write and quit all" },
  },
  { "<leader>P", '"_dP', desc = "Paste without overwriting paste buffer", mode = "x" },
  {
    "<leader>R",
    ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
    desc = "Replace word under cursor",
    icon = "󰛔",
  },
  { "<leader>U", vim.cmd.UndotreeToggle, desc = "Toggle Undotree", icon = "" },
  {
    "<leader>0",
    function()
      Snacks.dashboard.open()
    end,
    desc = "Home",
    icon = "",
  },
})
