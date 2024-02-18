-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local set = vim.opt

set.ignorecase = true

set.relativenumber = false
set.linebreak = true
set.scrolloff = 8
set.textwidth = 100
set.colorcolumn = "100"

-- Reverse highlight colors
local function reverse_highlight_colors()
  vim.cmd("hi Visual cterm=reverse gui=reverse")
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = reverse_highlight_colors })
