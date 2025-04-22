local common = require 'lsp.servers.utils.common'

return function(lspconfig)
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

