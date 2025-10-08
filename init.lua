-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_user_command("NOTES", "Explore ~/notes/", {})
vim.api.nvim_create_user_command("TOPICS", "Explore ~/notes/topics/", {})
vim.api.nvim_create_user_command("TASKS", "Explore ~/notes/tasks/", {})
vim.api.nvim_create_user_command("SP", "e ~/notes/scratchpad.md", {})
vim.api.nvim_create_user_command("TODO", "e ~/notes/todo.md", {})
vim.api.nvim_create_user_command("ONCALL", "e ~/notes/oncall.md", {})
vim.api.nvim_create_user_command("BRUNO", "e ~/notes/bruno.md", {})
vim.api.nvim_create_user_command("ANDERSON", "e ~/notes/anderson.md", {})
vim.api.nvim_create_user_command("RC", "e ~/.zshrc", {})
vim.api.nvim_create_user_command("SC", "e ~/.config/nvim/nvim.shortcuts", {})
vim.api.nvim_create_user_command("VIMRC", "e ~/.config/nvim/init.lua", {})
-- lazy cheat so I don't have to worry about pressing shift while issuing the save all command
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WA", "wa", {})

vim.api.nvim_create_user_command("GO", "!go run %", {})
vim.api.nvim_create_user_command("LUALOG", ":lua Snacks.notifier.show_history()", {})

-- when pasting yanked content, don't overwrite the clipboard
vim.keymap.set("x", "p", '"_dP', { noremap = true, silent = true })
-- ESC will enter normal mode at the terminal
vim.keymap.set("t", "<C-w>", [[<C-\><C-n>]], {
  desc = "Exit terminal mode",
})

-- vim.opt.grepprg =
--   [[rg --hidden --vimgrep --no-heading --smart-case | awk -F: '{n=split($1,a,"/"); if(n>2) print ".../" a[n-1] "/" a[n] ":" $2 ":" $3 ":" $4; else print $1 ":" $2 ":" $3 ":" $4}']]
-- vim.opt.grepprg =
--   'rg --vimgrep --no-heading --smart-case | awk -F: \'{split($1,a,"/"); print a[length(a)-1] "/" a[length(a)] ":" $2 ":" $3 ":" $4}\''

vim.o.tabstop = 4
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
