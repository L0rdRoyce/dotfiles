local status, configs = pcall(require, "nvim-treesitter.configs")
if not status then
    print("treesitter not found")
    return
end

configs.setup {
    ensure_installed = { 'c', 'cpp', 'python', 'rust', 'lua', 'vimdoc' },
    sync_install = false,
    auto_install = true,
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    rainbow = {
        enable = true,
        disable = { '' },
        query = 'rainbow-parens',
        strategy = require('ts-rainbow').strategy.global,
    }
}
