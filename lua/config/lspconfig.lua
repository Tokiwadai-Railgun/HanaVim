require("mason").setup()
-- require("mason-lspconfig").setup()

local lsp = vim.lsp

-- === 1. Capabilities Setup (Crucial for Autocompletion) ===
-- We define this locally to pass it explicitly to servers that need it.
local capabilities = vim.tbl_deep_extend(
    'force',
    vim.lsp.protocol.make_client_capabilities(),
    {
        textDocument = {
            completion = { completionItem = { snippetSupport = true } },
        },
    }
)

-- Attempt to add cmp_nvim_lsp capabilities if the plugin is present
local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
    capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded" -- Force 'rounded' border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- === Global default configuration ===
lsp.config('*', {
    root_markers = { '.git' },
    capabilities = capabilities, -- Apply globally
})

vim.api.nvim_set_hl(0, "FloatBorder", { link = "MiniFilesBorder" })

-- === Lua ===
lsp.config('lua_ls', {
    settings = {
        Lua = {
            hint = { enable = true },
            diagnostics = { globals = { 'vim' } },
        },
    },
    filetypes = { 'lua' },
})

-- === Vue / TypeScript Setup (The Fix) ===

-- 1. Find the Vue Plugin path reliably
local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local vue_pkg_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
-- Fallback if the folder structure is different
if vim.fn.isdirectory(vue_pkg_path) == 0 then
    vue_pkg_path = mason_packages .. "/vue-language-server/node_modules/@vue/typescript-plugin"
end

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_pkg_path,
  languages = { 'vue' },
}

-- 2. TypeScript (ts_ls) - Modified to support Vue
lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    -- Add 'vue' to filetypes so TS works in <script> tags
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'vue' },
    capabilities = capabilities, -- Explicitly passed for safety
    init_options = {
        plugins = {
            vue_plugin, -- Load the Vue plugin
        },
    },
    settings = {
        typescript = {
            tsserver = { useSyntaxServer = false },
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
        },
    },
})

-- 3. Vue (vue_ls) - Added for Template Support
lsp.config('vue_ls', {
    cmd = { 'vue-language-server', '--stdio' },
    filetypes = { 'vue' },
    capabilities = capabilities,
    init_options = {
        vue = {
            hybridMode = true, -- Hand off JS/TS work to ts_ls
        },
        typescript = {
            -- Point to the typescript installed by Mason to ensure template parsing works
            tsdk = mason_packages .. "/typescript-language-server/node_modules/typescript/lib"
        }
    },
})

-- === PHP (phpactor) ===
lsp.config('phpactor', {
    cmd = { 'phpactor', 'language-server' },
    filetypes = { 'php' },
    root_markers = { '.git', '.phpactor.json', '.phpactor.yml' },
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
})

-- === Go ===
lsp.config('gopls', {
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
})

-- === PHP + HTML / CSS ===
lsp.config('intelephense', {
    filetypes = { 'php', 'html', 'css' },
})

-- === Assembly ===
lsp.config('asm_lsp', {
    filetypes = { 'asm', 's', 'S' },
})

-- === Emmet (Fixed) ===
-- Switched to emmet-language-server for better "div" expansion
lsp.config('emmet_language_server', {
    cmd = { 'emmet-language-server', '--stdio' },
    filetypes = { 'css', 'eruby', 'html', 'javascript', 'javascriptreact', 'less', 'sass', 'scss', 'pug', 'typescriptreact', 'vue' },
    capabilities = capabilities,
})

-- === Prisma ===
lsp.config('prismals', {
    cmd = { 'prisma-language-server', '--stdio' },
    filetypes = { 'prisma' },
})

-- === nvim-cmp ===
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = { menu = 50, abbr = 50 },
            ellipsis_char = '...',
            show_labelDetails = true,
        }),
    },
    preselect = cmp.PreselectMode.None,
    completion = { completeopt = 'menu,menuone,noselect' },
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
        completion = cmp.config.window.bordered({
            border = "rounded",
            -- Map standard FloatBorder to the MiniFilesBorder color
            winhighlight = "Normal:CmpPmenu,FloatBorder:MiniFilesBorder,CursorLine:PmenuSel,Search:None",
        }),
        documentation = cmp.config.window.bordered({
            border = "rounded",
            -- Same here for documentation
            winhighlight = "Normal:Normal,FloatBorder:MiniFilesBorder,CursorLine:PmenuSel,Search:None",
        }),
    },
}

-- === Svelte ===
lsp.config('svelte', {
    cmd = { 'svelteserver', '--stdio' }, -- default Mason binary
    filetypes = { 'svelte' },
    root_markers = { 'svelte.config.js', 'svelte.config.cjs', 'svelte.config.ts', 'package.json', '.git' },
    settings = {
        svelte = {
            plugin = {
                svelte = { compilerWarnings = { ['a11y-no-onchange'] = 'ignore' } },
            },
        },
    },
})

-- === Tailwind CSS ===
lsp.config('tailwindcss', {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = {
        'html', 'css', 'scss', 'sass', 'javascript', 'javascriptreact',
        'typescript', 'typescriptreact', 'svelte', 'vue', 'astro',
    },
    root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts', 'postcss.config.js', 'package.json', '.git' },
    settings = {
        tailwindCSS = {
            classAttributes = { 'class', 'className', 'ngClass' },
            lint = {
                cssConflict = 'warning',
                invalidApply = 'error',
                invalidScreen = 'error',
                invalidVariant = 'error',
                invalidConfigPath = 'error',
            },
            validate = true,
        },
    },
})

lsp.config('ansiblels', {})

-- === Auto-enable all configured LSPs ===
lsp.enable({
    'lua_ls',
    'ts_ls',
    'vue_ls', -- ADDED
    'phpactor',
    'gopls',
    -- 'intelephense',
    'asm_lsp',
    'emmet_language_server', -- ADDED (replaces ls_emmet)
    'prismals',
    'svelte',
    'jdtls',
    "ansiblels"
    -- 'tailwindcss'
})
