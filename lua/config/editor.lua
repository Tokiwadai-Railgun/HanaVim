  require('catppuccin').setup({
    flavour = "mocha",
    background = {
      dark = "mocha",
      light = "frappe"
    },
    transparent_background = true
  })

  require('rose-pine').setup({
    extend_background_behind_borders = true,
    enable = {
      terminal = true,
      italics = true,
      underline = true
    },
    styles = {
      transparency = true,
    }
  })
  -- Set lualine as statusline
-- See `:help lualine.txt`

require('lualine').setup ({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_z = {"nvim_treesitter#statusline"}
  }
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
require('mini.indentscope').setup({
  symbol= "│",
  try_as_border= false
})

require('autoclose').setup({
  options = {
    disable_when_touch = true,
    pair_spaces = true
  }
});


require("todo-comments").setup({
});

require('luasnip.loaders.from_vscode').lazy_load()
