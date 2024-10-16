require('catppuccin').setup({
  flavour = "mocha",
  background = {
    dark = "mocha",
    light = "frappe"
  },
  transparent_background = true
})
-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup ({
  options = {
    icons_enabled = false,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
})

-- setup indent-blankline
require("ibl").setup()


-- setup autoclose
require('autoclose').setup()

-- Line numbering to show on the left
vim.wo.number = true
vim.wo.relativenumber = true

require("cmp").config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter
}


require('mini.cursorword').setup()
local hipatterns = require('mini.hipatterns')
hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

    -- Highlight hex color strings (`#rrggbb`) using that color
    hex_color = hipatterns.gen_highlighter.hex_color(),
  },
})

require('mini.indentscope').setup({
  symbol= "│",
  try_as_border= false
})
