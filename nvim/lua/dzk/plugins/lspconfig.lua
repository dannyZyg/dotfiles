return  {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()

    local servers = {
      "ansiblels",
      "bashls",
      "cmake",
      "clangd",
      "cssls",
      "dockerls",
      -- "jinja_lsp",
      "pyright",
      --"basedpyright",
      "ruff",
      "html",
      "ts_ls",
    }

    supercollider_config = {
      cmd = {
        "/Users/danny/dev/LanguageServer.quark/sc_language_server/.venv/bin/python",
        "-Xfrozen_modules=off",
        "/Users/danny/dev/LanguageServer.quark/sc_language_server/sc_language_server.py",
        "--log-file",
        "/tmp/sc_lsp_output.log",
        "--verbose",
        "--", -- indicates the args that follow are to be passed to sclang
        "-u", "57300",  -- e.g. custom UDP listening port for sclang
        "-l", "/Users/danny/.dotfiles/supercollider/sclang_conf_lsp.yaml",  -- e.g. full path to config file
      },

      filetypes = { "supercollider" },
      -- root_dir = function(fname)
      --     return "/"
      -- end,
      settings = {},
    }

    local sc_lsp_quark = io.open("/Users/danny/dev/LanguageServer.quark/LanguageServer.quark", "r")

    if sc_lsp_quark then
        -- Directory exists (or at least the path is valid enough to attempt to open a file)
        sc_lsp_quark:close() -- Close the file immediately

        vim.lsp.config['supercollider'] = supercollider_config
        table.insert(servers, "supercollider")
    end



    for _, server in pairs(servers) do
      vim.lsp.enable(server)
    end

    vim.api.nvim_create_autocmd("LspAttach", {

      callback = function(args)
        local opts = { noremap = true, silent = true }
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        -- setup additional keybindings
        vim.api.nvim_buf_set_keymap(args.buf, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
        vim.api.nvim_buf_set_keymap(args.buf, "n", "gca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.api.nvim_buf_set_keymap(
          args.buf,
          "n",
          "gl",
          '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
          opts
        )
        vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

        if client.name == "clangd" then
          vim.api.nvim_buf_set_keymap(args.buf, "n", "<leader>hs", "<cmd>LspClangdSwitchSourceHeader<CR>", opts)
        end

        -- setup auto formatting
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end
          })
        end

      end
    })

  end,
}
