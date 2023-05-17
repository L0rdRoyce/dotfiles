local keymap = vim.keymap
vim.g.mapleader = " "

--general keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

-- window management


-- plugin keymaps

-- nvim-tree
keymap.set("n", "<leader>ec", ":NvimTreeToggle<CR>") 
keymap.set("n", "<leader>eo", ":NvimTreeFocus<CR>") 
