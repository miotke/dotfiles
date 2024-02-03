local M = { 
  "nvim-telescope/telescope.nvim", 
  tag = "0.1.5",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  }
}

function M.config()
  local actions = require "telescope.actions"
  local builtin = require "telescope.builtin"

  require("telescope").setup {
    defaults = { 
      entry_prefix = " ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
    },

    mappings = {
      n = {
	["<esc>"] = actions.close,
	["<leader>f"] = {
	  builtin.find_files,
	  desc = "Search [F] files in current directory"
	},
	["<leader>sh>"] = {
	  builtin.help_tags,
	  desc = "[S]earch [H]elp"
	}
      },
    },

    pickers = {
      live_grep = { 
	theme = "dropdown"
      }
    },

    find_files = {
      theme = "dropdown",
      previewer = false,
    },
    
    pcall(require('telescope').load_extension, 'fzf')
  }
end

return M

