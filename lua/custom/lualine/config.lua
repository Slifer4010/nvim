local utils = require("custom.lualine.utils")

require("lualine").setup({
	options = {
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", upper = true, icon = "" } },
		lualine_b = {
			{ utils.empty },
			{ "filename", file_status = true, path = 0, separator = { left = "", right = "" } },
		},
		lualine_c = {
			{ "branch", icon = "", padding = { left = 1, right = 0 } },
			{
				"diff",
				symbols = { added = "  ", modified = "  ", removed = "  " },
				padding = { left = 0, right = 0 },
			},
		},

		lualine_x = {
			{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " } },
		},
		lualine_y = {
			{
				utils.lsp_progress,
				cond = function()
					return utils.lsp_progress_text ~= ""
				end,
				separator = { left = "", right = "" },
			},
			{
				"filetype",
				separator = { left = "", right = "" },
				cond = function()
					return utils.lsp_progress_text == ""
				end,
			},
			{ utils.empty },
		},
		lualine_z = { { "progress", icon = " " } },
	},
	inactive_winbar = {
		lualine_c = { "filename" },
	},
})
