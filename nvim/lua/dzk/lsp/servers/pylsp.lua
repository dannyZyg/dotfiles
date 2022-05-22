local M = {}

M.config = {
  cmd = { "pylsp" },
  filetypes = { "python" },
  single_file_support = true,
  plugins = {
    configurationSources = {"flake8"},
    pycodestyle = {enabled = false},
    flake8 = {enabled = true},
    mypy = {
      enabled = true,
      live_mode =true,
      strict = true
    },
  },
}

return M
