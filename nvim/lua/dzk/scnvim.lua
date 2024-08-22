local status_ok, scnvim = pcall(require, "scnvim")
if not status_ok then
	return
end

local map = scnvim.map
local map_expr = scnvim.map_expr

scnvim.setup({
	keymaps = {
		["<M-e>"] = map("editor.send_line", { "i", "n" }),
		["<C-e>"] = {
			map("editor.send_block", { "i", "n" }),
			map("editor.send_selection", "x"),
		},
		["<CR>"] = map("postwin.toggle"),
		["<leader>ll"] = map("postwin.clear", { "n", "i" }),
		["<C-k>"] = map("signature.show", { "n", "i" }),
		["<C-h>"] = map("sclang.hard_stop", { "n", "x", "i" }),
		["<leader>st"] = map("sclang.start"),
		["<leader>sk"] = map("sclang.recompile"),
		["<leader>sb"] = map_expr("s.boot"),
		["<leader>sm"] = map_expr("s.meter"),
		["<leader>pt"] = map_expr("s.plotTree"),
	},
	editor = {
		highlight = {
			color = "IncSearch",
		},
	},
	postwin = {
		highlight = true,
		auto_toggle_error = true,
		scrollback = 5000,
		horizontal = false,
		direction = "right",
		size = nil,
		fixed_size = nil,
		keymaps = nil,
		float = {
			enabled = false,
			row = 0,
			col = function()
				return vim.o.columns
			end,
			width = 64,
			height = 14,
			config = {
				border = "single",
			},
			callback = function(id)
				vim.api.nvim_win_set_option(id, "winblend", 10)
			end,
		},
	},
})
