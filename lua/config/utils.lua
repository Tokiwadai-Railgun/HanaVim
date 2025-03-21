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
      {
        icon = " ",
        icon_h1 = "Title",
        desc = "Restore Session",
        desc_h1 = "String",
        key = "r",
        keymap = "SPC r",
        key_h1 = "Number",
        key_format = " %s",
        action = ":SessionRestore"
      },
      {
        icon = " ",
        icon_h1 = "Colorscheme",
        desc = "Change colorscheme",
        desc_h1 = "String",
        key = "p",
        keymap = "SPC p",
        key_h1 = "Number",
        key_format = " %s",
        action = ":Telescope colorscheme"
      }
    },
    footer = {}  --your footer
  }
})

-- Setting up borders on documentation K
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single" -- or "double", "rounded", "solid", "shadow"
  }
)

-- File explorer
require('mini.files').setup({
  windows = {
    preview = true
  }
})


require('fidget').setup({
  notification = {
    window = {
      winblend = 0
    }
  }
})

vim.notify = require('fidget').notify

require('toggleterm').setup({
    direction = "float"
})
