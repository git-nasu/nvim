local status, nvim_lsp = pcall(require,'lspconfig')
if not status then
	return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client,bufnr)
	-- mapping
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr,...) end
	local opts = { noremap = true, silent = true }
	buf_set_keymap('n','gD','<Cmd>lua vim.lsp.buf.declaration()<CR>',opts)
	buf_set_keymap('n','gd','<Cmd>lua vim.lsp.buf.definition()<CR>',opts)
	buf_set_keymap('n','K','<Cmd>lua vim.lsp.buf.hover()<CR>',opts)

	-- format
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre",{
			group = vim.api.nvim_create_augroup("Format",{ client = true }),
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.formatting_seq_sync()
			end
		})
	end
end

protocol.CompletionItemKind = {
	'', -- Text
	'', -- Method
	'', -- Function
	'', -- Constructor
	'', -- Field
	'', -- Variable
	'', -- Class
	'ﰮ', -- Interface
	'', -- Module
	'', -- Property
	'', -- Unit
	'', -- Value
	'', -- Enum
	'', -- Keyword
	'﬌', -- Snippet
	'', -- Color
	'', -- File
	'', -- Reference
	'', -- Folder
	'', -- EnumMember
	'', -- Constant
	'', -- Struct
	'', -- Event
	'ﬦ', -- Operator
	'', -- TypeParameter
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- typescript-language-server

-- nvim_lsp.tsserver.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	cmd = { "typescript-language-server", "--stdio" },
-- 	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
-- 	hostInfo = { "nvim" }
-- })

-- lua-language-server

nvim_lsp.lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,{
		underline = true,
		update_in_install = false,
		virtual_text = {
			spacinig = 4,
			prefix = '●'
		},
		serverty = true
	}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type,icon in pairs(signs) do
	local h1 = "DiagnosticSign" .. type
	vim.fn.sign_define(h1,{ text = icon, texth1 = h1, numh1 = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = '●'
	},
	update_in_insert  = true,
	float = {
		source  = "always" -- Or "if_many"
	},
})
