return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvimtools/none-ls-extras.nvim',
      'gbprod/none-ls-shellcheck.nvim',
      'davidmh/cspell.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'

      null_ls.setup {
        sources = {
          -- Code actions (keep these - conform doesn't handle code actions)
          require 'none-ls.diagnostics.eslint_d',
          require 'none-ls.code_actions.eslint_d',
          null_ls.builtins.code_actions.gomodifytags,
          null_ls.builtins.code_actions.impl,
          null_ls.builtins.code_actions.refactoring,
          -- Diagnostics
          null_ls.builtins.diagnostics.terraform_validate,
          -- Note: Formatting is handled by conform.nvim
        },
      }
    end,
  },
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    config = function(_, opts)
      require('gopher').setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
}
