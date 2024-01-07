vim.o.background = "dark"
vim.cmd.colorscheme("gruvbox")

-- TRANSPARENT BACKGROUND
vim.cmd([[
  augroup MyColors
  autocmd!
  highlight Normal guibg=NONE
  highlight NonText guibg=NONE
  highlight SignColumn guibg=NONE
  augroup end
]])
