return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true, style = "input" },
    notifier = { enabled = true, style = "compact" },
    picker = { enabled = true, layout = "telescope" },
    statuscolumn = { enabled = true },
    scroll = { enabled = true },
    indent = {
      enabled = true,
      animate = {
        style = "down",
        duration = {
          step = 30,
        },
      },
    },
    dashboard = require("slifer.snack.dashboard").setup(),
    terminal = {
      win = { style = "terminal", height = 0.3 },
    },
  },
  keys = function()
    return require("slifer.snack.keys")
  end,
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
      end,
    })
  end,
}
