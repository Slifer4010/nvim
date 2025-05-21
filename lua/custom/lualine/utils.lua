local M = {}

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

function M.get_venv_name()
  local venv = os.getenv("VIRTUAL_ENV") or vim.g.python3_host_prog
  if venv then
    local parts = vim.split(venv, "/")
    return "󰌠 " .. parts[#parts - 1]
  end
  return ""
end

function M.has_venv()
  return os.getenv("VIRTUAL_ENV") or vim.g.python3_host_prog
end

return M
