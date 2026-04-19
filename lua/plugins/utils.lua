return {
    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', branch = 'master', requires = { 'nvim-lua/plenary.nvim' } },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    -- {
    --   "nvim-tree/nvim-tree.lua",
    --   version = "*",
    --   lazy = false,
    --   dependencies = {
    --     "nvim-tree/nvim-web-devicons",
    --   },
    --   config = function()
    --     require("nvim-tree").setup {}
    --   end,
    -- },
    {
        "echasnovski/mini.nvim"
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        dependencies = { {"nvim-tree/nvim-web-devicons"}}
    },
    { -- Change appearance of features like rename in LSP & etc...
        'stevearc/dressing.nvim',
        opts = {},
    },
    'weizheheng/ror.nvim', -- Run test un Ruby on Rails
    "nvim-lua/plenary.nvim",
    {
        "Zeioth/distroupgrade.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
        opts = {}
    },
    { --- Utils related to the editor : add color square for tailwindcss
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
            require("tailwindcss-colorizer-cmp").setup({
                color_square_width = 2,
            })
        end
    },
    {
        'rmagatti/auto-session',
        lazy = false,

        ---enables autocomplete for opts
        ---@module "auto-session"
        ---@type AutoSession.Config
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            auto_restore = false,
            -- log_level = 'debug',
        }
    },
    { "j-hui/fidget.nvim" },
    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            set_dark_mode = function()
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
            end,
            set_light_mode = function()
                local theme = require('colorsheme.nier-light.init')
                theme.setup {
                    theme = 'light',
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
            end,
            update_interval = 3000,
            fallback = "dark"
        }
    }
}
