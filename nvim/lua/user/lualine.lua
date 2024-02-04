local M = {
    -- Set lualine as statusline
    "nvim-lualine/lualine.nvim",
}

function M.config()
  require("lualine").setup { 
    options = {
      icons_enabled = false,
      theme = "everforest",
      component_separators = "|",
      section_separators = "",
    },
  }
end 

return M

