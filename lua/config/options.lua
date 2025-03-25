--
--  ██████╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗
-- ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
-- ██║   ██║██████╔╝   ██║   ██║██║   ██║██╔██╗ ██║███████╗
-- ██║   ██║██╔═══╝    ██║   ██║██║   ██║██║╚██╗██║╚════██║
-- ╚██████╔╝██║        ██║   ██║╚██████╔╝██║ ╚████║███████║
--  ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
--

-------------------------------------------------
---------------Neovim API aliases----------------
-------------------------------------------------

local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

-------------------------------------------------
----------------Neovim Settings------------------
-------------------------------------------------

g.mapleader = " "
g.maplocalleader = " "
g.loaded_netrw = nil
g.loaded_netrwPlugin = nil
g.netrw_liststyle = 3 -- Muestra los archivos en forma de árbol
g.snacks_animate = true
g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = "wl-paste --no-newline",
  },
}

opt.autowrite = true
opt.autochdir = true
opt.clipboard = "unnamedplus"
opt.expandtab = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftwidth = 2
opt.showmatch = true
opt.showmode = false
opt.smartindent = true
opt.spelllang = { "es" }
opt.splitright = true
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.undofile = true

cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
cmd("runtime! autoload/netrw.vim")
cmd("runtime! plugin/netrwPlugin.vim")

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
