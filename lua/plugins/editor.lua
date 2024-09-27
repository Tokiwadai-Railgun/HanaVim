return {
  'tpope/vim-fugitive',                                                  -- Git commands in nvim
  'tpope/vim-rhubarb',                                                   -- Fugitive-companion to interact with github
  { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }, -- Add git related info in the signs columns and popups
  'numToStr/Comment.nvim',                                               -- "gc" to comment visual regions/lines
  'nvim-treesitter/nvim-treesitter',                                     -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter-textobjects',                         -- Additional textobjects for treesitter
  'nvim-treesitter/nvim-treesitter-context',                             -- Used to display current function name
  'neovim/nvim-lspconfig',                                               -- Collection of configurations for built-in LSP client
  'williamboman/mason.nvim',                                             -- Manage external editor tooling i.e LSP servers
  'williamboman/mason-lspconfig.nvim',                                   -- Automatically install language servers to stdpath
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()

  end},         -- Autocompletion
  { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } },     -- Snippet Engine and Snippet Expansion
  'mjlbach/onedark.nvim',                                                -- Theme inspired by Atom
  'nvim-lualine/lualine.nvim',                                           -- Fancier statusline
  'lukas-reineke/indent-blankline.nvim',                                 -- Add indentation guides even on blank lines
  'tpope/vim-sleuth',                                                    -- Detect tabstop and shiftwidth automatically
  'wakatime/vim-wakatime',                                               -- Coding timespeck
  { "catppuccin/nvim", as = "catppuccin" },                              -- Colorsheme
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {'m4xshen/autoclose.nvim'},
}
