local M = {}

-- define mapleader
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  if opts.noremap == nil then
    opts.noremap = false
  end
  opts.silent = opts.silent ~= false
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

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ':m ">+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-k>', ':m "<-2<cr>gv=gv', { desc = 'Move up' })

-- Toggle Spelling
map('n', '<leader>us', '<cmd>lua vim.opt.spell = false<cr>', { desc = 'Toggle spelling' })

-- Save file
map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Better indenting
noremap('v', '<', '<gv')
noremap('v', '>', '>gv')

-- lazy
map('n', '<leader>l', '<cmd>:Lazy<cr>', { desc = 'Lazy' })

-- quit all
map('n', '<leader>qw', '<cmd>q<cr>', { desc = 'Quit window' })
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

-- Source current file
map('n', '<leader>s', '<Cmd>w<Cr><Cmd>source %<Cr>', { desc = 'Source current file' })

-- Use `jk` as escape
map('i', 'jk', '<esc>', { desc = 'Escape' })

return M
