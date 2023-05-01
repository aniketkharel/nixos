local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"windwp/nvim-autopairs",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"norcalli/nvim-colorizer.lua",
	"akinsho/toggleterm.nvim",
	"nvim-lualine/lualine.nvim", -- status line/bar
	"lewis6991/gitsigns.nvim", -- git signs for editing or any changes
	"numToStr/Comment.nvim", -- comment
	"JoosepAlviste/nvim-ts-context-commentstring",
	"yamatsum/nvim-cursorline",
	"lukas-reineke/indent-blankline.nvim",
	"p00f/clangd_extensions.nvim",
	"RRethy/vim-illuminate",
	"lewis6991/impatient.nvim",
	"onsails/lspkind.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-nvim-lua",
	"L3MON4D3/LuaSnip", --snippet engine
	{ "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	"ggandor/leap.nvim",
  	"instant-markdown/vim-instant-markdown",
	{
		"jakewvincent/mkdnflow.nvim",
		config = function()
			require("mkdnflow").setup({
				-- Config goes here; leave blank for defaults
			})
		end,
	},
	{
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
	},
	"danilamihailov/beacon.nvim",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"vim-test/vim-test",
	"lewis6991/gitsigns.nvim",
	"preservim/vimux",
	"christoomey/vim-tmux-navigator",
	"tpope/vim-fugitive",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"neovim/nvim-lspconfig",
	"glepnir/lspsaga.nvim",
  "folke/tokyonight.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- rust tools
	"simrat39/rust-tools.nvim",
	"mfussenegger/nvim-dap",
}

local opts = {}
require("lazy").setup(plugins, opts)
