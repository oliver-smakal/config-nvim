local vim = vim local opt = vim.opt

vim.g.copilot_assume_mapped = true

opt.tabstop=4
opt.softtabstop=4
opt.shiftwidth=4
opt.expandtab=true

opt.scrolloff=12
opt.relativenumber=true
opt.colorcolumn = "80"

opt.clipboard="unnamedplus"

-- Folding with treesitter
--opt.foldmethod = "expr"
--opt.foldexpr = "nvim_treesitter#foldexpr()"
