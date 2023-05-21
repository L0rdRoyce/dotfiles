local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}
local term_opts = {silent = true}

keymap("n", "<Space>", "") -- disables space in normal mode
vim.g.mapleader = " " -- leader key (space, opts)

--general keymaps
keymap("i", "<C-c>", "<Esc>", opts) -- binds Ctrl + C to Esc.
keymap("n", "<C-u>", "<C-u>zz", opts) -- centers screen after scroll
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("n", "<leader>nh", ":nohl<CR>", opts) -- removes search highlight
keymap("n", "x", '"_x', opts) -- no registry when x delete

-- Visual mode
keymap("v", "p", '"_dP', opts)

    --indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

    -- move text up and down
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- window management
    -- split
keymap("n", "<leader>sh", "<C-w>v", opts) -- vertical split
keymap("n", "<leader>sd", "<C-w>s", opts) -- horizontal split
keymap("n", "<leader>sc", "<C-w>c", opts) -- close split
keymap("n", "<leader>se", "<C-w>=", opts) -- make split size equal

keymap("n", "<leader>sn", ":vnew<CR>", opts) -- empty vertical split
keymap("n", "<leader>sN", ":new<CR>", opts) -- empty horizontal split

keymap("n", "<C-h>", "<C-w>h", opts) -- move cursor to left split
keymap("n", "<C-l>", "<C-w>l", opts) -- move cursor to right split
keymap("n", "<C-j>", "<C-w>j", opts) -- move cursor to bottom split
keymap("n", "<C-k>", "<C-w>k", opts) -- move cursor to top split
keymap("n", "<leader>su", "<C-w>p", opts) -- move cursor to previous split
keymap("n", "<leader>st", "<C-w>T", opts) -- move current split to new tab
keymap("n", "<leader>sH", "<C-w>H", opts) -- make vertical splits horizontal
keymap("n", "<leader>sD", "<C-w>K", opts) -- make horizontal splits vertical
keymap("n", "<leader>sl", "<C-w>L", opts) -- move current split to the right
keymap("n", "<leader>sr", "<C-w>H", opts) -- move current split to the left
keymap("n", "<leader>sj", "<C-w>J", opts) -- move current split to the bottom
keymap("n", "<leader>sk", "<C-w>K", opts) -- move current split to the top

keymap("n", "<C-Up>", ":resize +2<CR>", opts) -- resize
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

    -- tabs
keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new empty tab
keymap("n", "<leader>tc", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) -- goto next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) -- goto previous tab
keymap("n", "<leader>ts", ":tabo<CR>", opts) -- close all tabs except current

keymap("n", "<leader>th", ":-tabmove<CR>", opts) -- move tab left
keymap("n", "<leader>tl", ":+tabmove<CR>", opts) -- move tab right
keymap("n", "<leader>tH", ":0tabmove<CR>", opts) -- move tab to extreme left
keymap("n", "<leader>tL", ":tabmove<CR>", opts) -- move tab to extreme right

    -- terminal navigation
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", term_opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", term_opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", term_opts)

-- plugin keymaps
    --vim maximizer
keymap("n", "<leader>sm", ":MaximizerToggle<CR>", opts)

    -- Vim Be Good
keymap("n", "<leader>vbg", ":VimBeGood<CR>", opts)

    -- telescope TODO

    -- mason
keymap("n", "<leader>m", ":Mason<CR>", opts)

-- nvim-tree
keymap("n", "<leader>ec", ":NvimTreeToggle<CR>", opts) -- open/close nvimtree
keymap("n", "<leader>eo", ":NvimTreeFocus<CR>", opts) -- if open: focus else open and focus

