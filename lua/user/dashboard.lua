local home = os.getenv('HOME')

local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

-- macos
db.preview_command = 'cat | lolcat -F 0.3'
-- linux
-- db.preview_command = 'ueberzug'
--
db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.preview_file_height = 10
db.preview_file_width = 70
db.custom_center = {
  {icon = '  ',
    desc = 'Recently opened files                   ',
    action =  'Telescope oldfiles',
    shortcut = 'SPC f h'},
  {icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files',
    shortcut = 'SPC f f'},
  {icon = '  ',
    desc ='File Browser                            ',
    action =  'RnvimrToggle',
    shortcut = 'SPC f b'},
  {icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w'},
  {icon = '  ',
    desc = 'Open Personal dotfiles                  ',
    action = 'e $MYVIMRC',
    shortcut = 'SPC f d'},
}
