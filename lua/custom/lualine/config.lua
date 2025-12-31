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
			{ "filetype", separator = { left = "", right = "" } },
		},
		lualine_z = { "location" },
	},
	inactive_winbar = {
		lualine_c = { "filename" },
	},
})
