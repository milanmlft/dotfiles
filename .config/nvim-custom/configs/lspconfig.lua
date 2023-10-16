local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml")
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.r_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"r", "rmd"},
  root_dir = util.root_pattern(".git", "DESCRIPTION", "*.Rproj", ".Rprofile")
})

lspconfig.ansiblels.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml.ansible"}
})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
})

lspconfig.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"dockerfile"},
  root_dir = util.root_pattern("Dockerfile")
})

lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml.docker-compose"},
  root_dir = util.root_pattern("docker-compose.yaml")
})

lspconfig.terraform_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"terraform-ls"},
  filetypes = {"terraform", "hcl"},
  root_dir = util.root_pattern(".terraform", ".git")
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"yaml"},
  root_dir = util.find_git_ancestor,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      }
    }
  }
})

