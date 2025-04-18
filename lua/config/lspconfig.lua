require'lspconfig'.svelte.setup{}
-- require'lspconfig'.tailwindcss.setup{}

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            hint = {
                enable = true
            },
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

lspconfig.ts_ls.setup{
    settings = {
        typescript = {
            tsserver = {
                useSyntaxServer = false
            },
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        }
    }
}

lspconfig.clangd.setup{}

lspconfig.phpactor.setup {
    cmd = { 'phpactor', 'language-server' },
    filetypes = { 'php' },
    root_dir = lspconfig.util.root_pattern('.git', '.phpactor.json', '.phpactor.yml'),
    init_options = {
        ['indexer.exclude_patterns'] = {
            '/vendor/**/Tests',
            '/vendor/**/tests/**/*',
            '/vendor/composer/**/*',
            '/generated/**/*',
            '/pub/static/**/*',
            '/var/**/*',
            '/dev/**/*',
        },
    },
}

lspconfig.gopls.setup {}

-- PHP and HTML / CSS
lspconfig.intelephense.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
    configs.ls_emmet = {
        default_config = {
            cmd = { "ls_emmet", "--stdio" };
            filetypes = {
                "html",
                "css",
                "scss",
                "javascriptreact",
                "typescriptreact",
                "php"
            }
        }
    }
end

lspconfig.ls_emmet.setup { capabilities = capabilities }

lspconfig.prismals.setup {
    default_config = {
        cmd = {"prisma-language-server", "--stdio"},
        filetypes = { 'prisma' }
    }
}

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
    preselect = cmp.PreselectMode.None,
    completion = { completeopt = "menu,menuone,noselect" },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }
}
