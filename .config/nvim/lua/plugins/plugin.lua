return
	{
		{
			"catppuccin/nvim",
			name = "catppuccin",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
			flavour = "mocha",
			config = function()
				-- load the colorscheme here
				vim.cmd([[colorscheme catppuccin]])
			end
		},
		-- {
		-- 	"lukas-reineke/indent-blankline.nvim",
		-- 	main = "ibl",
		-- 	---@module "ibl"
		-- 	---@type ibl.config
		-- 	opts = {},
		-- },
		-- {
		-- 	"iagorrr/noctishc.nvim",
		-- 	priority = 1000,
		-- 	config = function()
		-- 		vim.cmd([[colorscheme noctishc]])
		-- 	end,
		-- 	opts = ...
		-- },
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
			}
		},
		{
			'romgrk/barbar.nvim',
			dependencies = {
				'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
				'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
			},
			init = function() vim.g.barbar_auto_setup = false end,
			opts = {
				-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
				-- animation = true,
				-- insert_at_start = true,
				-- …etc.
			},
			version = '^1.0.0', -- optional: only update when a new 1.x version is released

		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "lua", "python", "c", "cpp", "vim", "bash", "glsl"}, -- Add languages you use
					highlight = { enable = true },
					indent = { enable = true },
				})
			end,
		},
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end
		},
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = { "lua_ls", "pyright" }, -- Add language servers here
					automatic_installation = true,
				})
			end
		},
		{
			"neovim/nvim-lspconfig",
			dependencies = { "williamboman/mason-lspconfig.nvim" },
			config = function()
				local lspconfig = require("lspconfig")
				local cmp_nvim_lsp = require("cmp_nvim_lsp")
				-- Get uv virtual environment path
				-- local uv_venv = vim.fn.system("uv venv"):gsub("\n", "")
				local python_path = vim.fn.system("which python"):gsub("\n", "")
				-- Enable LSP-based autocompletion
				local capabilities = cmp_nvim_lsp.default_capabilities()
				-- Setup Pyright
				lspconfig.pyright.setup({
					settings = {
						python = {
							pythonPath = python_path,
							analysis = {
								typeCheckingMode = "basic",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							}
						}
					}
				})
			end

		},
		{
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-cmdline",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
			},
			config = function()
				local cmp = require("cmp")
				local luasnip = require("luasnip")

				cmp.setup({
					snippet = {
						expand = function(args)
							luasnip.lsp_expand(args.body)
						end,
					},
					mapping = cmp.mapping.preset.insert({
						["<C-Space>"] = cmp.mapping.complete(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
						["<Tab>"] = cmp.mapping.select_next_item(),
						["<S-Tab>"] = cmp.mapping.select_prev_item(),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "luasnip" },
					}, {
							{ name = "buffer" },
						}),
				})
			end
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
			options = { theme = 'catppuccin' },
			config = function()
				require("lualine").setup()
			end,

		}
	}
