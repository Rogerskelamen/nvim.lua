return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },

  config = function()
    local nvimtree_status_ok, nvimtree = pcall(require, "nvim-tree")
    if not nvimtree_status_ok then
      return
    end

    local function mapping_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true
        }
      end
      api.config.mappings.default_on_attach(bufnr)

      -- Custom keymapping
      vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
      vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("Change Root Dir"))
      vim.keymap.set("n", "O", api.node.run.system, opts("Run System"))
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
      },
      on_attach = mapping_on_attach,
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    }
  end
}
