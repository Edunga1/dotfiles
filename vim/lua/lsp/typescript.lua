local null_ls = require 'null-ls'
return {
    server = require 'lspconfig'.tsserver,
    sources = {
        null_ls.builtins.diagnostics.eslint,
    },
}
