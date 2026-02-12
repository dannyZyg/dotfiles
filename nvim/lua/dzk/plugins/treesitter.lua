return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    enabled = true,
    build = ":TSUpdate",
    config = function()
      -- Register genexpr filetype (custom parser - must be installed manually via tree-sitter CLI)
      vim.filetype.add({ extension = { genexpr = "genexpr" } })

      -- New API: just set install directory if needed
      require("nvim-treesitter").setup({
        -- Uses default install_dir: vim.fn.stdpath('data')/site
      })

      -- Enable treesitter-based highlighting
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
