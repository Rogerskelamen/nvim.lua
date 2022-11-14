local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

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

  -- Colorschemes
  use "sainnhe/everforest"
  use { "catppuccin/nvim", as = "catppuccin" }
  use "folke/tokyonight.nvim"

  -- Statusline
  -- use "Rogerskelamen/eleline.vim"
  -- use 'feline-nvim/feline.nvim'
  use "beauwilliams/statusline.lua"
  use "rebelot/heirline.nvim"

  -- Git
  use "kdheepak/lazygit.nvim"
  use "lewis6991/gitsigns.nvim"

  -- Comment
  use "numToStr/Comment.nvim"

  -- AutoPair
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- dashboard-nvim
  use "glepnir/dashboard-nvim"

  -- Translator
  use "voldikss/vim-translator"

  -- Scoller
  use {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup()
    end
  }

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua" -- snippet for nvim lua api

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use {
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/mason.nvim", -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim", -- combine lspconfig with mason
  }

  -- Better LuaAPI
  use {
    "folke/neodev.nvim",
    config = function()
      require "neodev".setup()
    end
  }

  -- Debugger
  use {
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
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

  -- Surround
  use "tpope/vim-surround"

  -- Wildfire
  use "gcmt/wildfire.vim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    "nvim-telescope/telescope-file-browser.nvim",
  }

  -- Yanky
  use {
    "gbprod/yanky.nvim",
    requires = "nvim-telescope/telescope.nvim"
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
    "p00f/nvim-ts-rainbow",
    requires = "nvim-treesitter/nvim-treesitter",
  }

  -- Impatient
  use {
    "lewis6991/impatient.nvim",
    config = function()
      require "impatient".enable_profile()
    end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

