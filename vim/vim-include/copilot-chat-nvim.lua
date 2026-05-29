require("CopilotChat").setup {
  model = "gpt-5.4",
  language = "korean",
  sticky = {
    "#buffer:active",
    "#selection",
  },
  window = {
    width = 0.3,
  },
}

vim.keymap.set('n', '<M-a>', ':CopilotChatToggle<CR>', { noremap = true })
vim.keymap.set('x', '<M-a>', ':<C-u>CopilotChatToggle<CR>', { noremap = true })
