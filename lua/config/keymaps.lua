-- Mover lineas
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", { desc = "Moves lines up in visual selection" })







