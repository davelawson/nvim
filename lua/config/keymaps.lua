-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
map("n", "<leader>bk", function()
  require("dap").up()
end, { desc = "Up DAP stack" })
map("n", "<leader>bj", function()
  require("dap").down()
end, { desc = "Down DAP stack" })

-- When pasting yanked content, don't overwrite the clipboard.
map("x", "p", '"_dP')

-- Leave terminal mode and return to Normal mode.
map("t", "<C-w>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Some MacOS specific binding, since it handles alt-keys strangely
map("n", "∆", ":m+1<cr>")
map("n", "˚", ":m-2<cr>")
map("v", "˚", ":m'<-2<cr>gv=gv")
map("v", "∆", ":m'>+1<cr>gv=gv")
map("i", "˚", "<Esc>:m-2<cr>")
map("i", "∆", "<Esc>:m+1<cr>")
