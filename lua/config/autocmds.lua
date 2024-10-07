vim.api.nvim_create_autocmd({"BufReadPost", "BufWinEnter"}, {
  callback = function ()
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
  end
})

