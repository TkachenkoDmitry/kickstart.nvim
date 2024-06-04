return {
  {
    'nvim-pack/nvim-spectre',
    opt = true,
    cmd = 'Spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>cc', '<cmd>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre', mode = 'n' },
      { '<leader>cw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = 'Search current word', mode = 'n' },
      { '<leader>cw', '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = 'Search current word', mode = 'v' },
      { '<leader>cp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = 'Search on current file', mode = 'n' },
    },
  },
}
