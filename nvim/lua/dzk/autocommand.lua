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

local function augroup(name)
	return vim.api.nvim_create_augroup("dzk_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("checktime"),
	command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
