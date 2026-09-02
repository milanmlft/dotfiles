return {
  -- ── Mason tools ──────────────────────────────────────────────────────────
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "delve",
      },
    },
  },

  -- ── LSP ──────────────────────────────────────────────────────────────────
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
              directoryFilters = { "-.git", "-vendor", "-testdata", "-node_modules" },
              ["formatting.gofumpt"] = true,
              staticcheck = false,
              semanticTokens = true,
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedvariable = true,
                unusedwrite = true,
                useany = true,
              },
              codelenses = {
                gc_details = true,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
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

  -- Enable inlay hints for Go files only
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

  -- ── Formatter ────────────────────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },

  -- ── Debugger ──────────────────────────────────────────────────────────────
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = { ensure_installed = { "delve" } },
      },
      {
        "leoluz/nvim-dap-go",
        opts = {},
      },
    },
  },

  -- ── Testing  ────────────────────────────────────────────────────────────────
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "fredrikaverpil/neotest-golang",
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          -- Here we can set options for neotest-golang, e.g.
          -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
          dap_go_enabled = true, -- requires leoluz/nvim-dap-go
        },
      },
    },
  },
}
