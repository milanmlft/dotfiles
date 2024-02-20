return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      bashls = {},
      eslint = {},
      -- Python
      -- Still need pyright for more LSP features
      pyright = {},
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
}
