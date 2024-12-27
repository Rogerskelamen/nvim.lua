return {
  -- Yazi Builtin
  {
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
  {
    "godlygeek/tabular",
    keys = {
      { mode = "x", "\\t", ":Tabularize /", { noremap = true } }
    }
  },

  -- Live Server
  {
    "Rogerskelamen/live-server.nvim",
    config = true
  },

  -- Surround
  { "tpope/vim-surround" },

  -- Wildfire
  { "gcmt/wildfire.vim" },

  -- autotag
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter"
  },

  -- Impatient
  {
    "lewis6991/impatient.nvim", -- use :LuaCacheClear to clear all cache
    cmd = "LuaCacheClear",
    config = function()
      require "impatient".enable_profile()
    end
  },
}
