local status, packer = pcall(require, 'packer')
if not status then
	print('Packer is not installed ...')
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	-- My plugins installed

	--packer
	use 'wbthomason/packer.nvim'

	--LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	--completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-path', after  = 'nvim-cmp' }
	use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }

	--Snippet
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	--LSP UI's
	use 'onsails/lspkind.nvim'

	--colorscheme
	use 'EdenEast/nightfox.nvim'
	--use { 'catppuccin/nvim', as = 'catppuccin' }
	--use 'folke/tokyonight.nvim'


	--colorizer
	use 'norcalli/nvim-colorizer.lua'

	--common utilities
	use 'nvim-lua/plenary.nvim'

	--icons
	use 'nvim-tree/nvim-web-devicons'

	--indent blankline
  use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('ibl').setup()
		end
	}
	--comment
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	--statusline,bufferline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use {
		'akinsho/bufferline.nvim',
		tag = '*',
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	--treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end
	}

	--autopairs,autotag
	use 'windwp/nvim-autopairs'
	use 'windwp/nvim-ts-autotag'

	--telescope
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-telescope/telescope-file-browser.nvim'
	use {
		'nvim-telescope/telescope-frecency.nvim',
		config = function()
			require('telescope').load_extension('frecency')
		end,
		requires = { 'kkharji/sqlite.lua' }
	}

	--terminal
	use 'akinsho/toggleterm.nvim'

	--zenmode
	use 'folke/zen-mode.nvim'

	--gitsign
	use 'lewis6991/gitsigns.nvim'


  --endwise
	use {
		'RRethy/nvim-treesitter-endwise',
		config = function()
			require('nvim-treesitter.configs').setup({
				endwise = {
					enable  = true,
				}
			})
		end
	}

end)
