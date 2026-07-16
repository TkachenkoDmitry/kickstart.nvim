return {
  'OXY2DEV/markview.nvim',
  ft = 'markdown',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('markview').setup {
      markdown = {
        tables = {
          enable = true,
          block_decorator = true,
          use_virt_lines = false,
        },
      },
      markdown_inline = {
        checkboxes = { enable = true },
      },
      latex = { enable = false },
    }
  end,
}
