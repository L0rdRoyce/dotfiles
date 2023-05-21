local mason_status, mason = pcall(require, "mason")
if not mason_status then
    print("mason not found")
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    print("mason-lspconfig not found")
    return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    print("lspconfig not found")
    return
end

local cmp_lsp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_status then
    print("nvim-cmp-lsp not found")
    return
end

local capabilities = cmp_lsp.default_capabilities()

mason.setup {
    ui = {
        icons = {
            package_installed = "",
            package_pending = "󰟃",
            package_uninstalled = "󰅗"
        }
    }
}

mason_lspconfig.setup {
    ensure_installed = {
        'lua_ls',
        'clangd',
        'pyright',
        'rust_analyzer'
    },
    automatic_installation = true,
}

lspconfig['lua_ls'].setup {
	capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
lspconfig['pyright'].setup {
	capabilities = capabilities,
}
lspconfig['clangd'].setup {
	capabilities = capabilities,
}
lspconfig['rust_analyzer'].setup {
	capabilities = capabilities,
}
