-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local wk = require("which-key")

map("n", "<leader>pv", vim.cmd.Ex)

-- Move lines up and down in Visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in same position for various operations
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Pasting without overwriting the paste buffer!
map("x", "<leader>p", '"_dP')

-- Disable Q!
map("n", "Q", "<nop>")

-- Replace word under cursor
map("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace word under cursor" })

map("n", "<leader>U", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- cmake
wk.register({
  C = { name = "+CMake" },
})
map("n", "<leader>Cg", ":CMakeGenerate<CR>", { desc = "CMake Generate" })
map("n", "<leader>Cb", ":CMakeBuild<CR>", { desc = "CMake Build" })
