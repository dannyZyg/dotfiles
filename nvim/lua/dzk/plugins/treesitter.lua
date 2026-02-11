return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = true,
    build = ":TSUpdate",
    config = function()

      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
      parser_config.genexpr = {
        install_info = {
          url = '~/dev/tree-sitter-genexpr',
          files = { 'src/parser.c', 'src/scanner.c' },
          maintainer = '@sadguitarius',
        },
        filetype = 'genexpr',
      }

      require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "genexpr" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        ignore_install = {},

        modules = {},

        highlight = {
          enable = true,

          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,

          additional_vim_regex_highlighting = false,
        },
      }
    end
  }
}
