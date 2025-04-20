-- Enable Comment.nvimkey
require('Comment').setup()

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>st', '<cmd>Telescope diagnostics<cr>', {desc ="[S]earch for [T]roubles"})

-- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-e>', ":lua MiniFiles.open()<cr>", { noremap = true, silent = true })


function toggleTerminal()
    require('toggleterm').toggle()
end
vim.keymap.set('n', '<C-t>', toggleTerminal, { desc = "Terminal"})
vim.keymap.set('i', '<C-t>', toggleTerminal, { desc = "Terminal"})
vim.keymap.set('t', '<C-t>', toggleTerminal, { desc = "Terminal"})

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true})
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true})


vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float({ border="rounded"})<cr>', { noremap=true, silent=true})
vim.keymap.set('n', '<leader>;', '<cmd>Dashboard<cr>')

-- correct error using lsp
vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, { desc = "Correct Error"})
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename Variable"})

-- In case tabstop is not set up automatically
vim.keymap.set('n', '<leader>lt', '<cmd>set tabstop=2 shiftwidth=4<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>TodoTelescope<cr>', {desc ="[S]earch for Todos"})

vim.keymap.set("n", "<Leader>rc", ":lua require('ror.commands').list_commands()<CR>", { silent = true })

-- Lesser used LSP functionality
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc= '[G]oto [D]efinition'})
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc= '[G]oto [D]eclaration'})

-- comment using ","
vim.keymap.set("n", ",", "gcc", { remap = true})
vim.keymap.set("v", ",", "gcgv", { remap = true})

-- keep visual open when indenting
vim.keymap.set('v', '>', '>gv', { remap= true})
vim.keymap.set('v', '<', '<gv', { remap= true})

vim.keymap.set('n', '<leader>e', ':Markview<cr>', { desc="Activate Markdown preview"})
vim.keymap.set('n', '<C-p>', ':Markview splitToggle<cr>', { desc="Activate Markdown preview in split window"})


-- Debugger 
vim.keymap.set("n", "<leader>dA", function()
    vim.cmd.RustLsp { 'hover', 'actions'} -- supports rust-analyzer's grouping
  end,
  { silent = true, desc = "Code actions for Rust"}
)
vim.keymap.set('n', "<leader>db", ":DapToggleBreakpoint<CR>")
vim.keymap.set('n', "<leader>dx", ":DapTerminate<CR>")
vim.keymap.set('n', "<leader>do", ":DapStepOver<CR>")
vim.keymap.set('n', "<leader>dh", ":lua require('dap.ui.widgets').hover()", {desc="Vairable Value"})
vim.keymap.set('n', "<leader>dp", ":lua require('dap.ui.widgets').preview()", {desc="Preview value of an expression"})


vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true, silent=true })

vim.keymap.set('t', '<Esc>','<C-\\><C-n>', {noremap = true, silent = true})

function toogleInlayHint()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}))
end

vim.keymap.set('n', '<C-m>', toogleInlayHint, { desc = "Toogle inlay_hint" })

-- tabs features
vim.keymap.set('n', "<leader>tn", "<cmd>tabnew<cr>", { desc = "Create a new tab" })
vim.keymap.set('n', "<leader>tm", ":tabmove ", { desc = "Move to a given tab number" })
vim.keymap.set('n', "<leader>tc", "<cmd>tabclose<cr>", { desc = "close a tab" })
vim.keymap.set('n', "<leader>to", "<cmd>tabonly<cr>", { desc = "Close all tabs escept the current" })
