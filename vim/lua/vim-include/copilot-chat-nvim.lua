require("CopilotChat").setup {
  window = {
    width = 0.3,
  },
}

vim.keymap.set('n', '<M-a>', ':CopilotChatToggle<CR>', { noremap = true })
