local opts = { noremap = true, silent = true, buffer = true }
vim.keymap.set("n", "<leader>[", ":FlutterOutlineToggle<CR>", opts)
vim.keymap.set("n", "r", ":Telescope flutter commands<CR>", opts)
