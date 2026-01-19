local M = {}

M.__IS_WIN = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

M.is_darwin = function ()
  return vim.uv.os_uname().sysname == "Darwin"
end

return M
