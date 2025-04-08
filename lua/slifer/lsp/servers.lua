local M = {}

M.setup = function()
  local lspconfig = require("lspconfig")

  require("neodev").setup()
  require("mason-null-ls").setup({
    ensure_installed = {
      "prettier",
      "black",
      "ruff",
      "ruff-lsp",
      "basedpyright",
      "stylua",
      "shfmt",
      "beautysh",
      "jq",
      "latexindent",
      "lua-language-server",
      "pyright",
      "texlab",
      "ltex-ls",
      "bashls",
      "jsonls",
    },
    automatic_installation = true,
  })

  lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        telemetry = { enable = false },
        workspace = { checkThirdParty = false },
      },
    },
  })

  lspconfig.pyright.setup({
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
        onEdit = true,
        onOpenAndSave = true,
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
