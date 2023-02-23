local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

local function autocmd(events, opts)
  return vim.api.nvim_create_autocmd(events, opts)
end

autocmd('BufWritePre', {
  group = augroup('format_on_save'),
  callback = function()
    vim.lsp.buf.format()
  end,
})
