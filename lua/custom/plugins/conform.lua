return {
	{
		"stevearc/conform.nvim",
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		config = function()
			require("conform").setup {
				formatters_by_ft = {
					lua = { "stylua" },
					go = { "goimports", "gofumpt" },
					javascript = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
					javascriptreact = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
					typescript = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
					typescriptreact = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
					astro = { { "prettierd", "prettier" } }
				},
			}
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
