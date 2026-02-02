return {
  'nvim-neotest/neotest',
  dependencies = {
    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-jest',
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>tt', function() require('neotest').run.run() end, desc = 'Run nearest test' },
    { '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Run file tests' },
    { '<leader>ta', function() require('neotest').run.run(vim.fn.getcwd()) end, desc = 'Run all tests' },
    { '<leader>ts', function() require('neotest').summary.toggle() end, desc = 'Toggle test summary' },
    { '<leader>to', function() require('neotest').output.open({ enter = true }) end, desc = 'Show test output' },
    { '<leader>tO', function() require('neotest').output_panel.toggle() end, desc = 'Toggle output panel' },
    { '<leader>tS', function() require('neotest').run.stop() end, desc = 'Stop test' },
    { '<leader>td', function() require('neotest').run.run({ strategy = 'dap' }) end, desc = 'Debug nearest test' },
    { '[t', function() require('neotest').jump.prev({ status = 'failed' }) end, desc = 'Previous failed test' },
    { ']t', function() require('neotest').jump.next({ status = 'failed' }) end, desc = 'Next failed test' },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-vitest',
        require 'neotest-python',
        require 'neotest-jest' {
          jestCommand = 'npm test --',
          jestConfigFile = 'custom.jest.config.ts',
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        },
      },
    }
  end,
}
