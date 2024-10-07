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
