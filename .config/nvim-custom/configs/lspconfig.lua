local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = require("cmp_nvim_lsp")
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern("Cargo.toml")
})

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})

lspconfig.r_language_server.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "r", "rmd" },
  root_dir = util.root_pattern(".git", "DESCRIPTION", "*.Rproj", ".Rprofile")
})

lspconfig.ansiblels.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml.ansible" }
})

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
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
  filetypes = { "dockerfile" },
  root_dir = util.root_pattern("Dockerfile")
})

lspconfig.docker_compose_language_service.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml.docker-compose" },
  root_dir = util.root_pattern("docker-compose.yaml")
})

lspconfig.terraform_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "terraform-ls" },
  filetypes = { "terraform", "hcl" },
  root_dir = util.root_pattern(".terraform", ".git")
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "yaml" },
  root_dir = util.find_git_ancestor,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      }
    }
  }
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css" }
})

lspconfig.julials.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
})

-- Quarto stuff from https://github.com/jmbuhr/quarto-nvim-kickstarter/blob/b82936d4391aeca65689b91f0687476fe1933807/lua/plugins/quarto.lua
local on_attach_qmd = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts)
  client.server_capabilities.document_formatting = true
end

local lsp_flags = {
  allow_incremental_sync = true,
  debounce_text_changes = 150,
}

local function strsplit(s, delimiter)
  local result = {}
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

local function get_quarto_resource_path()
  local f = assert(io.popen("quarto --paths", "r"))
  local s = assert(f:read("*a"))
  f:close()
  return strsplit(s, "\n")[2]
end

local lua_library_files = vim.api.nvim_get_runtime_file("", true)
local lua_plugin_paths = {}
local resource_path = get_quarto_resource_path()
if resource_path == nil then
  vim.notify_once("quarto not found, lua library files not loaded")
else
  table.insert(lua_library_files, resource_path .. "/lua-types")
  table.insert(lua_plugin_paths, resource_path .. "/lua-plugin/plugin.lua")
end

-- not upadated yet in automatic mason-lspconfig install,
-- open mason manually with `<space>vm` and `/` search for lua.
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      runtime = {
        version = "LuaJIT",
        plugin = lua_plugin_paths,
      },
      diagnostics = {
        globals = { "vim", "quarto", "pandoc", "io", "string", "print", "require", "table" },
        disable = { "trailing-space" },
      },
      workspace = {
        library = lua_library_files,
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

lspconfig.marksman.setup({
  on_attach = on_attach_qmd,
  capabilities = capabilities,
  filetypes = { "markdown", "quarto" },
  root_dir = util.root_pattern(".git", ".marksman.toml", "_quarto.yml"),
})

