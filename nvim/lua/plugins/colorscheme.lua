return {
  'febyeji/bluehour.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.cmd.colorscheme 'bluehour'
  end,
}
