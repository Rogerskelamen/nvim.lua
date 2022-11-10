local comment_status_ok, comment = pcall(require, "Comment")
if not comment_status_ok then
  return
end

comment.setup {
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>c<leader>',
    ---Block-comment toggle keymap
    block = '<leader>c<leader>',
  },
  opleader = {
    ---Line-comment keymap
    line = '<leader>c<leader>',
    ---Block-comment keymap
    block = '<leader>c<leader>',
  },
  extra = {
    ---Add comment on the line above
    above = '<leader>cO',
    ---Add comment on the line below
    below = '<leader>co',
    ---Add comment at the end of line
    eol = '<leader>ca',
  },
}
