local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup({
  "ray-x/guihua.lua",
  "ray-x/navigator.lua",
  "neovim/nvim-lspconfig",
  "ms-jpq/coq_nvim",
  "ggandor/leap.nvim",
  "ojroques/nvim-lspfuzzy",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
})

require('leap').create_default_mappings()
