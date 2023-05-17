
-- recommended settings from nvim-tree documentation
-- disables netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup {
    view = {
        number = true,
        relativenumber = true,
        signcolumn = "number",
    },
}
