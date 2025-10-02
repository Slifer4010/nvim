return {
	"mason-org/mason.nvim",
	dependencies = {
		{ "mason-org/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	config = function()
		require("mason").setup()
		local ensure_installed = {}
		vim.list_extend(ensure_installed, {
			"stylua",
			"prettier",
			"prettierd",
			"black",
      "pyright",
			"shfmt",
			"beautysh",
			"jq",
			"latexindent",
      "htmlhint",
      "stylelint",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"bashls",
				"pyright",
				"ruff",
				"ltex",
				"texlab",
        "html",
        "astro",
        "cssls",
			},
		})
	end,
}
