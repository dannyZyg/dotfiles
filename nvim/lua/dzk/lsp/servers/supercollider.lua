local M = {
	config = {
		--[[ cmd = { ]]
		--[[ 	"sc-language-server", ]]
		--[[ 	"--log-file", ]]
		--[[ 	"/tmp/sc_lsp_output.log", ]]
		--[[ 	"--verbose", ]]
		--[[ }, ]]
		cmd = {
			"/Users/danny/dev/LanguageServer.quark/sc_language_server/.venv/bin/python",
			"-Xfrozen_modules=off",
			"/Users/danny/dev/LanguageServer.quark/sc_language_server/sc_language_server.py",
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
