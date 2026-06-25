-- ~/.config/nvim/lua/plugins.lua

return {
	-- nvim-tree.lua: Un explorador de archivos estilo árbol (antes conocido como NerdTree)
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = false,
				},
			})
		end,
	},

	-- Dracula color scheme: Tu tema de color favorito
	{
		"Mofiqul/dracula.nvim",
		lazy = false,      -- Cárgalo al inicio para que el tema se aplique de inmediato
		priority = 1000,   -- Asegura que este plugin se cargue antes que otros temas
		config = function()
			-- Puedes añadir configuración específica si la necesitas, por ejemplo:
			-- require("dracula").setup({
			--   transparent_background = false,
			-- })
		end,
	},

	-- nvim-lspconfig: Configuraciones para Language Server Protocol (LSP)
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",        -- Gestor de paquetes para LSP, linters, formatters
			"williamboman/mason-lspconfig.nvim", -- Conexión entre mason y lspconfig
			"hrsh7th/nvim-cmp",               -- Autocompletado principal
			"hrsh7th/cmp-nvim-lsp",           -- Fuente de cmp para LSP
		},
		config = function()
			-- Carga el módulo de configuración de LSP definido en lua/config/lsp.lua
			require("config.lsp")
		end,
	},

	-- nvim-cmp: Motor de Autocompletado
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",           -- Fuente LSP
			"hrsh7th/cmp-buffer",             -- Fuente de búfer actual
			"hrsh7th/cmp-path",               -- Fuente de rutas de archivos
			"hrsh7th/cmp-cmdline",            -- Fuente para línea de comandos (opcional)
			"saadparwaiz1/cmp_luasnip",       -- Fuente para snippets de LuaSnip
			"L3MON4D3/LuaSnip",                -- Motor de snippets
		},
		config = function()
			-- Carga el módulo de configuración de CMP definido en lua/config/cmp.lua
			require("config.cmp")
		end,
	},

	-- LuaSnip: Motor de Snippets (dependencia de nvim-cmp para snippets)
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- O la última versión estable recomendada
		build = "make install_jsregexp", -- Comando para instalar dependencias de snippets
		dependencies = { "saadparwaiz1/cmp_luasnip" },
	},

	-- nvim-treesitter: Mejora el resaltado de sintaxis y la estructura del código
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate", -- Comando para actualizar los parsers de treesitter
		config = function()
			require("nvim-treesitter").setup({
				ensure_installed = { "php", "javascript", "html", "css", "lua" },
				auto_install = true,
			})
		end,
	},

	-- mason.nvim: Gestor de paquetes para servidores LSP, linters y formatters
	{
		"williamboman/mason.nvim",
		cmd = "Mason", -- Permite usar :Mason para abrir la interfaz de usuario
		build = ":MasonUpdate", -- Comando para actualizar los paquetes instalados
		config = function()
			require("mason").setup()
		end,
	},

	-- mason-lspconfig.nvim: Integra Mason con nvim-lspconfig para una instalación fácil de LSP
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				-- Lista de servidores LSP que Mason debe asegurar que estén instalados
				-- ¡Aquí cambiamos "tsserver" por "ts_ls"!
				ensure_installed = { "intelephense", "html", "cssls", "jsonls", "ts_ls" },
				automatic_installation = true, -- Instala automáticamente los servidores listados
			})
		end,
	},

	-- telescope.nvim: Potente "fuzzy finder" para Neovim
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			-- Carga el módulo de configuración de Telescope definido en lua/config/telescope.lua
			require("config.telescope")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("config.cmp") -- Asegúrate de que este config cargue tu configuración de cmp
		end,
	},

	-- nvim-ts-autotag: Auto-cierre y auto-renombrado de etiquetas HTML/XML
	{
		"windwp/nvim-ts-autotag",
		ft = { "html", "xml", "php" }, -- Activar solo para estos tipos de archivo
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- Se carga solo cuando entras en modo inserción
		config = function()
			-- Carga el módulo de configuración de Autopairs definido en lua/config/autopairs.lua
			require("config.autopairs")
		end,
	},
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    }

}
