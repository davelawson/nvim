return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sqlfluff" },
        -- scala = { "scalafmt" },
        -- terraform = { "terraform_fmt" },
      },
    },
  },
}
