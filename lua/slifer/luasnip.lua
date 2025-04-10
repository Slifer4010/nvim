local ls = require("luasnip")
local types = require("luasnip.util.types")

local M = {}

function M.setup()
  ls.config.set_config({
    history = true,
    updateevents = "TextChanged, TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
      [types.choiceNode] = {
        active = {
          virt_text = { { "<- Choice", "Error" } },
        },
      },
    },
  })

  vim.api.nvim_create_user_command("ReloadSnippets", function()
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })
    require("luasnip.loaders.from_vscode").lazy_load({ include = { "latex" } })
    print("Snippets recargados")
  end, {})

  vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set({ "i", "s" }, "<C-n>", function()
    if ls.choice_active() then
      ls.change_choice()
    end
  end, { silent = true })
end

return M
