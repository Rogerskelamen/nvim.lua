return {
  {
    "neovim/nvim-lspconfig", -- enable LSP

    config = function()
      require "plugins.lsp.mason"
      require "plugins.lsp.handlers".setup()
    end,
    dependencies = {
      "mason-org/mason.nvim", -- auto manage lsp packages
      "mason-org/mason-lspconfig.nvim", -- combine lspconfig with mason
    },
  },

  { import = "plugins.lsp.metals"  },
  { import = "plugins.lsp.flutter" },
}
