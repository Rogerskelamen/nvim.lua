local M = {}

M.setup = function(colorscheme)
  local status_ok, _ = pcall(require, "theme." .. colorscheme)

  local set_status_ok, _ = pcall(function ()
    vim.cmd("colorscheme " .. colorscheme)
  end)
  if not status_ok or not set_status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not found!")
    return
  end
end

return M
