vim.api.nvim_create_autocmd({"BufReadPost", "BufWinEnter"}, {
  callback = function ()
    vim.o.tabstop = 2
    vim.o.shiftwidth = 4
  end
})

vim.cmd("highlight BorderBG guibg=NONE guifg=#00ff00")

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
