local status, zenMode = pcall(require,"zen-mode")
if not status then
	return
end

zenMode.setup({

})
-- vim.keymap.set('n','<C-w>o','<Cmd>ZenMode<CR>', { silent = true })
vim.keymap.set('n','<C-w>','<Cmd>ZenMode<CR>', {silent = true})
