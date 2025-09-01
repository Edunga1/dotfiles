require("CopilotChat").setup {
  window = {
    layout = 'float',
    relative = 'cursor',
    width = 1,
    height = 0.4,
    row = 1,
  }
}

vim.keymap.set('n', '<M-a>', ':CopilotChatToggle<CR>', { noremap = true })
