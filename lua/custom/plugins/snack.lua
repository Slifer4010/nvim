return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    image = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    toggle = { enabled = true },
    words = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd

        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.diagnostics():map("<leader>ud")

        local map = function(keys, func, desc, modes)
          vim.keymap.set(modes or { "n" }, keys, func, { desc = desc })
        end

        -- Pickers
        map("<leader>ff", function() Snacks.picker.smart({ multi = { "buffers", "files" } }) end, "Find Files")
        map("<leader>fb", function() Snacks.picker.buffers() end, "Find Buffers")
        map("<leader>fg", function() Snacks.picker.grep() end, "Find Grep")
        map("<leader>fh", function() Snacks.picker.help() end, "Find Help")
        map("<leader>fs", function() Snacks.picker.git_status() end, "Find Modified Files")
        map("<leader>fi", function() Snacks.picker.icons() end, "Find Icon")
        map("<leader>fk", function() Snacks.picker.keymaps() end,"Find keymaps")
        map("<leader>fp", function()
          Snacks.picker.projects({
            format = "file",
            dev = { "~/Projects" },
            patterns = {
              ".git",
              "_darcs",
              ".hg",
              ".bzr",
              ".svn",
              "package.json",
              "Makefile",
              "pyproject.toml",
              ".venv",
            },
          })
        end, "Find Projects")

        -- Scratch
        map("<leader>S", function() Snacks.scratch.select() end, "Open the scratch buffer selector")
        map("<leader>.", function() Snacks.scratch() end, "Open the scratch buffer")

        -- Misc
        map("<leader>bd", function() Snacks.bufdelete() end, "Delete buffer")
        map("<leader>rf", function() Snacks.rename.rename_file() end, "Rename file")
        map("<leader>sd", function() Snacks.picker.diagnostics() end, "Find Diagnostics")
        map("<A-h>", function() Snacks.terminal.toggle() end, "Toggle terminal", { "n", "t" })
        map("<leader>zz", function() Snacks.picker.spelling({
          layout = {
            preset = "telescope"
          },
        })
        end, "Spell Suggest")

        -- GIT
        map("<leader>gB", function() Snacks.gitbrowse() end, "Git Browse", {"n", "v"})
        map("<leader>gg", function() Snacks.lazygit() end, "Lazygit")

        -- Notifications
        map("<leader>nn", function() Snacks.notifier.show_history() end, "Notification history")
        map("<leader>nh", function() Snacks.notifier.hide() end, "Notification Dismiss all")
      end,
    })
  end,
}
