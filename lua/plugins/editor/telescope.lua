return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = {
      'VeryLazy',
    },
    cmd = {
      'Telescope',
    },
    keys = {
      { '<leader>ff', function() require('telescope.builtin').find_files() end },
      { '<leader>fg', function() require('telescope.builtin').live_grep() end },
      { '<leader>fb', function() require('telescope.builtin').buffers() end },
      { '<leader>fh', function() require('telescope.builtin').help_tags() end },
    },
    config = function()
      local telescope = require("telescope")
      local trouble = require("trouble.providers.telescope")
      telescope.setup({
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          }
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        }
      })
    end
  },
}
