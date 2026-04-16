-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Go-specific keymaps, set on LspAttach for Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function(args)
    local buf = args.buf
    local opts = { buffer = buf, silent = true }

    -- Alternate between foo.go and foo_test.go
    vim.keymap.set("n", "<leader>cga", function()
      local file = vim.fn.expand("%:p")
      local alt
      if file:match("_test%.go$") then
        alt = file:gsub("_test%.go$", ".go")
      else
        alt = file:gsub("%.go$", "_test.go")
      end
      if vim.fn.filereadable(alt) == 1 then
        vim.cmd("edit " .. alt)
      else
        vim.notify("Alternate file not found: " .. alt, vim.log.levels.WARN)
      end
    end, vim.tbl_extend("force", opts, { desc = "Go: alternate test file" }))

    -- GoIfErr: insert `if err != nil { return err }` below cursor
    vim.keymap.set("n", "<leader>cge", function()
      local row = vim.api.nvim_win_get_cursor(0)[1]
      vim.api.nvim_buf_set_lines(buf, row, row, false, {
        "if err != nil {",
        "\treturn err",
        "}",
      })
      vim.api.nvim_win_set_cursor(0, { row + 2, 1 })
    end, vim.tbl_extend("force", opts, { desc = "Go: if err != nil" }))

    -- GoFillStruct: use gopls "Fill struct" code action
    vim.keymap.set("n", "<leader>cgs", function()
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(action)
          return action.title:lower():find("^fill ") ~= nil
        end,
        on_list = function(list)
          if #list.items == 0 then
            vim.notify("No 'fill struct' action available — place cursor on an incomplete struct literal", vim.log.levels.WARN)
          end
        end,
      })
    end, vim.tbl_extend("force", opts, { desc = "Go: fill struct" }))

    -- GoAddTag: use gomodifytags to add json tags to struct under cursor
    vim.keymap.set("n", "<leader>cgt", function()
      -- Find the enclosing struct name via treesitter
      local node = vim.treesitter.get_node()
      while node do
        if node:type() == "type_spec" then
          local name_node = node:field("name")[1]
          if name_node then
            local struct_name = vim.treesitter.get_node_text(name_node, buf)
            local file = vim.fn.expand("%:p")
            vim.system(
              { "gomodifytags", "-file", file, "-struct", struct_name, "-add-tags", "json", "-transform", "snakecase", "-w" },
              {},
              function(result)
                vim.schedule(function()
                  if result.code == 0 then
                    vim.cmd("edit!")
                  else
                    vim.notify("gomodifytags: " .. (result.stderr or "unknown error"), vim.log.levels.ERROR)
                  end
                end)
              end
            )
            return
          end
        end
        node = node:parent()
      end
      vim.notify("No struct found under cursor", vim.log.levels.WARN)
    end, vim.tbl_extend("force", opts, { desc = "Go: add json struct tags" }))
  end,
})
