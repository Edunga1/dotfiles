local null_ls = require 'null-ls'
return {
    server = require 'lspconfig'.kotlin_language_server,
    sources = {
        null_ls.builtins.diagnostics.ktlint,
        null_ls.builtins.formatting.ktlint,
    },
}
