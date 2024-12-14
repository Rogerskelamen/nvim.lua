local colorscheme = "everforest"

pcall(require, "theme." .. colorscheme)

local status_ok, _ = pcall(function ()
  vim.cmd("colorscheme " .. colorscheme)
end)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
