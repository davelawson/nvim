-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
local dap = require("dap")
map("n", "<leader>bk", dap.up)
map("n", "<leader>bj", dap.down)
-- Some MacOS specific binding, since it handles alt-keys strangely
map("n", "∆", ":m+1<cr>")
map("n", "˚", ":m-2<cr>")
map("v", "˚", ":m'<-2<cr>gv=gv")
map("v", "∆", ":m'>+1<cr>gv=gv")
map("i", "˚", "<Esc>:m-2<cr>")
map("i", "∆", "<Esc>:m+1<cr>")
