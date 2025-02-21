local common = require 'lsp.servers.utils.common'

return function(_, lspconfig)
  lspconfig.lua_ls.setup {
    on_attach = common.on_attach,
    capabilities = common.capabilities,
    settings = {
      Lua = {
        workspace = {
          library = {
            -- HammerSpoon annotations that are automatically generated
            vim.env.HOME .. '/.hammerspoon/Spoons/EmmyLua.spoon/annotations',
          },
        },
      },
    },
  }
end
