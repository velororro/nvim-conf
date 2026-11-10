vim.g.netrw_banner = 0

vim.g.mapleader = " "

vim.opt.rnu = true
vim.opt.nu = true

vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cmdheight = 0
vim.opt.laststatus = 0

vim.opt.winbar = "%f %h%w%m%r %=%(%l,%c%) %{strftime('%H:%M')}"

-- Active window winbar color
vim.api.nvim_set_hl(0, "WinBar", { fg = "#ffffff", bg = "#282c34", bold = true })
-- Inactive window winbar color
vim.api.nvim_set_hl(0, "WinBarNC", { fg = "#abb2bf", bg = "#1e222a" })

--Mappings
vim.keymap.set("n", "<Tab>", vim.cmd.bnext)
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true })
vim.opt.foldmethod = "syntax"
