-- ~/.config/nvim/lua/config/lsp.lua

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local on_attach = function(client, bufnr)
  -- Habilita el diagnóstico de la LSP al inicio
  vim.diagnostic.config({
    virtual_text = true, -- Muestra diagnósticos como texto virtual al final de la línea
    signs = true,        -- Muestra iconos de diagnóstico en el margen
    update_in_insert = false, -- No actualiza los diagnósticos en modo inserción
    underline = true,
    severity_sort = true, -- Ordena los diagnósticos por severidad
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  -- Mapeos de teclado para LSP
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

  -- Mapeos para navegación de diagnósticos
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

-- Capabilities para nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Configuración del servidor LSP para PHP
-- Puedes elegir 'intelephense' o 'phpactor'. Intelephense es muy popular.
lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  -- Asegúrate de que PHP y Composer estén en tu PATH
  -- Puedes añadir opciones específicas de Intelephense aquí si las necesitas
  -- Por ejemplo, si tienes una licencia, puedes configurar la ruta:
  -- settings = {
  --   intelephense = {
  --     licenceKey = "tu_licencia_aqui",
  --   },
  -- },
})

-- Otros servidores LSP que puedas necesitar (ej. para HTML, CSS, JS)
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lspconfig.ts_ls.setup({ -- Para JavaScript/TypeScript
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Nota: Si usas Laravel, a menudo se recomienda instalar `barryvdh/laravel-ide-helper`
-- en tu proyecto PHP para mejorar la precisión del LSP.
-- composer require --dev barryvdh/laravel-ide-helper
-- php artisan ide-helper:generate
-- php artisan ide-helper:models --nowrite (si no quieres que sobrescriba tus modelos)
