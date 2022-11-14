-- set your prefer statusline
local statusline = "statusline"
-- local statusline = "heirline"

local status_ok, config = pcall(require, statusline)
if not status_ok then
  vim.notify("can't find statusline" .. statusline)
  return
end

if statusline == "statusline" then
  -- config.tabline = false
  config.lsp_diagnostics = true
elseif statusline == "heirline" then
  local line_provider = "%f"
  local StatusLine = {
    provider = line_provider,
  }
  config.setup(StatusLine)
end

