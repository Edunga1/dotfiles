require("CopilotChat").setup {
}

vim.keymap.set('n', '<leader>q', ':CopilotChatToggle<CR>', { noremap = true })
