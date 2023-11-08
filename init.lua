
-- nvim startup speed up
if vim.loader then
	vim.loader.enable()
end



require('gitnasu.base')
require('gitnasu.keymaps')
require('gitnasu.plugins')
require('gitnasu.autocmds')

