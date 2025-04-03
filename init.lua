-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_user_command("TODO", "e ~/todo.md", {})
vim.api.nvim_create_user_command("ONCALL", "e ~/oncall.md", {})
vim.api.nvim_create_user_command("RC", "e ~/.zshrc", {})
vim.api.nvim_create_user_command("SC", "e ~/.config/nvim/nvim.shortcuts", {})
vim.api.nvim_create_user_command("VIMRC", "e ~/.config/nvim/init.lua", {})
-- lazy cheat so I don't have to worry about pressing shift while issuing the save all command
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WA", "wa", {})

vim.api.nvim_create_user_command("GO", "!go run %", {})
vim.api.nvim_create_user_command("LUALOG", ":lua Snacks.notifier.show_history()", {})

vim.o.tabstop = 4
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
