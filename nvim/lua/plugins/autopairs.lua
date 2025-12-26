return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true,  -- use treesitter to check for pairs
    fast_wrap = {
      map = '<M-e>',  -- Alt+e to wrap with pair
    },
  },
}
