return {
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
}
