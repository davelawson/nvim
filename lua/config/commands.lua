vim.api.nvim_create_user_command("NOTES", "Explore ~/notes/", {})
vim.api.nvim_create_user_command("TOPICS", "Explore ~/notes/topics/", {})
vim.api.nvim_create_user_command("TASKS", "Explore ~/notes/tasks/", {})
vim.api.nvim_create_user_command("SP", "e ~/notes/scratchpad.md", {})
vim.api.nvim_create_user_command("TODO", "e ~/notes/todo.md", {})
vim.api.nvim_create_user_command("ONCALL", "e ~/notes/oncall.md", {})
vim.api.nvim_create_user_command("BRUNO", "e ~/notes/bruno.md", {})
vim.api.nvim_create_user_command("ANDERSON", "e ~/notes/anderson.md", {})
vim.api.nvim_create_user_command("RC", "e ~/.zshrc", {})
vim.api.nvim_create_user_command("SC", "e ~/.config/nvim/nvim.shortcuts.md", {})
vim.api.nvim_create_user_command("VIMRC", "e ~/.config/nvim/init.lua", {})

-- Save all without worrying about the capitalization of the command.
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WA", "wa", {})

vim.api.nvim_create_user_command("GO", "!go run %", {})
vim.api.nvim_create_user_command("LUALOG", ":lua Snacks.notifier.show_history()", {})
