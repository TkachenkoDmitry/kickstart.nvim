return {
  'stevearc/aerial.nvim',
  event = 'LspAttach',
  opts = {
    backends = { 'lsp', 'treesitter', 'markdown', 'man' },
    layout = {
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 20,
      default_direction = 'prefer_right',
      placement = 'edge',
    },
    attach_mode = 'global',
    filter_kind = false,
    show_guides = true,
    guides = {
      mid_item = '├─',
      last_item = '└─',
      nested_top = '│ ',
      whitespace = '  ',
    },
  },
  keys = {
    { '<leader>cs', function() require('aerial').fzf_lua_picker() end, desc = 'Aerial (Symbols)' },
    { '<leader>cS', '<cmd>AerialToggle<cr>', desc = 'Aerial Toggle' },
    { '[s', '<cmd>AerialPrev<cr>', desc = 'Previous symbol' },
    { ']s', '<cmd>AerialNext<cr>', desc = 'Next symbol' },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
