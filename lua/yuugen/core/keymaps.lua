-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Space + s saves the file
vim.keymap.set("n", "<Leader>s", ":write<CR>", { silent = true })

-- Move normally between wrapped lines
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) 
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }) 

-- Move to first symbol of the line
vim.keymap.set("n", "H", "^")

-- Move to last symbol of the line
vim.keymap.set("n", "L", "$")

-- Shift + q - Quit
vim.keymap.set("n", "Q", "<C-W>q")

-- vv - Makes vertical split
vim.keymap.set("n", "vv", "<C-W>v")

-- ss - Makes horizontal split
vim.keymap.set("n", "ss", "<C-W>s")

-- Quick jumping between splits
vim.keymap.set("n", "<C-j>", "<C-w>j") -- Down
vim.keymap.set("n", "<C-k>", "<C-w>k") -- Up
vim.keymap.set("n", "<C-h>", "<C-w>h") -- Left
vim.keymap.set("n", "<C-l>", "<C-w>l") -- Left

-- Indenting in visual mode (tab/shift+tab)
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- Move to the end of yanked text after yank and paste
vim.cmd("vnoremap <silent> y y`]")
vim.cmd("vnoremap <silent> p p`]")
vim.cmd("nnoremap <silent> p p`]")

-- Clean search highlight
vim.keymap.set("n", "<Leader>h", ":noh<CR>", { silent = true })

-- Fixes pasting after visual selection.
vim.keymap.set("v", "p", '"_dP')

