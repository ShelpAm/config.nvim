local M = {}

-- define mapleader
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local function map(mode, from, to, opts)
  return vim.keymap.set(mode, from, to, opts)
end

local function noremap(mode, from, to)
  return map(mode, from, to, { noremap = true, silent = true })
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

-- Better window navigation
noremap({ 'n', 'v', 'i' }, '[w', '<C-l>')
noremap({ 'n', 'v', 'i' }, ']w', ':bn<cr>')
noremap('n', '<C-h>', '<C-w>h')
noremap('n', '<C-j>', '<C-w>j')
noremap('n', '<C-k>', '<C-w>k')
noremap('n', '<C-l>', '<C-w>l')

-- Better buffer navigation
noremap({ 'n', 'v', 'i' }, '[b', '<cmd>bp<cr>')
noremap({ 'n', 'v', 'i' }, ']b', '<cmd>bn<cr>')
noremap({ 'n', 'v', 'i' }, '<S-h>', '<cmd>bp<cr>')
noremap({ 'n', 'v', 'i' }, '<S-l>', '<cmd>bn<cr>')

-- Resize window using <ctrl> arrow keys
noremap('n', '<C-Up>', '<cmd>resize +2<cr>') -- 'Increase window height'
noremap('n', '<C-Down>', '<cmd>resize -2<cr>') -- Decrease window height
noremap('n', '<C-Left>', '<cmd>vertical resize -2<cr>') -- Decrease window width
noremap('n', '<C-Right>', '<cmd>vertical resize +2<cr>') -- Increase window width

-- Move Lines
map('n', "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map('n', "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Toggle
map("n", "<leader>us", '<cmd>lua vim.opt.spell = false', { desc = "Toggle Spelling" })

-- Save file
noremap('n', '<leader>w', ':w<enter>')
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better indenting
noremap("v", "<", "<gv")
noremap("v", ">", ">gv")

-- Quit
noremap('n', '<leader>q', ':q<enter>')

-- Source current file
noremap('n', '<leader>s', ':source %<enter>')

-- Use `jk` to escape
map('i', 'jk', '<esc>')

return M
