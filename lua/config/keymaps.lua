--
--██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗
--██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝
--█████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗
--██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
--██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║
--╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝
--

vim.keymap.set("n", "<leader>rr", ":source %<CR>", { silent = true, desc = "Source de current file" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true, desc = "Next buffer" })

vim.keymap.set(
  "n",
  "n",
  "nzzzv",
  { silent = true, desc = "Goes to the next result on the seach and put the cursor in the middle" }
)
vim.keymap.set(
  "n",
  "N",
  "Nzzzv",
  { silent = true, desc = "Goes to the prev result on the seach and put the cursor in the middle" }
)

vim.keymap.set("v", ">", ">gv", { silent = true, desc = "After tab in re-select the same" })
vim.keymap.set("v", "<", "<gv", { silent = true, desc = "After tab out re-select the same" })

-- Position cursor at the middle of the screen after scrolling half page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Map Ctrl+c to escape from other modes
vim.keymap.set({ "i", "n", "v" }, "<C-c>", [[<C-\><C-n>]])

-- Delete all buffers but the current one
vim.keymap.set(
  "n",
  "<leader>bq",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)

-- Move to window using the <alt> keys
vim.keymap.set("n", "<A-left>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<A-down>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<A-up>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<A-right>", "<C-w>l", { desc = "Go to right window" })

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { silent = true, desc = "Move down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { silent = true, desc = "Move up" })
vim.keymap.set("i", "<A-j>", "<esc>:m .+1<cr>==gi", { silent = true, desc = "Move down" })
vim.keymap.set("i", "<A-k>", "<esc>:m .-2<cr>==gi", { silent = true, desc = "Move up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Move down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Move up" })

-- Clear search with <esc>
vim.keymap.set({ "n" }, "<esc>", ":noh<cr><esc>", { silent = true, desc = "Escape and clear hlsearch" })

-- save file
vim.keymap.set({ "n", "v", "s" }, "<C-s>", ":w<cr>", { silent = true, desc = "Save file" })

-- save and close file
vim.keymap.set({ "n", "v", "s" }, "<C-q>", ":wq<cr>", { silent = true, desc = "Save file" })

-- windows
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "<leader>wh", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window right", remap = true })

-- Latex keymaps

--Enable/Disable ltex
vim.keymap.set("n", "<leader>dt", ":lua require('config.utils').toggle_ltex()<cr>", { remap = true, silent = true })

-- Toggle the auto-processing with VimTex
vim.keymap.set("n", "<leader>vc", ":VimtexCompile<cr>", { silent = true })
-- Clean with VimTex
vim.keymap.set("n", "<leader>vd", ":VimtexClean<cr>", { silent = true })
-- Search direct with Vimtex
vim.keymap.set("n", "<leader>vv", ":VimtexView<cr>", { silent = true })
-- Errors with Vimtex
vim.keymap.set("n", "<leader>ve", ":VimtexErrors<cr>", { silent = true })
