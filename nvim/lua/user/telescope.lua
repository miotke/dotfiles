local M = {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
	cond = function()
	    return vim.fn.executable 'make' == 1
	end,
	lazy = true
	}
    }
} 
function M.config()
    require("telescope").setup {
	defaults = { 
	    mappings = { 
		i = {
		    ['<C-u>'] = false,
		    ['<C-d>'] = false,
		},
	    }
	},
	pickers = {
	      live_grep = {
		theme = "dropdown",
	      },

	      grep_string = {
		theme = "dropdown",
	      },

	      find_files = {
		theme = "dropdown",
		previewer = false,
	      },
	},
	vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })

    }

end

return M

