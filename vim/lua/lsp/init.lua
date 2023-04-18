-- package manager for lsp
require 'mason'.setup{
  PATH = 'append'
}
require 'mason-lspconfig'.setup()

-- setup key mappings
vim.diagnostic.config({
  float = {
    source = true,
  },
})
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '\\d', vim.diagnostic.setloclist, opts)

-- setup language servers
local function merge(t1, t2)
   for _,v in ipairs(t2) do
      table.insert(t1, v)
   end
   return t1
end
require 'lsp.lua'
require 'lsp.markdown'

local sources = {}
merge(sources, require 'lsp.kotlin'.sources)
merge(sources, require 'lsp.python'.sources)
merge(sources, require 'lsp.typescript'.sources)
require 'null-ls'.setup {
  sources = sources,
}
