-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  "mfussenegger/nvim-dap",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    { "igorlfs/nvim-dap-view", opts = {} },

    -- Installs the debug adapters for you
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "jbyuki/one-small-step-for-vimkind",
  },
  keys = {
    -- Basic debugging keymaps, feel free to change to your liking!
    {
      "<F5>",
      function()
        --require("dap").continue()
        -- (Re-)reads launch.json if present
        if vim.fn.filereadable(".vscode/launch.json") then
          require("dap.ext.vscode").load_launchjs(nil)
        end
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Debug: Set Breakpoint",
    },
    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    {
      "<F7>",
      function()
        require("dap-view").toggle()
      end,
      desc = "Toggle dap view",
    },
  },
  config = function()
    local dap = require("dap")
    local dapview = require("dap-view")

    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }

    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    require("mason").setup()

    require("mason-nvim-dap").setup({
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      -- handlers = {},
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
        php = function(config)
          config.configurations = {
            {
              type = "php",
              request = "launch",
              name = "Listen for XDebug",
              port = 9003,
              log = true,
              pathMappings = {
                ["/var/www/html/"] = vim.fn.getcwd() .. "/",
              },
              hostname = "0.0.0.0",
            },
          }

          require("mason-nvim-dap").default_setup(config) -- don't forget this!
        end,
      },

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve',
      },
    })

    --dap.adapters.php = {
    --  type = "executable",
    --  command = "node",
    --  args = { "/Users/mickael/.vscode/extensions/xdebug.php-debug-1.36.1/out/phpDebug.js" },
    --}

    dap.listeners.before.launch.dapui_config = function()
      -- when the debugger is launched open up the debug ui
      dapview.open()
    end
    --start lua debugger
    vim.keymap.set("n", "<leader>dl", function()
      require("osv").launch({ port = 8086 })
    end, { noremap = true })

    -- set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })

    -- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
    vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })

    -- set a vim motion to close the debugging ui
    vim.keymap.set("n", "<leader>dc", dapview.close, { desc = "[D]ebug [C]lose" })
  end,
}
