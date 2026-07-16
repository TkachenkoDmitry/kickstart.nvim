return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  opts = {
    name = { '.venv', 'venv', 'env', 'envs', 'environment', 'environments' },
    auto_refresh = true,
  },
  keys = {
    { '<leader>cv', '<cmd>VenvSelect<cr>', desc = 'Select [C]onfig [V]env' },
  },
}
