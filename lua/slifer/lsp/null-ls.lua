local M = {}

M.setup = function()
  local nls = require("null-ls")

  nls.setup({
    sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.black,
      nls.builtins.formatting.prettier,
      nls.builtins.formatting.shfmt.with({
        extra_args = { "-i", "2" },
      }),
      nls.builtins.formatting.beautysh.with({
        extra_args = { "-i", "2" },
      }),
      nls.builtins.formatting.latexindent, --.with({
      -- extra_args = { "-l" },
      -- }),
      nls.builtins.diagnostics.ruff,
    },

    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatting", {}),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end,
  })
end

return M
