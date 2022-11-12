local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- only one space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 2,                        -- so that `` is visible in markdown files
  autochdir = true,
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "",                              -- disable the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "number",                   -- merge the sign column with number column
  wrap = true,                             -- display lines as one long line
  scrolloff = 5,                           -- is one of my fav
  sidescrolloff = 5,
  laststatus = 3,                             -- one single statusline drawn accross the entire display
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  foldmethod = "expr",                     -- define fold method in other way
  foldexpr = "nvim_treesitter#foldexpr()", -- use tree-sitter to define how to fold
  foldenable = false,                     -- disable folding at startup
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
