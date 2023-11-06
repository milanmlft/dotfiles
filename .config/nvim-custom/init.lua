-- For configuring nvim options

local set = vim.opt -- set options
-- set.tabstop = 4
-- set.softtabstop = 4
-- set.shiftwidth = 4

-- Add width marker
set.colorcolumn = "100"

-- Set relative line numbers by default
set.relativenumber = true

-- Open nivmtree when in directory
local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local function reverse_highlight_colors()
  vim.cmd('hi Visual cterm=reverse gui=reverse')
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = reverse_highlight_colors })
