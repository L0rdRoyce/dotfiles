
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("cmp not found")
    return
end

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
    print("luasnip not found")
    return
end

local select_opts = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert{
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Set `select` to `false` to only confirm explicitly selected items.
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'}),
    },
    sources = cmp.config.sources{
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
    },
    cmp.setup.cmdline ({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    }),
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
            { name = 'path' },
            { name = 'cmdline' },
        }
    }),
    window = {
        documentation = cmp.config.window.bordered()
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                nvim_lua = '[NvimLua]',
                luasnip = '[Snippet]',
                buffer = '[Buffer]',
                path = '[Path]'
            })[entry.source.name]
            return vim_item
        end,
    },
}
