local null_ls = require 'null-ls'
return {
    server = require 'lspconfig'.sumneko_lua,
    sources = {
        null_ls.builtins.completion.luasnip,
    },
}
