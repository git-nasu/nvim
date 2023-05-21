local status, indent_blankline = pcall(require, "indent-blankline")
if not status then
	return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

indent_blankline.setup({
	show_current_context = true,
	space_char_blankline = " ",
})
