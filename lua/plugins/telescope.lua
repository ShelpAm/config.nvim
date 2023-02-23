return {
  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
      -- Unless you are still migrating, remove the deprecated commands from v1.x
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      local telescope = require('telescope.builtin')
      local keymaps = require('config.keymaps')
      keymaps.nnoremap('<leader>ff', telescope.find_files)
      keymaps.nnoremap('<leader>fg', telescope.live_grep)
      keymaps.nnoremap('<leader>fb', telescope.buffers)
      keymaps.nnoremap('<leader>fh', telescope.help_tags)
    end,
  },
}
