local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
    sources = {
        -- python
        null_ls.builtins.formatting.ruff, null_ls.builtins.diagnostics.ruff,
        -- null_ls.builtins.formatting.black.with({
        --     extra_args = {"--fast", "--line-length-100"}
        -- }),
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = function()
                local virtual = os.getenv("VIRTUAL_ENV") .. "/bin" or
                    os.getenv("PYENV_ROOT") .. "/shims" or
                    "/usr/bin"
                return { "--python-executable", virtual .. "/python3" }
            end
        }), null_ls.builtins.formatting.gofmt, -- go
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.clang_format, -- c++
        null_ls.builtins.formatting.lua_format,   -- lua
        -- null_ls.builtins.formatting.markdownlint, -- markdown
        null_ls.builtins.diagnostics.cmake_lint,  -- cmake
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.prettierd
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end
            })
        end
    end
}

return opts
