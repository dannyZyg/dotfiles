return {
  "tidalcycles/vim-tidal",
  enabled = true,
  config = function()
    vim.g.tidal_target = "terminal"
    vim.g.tidal_boot = os.getenv("HOME") .. "/.config/tidal/BootTidal.hs"
    vim.g.tidal_no_mappings = 1
  end,
}

