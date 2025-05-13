vim.api.nvim_create_autocmd("User", {
  pattern = "VimtexEventQuit",
  command = "VimtexClean",
})
