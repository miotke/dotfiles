local M = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = { 
      indent_blankline_use_treesitter = true,
      show_current_context = true,
      show_current_context_start = true,
      indent_blankline_show_trailing_blankline_indent = true
    }
}

function M.config()
  require("ibl").setup { 
    -- Settings go in opts above 
  }
end

return M

