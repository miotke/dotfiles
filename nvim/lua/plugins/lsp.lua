-- Add this at the top of your lsp.lua file
vim.api.nvim_create_user_command("InstallMasonLSPs", function()
  vim.cmd("MasonInstall lua-language-server jedi-language-server terraform-ls")
end, {})

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "folke/neodev.nvim",
    },
    config = function()
      -- Define a list of servers to use
      local servers = {
        "lua_ls",              -- Lua
        "jedi_language_server", -- Python
        "terraformls",         -- Terraform
        -- Add more servers here as needed
      }
      
      -- Setup neovim lua configuration
      require('neodev').setup()
      
      -- Initialize mason
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
      
      -- Define a basic on_attach function for LSP servers
      local on_attach = function(_, bufnr)
        -- Define keymaps
        local function buf_set_keymap(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        
        -- LSP keybindings
        buf_set_keymap('n', 'gd', vim.lsp.buf.definition, 'Go to Definition')
        buf_set_keymap('n', 'gr', vim.lsp.buf.references, 'Go to References')
        buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, 'Go to Implementation')
        buf_set_keymap('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        buf_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, 'Signature Help')
        buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, 'Rename')
        buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code Action')
        
        -- Create a command `:Format` for formatting
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end
      
      -- Set up capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      
      -- Function to set up LSP servers
      local function setup_lsp_servers()
        -- Server-specific settings
        local server_settings = {
          lua_ls = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            }
          },
          -- Add settings for other servers as needed
        }
        
        -- Loop through servers and set them up
        for _, server_name in ipairs(servers) do
          require('lspconfig')[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = server_settings[server_name],
          })
        end
      end
      
      -- Install servers directly using shell commands
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- This function will run on Vim startup
          vim.defer_fn(function()
            -- Map LSP servers to Mason package names
            local server_to_package = {
              lua_ls = "lua-language-server",
              jedi_language_server = "jedi-language-server",
              terraformls = "terraform-ls",
            }
            
            for server_name, pkg_name in pairs(server_to_package) do
              -- Check if package is installed
              local is_installed = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/" .. pkg_name) ~= ""
              
              if not is_installed then
                print("Installing " .. pkg_name .. "...")
                vim.cmd("MasonInstall " .. pkg_name)
              end
            end
          end, 1000)  -- Delay to ensure Mason is initialized
        end,
        once = true,
      })
      
      -- Set up LSP servers
      setup_lsp_servers()
      
      -- Setup nvim-cmp
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      })
    end,
  }
}
