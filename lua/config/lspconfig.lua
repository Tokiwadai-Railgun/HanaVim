require'lspconfig'.svelte.setup{}
require'lspconfig'.tailwindcss.setup{}


-- Cmp and LSP border configuration

vim.api.nvim_set_hl(0, "BorderColor", { fg= "#b4befe"})
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg= "#b4befe"})
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg= "#b4befe"})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {fg= "#b4befe"})
vim.api.nvim_set_hl(0, "TelescopePromptTitle", {fg= "#b4befe"})
vim.api.nvim_set_hl(0, "TelescopeResultBorder", {fg= "#b4befe"})
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {fg= "#b4befe"})
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {fg= "#b4befe"})


-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
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
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
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
      winhighlight = "Normal:BorderColor,FloatBorder:BorderColor,CursorLine:PmenuSel,Search:None"
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:BorderColor,FloatBorder:BorderColor,CursorLine:PmenuSel,Search:None"
    })
  }
}
