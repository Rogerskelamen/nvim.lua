-- Automatically install lazy
local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(install_path) then
  vim.fn.system {
    "git", "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    install_path
  }
end
vim.opt.rtp:prepend(install_path)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

lazy.setup("plugins")
