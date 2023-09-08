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
		["<M-CR>"] = map("postwin.toggle", "i"),
		["<M-L>"] = map("postwin.clear", { "n", "i" }),
		["<C-k>"] = map("signature.show", { "n", "i" }),
		["<F12>"] = map("sclang.hard_stop", { "n", "x", "i" }),
		["<leader>st"] = map("sclang.start"),
		["<leader>sk"] = map("sclang.recompile"),
		["<F1>"] = map_expr("s.boot"),
		["<F2>"] = map_expr("s.meter"),
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

-- Get the help source URI for "subject"
-- @param subject The subject to find
-- @param cb A callback which gets the URI as its first argument
local function get_help_uri(subject, cb)
	local cmd = [[SCDoc.helpSourceDir +/+ \"Classes\" +/+ \"%s\" ++ \".schelp\"]]
	cmd = string.format(cmd, subject)
	scnvim.eval(cmd, cb)
end

-- Open the help source file for the word under the cursor
return function()
	local subject = vim.fn.expand("<cword>")
	get_help_uri(subject, function(result)
		result = string.format("edit %s", result)
		vim.cmd(result)
	end)
end
