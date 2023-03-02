return {
  -- Highlight supports
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    build = ':TSUpdate',
    config = function(opts)
      local configs = require('nvim-treesitter.configs')
      local install = require('nvim-treesitter.install')
      configs.setup({
        -- A directory to install the parsers into.
        -- If this is excluded or nil parsers are installed
        -- to either the package dir, or the "site" dir.
        -- If a custom path is used (not nil) it must be added to the runtimepath.
        parser_install_dir = nil,
        -- A list of parser names, or "all"
        ensure_installed = {
          'bash',
          'c',
          'cmake',
          'cpp',
          'gitcommit',
          'glsl',
          'help',
          'lua',
          'vim',
          'yaml',
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        -- List of parsers to ignore installing (for "all")
        ignore_install = {},
        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- list of language that will be disabled
          disable = {},

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = {
          enable = true,
        },
      })
      -- install.prefer_git = true
      install.command_extra_args = {
        curl = { "--proxy", "127.0.0.1" },
      }
    end
  },
}
