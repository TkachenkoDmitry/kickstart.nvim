return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  keys = {
    {
      '<leader>;a',
      function()
        require('harpoon'):list():add()
      end,
      desc = 'Add file',
    },
    {
      '<leader>;t',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = 'Toggle menu',
    },
    {
      '<leader>;h',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = 'Nav 1',
    },
    {
      '<leader>;j',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = 'Nav 2',
    },
    {
      '<leader>;k',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = 'Nav 3',
    },
    {
      '<leader>;l',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = 'Nav 4',
    },
  },
}
