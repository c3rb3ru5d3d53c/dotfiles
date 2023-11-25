local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("lspconfig").clangd.setup({
  cmd = {"clangd", "--background-index"},
  filetypes = {"c", "cpp", "h", "hpp"}
})

require("lspconfig").pyright.setup({
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
      python = {
          analysis = {
              typeCheckingMode = "off",
              signatureHelp = true,
              includeSnippets = true,
              functionDocumentation = true,
          },
      },
  }
})
