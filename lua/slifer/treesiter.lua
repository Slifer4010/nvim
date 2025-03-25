return {
  ensure_installed = {
    "lua",
    "luadoc",
    "python",
    "ninja",
    "latex",
    "bibtex",
    "json",
    "json5",
    "jsonc",
    "markdown_inline",
    "markdown",
    "bash",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
      },
    },
  },
}
