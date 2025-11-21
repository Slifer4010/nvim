return {
  lua = {
    lsp = { "lua_ls" },
    formatter = { "stylua", lsp_format = "fallback" },
  },

  json = {
    lsp = { "jsonls" },
    formatter = { "jq" },
  },

  jsonc = {
    lsp = { "biome" },
    formatter = { "biome" },
  },

  python = {
    lsp = { "pyright" },
    formatter = { "black" }
  },

  tex = {
    lsp = { "texlab", "ltex" },
    formatter = { "latexindent" }
  },

  html = {
    lsp = { "html" },
    formatter = { "prettier" }
  },

  css = {
    lsp = { "cssls" },
    formatter = { "prettier" }
  },

  astro = {
    lsp = { "astro" },
    formatter = { "prettier" }
  },

  bash = {
    lsp = { "bashls" },
    formatter = { "beautysh" }
  },

}
