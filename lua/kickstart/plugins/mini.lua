return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- mini.surround is configured in custom/plugins/mini-surround.lua with custom keymaps

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Enhanced git section: branch + diff counts
      local original_section_git = statusline.section_git
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_git = function(args)
        local git = original_section_git(args)
        local diff = MiniStatusline.section_diff(args)
        if diff ~= '' then
          return git .. ' ' .. diff
        end
        return git
      end

      -- Enhanced LSP section: servers + harpoon count
      local original_section_lsp = statusline.section_lsp
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_lsp = function(args)
        local lsp = original_section_lsp(args)
        local ok, harpoon = pcall(require, 'harpoon')
        if ok then
          local count = harpoon:list():length()
          if count > 0 then
            local harpoon_str = 'H:' .. count
            if lsp ~= '' then
              return lsp .. ' ' .. harpoon_str
            end
            return harpoon_str
          end
        end
        return lsp
      end

      -- Macro recording indicator in mode section
      local original_section_mode = statusline.section_mode
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_mode = function(args)
        local mode = original_section_mode(args)
        local rec = vim.fn.reg_recording()
        if rec ~= '' then
          return mode .. ' [REC @' .. rec .. ']'
        end
        return mode
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
