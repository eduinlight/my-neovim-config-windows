require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "rust_analyzer", "html", "cssls", "tsserver", "eslint" },
}

local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_preferences({
  sign_icons = {}
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lsp_flags = {
  debounce_text_changes = 150,
}

require 'lspconfig'.eslint.setup {
  capabilities = capabilities,
  settings = {
    codeActionOnSave = {
      enable = true,
      mode = "all"
    },
  }
}

lsp.setup()

-- USE telescome to listing references
local builtin = require("telescope.builtin")
vim.lsp.handlers["textDocument/references"] = builtin.lsp_references
vim.lsp.handlers["textDocument/definition"] = builtin.lsp_definitions

-- MAPS
K('n', '<A-f>', vim.cmd.EslintFixAll)
K('n', '<leader>f', function() vim.lsp.buf.format { async = true } end)
K('n', '<leader>dv', ":vsplit<CR><C-w>lgD", { silent = true })
K('n', '<leader>ds', ":split<CR><C-w>jgD", { silent = true })
K('n', '<leader>js', ":ClangdSwitchSourceHeader<CR>", { silent = true })

-- SELECT COMPLETION
local cmp = require('cmp')

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }
})

-- MASON
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})
