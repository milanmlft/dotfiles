local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
    sources = {
        -- python
        null_ls.builtins.formatting.black.with({
            extra_args = {"--fast", "--line-length-100"}
        }), null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff, null_ls.builtins.formatting.gofmt, -- go
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.clang_format, -- c++
        null_ls.builtins.formatting.lua_format, -- lua
        null_ls.builtins.formatting.markdownlint, -- markdown
        null_ls.builtins.diagnostics.cmake_lint, -- cmake
        null_ls.builtins.formatting.cmake_format
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr})
                end
            })
        end
    end
}

return opts
