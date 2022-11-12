local null_ls = require 'null-ls'
return {
    server = require'lspconfig'.pyright,
    sources = {
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.isort,
    },
}

