local colorscheme = "everforest"

pcall(require, "theme." .. colorscheme)

local status_ok, _ = pcall(function ()
  vim.cmd("colorscheme " .. colorscheme)
end)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end

vim.api.nvim_set_hl(0, "NormalFloat", { bg = 'none' })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = 'none' })
