return {
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    init = function()
      vim.opt.termguicolors = true
    end,
    config = function()
      require'bufferline'.setup()
    end
  },
}
