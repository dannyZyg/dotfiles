return {
  'stevearc/overseer.nvim',
  keys = {
    { "<leader>bb", function()
        local overseer = require("overseer")
        local tasks = overseer.list_tasks({ recent_first = true })
        if vim.tbl_isempty(tasks) then
          -- No tasks yet, show picker
          vim.cmd("OverseerRun")
        else
          -- Rerun last task and ensure window is open
          tasks[1]:restart()
          overseer.open({ enter = false, direction = "bottom" })
        end
      end, desc = "Run last task or pick" },
    { "<leader>tr", "<cmd>OverseerRun<cr>", desc = "Pick task" },
    { "<leader>ta", "<cmd>OverseerTaskAction<cr>", desc = "Run task action" },
    { "<leader>tt", "<cmd>OverseerToggle<cr>", desc = "Toggle task panel" },
  },
  opts = function()
    return {
    }
  end
}
