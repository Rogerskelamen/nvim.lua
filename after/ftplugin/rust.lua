--[[
-- It's wired to force tab space to 2
-- since it has been set in main config `config/options.lua`
-- Unfortunately, once you use rust-analyzer to help your coding,
-- tab space will be changed to 4
-- So this forcely changing is needed
--]]
vim.opt_local.formatoptions:remove "o" -- better auto comment behavior
vim.opt_local.tabstop = 2 -- force 2 spaces for a indent
vim.opt_local.shiftwidth = 2
