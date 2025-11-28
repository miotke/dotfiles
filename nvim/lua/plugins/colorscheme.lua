return {
  'sainnhe/sonokai',
  lazy = false,
  priority = 1000,
  config = function()
    vim.o.termguicolors = true
    vim.g.sonokai_style = 'shusia'
    vim.cmd.colorscheme 'sonokai'
  end,
}
