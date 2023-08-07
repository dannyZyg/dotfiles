vim.cmd([[
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
]])

-- ts = 'number of spaces that <Tab> in file uses'
-- sts = 'number of spaces that <Tab> uses while editing'
-- sw = 'number of spaces to use for (auto)indent step'
vim.cmd([[ autocmd Filetype html setlocal ts=2 sw=2 expandtab ]])
vim.cmd([[ autocmd Filetype json setlocal ts=2 sw=2 expandtab ]])
vim.cmd([[ autocmd Filetype php setlocal ts=4 sw=4 sts=4 ]])
vim.cmd([[ autocmd Filetype twig setlocal ts=4 sw=4 sts=4 ]])
vim.cmd([[ autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype javascriptreact setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype typescriptreact setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype astro setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype svelte setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype vue setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype yml setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype yaml setlocal ts=2 sw=2 sts=2 expandtab ]])
vim.cmd([[ autocmd Filetype cs setlocal ts=2 sw=2 expandtab! ]])
vim.cmd([[ autocmd Filetype python setlocal ts=4 sw=4 sts=4 expandtab autoindent fileformat=unix ]])

vim.cmd([[ autocmd BufRead,BufEnter *.astro set filetype=astro ]])

vim.cmd([[
  "restart sxhkd if editing the rc
  autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd &
]])

local grok_group = vim.api.nvim_create_augroup("grok", { clear = true })
local grok_problem_types = vim.api.nvim_create_augroup("grok_problem_types", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = {
		"*/web/code/*",
		"*/marker/code/*",
		"*/plagiarism-detection/code/*",
		"*/realtime/code/*",
	},
	group = grok_group,
	callback = function()
		-- Syntax highlight HTML files as Django.
		vim.cmd([[ au BufRead,BufNewFile *.html set filetype=htmldjango ]])

		-- Syntax highlight .conf files as cfg.
		vim.cmd([[ au BufRead,BufNewFile *.conf set filetype=cfg ]])

		-- File encoding to be UTF-8.
		vim.opt.encoding = "utf-8"

		-- 2 space indentation.
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2

		-- Soft tabs.
		vim.opt.expandtab = true
		vim.opt.autoindent = true
		vim.opt.smartindent = false
		vim.opt.smarttab = true

		-- Trailing newline at end of file.
		vim.opt.fixendofline = true

		-- No hard wrapping.
		vim.opt.textwidth = 0
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {
		"*/problem-types/microbit-v2/frontend/bottom-panel/*.ts",
		"*/problem-types/microbit-v2/frontend/bottom-panel/*.tsx",
		"*/problem-types/microbit-v2/frontend/bottom-panel/*.js",
	},
	group = grok_problem_types,
	callback = function()
		vim.api.nvim_command(":! cd problem-types/microbit-v2/frontend/bottom-panel && npm run build")
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = {
		"*/problem-types/spreadsheet/frontend/*.ts",
		"*/problem-types/spreadsheet/frontend/*.tsx",
		"*/problem-types/spreadsheet/frontend/*.js",
	},
	group = grok_problem_types,
	callback = function()
		vim.api.nvim_command(":! cd problem-types/spreadsheet/frontend/ && npm run build")
	end,
})

vim.cmd([[
  augroup c
      autocmd!
      autocmd FileType c,cpp,h,hpp,glsl call MakeRun()
  augroup end

  function! MakeRun()
      nnoremap <C-e> :terminal make -j8 && make run<cr>
      inoremap <C-e> <esc>:terminal make -j8 && make run<cr>
  endfunction
]])
