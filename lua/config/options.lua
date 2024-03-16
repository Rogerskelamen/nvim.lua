local options = {
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  cursorline = true,                       -- highlight the current line
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  cmdheight = 1,                           -- only one space in the neovim command line for displaying messages
  signcolumn = "number",                   -- merge the sign column with number column
  wrap = true,                             -- display more lines if the content is too long for one line
  scrolloff = 5,                           -- is one of my fav
  sidescrolloff = 5,
  laststatus = 3,                          -- one single statusline drawn accross the entire display
  conceallevel = 2,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  termencoding = "utf-8",                  -- encoding when enter terminal
  autochdir = true,                        -- auto change root dir every time it changes buffer
  backup = false,                          -- do not creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  -- softtabstop = 2,                         -- mix spaces and tab
  smartindent = true,                      -- make indenting smarter again
  -- autoindent = true,                       -- copy the indent of previous line and indent
  mouse = "",                              -- disable the mouse to be used in neovim
  mousescroll = "ver:1,hor:1",             -- mouse scroll interval
  list = true,                             -- for listchars
  listchars = { tab = "| ", trail = "▫" },
  pumheight = 10,                          -- completion pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- do not creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  -- foldmethod = "expr",                     -- define fold method in other way
  -- foldexpr = "nvim_treesitter#foldexpr()", -- use tree-sitter to define how to fold
  foldenable = true,                       -- enable folding at startup
  foldlevel = 99,                          -- fold current area, not all foldable areas
  foldcolumn = '0',                        -- don't create a sign column for fold indicator
}

vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l" -- keys like h/l can jump to next line
vim.opt.iskeyword:append "-" -- some-words-like-this can be deleted using 'dw'

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work (be overwritten by other runtime config, please set nvim/after/ftplugin)

vim.cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]] -- put cursor on the position where last time edited
