local M = {}

local util = require("lspconfig.util")

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
}

M.config = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_dir = util.root_pattern(unpack(root_files)),
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
			},
		},
	},
	single_file_support = true,
}

return M
