return {
  on_attach = function(_, buffer)
    -- Enable file renaming command
    vim.api.nvim_buf_create_user_command(buffer, 'RenameFile', require('lsp.utils').rename_file, {
      desc = "Rename file",
    })
  end,
}
