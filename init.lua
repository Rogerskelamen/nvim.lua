--[[
--  ▄▄   ▄▄ ▄▄   ▄▄    ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄
-- █  █▄█  █  █ █  █  █  █  █ █       █       █  █ █  █   █  █▄█  █
-- █       █  █▄█  █  █   █▄█ █    ▄▄▄█   ▄   █  █▄█  █   █       █
-- █       █       █  █       █   █▄▄▄█  █ █  █       █   █       █
-- █       █▄     ▄█  █  ▄    █    ▄▄▄█  █▄█  █       █   █       █
-- █ ██▄██ █ █   █    █ █ █   █   █▄▄▄█       ██     ██   █ ██▄██ █
-- █▄█   █▄█ █▄▄▄█    █▄█  █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█ █▄▄▄█ █▄▄▄█▄█   █▄█
--
-- Author: @Rogerskelamen
-- E-mail: rogerskelamen@gmail.com
--
-- NOTE: modify lua/control.lua to decide which module should be enabled
--]]

-- load basic settings
require "config.options"
require "config.keymaps"
require "config.filetypes"
require "config.autocmds"

-- load plugins
require "config.lazy"

-- Colorschemes
require "theme".setup("everforest")
