return {
  'sindrets/diffview.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
  config = function()
    require('diffview').setup {
      enhanced_diff_hl = true, -- Better syntax highlighting in diffs
      view = {
        merge_tool = { layout = 'diff3_mixed' },
      },
    }
  end,
}
