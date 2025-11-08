-- ~/.config/nvim/lua/config/cmp.lua

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	completion = {
		completeopt = "menu,menuone,noselect",
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- Activa el autocompletado manualmente
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	-- Aquí es donde añadimos la fuente de Emmet, filtrada por filetype
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
	-- Agregamos fuentes específicas por filetype para Emmet
	cmp.setup.filetype({ "html", "php", "javascriptreact", "typescriptreact" }, {
		sources = cmp.config.sources({
			{ name = "nvim_lsp" }, -- LSP también es útil en HTML/JS
			{ name = "buffer" },
			{ name = "path" },
		}),
	}),
	-- También puedes añadir esto para CSS si lo necesitas
	cmp.setup.filetype({ "css", "scss", "less" }, {
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- Autocompletado en la línea de comandos
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})
