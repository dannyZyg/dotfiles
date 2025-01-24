require("mason").setup()

require('mason-nvim-dap').setup({
  ensure_installed = { 'codelldb' },
  handlers = {
    function(config)
      require('mason-nvim-dap').default_setup(config)
    end
  }
})
