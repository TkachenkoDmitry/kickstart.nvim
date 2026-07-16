return {
  'danymat/neogen',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>cn',
      function()
        require('neogen').generate()
      end,
      desc = 'Generate [C]onfig docst[ring]',
    },
  },
  opts = {
    languages = {
      python = {
        template = {
          -- Options: 'numpydoc', 'google_docstrings', 'reST'
          annotation_convention = 'numpydoc',
        },
      },
    },
  },
}
