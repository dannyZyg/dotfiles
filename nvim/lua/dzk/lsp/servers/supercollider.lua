local M = {
	config = {
		cmd = {
			"sc-language-server",
			"--log-file",
			"/tmp/sc_lsp_output.log",
			"--verbose",
		},
		filetypes = { "supercollider" },
		root_dir = function(fname)
			return "/"
		end,
		settings = {},
	},
}

return M
