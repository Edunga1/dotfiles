-- package manager for lsp
require 'mason'.setup {
  PATH = 'append'
}
require 'mason-lspconfig'.setup {
  automatic_installation = false,
  automatic_enable = false,
}

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

-- Setup common LSP keymaps via LspAttach autocmd
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local function on_list(options)
      vim.fn.setqflist({}, ' ', options)
      vim.api.nvim_command('cfirst')
    end
    local context = {
      includeDeclaration = false,  -- do not include declaration in references
    }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr',
      function()
        vim.lsp.buf.references(
          context,
          { on_list = on_list }
        )
      end,
      bufopts
    )
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('v', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end,
})

-- setup language servers
local ns = require 'null-ls'
ns.setup()
local capabilities = require 'cmp_nvim_lsp'.default_capabilities()
local modules = {
  'lsp.servers.bash',
  'lsp.servers.markdown',
  'lsp.servers.python',
  'lsp.servers.vim',
  'lsp.servers.json',
  'lsp.servers.docker',
  'lsp.servers.rust',
  'lsp.servers.typescript',
  'lsp.servers.kotlin',
  'lsp.servers.gdscript',
  'lsp.servers.lua',
  'lsp.servers.html',
}

for _, module in ipairs(modules) do
  local server_module = require(module)

  -- Enable nvim-lspconfig servers
  for _, server in ipairs(server_module.servers or {}) do
    local config_table = {
      capabilities = capabilities,
    }

    -- on_attach function (server-specific only)
    if type(server.on_attach) == 'function' then
      config_table.on_attach = server.on_attach
    end

    -- settings
    if server.settings then
      config_table.settings = server.settings
    end

    -- filetypes
    if server.filetypes then
      config_table.filetypes = server.filetypes
    end

    vim.lsp.enable(server[1])
    vim.lsp.config(server[1], config_table)
  end

  -- Register none-ls sources
  if type(server_module.get_sources) == 'function' then
    ns.register(server_module.get_sources(ns))
  end
end
