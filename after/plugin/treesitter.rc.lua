local status,ts  = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

ts.setup({
	highlight = {
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
      'css', 'lua', 'xml', 'php', 'markdown','rb'
    }
	}
})
