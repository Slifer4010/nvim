return {
  "jameswolensky/marker-groups.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/snacks.nvim",
  },
  config = function()
    require("marker-groups").setup({
      -- Default picker is 'vim' (built-in vim.ui)
      -- Accepted values: 'vim' | 'snacks' | 'fzf-lua' | 'mini.pick' | 'telescope'
      picker = "snacks",
    })
  end,
}
