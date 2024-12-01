local has_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not has_mason_lspconfig then
	return
end

local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
	return
end

local status_ok, handlers = pcall(require, "dzk.lsp.handlers")
if not status_ok then
	return
end

-- Server names from https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
mason_lspconfig.setup({
	ensure_installed = {
		"ansiblels",
		"astro",
		"awk_ls",
		"clangd",
		"cssls",
		"bashls",
		"hls",
		"jsonls",
		"lua_ls",
		"marksman",
		"pyright",
		"rust_analyzer",
		"svelte",
		"ts_ls",
	},
})

local runtime_path = vim.split(package.path, ";")
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
	ansiblels = require("dzk.lsp.servers.ansible").config,
	graphql = require("dzk.lsp.servers.graphql").config,
	eslint = require("dzk.lsp.servers.eslint").config,
	svelte = require("dzk.lsp.servers.svelte").config,
	yamlls = require("dzk.lsp.servers.yamlls").config,
	hls = require("dzk.lsp.servers.haskell").config,
	html = require("dzk.lsp.servers.html").config,
	vimls = require("dzk.lsp.servers.vimls").config,
	cssls = require("dzk.lsp.servers.cssls").config,
	pyright = require("dzk.lsp.servers.pyright").config,
	lua_ls = require("dzk.lsp.servers.lua_ls").config,
	ts_ls = require("dzk.lsp.servers.ts_ls").config,
	jsonls = require("dzk.lsp.servers.jsonls").config,
	clangd = require("dzk.lsp.servers.clangd").config,
	theme_check = require("dzk.lsp.servers.shopify").config,
	ruff = require("dzk.lsp.servers.ruff").config,
	rust_analyzer = require("dzk.lsp.servers.rust").config,
	--[[ supercollider = require("dzk.lsp.servers.supercollider").config, ]]
}

for server, config in pairs(servers) do
	setup_server(server, config)
end
