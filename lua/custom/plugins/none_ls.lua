local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
			"nvimtools/none-ls-extras.nvim",
			"gbprod/none-ls-shellcheck.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettierd,
					require("none-ls.diagnostics.eslint"),
					null_ls.builtins.completion.spell,
					null_ls.builtins.code_actions.gomodifytags,
					null_ls.builtins.code_actions.impl,
					null_ls.builtins.formatting.golines,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.sqlfmt,
				},
			})
		end,
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({
					group = augroup,
					buffer = bufnr,
				})
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}
