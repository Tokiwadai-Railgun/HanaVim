vim.api.nvim_create_autocmd({"BufReadPost", "BufWinEnter"}, {
  callback = function ()
    vim.o.tabstop = 2
    vim.o.shiftwidth = 2
  end
})

-- vim.cmd("highlight BorderBG guibg=NONE guifg=#00ff00")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, {args.buf})
        end
        -- whatever other lsp config you want
    end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "typescriptreact" }, -- or add "typescript.tsx" if needed
  callback = function()
    vim.keymap.set("n", "gl", ":PrettyTsError<CR>", { buffer = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    callback = function ()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set(
            "n",
            "<leader>a",
            function()
                vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
                -- or vim.lsp.buf.codeAction() if you don't want grouping.
            end,
            { silent = true, buffer = bufnr }
        )
        vim.keymap.set(
            "n",
            "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
            function()
                vim.cmd.RustLsp({'hover', 'actions'})
                end,
            { silent = true, buffer = bufnr }
        )
    end
})

-- Auto fold long comments when entering a file
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("AutoFoldComments", { clear = true }),
  callback = function ()
    vim.defer_fn(function ()
      local bufnr = vim.api.nvim_get_current_buf()
      local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
      if not ok or not parser then return end

      local tree = parser:parse()[1]
      local root = tree:root()
      local lang = parser:lang()

      local query_string = [[
        (comment) @comment
        (line_doc_comment) @comment
        (block_doc_comment) @comment
      ]]

      local ok_query, query = pcall(vim.treesitter.query.parse, lang, query_string)
      if not ok_query then return end

      for _, node in query:iter_captures(root, bufnr, 0, -1) do
        local start_now, _, end_row, _ = node:range()
        if (end_row - start_now) >= 4 then
          pcall(vim.cmd, string.format("%d, %dfold", start_now + 1, end_row))
        end
      end
    end, 150)
  end
})
