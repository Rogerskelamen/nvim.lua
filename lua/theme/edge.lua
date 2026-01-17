local g = vim.g

g.edge_style = "aura"
g.edge_enable_italic = 1
g.edge_cursor = "cyan"
g.edge_transparent_background = 1
g.edge_current_word = "grey background"
g.edge_diagnostic_text_highlight = 1
g.edge_better_performance = 1

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("custom_highlights_edge", {}),
  pattern = "edge",
  callback = function()
    local config = vim.fn["edge#get_configuration"]()
    local palette = vim.fn["edge#get_palette"](config.style, config.dim_foreground, config.colors_override)
    local set_hl = vim.fn["edge#highlight"]

    -- make Float Window to be transparent
    set_hl("NormalFloat", palette.none, palette.none)
    set_hl("FloatBorder", palette.none, palette.none)
  end
})
