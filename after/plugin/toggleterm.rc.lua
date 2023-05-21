local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

toggleterm.setup({
	size = 30,
	open_mapping = [[<C-t>]], --toggle switch
	shade_filetypes = {},
	start_in_insert = true,
	insert_mapping = true,
	tag = '*',
	vim.api.nvim_create_autocmd("TermEnter", {
		pattern = { 'term://*toggleterm#*/' },
		callback = function()
			vim.keymap.set('t', '<C-t>', "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", {})
		end
	})
})
vim.keymap.set('n', '<C-t>', "<Cmd>exe v:count1 . 'ToggleTerm'<CR>", {})
vim.keymap.set('i', '<C-t>', "<Esc><Cmd>exe v:count1 . 'ToggleTerm'<CR>", {})
