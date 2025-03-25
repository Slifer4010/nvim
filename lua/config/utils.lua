local M = {}

function M.lsp_progress_message(ev)
  local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local icon = ev.data.params.value.kind == "end" and " "
      or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
  return string.format("LSP Progress: %s %s", icon, vim.lsp.status())
end

return M
