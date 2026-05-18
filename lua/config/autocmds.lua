local api = vim.api
local user_autogroup = api.nvim_create_augroup("UserAutoCmds", { clear = true })

api.nvim_create_autocmd("FileType", {
  group = user_autogroup,
  callback = function()
    -- remove 'o'，avoiding o/O insert comments automatically
    vim.opt_local.formatoptions:remove({ "o" })
  end,
})

-- Put cursor on the position where last time edited
api.nvim_create_autocmd("BufReadPost", {
  group = user_autogroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lnum = mark[1]

    if lnum > 1 and lnum <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Eslint auto fix
api.nvim_create_autocmd("BufWritePre", {
  group = user_autogroup,
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue" },
  command = "silent! LspEslintFixAll",
})
