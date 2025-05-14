return {
	"lervag/vimtex",
	lazy = false,
	ft = "tex",
	config = function()
		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
		vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
		vim.g.vimtex_quickfix_mode = 0
		vim.g.vimtex_syntax_enabled = 0
		vim.g.vimtex_complete_enabled = 1
		vim.g.vimtex_compiler_latexmk = { aux_dir = "aux" }
		vim.g.vimtex_view_general_viewer = "okular"
		vim.g.vimtex_compiler_progname = "nvr"
		vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
	end,
}
