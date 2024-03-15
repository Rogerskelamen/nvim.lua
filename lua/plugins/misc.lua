return {
  -- Ranger Builtin
  {
    "kevinhwang91/rnvimr",
    config = function()
      vim.keymap.set("n", "<leader>r", "<cmd>RnvimrToggle<CR>", { noremap = true, silent = true })
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
  { "yianwillis/vimcdoc", lazy = true },

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
  }
}
