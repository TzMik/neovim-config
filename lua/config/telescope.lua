-- ~/.config/nvim/lua/config/telescope.lua

local telescope = require("telescope.builtin")

-- Mapeos de teclado para Telescope
-- Estos son ejemplos, puedes personalizarlos a tu gusto

-- Buscar archivos en el proyecto
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Buscar archivos" })

-- Buscar texto en el contenido de los archivos del proyecto (grep_string)
-- Esto usa el texto bajo el cursor como búsqueda inicial
vim.keymap.set("n", "<leader>fg", telescope.grep_string, { desc = "Buscar texto bajo el cursor" })

-- Buscar texto en el contenido de los archivos del proyecto (live_grep)
-- Puedes escribir tu consulta de búsqueda después de presionar el atajo
vim.keymap.set("n", "<leader>fG", telescope.live_grep, { desc = "Buscar texto en el proyecto" })

-- Buscar archivos recientes
vim.keymap.set("n", "<leader>fh", telescope.oldfiles, { desc = "Buscar archivos recientes" })

-- Buscar buffers abiertos
vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Buscar buffers" })

-- Configuración adicional de Telescope (opcional)
require("telescope").setup({
  defaults = {
    -- Puedes ajustar el comportamiento predeterminado aquí
    file_ignore_patterns = { "node_modules", ".git" },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.8,
      height = 0.9,
      preview_cutoff = 120,
    },
  },
  pickers = {
    live_grep = {
      theme = "ivy", -- O "dropdown", "cursor", "center"
    },
  },
  -- extensions = {
  --   -- Aquí puedes cargar extensiones si las instalas
  --   -- project = {
  --   --   theme = "dropdown",
  --   -- },
  -- },
})

-- Para cargar extensiones (si las instalaste en dependencies)
-- require('telescope').load_extension('project')
-- require('telescope').load_extension('file_browser')
