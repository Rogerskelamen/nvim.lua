-- set your prefer statusline
local statusline = "statusline"

local status_ok, config = pcall(require, statusline)
if not status_ok then
  vim.notify("can't find statusline" .. statusline)
  return
end

-- config.tabline = false
config.lsp_diagnostics = true

