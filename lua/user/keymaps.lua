local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- All Mode --
-- Quick move
keymap("", "<S-h>", "5h", opts)
keymap("", "<S-j>", "5j", opts)
keymap("", "<S-k>", "5k", opts)
keymap("", "<S-l>", "5l", opts)
keymap("", "<S-w>", "5w", opts)
keymap("", "<S-b>", "5b", opts)

-- Normal --
-- Quit and Save
keymap("n", "<S-s>", ":w<CR>", opts)
keymap("n", "<S-q>", ":q<CR>", opts)
keymap("n", "<C-q>", ":qa<CR>", opts)

-- Better window navigation
keymap("n", "<LEADER>h", "<C-w>h", opts)
keymap("n", "<LEADER>j", "<C-w>j", opts)
keymap("n", "<LEADER>k", "<C-w>k", opts)
keymap("n", "<LEADER>l", "<C-w>l", opts)

-- Indention
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)

-- Quick open file explore
keymap("n", "<LEADER>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<LEADER>p", ":NvimTreeFindFile<CR>", opts)

-- Hide the highlight text
keymap("n", "<LEADER>/", ":nohlsearch<CR>", opts)

-- Folding
keymap("n", "<LEADER>o", "za", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)

-- Split windows
keymap("n", "<LEADER>s", ":split<CR>", opts)
keymap("n", "<LEADER>v", ":vsplit<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)


-- Navigate linehead and linetail
-- keymap("n", "<expr>m", "col('.')==col('$')-1 ? '^' : '$'", opts)

-- Find and replace
keymap("n", "\\s", ":%s//g<left><left>", opts)

-- Go into popup window
keymap("n", "<LEADER><LEADER>", "<C-w><C-w>", opts)

-- Visual make to line end
keymap("n", "\\v", "v$h", opts)

-- Insert --
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<C-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)

-- Navigate linehead and linetail
-- keymap("v", "<expr>m", "col('.')==col('$')-1 ? '^' : '$h'", opts)


-- Telescope --
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-- Ranger --
keymap("n", "<leader>r", ":RnvimrToggle<CR>", opts)

-- LazyGit --
keymap("n", "<leader>g", ":LazyGitCurrentFile<CR>", opts)

-- Translator --
keymap("", "<leader>t", "<cmd>TranslateW<cr>", opts)
