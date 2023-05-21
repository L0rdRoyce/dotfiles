-- plans to try out lazy
-- auto-install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins when file is saved
vim.cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]])

-- protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Packer not found")
    return
end

-- popup window for packer
packer.init{
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- plugins list
return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- dependencies
    use 'nvim-lua/plenary.nvim'
    use 'BurntSushi/ripgrep'
    use 'sharkdp/fd'

    --My Plugins here
    use 'navarasu/onedark.nvim' -- colorscheme

    -- File explorer
    use 'nvim-tree/nvim-tree.lua'
    use 'nvim-tree/nvim-web-devicons'

    use 'nvim-lualine/lualine.nvim' -- Statusline

    -- QOL
    use 'szw/vim-maximizer'

    -- Fuzzy finding with telescope
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- dependency for better sorting performance
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' } -- fuzzy finder

    -- autocompletion
    use 'hrsh7th/nvim-cmp' -- completion plugin
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    -- snippets
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use
    use 'saadparwaiz1/cmp_luasnip' -- snippet completions

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- treesitter
    use 'HiPhish/nvim-ts-rainbow2'
-- TODO: Treesitter, git integration (fugitive), undotree, harpoon 
-- autopair, surround, replace with register, comment out

    use {'ThePrimeagen/vim-be-good', cmd = 'VimBeGood'} -- Primeagen's vim tutor

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        packer.sync()
    end
end)
