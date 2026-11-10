-- Definir los colores para cada modo (usando nombres de grupos de tu colorscheme)
-- Puedes cambiar "DiagnosticOk", "DiagnosticError", etc., por los colores que prefieras
local mode_colors = {
  n  = "DiagnosticOk",      -- Normal: Verde/Aceptado
  i  = "DiagnosticError",   -- Insertar: Rojo/Intenso (para llamar la atención)
  v  = "DiagnosticWarn",    -- Visual: Amarillo/Naranja
  V  = "DiagnosticWarn",    -- Visual Línea
  ["\22"] = "DiagnosticWarn", -- Visual Bloque (Ctrl+V)
  c  = "DiagnosticInfo",    -- Comando: Azul/Información
  R  = "DiagnosticHint",    -- Reemplazo: Morado/Pista
}

-- Crear un grupo de autocomandos para que no se dupliquen al recargar
local mode_group = vim.api.nvim_create_augroup("ModeColorChanger", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
  group = mode_group,
  pattern = "*:*", -- Escucha cualquier cambio de modo
  callback = function()
    local mode = vim.fn.mode()
    -- Buscar el grupo de color asignado al modo actual, o usar Normal si no existe
    local highlight_group = mode_colors[mode] or "Normal"
    
    -- Extraer los colores (Foreground y Background) de ese grupo del colorscheme
    local hl = vim.api.nvim_get_hl(0, { name = highlight_group, link = false })
    local fg_color = hl.fg and string.format("#%06x", hl.fg) or "NONE"
    
    -- ¡AQUÍ ESTÁ LA MAGIA CREATIVA!
    -- Opción A: Cambiar el color del texto de la línea de estado nativa (StatusLine)
    vim.api.nvim_set_hl(0, "StatusLine", { fg = fg_color, bold = true })
    
    -- Opción B (Opcional): Si usas una línea divisora vertical para los buffers, cambia su color
    --vim.api.nvim_set_hl(0, "WinSeparator", { fg = fg_color })
  end,
})
