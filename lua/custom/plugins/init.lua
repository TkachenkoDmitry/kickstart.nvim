-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      { '<leader>S', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
      { '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer' },
      { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
      { '\\', function() Snacks.explorer() end, desc = 'Explorer' },
    },
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      lazygit = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      picker = {
        ui_select = false, -- Using fzf-lua for ui.select
        hidden = true,
        sources = {
          explorer = {
            cycle = true,
            auto_close = true,
            -- layout = { preview = 'main' },
          },
        },
        layout = {
          { preview = true },
          layout = {
            box = 'horizontal',
            width = 0.8,
            height = 0.8,
            {
              box = 'vertical',
              border = 'rounded',
              title = '{source} {live} {flags}',
              title_pos = 'center',
              { win = 'input', height = 1, border = 'bottom' },
              { win = 'list', border = 'none' },
            },
            { win = 'preview', border = 'rounded', width = 0.7, title = '{preview}' },
          },
        },
      },
      explorer = { enabled = true },
    },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      -- add any options here
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- NOTE: Using snacks.notifier instead of nvim-notify for notifications
    },
  },
}
