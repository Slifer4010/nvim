return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("slifer.lsp.null-ls").setup()
  end,
}
