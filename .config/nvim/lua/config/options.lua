-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local set = vim.opt

set.number = true
set.relativenumber = true

set.shiftwidth = 4
set.smarttab = true
set.expandtab = true

-- Set tab stops to different length than indentation width, to reduce the chance of mixing tabs and spaces
set.tabstop = 4
set.softtabstop = 4

set.smartindent = true

set.wrap = true

-- Disable swap files and use undotree instead
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

-- Scrolling
set.scrolloff = 8
set.signcolumn = "yes"

-- Faster updatetime
set.updatetime = 50

set.textwidth = 100
set.colorcolumn = "100"
