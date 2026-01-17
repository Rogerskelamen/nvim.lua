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
