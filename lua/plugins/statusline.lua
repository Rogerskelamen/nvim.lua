return {
  {
    "Rogerskelamen/eleline.vim",
    -- lazy = true,
  },
  {
    "beauwilliams/statusline.lua",
    lazy = true,
    opts = {
      match_colorscheme = false,
      tabline = true,
      lsp_diagnostics = true,
    }
  },
  {
    "feline-nvim/feline.nvim",
    lazy = true
  }
}
