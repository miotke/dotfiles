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
  --wk.register { }

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
    
    pcall(require("telescope").load_extension, "fzf")
  }
end

  -- Telescope live_grep in git root
  -- Function to find the git root directory based on the current buffer's path
 local function find_git_root()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == '' then
      current_dir = cwd
    else
      -- Extract the directory from the current file's path
      current_dir = vim.fn.fnamemodify(current_file, ':h')
    end

    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
      print 'Not a git repository. Searching on current working directory'
      return cwd
    end
    return git_root
 end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end


vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- Telescope builtin keymaps
-- See `:help telescope.builtin`

-- Search open buffers
vim.keymap.set('n', '<leader>b', function()
  require('telescope.builtin').buffers()
end, { desc = "Search existing [b]uffers" })


-- Search within the file
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Search the file' })

-- Search files
vim.keymap.set("n", "<leader>f", function()
  require("telescope.builtin").find_files()
end, { desc = "Search [f]iles in current directory"})


local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end

return M

