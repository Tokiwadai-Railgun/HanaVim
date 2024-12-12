vim.api.nvim_create_autocmd({"BufReadPost", "BufWinEnter"}, {
  callback = function ()
    vim.o.tabstop = 2
    vim.o.shiftwidth = 4
  end
})

vim.cmd("highlight BorderBG guibg=NONE guifg=#00ff00")
