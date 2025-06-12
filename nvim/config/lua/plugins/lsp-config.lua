return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = { "lua_ls", "solargraph", "ts_ls" },
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities,
				cmd = { os.getenv("HOME") .. "/.rbenv/versions/2.6.8/bin/solargraph", "stdio" },
				settings = {
					solargraph = {
						--commandPath = { os.getenv( "HOME" ) .. "/.rbenv/versions/2.6.8/bin/solargraph", 'stdio' },
						autoformat = true,
						completion = true,
						diagnostic = true,
						folding = true,
						references = true,
						rename = true,
						symbols = true,
					},
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.phpactor.setup({
				capabilities = capabilities,
			})

			local telescopeBuiltIn = require("telescope.builtin")

			vim.keymap.set("n", "<leader>td", function()
				vim.diagnostic.enable(not vim.diagnostic.is_enabled())
			end, { silent = true, noremap = true, desc = "[T]oggle [D]iagnostic" })

			-- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
			-- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
			-- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
			-- Set vim motion for <Space> + c + r to display references to the code under the cursor
			vim.keymap.set("n", "<leader>cr", telescopeBuiltIn.lsp_references, { desc = "[C]ode Goto [R]eferences" })
			-- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
			vim.keymap.set(
				"n",
				"<leader>ci",
				telescopeBuiltIn.lsp_implementations,
				{ desc = "[C]ode Goto [I]mplementations" }
			)
			-- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
			vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
			-- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
			vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
		end,
	},
}
