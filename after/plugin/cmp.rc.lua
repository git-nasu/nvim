local status,cmp = pcall(require,"cmp")
if not status then
	return
end

local lspkind = require('lspkind')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	sources  = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip', option = { show_autosnippets =  true } },
		{ name = 'buffer' },
    { name = 'path' },
		{ name = 'cmdline' }
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] =  cmp.mapping.confirm( { select = true })
	}),
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 40,
			ellipse_char = '...',
			menu = {
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
				nvim_lua = "[Lua]",
				omni = "[Omni]"
			}
		})
	}
})


vim.cmd [[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]]
