local status, endwise = pcall(require,'nvim-treesitter.config')
if not status then
	return
end

endwise.setup({
	endwise = {
		enable = true
	}
})
