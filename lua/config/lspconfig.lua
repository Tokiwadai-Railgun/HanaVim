require("mason").setup()
-- require("mason-lspconfig").setup()

local lsp = vim.lsp

-- === Global default configuration ===
lsp.config('*', {
  root_markers = { '.git' },
  capabilities = vim.tbl_deep_extend('force',
    vim.lsp.protocol.make_client_capabilities(),
    {
      textDocument = {
        completion = { completionItem = { snippetSupport = true } },
      },
    }
  ),
})

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

-- === TypeScript / JavaScript ===
lsp.config('ts_ls', {
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
  filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
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

-- === Emmet ===
lsp.config('ls_emmet', {
  cmd = { 'ls_emmet', '--stdio' },
  filetypes = { 'html', 'css', 'scss', 'javascriptreact', 'php' },
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
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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

-- === Auto-enable all configured LSPs ===
lsp.enable({
  'lua_ls',
  'ts_ls',
  'phpactor',
  'gopls',
  -- 'intelephense',
  'asm_lsp',
  -- 'ls_emmet',
  'prismals',
    'svelte',
    -- 'tailwindcss'
})
