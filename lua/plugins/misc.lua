return {
  -- Ranger Builtin
  {
    "kevinhwang91/rnvimr", -- If MacOS, install 'ranger-fm' using pip
    keys = {
      { mode = "n", "<leader>r", "<cmd>RnvimrToggle<CR>", noremap = true }
    },
  },

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
      { mode = "x", "\\t", ":Tabularize /", noremap = true }
    }
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
