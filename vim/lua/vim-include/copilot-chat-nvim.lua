require("CopilotChat").setup {
}

vim.keymap.set('n', '<M-a>', ':CopilotChatToggle<CR>', { noremap = true })
