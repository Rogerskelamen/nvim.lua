local nvimtree_status_ok, nvimtree = pcall(require, "nvim-tree")
if not nvimtree_status_ok then
  return
end

nvimtree.setup {
  auto_reload_on_write = true,
  sort_by = "case_sensitive",
  hijack_cursor = true,
  update_focused_file = {
    enable = false,
    update_root = true, -- only effect when calling NvimTreeFindFile
    ignore_list = {},
  },
  view = {
    width = 25,
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
