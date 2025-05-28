local M = {}

M.servers = {
  { 'pyright' },
}

M.get_sources = function(ns)
  return {
    require('none-ls.formatting.autopep8'),
    ns.builtins.formatting.isort,
    require('none-ls.formatting.ruff'),
    require('none-ls.diagnostics.ruff'),
  }
end

return M
