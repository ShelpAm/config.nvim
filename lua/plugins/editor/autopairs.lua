return {
  {
    "windwp/nvim-autopairs",
    event = 'VeryLazy',
    opts = {},
    config = function()
      require("nvim-autopairs").setup()
    end
  },
}
