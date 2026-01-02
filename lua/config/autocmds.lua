local api = vim.api

api.nvim_create_autocmd("FileType", {
  callback = function()
    -- remove 'o'，avoiding o/O insert comments automatically
    vim.opt_local.formatoptions:remove({ "o" })
  end,
})

-- Put cursor on the position where last time edited
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lnum = mark[1]

    if lnum > 1 and lnum <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

