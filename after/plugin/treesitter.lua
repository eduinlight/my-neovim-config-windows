require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "javascript", "typescript", "clojure", "cmake", "css", "html", "graphql", "java", "json", "latex", "make", "elixir", "python", "regex", "scss", "sql", "yaml", "toml", "vim", "vue", "dart", "dockerfile", "cpp", "c_sharp", "bash", "kotlin" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    disable = {},

    -- `false` will disable the whole extension
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}

-- jump to context
vim.keymap.set("n", "<leader>jc", function()
  require("treesitter-context").go_to_context()
end, { silent = true })

vim.treesitter.language.register('html', 'xml')
