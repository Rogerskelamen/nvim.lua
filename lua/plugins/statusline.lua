local utils = require("utils")

return {
  {
    "beauwilliams/statusline.lua",
    lazy = utils.__IS_WIN,
    opts = {
      match_colorscheme = false,
      tabline = true,
      lsp_diagnostics = true,
    }
  },
  {
    "Rogerskelamen/eleline.vim",
    lazy = not utils.__IS_WIN
  },
  {
    "feline-nvim/feline.nvim",
    lazy = true
  }
}
