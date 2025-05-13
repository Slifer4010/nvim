return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<C-o>", ":Oil --float<CR>", desc = "Open Oil" },
  },
}
