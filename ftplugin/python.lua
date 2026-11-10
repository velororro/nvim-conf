vim.opt_local.shiftwidth = 8
vim.opt_local.tabstop = 8
vim.opt_local.expandtab = true

vim.opt.colorcolumn = "100"

-- Atajo para ejecutar con F5
vim.keymap.set('n', '<F5>', ':w<CR>:vsplit term://python %<CR>', { buffer = true })
