if vim.g.plugs["yankdown.nvim"] == nil then
  return
end

require("yankdown").setup({
  auto_intercept = true,
})
