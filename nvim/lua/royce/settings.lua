local opt = vim.opt --don't want to type vim multiple times :P

--line numbers
opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
--opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- scrolling
opt.scrolloff = 8

-- swap & backup and undotree
opt.swapfile = false
opt.backup = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
-- opt.colorcolumn = "60"

--clipboard (xclip)
opt.clipboard:append("unnamedplus")

--split
opt.splitright = true
opt.splitbelow = true

--misc
opt.updatetime = 50
-- opt.iskeyword:append("-")

