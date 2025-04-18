return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-git",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "windwp/nvim-autopairs",
      "SergioRibera/cmp-dotenv",
      "zbirenbaum/copilot-cmp",
      "onsails/lspkind.nvim",
      "kdheepak/cmp-latex-symbols",
    },
    event = "VeryLazy",
    main = "slifer.cmp",
    config = true,
  },
}
