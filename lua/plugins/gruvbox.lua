return {
  -- Colorscheme
  {
    'morhetz/gruvbox',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
