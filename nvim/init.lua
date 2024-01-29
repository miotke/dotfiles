-- Set <space> as the leader key
-- This must happen before plugs are required
-- This could go into the user.keymaps file
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Requirements
require ("user.launch")
require ("user.options")
require ("user.keymaps")

-- Specs (plugins)
spec ("user.colorscheme")
spec ("user.treesitter")
spec ("user.mason")
spec ("user.lualine")
spec ("user.vim-sleuth")
spec ("user.vim-fugitive")
spec ("user.vim-rhubarb")
spec ("user.indent-blankline")
spec ("user.whichkey")
spec ("user.gitsigns")
spec ("user.telescope")
require ("user.lazy")
