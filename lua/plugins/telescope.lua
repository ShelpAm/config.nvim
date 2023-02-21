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
      local keymap = require('config.keymap')
      keymap.nnoremap('<leader>ff', telescope.find_files)
      keymap.nnoremap('<leader>fg', telescope.live_grep)
      keymap.nnoremap('<leader>fb', telescope.buffers)
      keymap.nnoremap('<leader>fh', telescope.help_tags)
    end,
  },
}
