local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
    return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
    return
end

-- configure telescope
telescope.setup({
    -- custom keymaps
    defaults = {
        mappings = {
            i = {
                ['<C-k>'] = actions.move_selection_previous, -- move to prev result
                ['<C-j>'] = actions.move_selection_next, -- move to next result
                ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist, --send selected to quickfixlist
            },
        },
    },
})

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

telescope.load_extension("fzf")

