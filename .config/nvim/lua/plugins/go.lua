return {
  -- Configure gopls with better defaults for Go development
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          capabilities = {
            workspace = {
              didChangeWatchedFiles = {
                dynamicRegistration = false,
              },
            },
          },
          settings = {
            gopls = {
              gofumpt = true,
              staticcheck = false,
              memoryMode = "DegradeClosed",
              directoryFilters = { "-.git", "-vendor", "-testdata", "-node_modules" },
              usePlaceholders = true,
              completeFunctionCalls = true,
              analyses = {
                shadow = true,
                unusedvariable = true,
                unusedparams = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
      },
    },
  },

  -- Re-enable inlay hints for Go files only
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "gopls" then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })
      return opts
    end,
  },

  -- Use goimports + gofumpt formatter chain for Go
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },

  -- Ensure gomodifytags is installed via mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "gomodifytags" },
    },
  },

  -- Configure neotest-golang with race detection and no caching
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-golang"] = {
          go_test_args = { "-v", "-race", "-count=1" },
        },
      },
    },
  },
}
