local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local status_ok, handlers = pcall(require, "dzk.lsp.handlers")
if not status_ok then
  return
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = handlers.setup,
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  lspconfig[server].setup(config)
end

local servers = {
  graphql = require("dzk.lsp.servers.graphql").config,
  eslint = require("dzk.lsp.servers.eslint").config,
  svelte = require("dzk.lsp.servers.svelte").config,
  yamlls = require("dzk.lsp.servers.yamlls").config,
  html = require("dzk.lsp.servers.html").config,
  vimls = require("dzk.lsp.servers.vimls").config,
  cssls = require("dzk.lsp.servers.cssls").config,
  pylsp = require("dzk.lsp.servers.pylsp").config,
  sumneko_lua = require("dzk.lsp.servers.sumneko_lua").config,
  tsserver = require("dzk.lsp.servers.tsserver").config,
  jsonls = require("dzk.lsp.servers.jsonls").config,
}

for server, config in pairs(servers) do
  setup_server(server, config)
end
