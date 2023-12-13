local opts = {
    ensure_installed = {
        "black", "clangd", "clang-format", "debugpy", "mypy", "pyright", "ruff",
        "marksman", "glow", "gopls", "golines", "goimports", "gomodifytags",
        "gotests", "docker-compose-language-service",
        "dockerfile-language-server", "terraform-ls", "ansible-language-server",
        "ansible-lint", "yaml-language-server", "r-languageserver",
        "luaformatter", "lua-language-server", "markdownlint"
    }
}

return opts
