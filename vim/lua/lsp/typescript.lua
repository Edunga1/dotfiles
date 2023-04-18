local null_ls = require 'null-ls'
local common = require 'lsp._common'

local function rename_file()
  local source_file, target_file

  vim.ui.input({
    prompt = "Source : ",
    completion = "file",
    default = vim.api.nvim_buf_get_name(0)
  },
    function(input)
      source_file = input
    end
  )
  vim.ui.input({
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
  vim.lsp.buf.execute_command(params)
end

require 'lspconfig'.tsserver.setup {
  on_attach = common.on_attach,
  capabilities = common.capabilities,
  commands = {
    RenameFile = {
      rename_file,
      description = "Rename file",
    },
  },
}

return {
  sources = {
    null_ls.builtins.diagnostics.eslint,
  },
}
