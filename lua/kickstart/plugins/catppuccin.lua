return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'catppuccin/nvim',
    fzf = true,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    ---@type CatppuccinOptions
    opts = {
      flavour = 'mocha',
      integrations = {
        fzf = true,
        -- cmp = true,
        noice = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          scope_color = '', -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        snacks = true,
        fidget = true,
        blink_cmp = true,
        markdown = true,
        mason = true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
