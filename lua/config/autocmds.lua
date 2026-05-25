-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_user_command("ReloadFromDisk", function()
  vim.cmd("checktime")

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local name = vim.api.nvim_buf_get_name(bufnr)
      local buftype = vim.bo[bufnr].buftype
      local modified = vim.bo[bufnr].modified

      if name ~= "" and buftype == "" and not modified then
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd("silent! edit!")
        end)

        vim.diagnostic.reset(nil, bufnr)
      end
    end
  end

  vim.cmd("silent! LspRestart")
end, {})
