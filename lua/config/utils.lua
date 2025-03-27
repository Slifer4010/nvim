local M = {}

function M.lsp_progress_message(ev)
  local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local icon = ev.data.params.value.kind == "end" and " "
      or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
  return string.format("LSP Progress: %s %s", icon, vim.lsp.status())
end

function M.toggle_ltex()
  local clients = vim.lsp.get_clients()
  local ltex_client = nil

  for _, client in ipairs(clients) do
    if client.name == "ltex" then
      ltex_client = client
      break
    end
  end

  if ltex_client then
    vim.lsp.stop_client(ltex_client.id)
    print("LTeX desactivado")
  else
    vim.cmd("LspStart ltex")
    print("LTeX activado")
  end
end

return M
