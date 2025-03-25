return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },

    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "codeium",
          },
        },
      })
    end,
    keys = {
      { "<leader>ac", ":CodeCompanionChat Toggle<CR>", desc = "Open CopilotChat" },
      { "<leader>ai", ":CodeCompanion",                desc = "Open CopilotChat", mode = "v" },
    },
  },
}
