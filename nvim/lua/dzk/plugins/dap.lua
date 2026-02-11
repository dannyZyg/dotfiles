return {
  {
    "mfussenegger/nvim-dap-python",
    enabled = true,
  },

  {
    "rcarriga/nvim-dap-ui",
    enabled = true,
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = true,
    event = "VeryLazy",
    dependencies = {"williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
        codelldb = function(config)

          table.insert(config.configurations, {
            name = "Attach to process",
            type = 'codelldb',
            request = 'attach',
            pid = function()
              return require("dap.utils").pick_process({ filter = "REAPER" })
            end,
            args = {},
          })

          require('mason-nvim-dap').default_setup(config)
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    enabled = true,
    event = "VeryLazy",

    init = function()

      local dap_status_ok, dap = pcall(require, "dap")
      if not dap_status_ok then
        return
      end

      local dapui_status_ok, dapui = pcall(require, "dapui")
      if not dapui_status_ok then
        vim.notify("Error: Failed to load dapui", vim.log.levels.ERROR)
        return
      end

      dapui.setup()

      vim.keymap.set("n", "<leader>dui", dapui.toggle)
      vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>/", function()
        dapui.eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<leader>dc", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F13>", dap.restart)

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
  },
}
