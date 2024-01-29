local M = { 
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
}

function M.config()
   require("nvim-treesitter.configs").setup {
        ensure_installed = { "lua", "python", "vim", "markdown" },
	highlight = { enable = true },
 	indent = { enable = true },
   }
end 

return M

