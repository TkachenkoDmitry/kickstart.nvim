return {
  'nvim-lualine/lualine.nvim',
  optional = true,
  opts = function(_, opts)
    table.insert(opts.sections.lualine_c, {
      'aerial',
      sep = ' ', -- separator between symbols
      sep_icon = '', -- separator between icon and symbol

      -- The number of symbols to render top-down. In order to render only 'N' last
      -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
      -- be used in order to render only current symbol.
      depth = 5,

      -- When 'dense' mode is on, icons are not rendered near their symbols. Only
      -- a single icon that represents the kind of current symbol is rendered at
      -- the beginning of status line.
      dense = false,

      -- The separator to be used to separate symbols in dense mode.
      dense_sep = '.',

      -- Color the symbol icons.
      colored = true,
    })
  end,
}
