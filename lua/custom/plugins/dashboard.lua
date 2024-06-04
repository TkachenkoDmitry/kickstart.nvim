return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      hide = {
        statusline = false,
      },
      config = {
        header = {
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[]],
          [[    ███╗   ███╗ █████╗ ██╗  ██╗███████╗   ]],
          [[    ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   ]],
          [[    ██╔████╔██║███████║█████╔╝ █████╗     ]],
          [[    ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     ]],
          [[    ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   ]],
          [[    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ]],
          [[      ██████╗ ██████╗  ██████╗ ██╗        ]],
          [[     ██╔════╝██╔═══██╗██╔═══██╗██║        ]],
          [[     ██║     ██║   ██║██║   ██║██║        ]],
          [[     ██║     ██║   ██║██║   ██║██║        ]],
          [[     ╚██████╗╚██████╔╝╚██████╔╝███████╗   ]],
          [[      ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ]],
          [[███████╗████████╗██╗   ██╗███████╗███████╗]],
          [[██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝]],
          [[███████╗   ██║   ██║   ██║█████╗  █████╗  ]],
          [[╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ]],
          [[███████║   ██║   ╚██████╔╝██║     ██║     ]],
          [[╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ]],
          [[]],
          [[]],
          [[]],
          [[]],
        },
        center = {
          { action = 'ene | startinsert', desc = ' New File', icon = ' ', key = 'n' },
          { action = 'Telescope oldfiles', desc = ' Recent Files', icon = ' ', key = 'r' },
          { action = 'Telescope live_grep', desc = ' Find Text', icon = ' ', key = 'g' },
          { action = 'lua require("persistence").load()', desc = ' Restore Session', icon = ' ', key = 's' },
          { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
          {
            action = function()
              vim.api.nvim_input '<cmd>qa<cr>'
            end,
            desc = ' Quit',
            icon = ' ',
            key = 'q',
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }
  end,
  opts = {},
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
