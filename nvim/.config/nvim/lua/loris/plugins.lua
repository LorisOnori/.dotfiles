local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}
-- Packer plugins 

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"


    -- colorscheme
    use "folke/tokyonight.nvim"
    use "ellisonleao/gruvbox.nvim"

    -- LSP
	use {
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
		"folke/trouble.nvim",
	}

    -- Telescope
    use {
		"nvim-telescope/telescope.nvim", tag = '0.1.0',
        requires = { {"nvim-lua/plenary.nvim"} }
    }

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
    -- nvim-web-devicons --> Telescope's icons
    use "kyazdani42/nvim-web-devicons"

    -- Impatient --> load Lua faster
    use "lewis6991/impatient.nvim"

    -- Indend blankline
    use "lukas-reineke/indent-blankline.nvim"

    -- Dashboard
    use {
        'goolord/alpha-nvim',
        config = function ()
                require'alpha'.setup(require'alpha.themes.dashboard'.config)
            end
    }


	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
