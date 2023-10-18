return {
	'stevearc/conform.nvim',
	event = { "BufWritePre" },
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
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
			javascriptreact = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
			typescript = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
			typescriptreact = { { "eslint_d", "eslint" }, { "prettierd", "prettier" } },
			-- ["*"] = { "codespell" }
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true }
	},
}
