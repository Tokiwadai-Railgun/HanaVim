vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.g.wakatime_debug = true

-- Install packer
require("config.lazy")
require('config.editor')
require('config.keymaps')
require('config.utils')
require('config.whichkey')
require('config.lspconfig')
require('config.lspconfig')
require('config.debug')
require('config.autocmds')

-- stylua: ignore end


-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Indent size set to 4
vim.o.tabstop = 4

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Share clipboard with system
vim.opt.clipboard = 'unnamedplus'

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- [[ Configure Treesitter ]]
require('nvim-treesitter').install({
'c', 'cpp', 'go', 'lua', 'python', 'rust'
})

-- select
for lhs, query in pairs({
  ['af'] = '@function.outer',
  ['if'] = '@function.inner',
  ['ac'] = '@class.outer',
  ['ic'] = '@class.inner',
}) do
  vim.keymap.set({ 'x', 'o' }, lhs, function()
    select.select_textobject(query, 'textobjects')
  end, { desc = 'Select ' .. query })
end

-- move
local move_maps = {
  goto_next_start     = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
  goto_next_end       = { [']M'] = '@function.outer', [']['] = '@class.outer' },
  goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
  goto_previous_end   = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
}
for method, maps in pairs(move_maps) do
  for lhs, query in pairs(maps) do
    vim.keymap.set({ 'n', 'x', 'o' }, lhs, function()
      move[method](query, 'textobjects')
    end, { desc = method .. ' ' .. query })
  end
end

-- swap
vim.keymap.set('n', '<leader>a', function()
  swap.swap_next('@parameter.inner')
end, { desc = 'Swap next parameter' })
vim.keymap.set('n', '<leader>A', function()
  swap.swap_previous('@parameter.inner')
end, { desc = 'Swap previous parameter' })

require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
  },
  move = {
    set_jumps = true,
  },
})


-- putting this at the end so colors are loaded after plugins
-- require('config.colors')
vim.g.ansible_extra_conf_files_with_extensions = 1

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
-- vim.opt.foldminlines = 4 -- only fold comment greater than 4 lines
-- vim.opt.fillchars = "fold: "

-- vim.cmd.colorscheme "automata"
local theme = require('colorsheme.nier-light.init')
theme.setup {
    theme = 'dark',
    transparent = false,
    italics = {
        comments = false,
        keywords = true,
        functions = true,
        strings = false,
        variables = true,
    },
}
theme.colorscheme()
