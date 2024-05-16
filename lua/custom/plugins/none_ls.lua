return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-shellcheck.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					require("none-ls.diagnostics.eslint"),
					require("none-ls-shellcheck.diagnostics"),
					require("none-ls-shellcheck.code_actions"),
					null_ls.builtins.code_actions.gomodifytags,
					null_ls.builtins.code_actions.impl,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.gofumpt,
				},
			})
		end,
	},
}
