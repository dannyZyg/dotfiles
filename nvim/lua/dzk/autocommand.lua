vim.cmd [[
  fun! TrimWhitespace()
      let l:save = winsaveview()
      keeppatterns %s/\s\+$//e
      call winrestview(l:save)
  endfun

  augroup USER_DK
      autocmd!
      autocmd BufWritePre * :call TrimWhitespace()
  augroup END

  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
  augroup END
]]

-- ts = 'number of spaces that <Tab> in file uses'
-- sts = 'number of spaces that <Tab> uses while editing'
-- sw = 'number of spaces to use for (auto)indent step'
vim.cmd [[ autocmd Filetype html setlocal ts=2 sw=2 expandtab ]]
vim.cmd [[ autocmd Filetype json setlocal ts=2 sw=2 expandtab ]]
vim.cmd [[ autocmd Filetype php setlocal ts=4 sw=4 sts=4 ]]
vim.cmd [[ autocmd Filetype twig setlocal ts=4 sw=4 sts=4 ]]
vim.cmd [[ autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype javascriptreact setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype typescriptreact setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype astro setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype svelte setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype vue setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype yml setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype yaml setlocal ts=2 sw=2 sts=2 expandtab ]]
vim.cmd [[ autocmd Filetype cs setlocal ts=2 sw=2 expandtab! ]]
vim.cmd [[ autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab autoindent fileformat=unix ]]
