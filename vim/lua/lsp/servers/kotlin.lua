local M = {}

M.servers = {
  { 'kotlin_lsp' },
}

M.get_sources = function(ns)
  return {
    ns.builtins.diagnostics.ktlint,
    ns.builtins.formatting.ktlint,
  }
end

return M
