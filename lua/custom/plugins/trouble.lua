return {
	"folke/trouble.nvim",
	cmd = { "TroubleToggle", "Trouble" },
	opts = {
    use_diagnostic_signs = true,
    focus = true,
		modes = {
			preview_float = {
				mode = "diagnostics",
				preview = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, -2 },
					size = { width = 0.3, height = 0.3 },
					zindex = 200,
				},
			},
		},
	},
	keys = {
		{
			"<leader>xx",
			":Trouble preview_float toggle filter.buf=0<CR>",
			silent = true,
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"[q",
			function()
				if require("trouble").is_open() then
					require("trouble").prev({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Previous trouble/quickfix item",
		},
		{
			"]q",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Next trouble/quickfix item",
		},
	},
}
