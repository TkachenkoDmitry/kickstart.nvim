-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Disable line wrapping globally (markview tables need this)
vim.opt.wrap = false

-- Toggle wrap keymap
vim.keymap.set('n', '<leader>uw', function()
  vim.opt.wrap = not vim.opt.wrap:get()
  vim.notify('wrap ' .. (vim.opt.wrap:get() and 'ON' or 'OFF'))
end, { desc = 'Toggle [W]rap' })

-- Enable 24-bit colors (required for modern themes)
vim.opt.termguicolors = true

-- Conceal markdown syntax for markview.nvim rendering
vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'

-- Remove 'o' from formatoptions to prevent auto-inserting comment leader on new lines
vim.opt.formatoptions:remove('o')

-- Allow cursor to move across lines with h/l/<Left>/<Right>
vim.opt.whichwrap = 'h,l,<,>,[,]'

-- Ask for confirmation when closing unsaved buffers
vim.opt.confirm = true

vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25'

vim.diagnostic.config {
  virtual_text = {
    source = true,
  },
  signs = true,
  float = {
    header = 'Diagnostics',
    source = true,
    border = 'rounded',
  },
}

-- vim: ts=2 sts=2 sw=2 et
