local utils = require("utils")

if utils.__IS_WIN then
  return {
    "Rogerskelamen/eleline.vim",
  }
end

return {
  {
    "beauwilliams/statusline.lua",
    -- lazy = true,
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
