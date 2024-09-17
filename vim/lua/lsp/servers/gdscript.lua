local common = require 'lsp.servers.utils.common'

-- doesn't work on WSL. check later
return function(_, lspconfig)
  lspconfig.gdscript.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
end
