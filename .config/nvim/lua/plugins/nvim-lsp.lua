return {
   {
      "williamboman/mason.nvim",
      config = function()
         require("mason").setup()
      end,
   },

   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = {
               "bashls",
               "lua_ls",
               "html",
               "cssls",
               "pyright",
               "clangd",
               "omnisharp",
               "jdtls",
               "ts_ls",
               "jsonls",
               "intelephense",
            },
         })
      end,
   },

   {
      "neovim/nvim-lspconfig",
      config = function()
         local capabilities = require("blink.cmp").get_lsp_capabilities()

         vim.lsp.config("bashls", {
            capabilities = capabilities,
         })

         vim.lsp.config("lua_ls", {
            capabilities = capabilities,
         })

         vim.lsp.config("html", {
            capabilities = capabilities,
         })

         vim.lsp.config("cssls", {
            capabilities = capabilities,
         })

         vim.lsp.config("pyright", {
            capabilities = capabilities,
         })

         vim.lsp.config("clangd", {
            capabilities = capabilities,
         })

         vim.lsp.config("omnisharp", {
            capabilities = capabilities,
         })

         vim.lsp.config("jdtls", {
            capabilities = capabilities,
         })

         vim.lsp.config("ts_ls", {
            capabilities = capabilities,
         })

         vim.lsp.config("jsonls", {
            capabilities = capabilities,
         })

         vim.lsp.config("intelephense", {
            capabilities = capabilities,
         })
      end,
   },
}
