local M = {}

M.servers = {
  {
    'lua_ls',
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = {
            vim.env.HOME .. '/.hammerspoon/Spoons/EmmyLua.spoon/annotations',
          },
        },
      },
    },
  },
}

return M
