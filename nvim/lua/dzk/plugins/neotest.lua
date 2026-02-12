return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- Adapters
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-python",
    "alfaix/neotest-gtest",
  },
  config = function()
    local adapters = {}

    -- Load neotest-gtest only if cpp parser is available
    local ok_gtest, gtest = pcall(function()
      return require("neotest-gtest").setup({})
    end)
    if ok_gtest then
      table.insert(adapters, gtest)
    else
      vim.notify("neotest-gtest: cpp parser not ready, skipping adapter", vim.log.levels.WARN)
    end

    -- Load python adapter
    local ok_python, python = pcall(require, "neotest-python")
    if ok_python then
      table.insert(adapters, python({ dap = { justMyCode = false } }))
    end

    -- Load plenary adapter
    local ok_plenary, plenary = pcall(require, "neotest-plenary")
    if ok_plenary then
      table.insert(adapters, plenary)
    end

    require("neotest").setup({
      adapters = adapters,
    })
  end,
}
