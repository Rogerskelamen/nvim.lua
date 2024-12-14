-- local g = vim.g

-- everforest
-- g.everforest_cursor = "green"
-- g.everforest_enable_italic = 1 -- make keyword also italic
-- g.everforest_transparent_background = 1
-- g.everforest_diagnostic_text_highlight = 1
-- g.everforest_current_word = "grey background"
-- g.everforest_better_performance = 1

require("everforest").setup {
  transparent_background_level = 1,
  italics = true, -- make keyword also italic
  diagnostic_text_highlight = true,
  -- customized highlight rules
  on_highlights = function(hl, palette)
    hl.NormalFloat = { bg = palette.none }
    hl.FloatBorder = { bg = palette.none }
  end,
}
