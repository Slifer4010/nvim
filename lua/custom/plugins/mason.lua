return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    local languages = require("core.languages")

    local lsp = {}
    local formatters = {}

    for _, entry in pairs(languages) do
      vim.list_extend(lsp, entry.lsp or {})
      vim.list_extend(formatters, entry.formatters or {})
    end

    require("mason-lspconfig").setup({
      ensure_installed = lsp,
    })

    require("mason-tool-installer").setup({
      ensure_installed = formatters,
    })
  end,
}
