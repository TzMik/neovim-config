-- ~/.config/nvim/lua/config/autopairs.lua

-- Carga el módulo principal de nvim-autopairs
local npairs = require("nvim-autopairs")

-- Configura nvim-autopairs
npairs.setup({
  check_ts = true, -- Usa Treesitter para un auto-cierre más inteligente (recomendado si tienes Treesitter)
  ts_config = {
    lua = { "string", "source" }, -- Tipos de nodos para los que Autopairs funcionará en Lua
    javascript = { "string", "template_string" }, -- En JS, para strings y template literals
    html = { "attr" }, -- En HTML, para atributos
  },
  disable_filetype = { "TelescopePrompt", "vim" }, -- Deshabilita en estos filetypes
  fast_wrap = {}, -- Configuración para el "fast wrap" (ej. "foo" -> 'foo')
  -- Puedes añadir reglas personalizadas si necesitas
})

-- Integración con nvim-cmp para que no interfiera y el auto-cierre funcione bien con el autocompletado
-- Asegúrate de que nvim-cmp esté cargado antes de que esta parte se ejecute
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return -- Si cmp no está disponible, sal de aquí
end

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
