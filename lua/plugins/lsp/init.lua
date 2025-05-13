return {
  "neovim/nvim-lspconfig", -- enable LSP
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local status_ok, _ = pcall(require, "lspconfig")
    if not status_ok then
      return
    end

    require "plugins.lsp.mason"
    require "plugins.lsp.handlers".setup()
  end,
  dependencies = {
    "mason-org/mason.nvim", -- simple to use language server installer
    "mason-org/mason-lspconfig.nvim", -- combine lspconfig with mason
  }
}
