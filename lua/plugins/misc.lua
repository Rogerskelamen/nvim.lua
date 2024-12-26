return {
  -- Ranger Builtin
  {
    "kevinhwang91/rnvimr",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>r", "<cmd>RnvimrToggle<CR>", { noremap = true, silent = true })
    end
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
    config = function()
      vim.keymap.set("x", "\\t", ":Tabularize /", { noremap = true })
    end
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

  -- Impatient
  {
    "lewis6991/impatient.nvim", -- use :LuaCacheclear to clear all cache
    config = function()
      require "impatient".enable_profile()
    end
  }
}
