local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand('%:p:h')
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup({
	defaults = {
		prompt_prefix = '    ',
		mapping = {
			n = {
				["q"] = actions.close
			}
		}
	},
	extensions = {
		file_browser = {
			theme = 'dropdown',
			--disable netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mapping = {
				-- insert mode mappings
				["i"] = {
					["<C-w>"] = function() vim.cmd('normal vbd') end
				},
				["n"] = {
					-- normal mode mapping
					["N"] = fb_actions.create,
					["h"] = fb_actions.goto_parent_dir,
					["/"] = function()
						vim.cmd('startinsert')
					end
				}
			}
		},
	}
})

telescope.load_extension("file_browser")

--telescope basic keymaps

vim.keymap.set('n', '<leader>ff',
	function()
		builtin.find_files({
			no_ignore = false,
			hidden = true
		})
	end
)

vim.keymap.set('n', '<leader>fg',
	function()
		builtin.live_grep()
	end
)

vim.keymap.set('n', '<leader>fb',
	function()
		builtin.buffers()
	end
)

vim.keymap.set('n', '<leader>fh',
	function()
		builtin.help_tags()
	end
)

-- telescope-file-browser keymaps

vim.keymap.set('n', '<leader><leader>',
	function()
		telescope.extensions.file_browser.file_browser({
			path = "%:p:h",
			cwd = telescope_buffer_dir(),
			respect_gitignore = false,
			hidden = true,
			grouped = true,
			previewer = false,
			initial_mode = "normal",
			layout_config = { height = 30 }
		})
	end
)
-- telescope-frecency keymaps

vim.keymap.set('n', 'sf',
	"<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", { noremap = true, silent = true }
)
