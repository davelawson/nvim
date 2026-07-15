return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        dependencies = { "uga-rosa/utf8.nvim" },
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait()
        end,
      },
    },
    opts = {
      adapters = {
        ["neotest-golang"] = {
          runner = "gotestsum",
          go_test_args = { "-v" },
          sanitize_output = true,
          log_level = vim.log.levels.INFO,
        },
      },
    },
    keys = {
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "[t]est run [f]ile",
      },
      {
        "<leader>tA",
        function()
          require("neotest").run.run(vim.uv.cwd())
        end,
        desc = "[t]est [A]ll files",
      },
      {
        "<leader>tS",
        function()
          require("neotest").run.run({ suite = true })
        end,
        desc = "[t]est [S]uite",
      },
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "[t]est [n]earest",
      },
      {
        "<leader>tt",
        function()
          require("neotest").run.stop()
        end,
        desc = "[t]est [t]erminate",
      },
      {
        "<leader>tD",
        function()
          require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
        end,
        desc = "Debug current file",
      },
    },
  },
}
