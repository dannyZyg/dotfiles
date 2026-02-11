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
  opts = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-gtest").setup({
          -- is_test_file = function()
          --   local _test_extensions = {
          --     ["cpp"] = true,
          --     ["cppm"] = true,
          --     ["cc"] = true,
          --     ["cxx"] = true,
          --     ["c++"] = true,
          --   }
          --
          --   local elems = vim.split(file_path, lib.files.sep, { plain = true })
          --   local filename = elems[#elems]
          --   if filename == "" then -- directory
          --     return false
          --   end
          --   local extsplit = vim.split(filename, ".", { plain = true })
          --   local extension = extsplit[#extsplit]
          --   local fname_last_part = extsplit[#extsplit - 1]
          --   local result = _test_extensions[extension]
          --       and (vim.startswith(filename, "test_") or vim.endswith(fname_last_part, "_test") or vim.endswith(fname_last_part, "Test"))
          --     or false
          --   vim.notify(result)
          --   return result
          --
          -- end,
        }),

        require("neotest-python")({
          dap = { justMyCode = false },
        }),

        require("neotest-plenary"),

        require("neotest-python")({}),
      },
    })
  end,
}
