local M = {}

M.servers = {
  { 'pyright' },
}

M.get_sources = function()
  return {
    require('none-ls.formatting.autopep8'),
    require('none-ls.formatting.ruff'),
    require('none-ls.diagnostics.ruff'),
  }
end

return M
