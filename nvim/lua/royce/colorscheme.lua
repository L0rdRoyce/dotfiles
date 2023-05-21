-- navarasu/onedark.nvim

local status, onedark = pcall(require, "onedark")
if not status then
    print("Colorscheme not found")
    return
end

onedark.setup {
    style = 'deep',
    transparent = true,
    lualine = {
        transparent = false,
    },
    highlights = {
        ["signcolumn"] = { bg = '$bg0' }, 
        ["TelescopePromptBorder"] = {fg = '$diff_text'},
        ["TelescopePreviewBorder"] = {fg = '$diff_text'},
        ["TelescopeResultsBorder"] = {fg = '$diff_text'},
    }
}

onedark.load()
