local utils = require("utils")
local control = require("control")

local fm = function()
  if not control.fm.enable then
    return {}
  end
  if utils.__IS_WIN then
    return {
      "mikavilpas/yazi.nvim",
      keys = {
        -- 👇 in this section, choose your own keymappings!
        {
          "<leader>r",
          "<cmd>Yazi<cr>",
          desc = "Open yazi at the current file",
        },
      },
      opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = false,
        keymaps = {
          show_help = '<f1>',
        },
      }
    }
  else
    return {
      "kelly-lin/ranger.nvim",
      keys = {
        { "<leader>r",
        function ()
          require("ranger-nvim").open(true)
        end,
        noremap = true }
      },
    }
  end
end


return {
  -- File Manager integrated
  fm(),

  -- LSP progress
  {
    "j-hui/fidget.nvim",
    event = "BufReadPre",
    opts = {
      notification = {
        window = {
          winblend = 0
        }
      }
    }
  },

  -- Visual-multi
  { "mg979/vim-visual-multi" },

  -- Chinese Vim help document
  { "yianwillis/vimcdoc" },

  -- Tabular
  -- use '\zs' to keep the current char untouched
  -- use '\zs/l0r1' to make only one space at right in the meantime.
  {
    "godlygeek/tabular",
    keys = {
      { mode = "x", "\\t", ":Tabularize /", noremap = true },
      { mode = "x", "\\,", ":Tabularize /\\zs/l0r1<Left><Left><Left><Left><Left><Left><Left><Left>", noremap = true },
    },
  },

  -- Live Server
  {
    "Rogerskelamen/live-server.nvim",
    config = true
  },

  -- Surround
  {
    "tpope/vim-surround",
    config = function ()
      vim.g.surround_40 = "(\r)" -- remove extra space in '()' and '[]'
      vim.g.surround_91 = "[\r]"
    end
  },

  -- Impatient
  {
    "lewis6991/impatient.nvim", -- use :LuaCacheClear to clear all cache
    cmd = "LuaCacheClear",
    config = function()
      require "impatient".enable_profile()
    end
  }
}
