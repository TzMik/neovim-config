-- ~/.config/nvim/init.lua
-- Tu configuración de números de línea
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true -- ¡Asegúrate de que esté aquí!


-- Define la tecla leader como la barra espaciadora
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Configuración de indentación
vim.opt.expandtab = true   -- No expandir tabs a espacios (usar caracteres de tab real)
vim.opt.tabstop = 4         -- Un tab se visualiza como 4 espacios
vim.opt.shiftwidth = 4      -- Cuando indentas/desindentas (ej. con << o >>) se mueve 4 espacios
vim.opt.softtabstop = 4     -- Cuando presionas tab en modo inserción, inserta 4 espacios o un tab si es posible

-- Opcional: Para asegurar que el autoindentado esté siempre activo
vim.opt.autoindent = true   -- Mantener la indentación de la línea anterior
vim.opt.smartindent = true  -- Indentación inteligente para ciertos lenguajes/estructuras (ej. if/else)

-- Resalta la línea donde se encuentra el cursor
vim.opt.cursorline = true

-- Mapeos para moverse entre ventanas (splits)
-- Usaremos la tecla leader + h/j/k/l
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Moverse a la ventana izquierda" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Moverse a la ventana abajo" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Moverse a la ventana arriba" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Moverse a la ventana derecha" })

-- Puedes añadir esto en tu init.lua o en un archivo de mapeos dedicado
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar NvimTree" })

-- Para un mapeo directo para enfocarse en NvimTree si está abierto
vim.keymap.set("n", "<leader>t", function()
  -- Si NvimTree está abierto y no es la ventana actual, enfócalo
  local nvim_tree_api = require("nvim-tree.api")
  if nvim_tree_api.tree.is_tree_open() and vim.api.nvim_get_current_win() ~= nvim_tree_api.tree.get_window() then
    nvim_tree_api.tree.focus()
  else
    -- Si no está abierto o ya está enfocado, puedes alternarlo o simplemente moverte a la ventana anterior
    vim.cmd("NvimTreeToggle")
  end
end, { desc = "Alternar/Enfocar NvimTree" })

-- ~/.config/nvim/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Carga los plugins definidos en lua/plugins.lua
require("lazy").setup("plugins", {
  change_detection = {
    enabled = true,
    notify = false,
  },
})

-- Establece el color scheme de Dracula
vim.cmd.colorscheme("dracula")

-- lualine configuration
require('lualine').setup()
