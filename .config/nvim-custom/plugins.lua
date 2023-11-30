local plugins = {
    {"christoomey/vim-tmux-navigator", lazy = false}, {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end
    }, {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function()
            require("nvim-tree").setup {
                filters = {git_ignored = false, custom = {"^\\.git$"}}
            }
        end,
        override_options = require("custom.configs.nvimtree")
    }, {
        "williamboman/mason.nvim",
        opts = function() return require("custom.configs.mason") end
    }, {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        opts = function() return require("custom.configs.null-ls") end
    }, {
        "mfussenegger/nvim-dap",
        init = function() require("core.utils").load_mappings("dap") end
    }, {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {"mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui"},
        config = function(_, opts)
            local path =
                "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end
    }, {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
            require("core.utils").load_mappings("dap_go")
        end
    }, {
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
    }, {
        -- Rainbow indent plugin
        "p00f/nvim-ts-rainbow",
        event = "BufRead",
        config = function()
            require("nvim-treesitter.configs").setup {
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil
                }
            }
        end
    }, {
        -- Copilot
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "VeryLazy",
        config = function()
            require("copilot").setup({
                suggestion = {
                    keymap = {
                        accept_word = false,
                        accept_line = "<S-tab>",
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>"
                    }
                }
            })
        end
    }, {
        "dreamsofcode-io/ChatGPT.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        config = function()
            require("chatgpt").setup({
                async_api_key_cmd = "pass show api/tokens/openai"
            })
        end
    }, {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
            require("core.utils").load_mappings("gopher")
        end,
        build = function() vim.cmd [[silent! GoInstallDeps]] end
    }, {
        "tpope/vim-fugitive",
        lazy = false,
        config = function()
            require("core.utils").load_mappings("fugitive")
        end
    }, {
        -- Cmake
        "Civitasv/cmake-tools.nvim",
        lazy = true,
        ft = "cmake",
        config = function()
            require("cmake-tools").setup({
                cmake_build_directory = "build/${variant:buildType}"
            })
        end
    }, {
        -- R
        "jalvesaq/Nvim-R",
        lazy = false,
        dependencies = {"hrsh7th/nvim-cmp", "jalvesaq/cmp-nvim-r"}
    }, {
        -- Markdown
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow"
    }, {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"
        },
        build = "cd app && yarn install",
        init = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    }
}
return plugins
