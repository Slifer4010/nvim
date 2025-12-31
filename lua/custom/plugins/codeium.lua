return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("codeium").setup({
			virtual_text = {
				enabled = false,
			},
			workspace_root = {
				use_lsp = true,
				find_root = nil,
				paths = {
					".bzr",
					".git",
					".hg",
					".svn",
					"_FOSSIL_",
					"package.json",
					".venv",
				},
			},
		})
	end,
}

