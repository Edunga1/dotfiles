local function rename_file()
  local source_file, target_file

  vim.ui.input(
    {
      prompt = "Source : ",
      completion = "file",
      default = vim.api.nvim_buf_get_name(0)
    },
    function(input)
      source_file = input
    end
  )
  vim.ui.input(
    {
      prompt = "Target : ",
      completion = "file",
      default = source_file
    },
    function(input)
      target_file = input
    end
  )

  local params = {
    command = "_typescript.applyRenameFile",
    arguments = {
      {
        sourceUri = source_file,
        targetUri = target_file,
      },
    },
    title = ""
  }

  vim.lsp.util.rename(source_file, target_file)
  local client = vim.lsp.get_clients({ bufnr = 0, name = 'ts_ls' })[1]
  if client then
    client:exec_cmd(params)
  end
end

return {
  on_attach = function(_, buffer)
    -- Enable file renaming command
    vim.api.nvim_buf_create_user_command(buffer, 'RenameFile', rename_file, {
      desc = "Rename file",
    })
  end,
}
