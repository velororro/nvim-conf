-- Opciones locales para C
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true

local map = vim.keymap.set
local opts = { buffer = true, silent = true }

-- Atajo <F5> para compilar y ejecutar el archivo actual en una ventana dividida
map("n", "<F5>", function()
  vim.cmd("write") -- Guarda el archivo actual
  local file = vim.fn.expand("%:p")
  local out = vim.fn.expand("%:p:r")
  local cmd

  cmd = string.format("gcc %s -o %s && %s", file, out, out)

  if cmd then
    -- Buscar si ya existe una ventana abierta ejecutando una terminal
    local term_win = nil
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].buftype == "terminal" then
        term_win = win
        break
      end
    end

    if term_win and vim.api.nvim_win_is_valid(term_win) then
      -- Si ya existe la ventana, la cerramos para limpiar la ejecución anterior
      vim.api.nvim_win_close(term_win, true)
    end

    -- Abre la nueva división e inicia la terminal
    vim.cmd("split | term " .. cmd)
  end

end, opts)

