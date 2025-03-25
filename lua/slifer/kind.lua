local lspkind = require("lspkind")
lspkind.init({
  symbol_map = {
    Copilot = " ",
    Codeium = "󰘦 ",
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindCodeium", { fg = "#6CC644" })
