local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require("nvim-tree").setup {
        filters = {
          git_ignored = false,
          custom = { "^\\.git$" }
        }
      }
    end,
    override_options = require("custom.configs.nvimtree")
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require("custom.configs.mason")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    -- Rainbow indent plugin
    "p00f/nvim-ts-rainbow",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        },
      }
    end,
  },
  {
    -- Copilot
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VeryLazy",
  },
  {
    "dreamsofcode-io/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    config = function()
      require("chatgpt").setup({
        async_api_key_cmd = "pass show api/tokens/openai",
      })
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      require("core.utils").load_mappings("fugitive")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    branch = "main",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-calc" },
      { "hrsh7th/cmp-emoji" },
      { "saadparwaiz1/cmp_luasnip" },
      { "f3fora/cmp-spell" },
      { "ray-x/cmp-treesitter" },
      { "kdheepak/cmp-latex-symbols" },
      { "jmbuhr/cmp-pandoc-references" },
      {
        "L3MON4D3/LuaSnip",
        version = nil,
        branch = "master",
      },
      { "rafamadriz/friendly-snippets" },
      { "onsails/lspkind-nvim" },
    },
    config = function()
      require "plugins.configs.cmp"
      require "custom.configs.cmp"
    end
  },
  {
    "quarto-dev/quarto-nvim",
    ft = "quarto",
    dependencies = {
      {
        "jmbuhr/otter.nvim",
        ft = "quarto",
        dependencies = {
          { "neovim/nvim-lspconfig" },
        },
        opts = {
          lsp = {
            hover = {
              border = require("custom.style").border,
            },
          },
        },
      },
    },
    opts = {
      lspFeatures = {
        languages = { "r", "python", "julia", "bash", "lua", "html" },
      },
    },
  },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
  {
    "jpalardy/vim-slime",
    ft = "quarto",
    init = function()
      require "custom.configs.vim-slime"
    end
  },
	{
		"jbyuki/nabla.nvim",
		keys = {
			{ "<leader>ee", ':lua require"nabla".toggle_virt()<cr>', "toggle equations" },
			{ "<leader>eh", ':lua require"nabla".popup()<cr>', "hover equation" },
		},
	},
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function ()
      require "custom.configs.whichkey"
    end
  }
}
return plugins
