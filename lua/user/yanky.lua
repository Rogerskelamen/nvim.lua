local status_ok, yanky = pcall(require, "yanky")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local mapping = require "yanky.telescope.mapping"

yanky.setup {
  ring = {
    history_length = 10,
    storage = "shada",
    sync_with_numbered_registers = true,
  },
  picker = {
    select = {
      action = {
      }, -- nil to use default put action
    },
    telescope = {
      mappings = {
        default = mapping.put("p"),
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        }
      }
    },
  },
  system_clipboard = {
    sync_with_ring = true,
  },
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 500,
  },
  preserve_cursor_position = {
    enabled = true,
  },
}
