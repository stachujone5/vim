-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Theme
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				-- ...
			})

			vim.cmd("colorscheme github_dark")
		end,
	})

	-- Neo tree
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})

	-- Minimap
	use({
		"gorbit99/codewindow.nvim",
		config = function()
			local codewindow = require("codewindow")
			codewindow.setup({
				auto_enable = true, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
				use_lsp = true, -- Use the builtin LSP to show errors and warnings
				use_treesitter = false, -- Use nvim-treesitter to highlight the code
				use_git = false, -- Show small dots to indicate git additions and deletions
			})
			codewindow.apply_default_keybinds()
		end,
	})

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- LSP
	use("VonHeikemen/lsp-zero.nvim")
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
end)
