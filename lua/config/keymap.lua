local M = {}

-- define mapleader
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local function map(mode, from, to, opts)
  return vim.keymap.set(mode, from, to, opts)
end

local function noremap(mode, from, to)
  return map(mode, from, to, { noremap = true,  silent = true })
end

local function nnoremap(from, to)
  return noremap('n', from, to)
end

local function vnoremap(from, to)
  return noremap('v', from, to)
end

local function inoremap(from, to)
  return noremap('i', from, to)
end

function M.nnoremap(from, to)
  return nnoremap(from, to)
end

function M.vnoremap(from, to)
  return vnoremap(from, to)
end

function M.inoremap(from, to)
  return inoremap(from, to)
end

-----------------
-- Normal mode --
-----------------

-- Better window navigation
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-l>', '<C-w>l')


-- Resize window using <ctrl> arrow keys
noremap('n', '<C-Up>', '<cmd>resize +2<cr>') -- 'Increase window height'
noremap('n', '<C-Down>', '<cmd>resize -2<cr>') -- Decrease window height
noremap('n', '<C-Left>', '<cmd>vertical resize -2<cr>') -- Decrease window width
noremap('n', '<C-Right>', '<cmd>vertical resize +2<cr>') -- Increase window width

-- Save file
nnoremap('<leader>w', ':w<enter>')

-- Quit
nnoremap('<leader>q', ':q<enter>')

-- Source current file
nnoremap('<leader>s', ':source %<enter>')

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-----------------
-- Insert mode --
-----------------

-- Use `jk` to escape
inoremap('jk', '<esc>')

return M
