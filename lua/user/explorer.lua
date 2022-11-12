local nvimtree_status_ok, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_status_ok then
  return
end

nvimtree.setup {
  auto_reload_on_write = true,
  sort_by = "case_sensitive",
  hijack_cursor = true,
  view = {
    width = 26,
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "s", action = "split" },
        { key = "v", action = "vsplit" },
        { key = "C", action = "cd" },
        { key = "O", action = "system_open"}
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}
