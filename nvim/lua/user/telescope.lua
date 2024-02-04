local M = { 
  "nvim-telescope/telescope.nvim", 
  tag = "0.1.5",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { 
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'make',
      cond = function()
	return vim.fn.executable 'make' == 1
      end,
    },
  }
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    ["<leader>f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
    ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
  }

  require("telescope").setup {
    defaults = { 
      entry_prefix = " ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
    },

    pickers = {
      live_grep = { 
        theme = "dropdown"
      }
    },

    find_files = {
      theme = "dropdown",
      previewer = true,
    },
    
    pcall(require('telescope').load_extension, 'fzf')
  }
end

return M

