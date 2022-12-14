local M = {}

M.config = {
  settings = {
    pylsp = {
      cmd = { "pylsp" },
      filetypes = { "python" },
      single_file_support = true,
      plugins = {
        configurationSources = {"flake8", "mypy"},
        flake8 = {enabled = true},
        mypy = {
          enabled = true,
          live_mode =true,
          strict = true,
          overrides = {"--check-untyped-defs"},
        },
        pycodestyle = {enabled = false},
        pyflakes = {enabled = false},
      },
    }
  }
}

return M
