return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = function(opts)
        opts.settings = {
          java = {
            format = {
              enabled = false,
              settings = {
                -- the settings section seems to get completely ignore, what is supposed to use it?
                url = vim.fn.expand("~/standard-authoring-code-formatter.xml"),
                -- url = vim.fn.expand("~/wtf/standard-authoring-code-formatter.xml"),
                profile = "AuthoringStandardCodeFormatter1_0",
              },
            },
          },
        }
        return opts
      end,
    },
  },
}
