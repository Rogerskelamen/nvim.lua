local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i",
--  visual_mode with select_visual_mode = "v",
--  only visual_text_mode = "x",
--  term_mode = "t",
--  command_mode = "c"

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
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Better tab navigation
keymap("n", "tn", ":tabe<CR>", opts)
keymap("n", "th", ":-tabnext<CR>", opts)
keymap("n", "tl", ":+tabnext<CR>", opts)

-- Indention
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)

-- Quick open file explore
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>p", "<cmd>NvimTreeFindFile<CR>", opts)

-- Hide the highlight text
keymap("n", "<leader>/", ":nohlsearch<CR>", opts)

-- Folding
keymap("n", "<leader>o", "za", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Split windows
keymap("n", "<leader>s", ":split<CR>", opts)
keymap("n", "<leader>v", ":vsplit<CR>", opts)

-- Navigate buffers
keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Navigate linehead and linetail
local function line_head_tail()
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

keymap({"n", "x"}, "m", line_head_tail, opts)

-- Find and replace
keymap("n", "\\s", ":%s//g<Left><Left>", { noremap = true })

-- Go into popup window
keymap("n", "<leader><leader>", "<C-w><C-w>", opts)

-- Visual make to line end
keymap("n", "\\v", "v$h", opts)

-- Insert --
-- Press jk fast to enter normal mode
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "p", '"_dP', opts)


-- Telescope --
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fh", "<cmd>Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>RnvimrToggle<CR>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<CR>", opts)

-- Ranger --
keymap("n", "<leader>r", "<cmd>RnvimrToggle<CR>", opts)

-- LazyGit --
keymap("n", "<leader>g", "<cmd>LazyGitCurrentFile<CR>", opts)

-- UndoTree --
keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts)

-- Symbols Outline --
keymap("n", "<leader>[", "<cmd>SymbolsOutline<CR>", opts)

-- Yanky --
keymap("n", "<leader>y", "<cmd>Telescope yank_history<CR>", opts)
vim.keymap.set({"n","x"}, "y", "<Plug>(YankyYank)")

-- Spell check --
keymap("n", "<leader>cs", "<cmd>set spell!<CR>", opts)

-- Translator --
keymap({"n", "x"}, "<leader>t", ":TranslateW<CR>", opts)

-- Debugger --
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dapui'.toggle()<CR>", opts)

-- Run File --
local function run_file()
  vim.cmd "exec 'w'"
  local filetype = vim.bo.filetype
  -- Markdown Preview
  if filetype == "markdown" then
    vim.cmd "silent! exec 'MarkdownPreviewToggle'"
  elseif filetype == "c" then
    vim.cmd [[
      exec "!gcc % -o %<"
      exec "sp"
      exec "res -5"
      exec "term ./%<"
      exec "startinsert"
    ]]
  elseif filetype == "cpp" then
    vim.cmd [[
      exec "!g++ -std=c++11 % -Wall -o %<"
      exec "sp"
      exec "res -5"
      exec "term ./%<"
      exec "startinsert"
    ]]
  elseif filetype == "sh" then
    vim.cmd [[
      exec "!time bash %"
    ]]
  elseif filetype == "python" then
    vim.cmd [[
      exec "sp"
      exec "res -5"
      exec "term python3 %"
      exec "startinsert"
    ]]
  elseif filetype == "java" then
    vim.cmd [[
      exec "sp"
      exec "res -5"
      exec "term javac % && time java %<"
      exec "startinsert"
    ]]
  elseif filetype == "javascript" then
    vim.cmd [[
      exec "sp"
      exec "res -5"
      exec "term node %"
      exec "startinsert"
    ]]
  elseif filetype == "lua" then
    vim.cmd [[
      exec "sp"
      exec "res -5"
      exec "term lua %"
      exec "startinsert"
    ]]
  elseif filetype == "go" then
    vim.cmd [[
      exec "sp"
      exec "term go run ."
      exec "startinsert"
    ]]
  elseif filetype == "html" then
    vim.cmd [[
      silent! exec "!open %"
    ]]
  elseif filetype == "dart" then
    vim.cmd [[
      exec "sp"
      exec "res -5"
      exec "term dart %"
      exec "startinsert"
    ]]
  elseif filetype == "vim" then
    vim.cmd [[
      exec "so %"
    ]]
  end
end

keymap("n", "r", run_file, opts)
