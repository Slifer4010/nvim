local M = {}

M.setup = function()
  require("slifer.lsp.keymaps")
  require("slifer.lsp.servers").setup()
  require("slifer.lsp.null-ls").setup()
end
return M
