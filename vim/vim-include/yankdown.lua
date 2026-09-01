if vim.g.plugs["yankdown.nvim"] == nil then
  return
end

require("yankdown").setup()


vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(ev)
    vim.keymap.set({ "n", "x", "i" }, "gp", "<Plug>(yankdown-paste-after)", { buffer = ev.buf })
  end,
})
