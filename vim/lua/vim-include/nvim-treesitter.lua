require'nvim-treesitter.configs'.setup {
  sync_install = false,
  auto_install = true,
  ignore_install = {
    "gitcommit",  -- looks not good. diff is not highlighted
  },
  highlight = {
    enable = true,
  },
}
