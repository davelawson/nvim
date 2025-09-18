return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local custom_path_display = function(_, path)
        local sep = package.config:sub(1, 1)
        local segments = vim.split(path, sep)
        local len = #segments
        if len <= 2 then
          return path
        end
        for i = 1, len - 2 do
          segments[i] = segments[i]:sub(1, 3)
        end
        return table.concat(segments, sep)
      end

      require("telescope").setup({
        defaults = {
          path_display = { "truncate" },
        },
        pickers = {
          live_grep = {
            path_display = { "truncate" },
          },
        },
      })
    end,
  },
}
