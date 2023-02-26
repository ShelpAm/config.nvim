return {
  -- Language server supports
  {
    'neovim/nvim-lspconfig',
    event = 'BufEnter',
    config = function()
      local config = {
        lsp = require('config.lsp'),
      }
      local lspconfig = require('lspconfig')
      -- Add additional capabilities supported by nvim-cmp
      for _, lsp_server in ipairs(config.lsp.lsp_servers) do
        lspconfig[lsp_server].setup {
          capabilities = require('cmp_nvim_lsp').default_capabilities(),
          on_attach = on_attach,
        }
      end

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }

    end
  },
}
