return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		interactions = {
			chat = {
				adapter = {
					name = "ollama",
					model = "qwen2.5-coder:3b",
				},
			},
		},
	},
  keys = {
    {"<C-a>",":CodeCompanionChat Toggle<CR>", desc="Chat AI"}
  }
}
