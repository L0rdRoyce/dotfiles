-- navarasu/onedark.nvim
require('onedark').setup {
    style = 'deep',
    transparent = true,
    lualine = {
        transparent = false,
    },
    highlights = {
        ["signcolumn"] = { bg = '$bg0' }, 
    }
}

require('onedark').load()
