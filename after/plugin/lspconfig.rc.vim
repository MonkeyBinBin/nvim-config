if !exists('g:lspconfig')
  finish
endif

lua << EOF
-- vim.lsp.set_log_level("debug")
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'
local lsp_installer = require("nvim-lsp-installer")
local lsp_installer_servers = require('nvim-lsp-installer.servers')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- formatting
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

local servers = { 'tsserver', 'html', 'cssls', 'jsonls', 'vuels', 'diagnosticls', 'angularls', 'emmet_ls', 'cssmodules_ls' }

lsp_installer.settings({
  ui = { icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)
  if server_available then
    server:on_ready(function ()
      -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
      -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
      -- function to set up servers, to avoid doing setting up a server twice.
      -- print('server on ready ' .. server_name)
      local opts = {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
      }
      server:setup(opts)
    end)
    if not server:is_installed() then
      -- Queue the server to be installed.
      server:install()
    end
  end
end

local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.formatting.prettier,
  },
  on_attach = on_attach
})

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

EOF
