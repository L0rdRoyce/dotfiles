-- nvim-tree/nvim-tree.lua
-- recommended settings from nvim-tree documentation
-- disables netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status, nvimtree = pcall(require, "nvim-tree")
if not status then
    print("nvim-tree not found")
    return
end

nvimtree.setup{
    view = {
        number = true,
        relativenumber = true,
        signcolumn = "number",
    },
}
