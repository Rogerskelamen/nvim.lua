local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode with select_visual_mode = "v",
--   only visual_text_mode = "x",
--   term_mode = "t",
--   command_mode = "c

-- All Mode --
-- Quick move
keymap({"n", "x"}, "<S-h>", "5h", opts)
keymap({"n", "x"}, "<S-j>", "5j", opts)
keymap({"n", "x"}, "<S-k>", "5k", opts)
keymap({"n", "x"}, "<S-l>", "5l", opts)
keymap({"n", "x"}, "<S-w>", "5w", opts)
keymap({"n", "x"}, "<S-b>", "5b", opts)

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
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Split windows
keymap("n", "<LEADER>s", ":split<CR>", opts)
keymap("n", "<LEADER>v", ":vsplit<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Navigate linehead and linetail
local function Line_Head_Tail()
  if vim.fn.mode() == 'n' then
    if vim.fn.col('.') == vim.fn.col('$')-1 then
      vim.cmd "normal ^"
    else
      vim.cmd "normal $"
    end
  else
    if vim.fn.col('.') == vim.fn.col('$')-1 then
      vim.cmd "normal ^"
    else
      vim.cmd "normal $h"
    end
  end
end

keymap({"n", "x"}, "m", Line_Head_Tail, opts)

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
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)
keymap("v", "p", '"_dP', opts)


-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

-- Ranger --
keymap("n", "<leader>r", "<cmd>RnvimrToggle<CR>", opts)

-- LazyGit --
keymap("n", "<leader>g", "<cmd>LazyGitCurrentFile<CR>", opts)

-- Translator --
keymap({"n", "x"}, "<leader>t", "<cmd>TranslateW<cr>", opts)

-- Run File --
local function Run_File()
  vim.cmd "exec 'w'"
  -- Markdown Preview
  if vim.bo.filetype == "markdown" then
    vim.cmd "exec 'MarkdownPreview'"
  end
end

keymap("n", "r", Run_File, opts)
