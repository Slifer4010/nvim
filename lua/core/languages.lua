return {
  lua = {
    lsp = { "lua_ls" },
    formatters = { "stylua", lsp_format = "fallback" },
  },

  json = {
    lsp = { "jsonls" },
    formatters = { "jq" },
  },

  jsonc = {
    lsp = { "jsonls" },
    formatters = { "biome" },
  },

  python = {
    lsp = { "pyright" },
    formatters = { "black" }
  },

  tex = {
    lsp = { "texlab", "ltex" },
    formatters = { "latexindent" }
  },

  html = {
    lsp = { "html" },
    formatters = { "prettier" }
  },

  css = {
    lsp = { "cssls" },
    formatters = { "prettier" }
  },

  astro = {
    lsp = { "astro" },
    formatters = { "prettier" }
  },

  bash = {
    lsp = { "bashls" },
    formatters = { "beautysh" }
  },

}
