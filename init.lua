-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_user_command("TODO", "e ~/todo", {})
vim.api.nvim_create_user_command("RC", "e ~/.zshrc", {})
vim.api.nvim_create_user_command("SC", "e ~/.config/nvim/nvim.shortcuts", {})
vim.api.nvim_create_user_command("NOTES", "e ~/notes", {})
vim.api.nvim_create_user_command("VIMRC", "e ~/.config/nvim/init.lua", {})

vim.api.nvim_create_user_command("GO", "!go run %", {})
vim.api.nvim_create_user_command("LUALOG", ":lua Snacks.notifier.show_history()", {})

vim.o.tabstop = 4
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
