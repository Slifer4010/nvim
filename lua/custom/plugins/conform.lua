local formatters = {
	lua = { "stylua", lsp_format = "fallback" },
	json = { "jq" },
	python = { "black" },
	tex = { "latexindent" },
}
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = formatters,
		formatters = {
			latexindent = {
				command = "latexindent",
				args = { "-l", "$FILENAME"},
				-- stdin = false,
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	keys = {
		{
			"<leader>fd",
			function()
				require("conform").format({ lsp_format = "fallback" })
			end,
			desc = "Format with Conform",
		},
	},
}
