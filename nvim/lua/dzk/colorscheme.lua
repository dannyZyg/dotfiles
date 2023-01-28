vim.cmd("colorscheme default")

local colorscheme = "gruvbox"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
else
	vim.g.gruvbox_contrast_dark = "hard"
end
