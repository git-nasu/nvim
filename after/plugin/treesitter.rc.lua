local status,ts  = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

ts.setup({
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
	}
})
