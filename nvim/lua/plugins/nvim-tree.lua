return {
    {
      "nvim-tree/nvim-tree.lua",
      lazy = true,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Nvim Tree settings and options
      require("nvim-tree").setup({
        view = { width = 50 },
      })

      require("nvim-web-devicons").setup({
        require'nvim-web-devicons'.get_icons(),
      })
    end,
  }
}
