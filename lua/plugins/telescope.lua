return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "%.git/",
            "CHANGELOG%.md$",
          },
          -- This is the table you need to add or edit
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden", -- Add this to include hidden files
            "--glob=!**/.git/*",
          },
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
