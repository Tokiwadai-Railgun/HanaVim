local db = require('dashboard')
local logo = [[




.---.  .---.    ____    ,---.   .--.   ____           ,---.  ,---..-./`) ,---.    ,---.
|   |  |_ _|  .'  __ `. |    \  |  | .'  __ `.        |   /  |   |\ .-.')|    \  /    |
|   |  ( ' ) /   '  \  \|  ,  \ |  |/   '  \  \       |  |   |  .'/ `-' \|  ,  \/  ,  |
|   '-(_{;}_)|___|  /  ||  |\_ \|  ||___|  /  |       |  | _ |  |  `-'`"`|  |\_   /|  |
|      (_,_)    _.-`   ||  _( )_\  |   _.-`   |       |  _( )_  |  .---. |  _( )_/ |  |
| _ _--.   | .'   _    || (_ o _)  |.'   _    |       \ (_ o._) /  |   | | (_ o _) |  |
|( ' ) |   | |  _( )_  ||  (_,_)\  ||  _( )_  |        \ (_,_) /   |   | |  (_,_)  |  |
(_{;}_)|   | \ (_ o _) /|  |    |  |\ (_ o _) /         \     /    |   | |  |      |  |
'(_,_) '---'  '.(_,_).' '--'    '--' '.(_,_).'           `---`     '---' '--'      '--'



]]
db.setup({
  theme = 'doom',
  config = {
    header = vim.split(logo, '\n')
    , --your header
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'f',
        keymap = 'SPC f',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope find_files'
      },
      {
        icon = ' ',
        desc = 'Configuration',
        key = 'c',
        keymap = '',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ":execute 'cd ' . stdpath('config') | :e init.lua"
      },
      {
        icon = " ",
        icon_h1 = "Title",
        desc = "Lazygit",
        desc_h1 = "String",
        key = "g",
        keymap = "SPC g",
        key_h1 = "Number",
        key_format = " %s",
        action = ":LazyGit"
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Plugins',
        desc_hl = 'String',
        key = 'l',
        keymap = '',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Lazy'
      },
    },
    footer = {}  --your footer
  }
})
