local M = {}

-- define mapleader
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = true
  return vim.keymap.set(mode, lhs, rhs, opts)
end

local function noremap(mode, lhs, rhs)
  return map(mode, lhs, rhs, { noremap = true, silent = true })
end

local function nnoremap(lhs, rhs)
  return noremap('n', lhs, rhs)
end

local function vnoremap(lhs, rhs)
  return noremap('v', lhs, rhs)
end

local function inoremap(lhs, rhs)
  return noremap('i', lhs, rhs)
end

function M.nnoremap(lhs, rhs)
  return nnoremap(lhs, rhs)
end

function M.vnoremap(lhs, rhs)
  return vnoremap(lhs, rhs)
end

function M.inoremap(lhs, rhs)
  return inoremap(lhs, rhs)
end

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Better buffer navigation
map('n', '<S-h>', '<cmd>bp<cr>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<cmd>bn<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>bp<cr>', { desc = 'Prev buffer' })
map('n', ']b', '<cmd>bn<cr>', { desc = 'Next buffer' })

-- Buffer
map('n', '<leader>bd', '<cmd>bd<cr>')

-- Window
map('n', '<leader>wq', '<cmd>q<cr>', { desc = 'Quit current window' })

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ':m ">+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-k>', ':m "<-2<cr>gv=gv', { desc = 'Move up' })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<leader>d', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<leader>q', vim.diagnostic.setloclist)

-- Toggle Spelling
map('n', '<leader>ts', '<cmd>set spell!<cr>', { desc = 'Toggle spelling check' })
map('n', '<leader>th', '<cmd>set hlsearch!<cr>', { desc = 'Toggle hlsearch' })

-- Save file
-- map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
map({ 'i', 'v', 'n', 's' }, '<C-S>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- Source current file
map('n', '<leader>s', function()
  if vim.bo.filetype == 'lua' then
    vim.cmd([[silent w | silent source %]])
  elseif vim.bo.filetype == 'zsh' then
    vim.cmd([[silent !exec zsh]])
  end
end, { desc = 'Source current file' })

-- Use `jk` as escape
map('i', 'jk', '<esc>', { desc = 'Escape' })

return M
