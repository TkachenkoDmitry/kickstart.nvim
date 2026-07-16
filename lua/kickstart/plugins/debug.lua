-- debug.lua
-- Modern nvim-dap configuration
-- Supports: Go, JavaScript, TypeScript, Python

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- UI
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio', -- Required for nvim-dap-ui v4+

    -- Mason integration
    'mason-org/mason.nvim',
    {
      'jay-babu/mason-nvim-dap.nvim',
      opts = {
        ensure_installed = { 'delve', 'js-debug-adapter', 'debugpy' },
        automatic_installation = true,
        handlers = {},
      },
    },

    -- Language extensions
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',

    -- Virtual text
    { 'theHamsta/nvim-dap-virtual-text', opts = {} },
  },

  keys = function(_, keys)
    local dap = require 'dap'
    local dapui = require 'dapui'
    return {
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
      { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
      { '<F4>', dap.restart, desc = 'Debug: Restart' },
      { '<F9>', dap.terminate, desc = 'Debug: Terminate' },
      { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      {
        '<leader>B',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Conditional Breakpoint',
      },
      {
        '<leader>lp',
        function()
          dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
        end,
        desc = 'Debug: Log Point',
      },
      { '<F7>', dapui.toggle, desc = 'Debug: Toggle UI' },
      { '<leader>dr', dap.repl.open, desc = 'Debug: Open REPL' },
      { '<leader>dl', dap.run_last, desc = 'Debug: Run Last' },
      {
        '<leader>dh',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = 'Debug: Hover',
        mode = { 'n', 'v' },
      },
      unpack(keys),
    }
  end,

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Signs
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '◐', texthl = 'DapBreakpointCondition' })
    vim.fn.sign_define('DapLogPoint', { text = '◆', texthl = 'DapLogPoint' })
    vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DapStopped', linehl = 'DapStoppedLine' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '○', texthl = 'DapBreakpointRejected' })

    -------------------------
    -- JavaScript/TypeScript
    -------------------------
    local js_filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }

    local function get_js_debug_adapter_path()
      local ok, mason_registry = pcall(require, 'mason-registry')
      if ok then
        local pkg = mason_registry.get_package('js-debug-adapter')
        if pkg:is_installed() then
          local path = pkg:get_install_path() .. '/js-debug/src/dapDebugServer.js'
          if vim.fn.filereadable(path) == 1 then
            return path
          end
        end
      end
      -- Fallback to hardcoded path
      local path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'
      if vim.fn.filereadable(path) == 1 then
        return path
      end
      return nil
    end

    local js_adapter_path = get_js_debug_adapter_path()
    if js_adapter_path then
      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = { js_adapter_path, '${port}' },
        },
      }

      -- Alias for VSCode launch.json compatibility
      dap.adapters['node'] = dap.adapters['pwa-node']

      -- Chrome debugging (for frontend)
      dap.adapters['pwa-chrome'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'node',
          args = { js_adapter_path, '${port}' },
        },
      }

      -- VSCode launch.json support
      local vscode = require 'dap.ext.vscode'
      vscode.type_to_filetypes['node'] = js_filetypes
      vscode.type_to_filetypes['pwa-node'] = js_filetypes
      vscode.type_to_filetypes['pwa-chrome'] = js_filetypes

      for _, lang in ipairs(js_filetypes) do
        dap.configurations[lang] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch File',
            program = '${file}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch File (tsx)',
            program = '${file}',
            cwd = '${workspaceFolder}',
            runtimeExecutable = 'tsx',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**', 'node_modules/**' },
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach to Process',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
            sourceMaps = true,
          },
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Launch Chrome',
            url = function()
              local input = vim.fn.input('URL: ', 'http://localhost:3000')
              return input ~= '' and input or 'http://localhost:3000'
            end,
            webRoot = '${workspaceFolder}',
            sourceMaps = true,
          },
        }
      end
    end

    -------------------------
    -- Python
    -------------------------
    local dap_python = require 'dap-python'
    -- Use debugpy from mason
    local debugpy_path = vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'
    if vim.fn.filereadable(debugpy_path) == 1 then
      dap_python.setup(debugpy_path)
    else
      dap_python.setup() -- Fallback to auto-detect
    end
    dap_python.test_runner = 'pytest'

    -------------------------
    -- Go
    -------------------------
    require('dap-go').setup {
      delve = {
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -------------------------
    -- DAP UI
    -------------------------
    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '▶' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '↓',
          step_over = '→',
          step_out = '↑',
          step_back = '←',
          run_last = '↻',
          terminate = '■',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.25 },
            { id = 'breakpoints', size = 0.25 },
            { id = 'stacks', size = 0.25 },
            { id = 'watches', size = 0.25 },
          },
          position = 'left',
          size = 40,
        },
        {
          elements = {
            { id = 'repl', size = 0.5 },
            { id = 'console', size = 0.5 },
          },
          position = 'bottom',
          size = 10,
        },
      },
    }

    -- Auto open/close UI
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
