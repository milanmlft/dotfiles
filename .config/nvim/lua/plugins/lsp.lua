return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        eslint = {},
        -- R
        r_language_server = {
          cmd = { "R", "--slave", "-e", "languageserver::run()" },
          filetypes = { "r", "rmd" },
          log_level = 2,
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("DESCRIPTION", "NAMESPACE", ".Rbuildignore")(fname)
              or require("lspconfig.util").find_git_ancestor(fname)
              or vim.loop.os_homedir()
          end,
        },
        ruff_lsp = {},
        -- C++
        clangd = {},
        cmake = {},
        -- Docker
        dockerls = {},
        docker_compose_language_service = {},
        -- markdown
        marksman = {},
        -- other
        yamlls = {},
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "nvimtools/none-ls.nvim", -- null-ls fork after it was archived
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        -- Set up mypy so it uses the local virtualenv if there is one
        nls.builtins.diagnostics.mypy.with({
          extra_args = function()
            local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
            return { "--python-executable", virtual .. "/bin/python3" }
          end,
          -- Styler for R
          nls.builtins.formatting.styler,
        }),
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        cmake = { "cmakelint" },
        -- sql = { "sqlfluff" },
      },
    },
  },
}
