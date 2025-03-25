local M = {}

M.setup = function()
  local keymaps = require("slifer.lsp.keymaps")
  local on_attach = keymaps.on_attach
  local lspconfig = require("lspconfig")

  require("neodev").setup()
  require("mason-null-ls").setup({
    ensure_installed = {
      "prettier",
      "black",
      "ruff",
      "ruff_lsp",
      "basedpyright",
      "stylua",
      "shfmt",
      "beautysh",
      "jq",
      "latexindent",
      "lua_ls",
      "pyright",
      "texlab",
      "ltex",
      "bashls",
      "jsonls",
    },
    automatic_installation = true,
  })

  lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
      Lua = {
        telemetry = { enable = false },
        workspace = { checkThirdParty = false },
      },
    },
  })

  lspconfig.pyright.setup({
    on_attach = on_attach,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true,
        },
      },
    },
  })
  lspconfig.ruff.setup({
    cmd_env = { RUFF_TRACE = "messages" },
    init_options = {
      settings = {
        logLevel = "error",
      },
    },
  })

  lspconfig.ltex.setup({
    on_attach = on_attach,
    settings = {
      ltex = {
        language = "es",
      },
    },
    filetypes = {
      "bib",
      "gitcommit",
      "markdown",
      "org",
      "plaintex",
      "rst",
      "rnoweb",
      "tex",
      "pandoc",
      "quarto",
      "rmd",
      "context",
      "html",
      "xhtml",
      "mail",
    },
  })

  lspconfig.texlab.setup({
    on_attach = on_attach,
    texlab = {
      auxDirectory = "aux",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = true,
        onSave = true,
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        executable = { "okular" },
        args = { "--unique", "%f#src:%l%p" },
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = false,
      },
    },
  })
end

return M
