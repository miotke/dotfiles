-- Sets theme to Everforest, https://github.com/sainnhe/everforest/tree/master
local M = {
    "sainnhe/everforest",
    lazy = false,    -- Make sure that it loads on startup
    priority = 1000, -- Loads before everything else
}

function M.config()
    vim.cmd.everforest_background = "soft"
    vim.cmd.colorscheme "everforest"
end

return M
