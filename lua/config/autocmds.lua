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
