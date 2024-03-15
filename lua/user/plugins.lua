local fn = vim.fn

-- local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
-- if fn.empty(fn.glob(install_path)) > 0 then
--   PACKER_BOOTSTRAP = fn.system {
--     "git",
--     "clone",
--     "--depth",
--     "1",
--     "https://github.com/wbthomason/packer.nvim",
--     install_path,
--   }
--   print "Installing packer close and reopen Neovim..."
--   vim.cmd [[packadd packer.nvim]]
-- end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Automatically install lazy
local install_path = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(install_path) then
  fn.system {
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    install_path
  }
end
vim.opt.rtp:prepend(install_path)

-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
--   return
-- end

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup("plugin")

-- Have packer use a popup window
-- packer.init {
--   display = {
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
-- }

-- Install your plugins here
return packer.startup(function(use)


  --
  -- My plugins here
  --
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
  use "dhruvasagar/vim-table-mode"

  -- Colorschemes
  use "sainnhe/everforest"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "folke/tokyonight.nvim"
  use 'marko-cerovac/material.nvim'

  -- Statusline
  -- use "Rogerskelamen/eleline.vim"
  -- use 'feline-nvim/feline.nvim'
  use "beauwilliams/statusline.lua"

  -- Git

  -- Comment

  -- AutoPair

  -- dashboard-nvim
  use "nvimdev/dashboard-nvim"

  -- Translator
  use "voldikss/vim-translator"

  -- Scroller
  use "karb94/neoscroll.nvim"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- completion for lsp
  use "hrsh7th/cmp-nvim-lua" -- snippet for nvim lua api
  use "hrsh7th/cmp-nvim-lsp-signature-help" -- signature tip
  use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }

  -- Snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use {
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/mason.nvim", -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim", -- combine lspconfig with mason
  }

  -- Metal LSP -- for scala
  use "scalameta/nvim-metals"

  -- Flutter tools
  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- LSP progress
  use {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require "fidget".setup {
        window = {
          blend = 0, -- config for complete transparency
        },
      }
    end,
  }

  -- Symbols Outline
  use "simrat39/symbols-outline.nvim"

  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "jayp0521/mason-nvim-dap.nvim", -- pair with mason
    "nvim-telescope/telescope-dap.nvim", -- pair with telescope
  }

  -- File explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Ranger Builtin
  use "kevinhwang91/rnvimr"

  -- Visual-multi
  use "mg979/vim-visual-multi"

  -- Chinese Vim help document
  use "yianwillis/vimcdoc"

  -- Colorizer
  use "NvChad/nvim-colorizer.lua"

  -- Live Server
  use {
    "Rogerskelamen/live-server.nvim",
    config = function()
      require "live-server".setup{}
    end
  }

  -- Surround
  use "tpope/vim-surround"

  -- Wildfire
  use "gcmt/wildfire.vim"

  -- UndoTree
  use "mbbill/undotree"

  -- Tabular
  -- use '\zs' to keep the current char untouched
  use "godlygeek/tabular"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.4',
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- Yanky
  use {
    "gbprod/yanky.nvim",
    requires = "nvim-telescope/telescope.nvim",
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }
  use {
    "windwp/nvim-ts-autotag",
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- Impatient
  use {
    "lewis6991/impatient.nvim", -- use :LuaCacheclear to clear all cache
    config = function()
      require "impatient".enable_profile()
    end
  }

  -- Startup
  use "dstein64/vim-startuptime" -- use :StartupTime to analyse your neovim startup time


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
