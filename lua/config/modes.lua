-- Definir los colores para cada modo (usando nombres de grupos de tu colorscheme)
-- Puedes cambiar "DiagnosticOk", "DiagnosticError", etc., por los colores que prefieras
local mode_colors = {
  i  = "DiagnosticError",   -- Insertar: Rojo/Intenso (para llamar la atención)
  v  = "DiagnosticWarn",    -- Visual: Amarillo/Naranja
  V  = "DiagnosticWarn",    -- Visual Línea
  ["\22"] = "DiagnosticWarn", -- Visual Bloque (Ctrl+V)
  c  = "DiagnosticInfo",    -- Comando: Azul/Información
  R  = "DiagnosticHint",    -- Reemplazo: Morado/Pista
}

-- Crear un grupo de autocomandos para que no se dupliquen al recargar
local mode_group = vim.api.nvim_create_augroup("ModeColorChanger", { clear = true })
local normal_winbar_highlight = vim.api.nvim_get_hl(0, { name = "WinBar", link = false })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = mode_group,
  pattern = "*:*", -- Escucha cualquier cambio de modo
  callback = function()
    local mode = vim.fn.mode()
    if mode:sub(1, 1) == "n" then
      vim.api.nvim_set_hl(0, "WinBar", normal_winbar_highlight)
      return
    end

    local highlight_group = mode_colors[mode] or "Normal"

    -- Extraer los colores (Foreground y Background) de ese grupo del colorscheme
    local hl = vim.api.nvim_get_hl(0, { name = highlight_group, link = false })
    local winbar_highlight = vim.tbl_extend("force", normal_winbar_highlight, {
      fg = hl.fg,
      bold = true,
    })
    vim.api.nvim_set_hl(0, "WinBar", winbar_highlight)
    
    -- Opción B (Opcional): Si usas una línea divisora vertical para los buffers, cambia su color
    --vim.api.nvim_set_hl(0, "WinSeparator", { fg = fg_color })
  end,
})
