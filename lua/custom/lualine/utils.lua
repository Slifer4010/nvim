local M = {}

M.lsp_progress_text = ""

local spinner_frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }

vim.api.nvim_create_autocmd("LspProgress", {
	callback = function(args)
		local msg = args.data.params.value.title or ""
		if msg:match("Loading workspace") then
			msg = "Loading"
		end
		local client_id = args.data.client_id
		local client = vim.lsp.get_client_by_id(client_id)
		if client then
			Lsp_name = " " .. client.name
		end

		if args.data.params.value.kind == "end" then
			M.lsp_progress_text = Lsp_name
		else
			local spinner = spinner_frames[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner_frames + 1]
			M.lsp_progress_text = string.format("%s %s", spinner, msg)
		end

		vim.cmd("redrawstatus")
	end,
})

M.lsp_progress = function()
	return M.lsp_progress_text
end

M.empty = require("lualine.component"):extend()

function M.empty:draw(default_highlight)
	local mode = vim.fn.mode()
	local colors = {
		n = { fg = "#FFFFFF", bg = "#a9c4fe" },
		i = { fg = "#000000", bg = "#cbd6c0" },
		v = { fg = "#FFFFFF", bg = "#b5a1da" },
		c = { fg = "#FFFFFF", bg = "#ffc3a0" },
		["\22"] = { fg = "#FFFFFF", bg = "#cdb8f3" },
		r = { fg = "#000000", bg = "#FFAF00" },
	}
	local color = colors[mode] or { fg = "#ffffff", bg = "#cdb8f3" }
	local hl_group = "LualineEmpty_" .. mode:gsub("%W", "_")

	vim.api.nvim_set_hl(0, hl_group, { fg = color.fg, bg = color.bg })
	self.status = "%#" .. hl_group .. "#"
	self.applied_separator = ""
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

return M
