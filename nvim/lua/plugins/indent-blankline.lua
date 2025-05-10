return {
  "lukas-reineke/indent-blankline.nvim",
  main = 'ibl',
  opts = {},
  -- Define rainbow colors
  config = function()
    local rainbow_highlight = {
      "RainbowRed",
      "RainbowYellow",
      "RainbowBlue",
      "RainbowOrange",
      "RainbowGreen",
      "RainbowViolet",
      "RainbowCyan",
    }

    -- Define single color (using a single highlight group)
    local single_highlight = { "IBLIndent" }

    -- Create a state variable to track current mode
    -- Changed to false to start with rainbow off
    local rainbow_mode = false

    local hooks = require "ibl.hooks"
    -- Create highlight groups
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- Rainbow colors
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })

      -- Single color (you can change this to your preferred color)
      vim.api.nvim_set_hl(0, "IBLIndent", { fg = "#3b4048" })
    end)

    -- Initialize with single color instead of rainbow colors
    require("ibl").setup {
      indent = { highlight = single_highlight },  -- Changed to single_highlight
      whitespace = {
        remove_blankline_trail = false
      }
    }

    -- Create a function to toggle between rainbow and single color
    _G.toggle_indent_rainbow = function()
      rainbow_mode = not rainbow_mode

      local highlight_to_use = rainbow_mode and rainbow_highlight or single_highlight

      -- Update the configuration
      require("ibl").setup {
        indent = { highlight = highlight_to_use },
        whitespace = {
          remove_blankline_trail = false
        }
      }

      vim.notify("Indent rainbow: " .. (rainbow_mode and "Enabled" or "Disabled"))
    end
  end
}
