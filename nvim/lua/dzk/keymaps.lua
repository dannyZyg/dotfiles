-- Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Swap v and CTRL-V, because Block mode is more useful that Visual mode
vim.keymap.set("n", "v", "<C-V>")
vim.keymap.set("n", "<C-V>", "v")
vim.keymap.set("v", "v", "<C-V>")
vim.keymap.set("v", "<C-V>", "v")

-- Clear search highlight
vim.keymap.set("n", "<leader>cs", ":noh<CR>")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Easy quit, easy save
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>!", ":q!<CR>")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Insert --
-- Press jk fast to exit insert
vim.keymap.set("i", "jk", "<ESC>")

-- Visual

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")

-- Maintain what is in the buffer when pasting in visual mode
vim.keymap.set("v", "p", '"_dP')

-- Visual Block

-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Terminal
local term_opts = { silent = true }

-- Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope keybindings
vim.keymap.set("n", "<leader>ff", function() require'telescope.builtin'.find_files() end)
vim.keymap.set("n", "<leader>fg", function() require'telescope.builtin'.live_grep() end)
vim.keymap.set("n", "<leader>fb", function() require'telescope.builtin'.buffers() end)
vim.keymap.set("n", "<leader>fh", function() require'telescope.builtin'.help_tags() end)
vim.keymap.set("n", "<leader>fs", function() require'telescope.builtin'.grep_string() end)

-- Nvim-Tree
vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<cr>")
