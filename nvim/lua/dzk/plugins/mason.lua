return {
  {
    "williamboman/mason.nvim",
    enabled = true,
    opts = {
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end
      },
    },
  },
}
