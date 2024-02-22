return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        eslint = {},
        -- Python
        -- Still need pyright for more LSP features
        pyright = {
          settings = {
            pyright = {
              disableOrganizeImports = true, -- Using Ruff
            },
            python = {
              analysis = {
                ignore = { "*" }, -- Using Ruff
                typeCheckingMode = "off", -- Using mypy
              },
            },
          },
        },
        ruff_lsp = {},
        -- C++
        clangd = {},
        cmake = {},
        -- R
        r_language_server = {},
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
  -- Set up mypy through null-ls
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
        }),
      })
    end,
  },
}
