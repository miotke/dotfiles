-- LSP Configuration using Neovim's built-in LSP client
-- Requires language servers to be installed on the system:
--   lua: lua-language-server
--   python: pylsp (pip install python-lsp-server)
--   go: gopls (go install golang.org/x/tools/gopls@latest)

-- Lua LSP
vim.lsp.config.lua_ls = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
}

-- Python LSP (pylsp)
vim.lsp.config.pylsp = {
  cmd = { 'pylsp' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { enabled = true, maxLineLength = 120 },
        pyflakes = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
      },
    },
  },
}

-- Go LSP (gopls)
vim.lsp.config.gopls = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

-- Enable all configured LSP servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('pylsp')
vim.lsp.enable('gopls')

-- LSP keymaps (applied when LSP attaches to a buffer)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

