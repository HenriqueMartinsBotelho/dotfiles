return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },
		{ 'jose-elias-alvarez/null-ls.nvim' }, -- Para linting e formatação adicionais
		{ 'hrsh7th/nvim-cmp' }, -- Autocompletar
		{ 'hrsh7th/cmp-nvim-lsp' }, -- Integração com LSP
		{ 'glepnir/lspsaga.nvim' }, -- Interface mais amigável para LSP
	},
	config = function()
		-- Mason setup
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				'pyright',    -- Python
				'lua_ls',     -- Lua
				'ts_ls',   -- TypeScript/JavaScript
				'volar',      -- Vue.js
				'angularls',  -- Angular
				'eslint',     -- ESLint for linting
			}
		})

		-- LSP setups
		local lspconfig = require('lspconfig')

		-- Lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = { globals = { 'vim' } },
				},
			},
		})

		-- TypeScript/JavaScript
		lspconfig.ts_ls.setup({
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
			end,
		})

		-- Vue
		lspconfig.volar.setup({
			filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
		})

		-- Angular
		lspconfig.angularls.setup({})

		-- Pyright (Python)
		lspconfig.pyright.setup({})

		-- Null-ls for additional linting/formatting
		local null_ls = require('null-ls')
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.eslint_d, -- ESLint for TypeScript/JavaScript
				null_ls.builtins.formatting.prettier, -- Prettier for formatting
			},
		})

		-- nvim-cmp setup for autocompletion
		local cmp = require('cmp')
		cmp.setup({
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'path' },
			}),
			mapping = cmp.mapping.preset.insert({
				['<C-Space>'] = cmp.mapping.complete(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
		})

		-- lspsaga for better UI
		require('lspsaga').setup({})
	end
}
