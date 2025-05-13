return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  keys = {
    {
      "<leader>ts",
      function()
        Snacks.picker.todo_comments()
      end,
      desc = "Todo",
    },
    {
      "<leader>tf",
      function()
        Snacks.picker.todo_comments({ keywords = { "FIX", "FIXME" } })
      end,
      desc = "Todo/Fix/Fixme",
    },
    {
      "<leader>tn",
      function()
        Snacks.picker.todo_comments({ keywords = { "NOTE" } })
      end,
      desc = "Todo/Fix/Fixme",
    },
  },
}
