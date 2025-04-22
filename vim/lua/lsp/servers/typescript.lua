local common = require 'lsp.servers.utils.common'

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

return function(lspconfig)
  lspconfig.eslint.setup {}
  lspconfig.ts_ls.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    commands = {
      RenameFile = {
        rename_file,
        description = "Rename file",
      },
    },
  }
  -- TODO: prettierd
end
