if exists('b:loaded_ftplugin_copilot_chat')
  finish
endif
let b:loaded_ftplugin_copilot_chat = 1

nnoremap <buffer> <silent> <esc> :CopilotChatClose<CR>
