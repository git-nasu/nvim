local autocmd = vim.api.nvim_create_autocmd --Create autocommand

--Remove whitespace on save
autocmd('BufWritePre', {
	pattern = '',
	command = ':%s/\\s\\+$//e'
})

--Don't auto commenting on save
autocmd('BufEnter', {
	pattern = '',
	command = 'set fo-=c fo-=r fo-=o' -- fo='formationoptions'
})


-- fo = formationoptions  :set formatioptions -=cro

--	c       auto-wrap comments using textwidth,
--
--	r       automatically insert the current comment leader after hitting
--					<Enter> in Insert mode.
--
--	o       automatically insert the current comment leader after hitting
--					'o' or 'O' in Normal mode.  In case comment is unwanted
--					in a specific place use CTRL-U to quickly delete
--					it. i_CTRL-

-- Packer automatically compile
vim.cmd [[
augroup packer_user_config
 autocmd!
 autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]
