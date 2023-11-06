local status,ts  = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

ts.setup({
	-- ensure_installed = "python",
	highlight = {
		additional_vim_regex_highlighting = true,
		enable = true,
		disable = {}
	},
	indent = {
		enable = true,
		disable = {}
  },
	auto_install = true,
	autotag = {
		enable = true,
		 filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'css', 'lua', 'xml', 'php', 'markdown','rb','ejs'
    }
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_selection = "grn",
			scope_selection = "grc",
			node_decremental = "grm"
		}
	}
})
