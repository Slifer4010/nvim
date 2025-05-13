return {
  cmd = { 'ruff', 'server' },
  cmd_env = { RUFF_TRACE = "messages" },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  init_options = {
    settings = {
      logLevel = "error",
    },
  },
}
