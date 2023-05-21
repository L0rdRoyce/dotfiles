-- nvim-telescope/telescope.nvim

local status, telescope = pcall(require, "telescope")
if not status then
    print("Telescope not found")
    return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup{
    -- custom keymaps
    defaults = {
        mappings = {
            i = {
                ['<C-k>'] = actions.move_selection_previous, -- move to prev result
                ['<C-j>'] = actions.move_selection_next, -- move to next result
                ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, --send selected to quickfixlist
            }
        }
    },

    pickers = {
        find_files = {
            hidden = true,
        }
    }
}

-- TODO Move maps to keymaps.lua
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

telescope.load_extension("fzf")

