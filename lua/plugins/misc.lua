return {
  -- Lf Builtin
  {
    "ptzz/lf.vim",
    dependencies = "voldikss/vim-floaterm",
    config = function()
      vim.g.lf_map_keys = 0
      vim.keymap.set("n", "<leader>r", "<cmd>Lf<CR>", { noremap = true, silent = true })
    end
  },

  -- LSP progress
  {
    "j-hui/fidget.nvim",
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
    config = function()
      vim.keymap.set("x", "\\t", ":Tabularize /", { noremap = true })
    end
  },

  -- Live Server
  {
    "Rogerskelamen/live-server.nvim",
    opts = {}
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
    "lewis6991/impatient.nvim", -- use :LuaCacheclear to clear all cache
    config = function()
      require "impatient".enable_profile()
    end
  },

  -- Yazi Embedding
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
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
  }
}
