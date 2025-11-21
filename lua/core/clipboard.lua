if os.getenv("WAYLAND_DISPLAY") then
  vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
      ["+"] = "wl-copy --foreground --type text/plain",
      ["*"] = "wl-copy --foreground --type text/plain",
    },
    paste = {
      ["+"] = "wl-paste --no-newline",
      ["*"] = "wl-paste --no-newline",
    },
    cache_enabled = true,
  }

elseif os.getenv("DISPLAY") then
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = true,
  }

else
  vim.notify("No se detectó Wayland ni X11: deshabilitando integración del portapapeles", vim.log.levels.WARN)
end
