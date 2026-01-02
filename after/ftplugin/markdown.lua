vim.opt_local.tabstop = 4 -- 4 spaces for a indent
vim.opt_local.shiftwidth = 4

local opts = { noremap = true, silent = true, buffer = true }
vim.keymap.set("n", ",b", "a****<Esc>hi", opts)
vim.keymap.set("n", ",i", "a**<Esc>i", opts)
vim.keymap.set("n", ",u", "a<u></u><Esc>3hi", opts)
vim.keymap.set("n", ",k", "a<kbd></kbd><Esc>5hi", opts)
vim.keymap.set("n", ",c", "a``````<Esc>2hi<CR><Esc>kA", opts)
vim.keymap.set("n", ",$", "a$$<CR>$$<Esc>O", opts)

vim.keymap.set("n", "tt", "<cmd>TableModeToggle<CR>", opts)
