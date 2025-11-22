return {
  "stevearc/conform.nvim",
  config = function()
    local languages = require("core.languages")
    local formatters = {}

    for ft, entry in pairs(languages) do
      if entry.formatters then
        formatters[ft] = entry.formatters
      end
    end

    require("conform").setup({
      formatters_by_ft = formatters,
      formatters = {
        latexindent = {
          command = "latexindent",
          args = { "-l", "$FILENAME" },
          -- stdin = false,
        },
      },
    })
  end,

  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,

  keys = {
    {
      "<leader>fd",
      function()
        require("conform").format({ lsp_format = "fallback" })
      end,
      desc = "Format with Conform",
    },
  },
}
