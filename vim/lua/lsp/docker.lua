local common = require 'lsp._common'

return function(_, lspconfig)
  -- dockerfile
  lspconfig.dockerls.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }

  -- docker compose
  lspconfig.docker_compose_language_service.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
  }
end

