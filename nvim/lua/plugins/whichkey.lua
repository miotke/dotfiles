return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    
    -- Register all mappings using the array-based format
    wk.register({
      -- Group registrations
      { "<leader>c", group = "[C]ode" },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>g", group = "[G]it" },
      { "<leader>h", group = "Git [H]unk" },
      { "<leader>m", group = "[M]acros" },
      { "<leader>r", group = "[R]ename" },
      { "<leader>s", group = "[S]earch" },
      { "<leader>t", group = "[T]oggle" },
      { "<leader>w", group = "[W]orkspace" },
      
      -- Individual key mappings
      { "<leader>tr", function() _G.toggle_indent_rainbow() end, desc = "Toggle Rainbow Indents" },
      
      -- You can add more specific keybindings here in the same format
      -- Example:
      -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
    })
  end
}
