return {
  'tpope/vim-fugitive',                                                  -- Git commands in nvim
  'tpope/vim-rhubarb',                                                   -- Fugitive-companion to interact with github
  { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }, -- Add git related info in the signs columns and popups
  'numToStr/Comment.nvim',                                               -- "gc" to comment visual regions/lines
  'nvim-treesitter/nvim-treesitter',                                     -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter-textobjects',                         -- Additional textobjects for treesitter
  'nvim-treesitter/nvim-treesitter-context',                             -- Used to display current function name
  {
    'neovim/nvim-lspconfig'
  },                                             -- Collection of configurations for built-in LSP client
  'williamboman/mason.nvim',                                             -- Manage external editor tooling i.e LSP servers
  'williamboman/mason-lspconfig.nvim',                                   -- Automatically install language servers to stdpath
  {'hrsh7th/cmp-nvim-lsp'},
  'saadparwaiz1/cmp_luasnip',
  { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' },
  config = function()

  end},         -- Autocompletion
  { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' }, run = "make install_jsregexp" },     -- Snippet Engine and Snippet Expansion
  'nvim-lualine/lualine.nvim',                                           -- Fancier statusline
  'lukas-reineke/indent-blankline.nvim',                                 -- Add indentation guides even on blank lines
  'tpope/vim-sleuth',                                                    -- Detect tabstop and shiftwidth automatically
  { "catppuccin/nvim", as = "catppuccin" },                              -- Colorsheme
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  {'m4xshen/autoclose.nvim'},
  'evanleck/vim-svelte',
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
  {
    "windwp/nvim-ts-autotag",
    config = function() 
      require('nvim-ts-autotag').setup()
    end
  },
  { 'echasnovski/mini.cursorword', version = false },
  { 'echasnovski/mini.indentscope', version = '*' },
  { -- To add copilot as to cmp
  "zbirenbaum/copilot-cmp",
  dependencies = "copilot.lua",
  config = function()
    require("copilot_cmp").setup()
  end
  },
  { 'wakatime/vim-wakatime', lazy = false },
  { 'mfussenegger/nvim-jdtls' }, -- Java configuration
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rose-pine/neovim",
    name="rose-pine",
  },
  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}


