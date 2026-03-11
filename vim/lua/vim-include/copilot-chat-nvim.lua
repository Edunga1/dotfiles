require("CopilotChat").setup {
  model = "gpt-5.4",
  window = {
    width = 0.3,
  },
  opts = {
    language = "korean",
  },
}

vim.keymap.set('n', '<M-a>', ':CopilotChatToggle<CR>', { noremap = true })
