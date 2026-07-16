return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      -- Helper to register Cypher parser (needed both now and after TSUpdate reloads parsers)
      local function register_cypher()
        require('nvim-treesitter.parsers').cypher = {
          install_info = {
            url = 'https://github.com/taekwombo/tree-sitter-cypher',
            files = { 'src/parser.c' },
            branch = 'master',
            queries = 'queries',
          },
        }
      end

      -- Register now
      register_cypher()

      -- Re-register after TSUpdate (install/update calls reload_parsers which wipes custom parsers)
      vim.api.nvim_create_autocmd('User', {
        pattern = 'TSUpdate',
        callback = register_cypher,
      })

      -- Register filetype for .cypher and .cql files
      vim.filetype.add {
        extension = {
          cypher = 'cypher',
          cql = 'cypher',
        },
      }

      -- Install parsers (new API)
      local parsers = {
        'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline',
        'vim', 'vimdoc', 'go', 'gomod', 'gowork', 'gosum',
        -- Additional languages matching LSP servers
        'typescript', 'tsx', 'javascript', 'css', 'scss', 'json',
        'python', 'yaml', 'toml', 'dockerfile', 'graphql', 'svelte',
        'terraform', 'hcl', 'ruby', 'rust',

        'regex',  -- regex literals in JS/TS
        'sql',    -- SQL in tagged template literals
        'jsdoc',  -- JSDoc comments in JS/TS
        'query',  -- treesitter .scm query files themselves
        'cypher', -- Neo4j Cypher query language
      }
      require('nvim-treesitter').install(parsers)

      -- Enable treesitter highlighting, folding, and indentation
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            -- Folding
            vim.opt_local.foldmethod = 'expr'
            vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.opt_local.foldlevel = 99
            -- Indentation
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup {
        enable = true,
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true,
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = 'V',
          },
          include_surrounding_whitespace = false,
        },
      }

      local select = require('nvim-treesitter-textobjects.select')
      vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end, { desc = 'Select outer function' })
      vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end, { desc = 'Select inner function' })
      vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end, { desc = 'Select outer class' })
      vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end, { desc = 'Select inner class' })
      vim.keymap.set({ 'x', 'o' }, 'aa', function() select.select_textobject('@parameter.outer', 'textobjects') end, { desc = 'Select outer argument' })
      vim.keymap.set({ 'x', 'o' }, 'ia', function() select.select_textobject('@parameter.inner', 'textobjects') end, { desc = 'Select inner argument' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
