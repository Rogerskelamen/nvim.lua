local home = os.getenv('HOME')

local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

db.setup {
  theme = 'doom',
  preview = {
    command     = 'cat | lolcat -F 0.3',
    file_path   = home .. '/.config/nvim/static/neovim.cat',
    file_height = 10,
    file_width  = 70,
  },
  config = {
    center = {
      {
        icon    = ' ',
        icon_hl = 'Title',
        desc    = 'Recently opened files       ',
        desc_hl = 'String',
        key     = 'h',
        keymap  = 'SPC f h',
        key_hl  = 'Number',
        action  = 'Telescope oldfiles'
      },
      {
        icon    = ' ',
        icon_hl = 'Title',
        desc    = 'File  Browser               ',
        desc_hl = 'String',
        key     = 'b',
        keymap  = 'SPC f b',
        key_hl  = 'Number',
        action  = 'RnvimrToggle'
      },
      {
        icon    = ' ',
        icon_hl = 'Title',
        desc    = 'Find  File                  ',
        desc_hl = 'String',
        key     = 'f',
        keymap  = 'SPC f f',
        key_hl  = 'Number',
        action  = 'Telescope find_files'
      },
      {
        icon    = ' ',
        icon_hl = 'Title',
        desc    = 'Find  word                  ',
        desc_hl = 'String',
        key     = 'w',
        keymap  = 'SPC f w',
        key_hl  = 'Number',
        action  = 'Telescope live_grep'
      },
      {
        icon    = ' ',
        icon_hl = 'Title',
        desc    = 'Open Personal dotfiles      ',
        desc_hl = 'String',
        key     = 'd',
        keymap  = 'SPC f d',
        key_hl  = 'Number',
        action  = 'e $MYVIMRC | NvimTreeFindFile'
      },
      {
        icon    = ' ',
        icon_hl = 'Title',
        desc    = 'Startup Time analysis       ',
        desc_hl = 'String',
        key     = 's',
        keymap  = 'SPC f s',
        key_hl  = 'Number',
        action  = 'StartupTime'
      },
    },
  },
}
