local vim = vim
local uv = vim.loop

local lspconfig = require "lspconfig"
local configs = require'lspconfig/configs'
local util = require 'lspconfig/util'
local default_callbacks = require 'vim.lsp.handlers'
local internal_util = require 'vim.lsp.util'

local on_attach = function(client, bufnr)

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require'completion'.on_attach(client)
  -- require "lspconfig".efm.setup {on_attach = on_format}
  if client.resolved_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
      vim.api.nvim_command [[augroup END]]
  end

  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',     opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd',  '<cmd>lua vim.lsp.buf.definition()<CR>',      opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>',           opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi',  '<cmd>lua vim.lsp.buf.implementation()<CR>',  opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',  '<cmd>lua vim.lsp.buf.signature_help()<CR>',  opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>td',   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',  '<cmd>lua vim.lsp.buf.rename()<CR>',          opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr',  '<cmd>lua vim.lsp.buf.references()<CR>',      opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>do',  '<cmd>lua vim.lsp.buf.code_action()<CR>',     opts)

end

-- vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
--     if err ~= nil or result == nil then
--         return
--     end
--     if not vim.api.nvim_buf_get_option(bufnr, "modified") then
--         local view = vim.fn.winsaveview()
--         vim.lsp.util.apply_text_edits(result, bufnr)
--         vim.fn.winrestview(view)
--         if bufnr == vim.api.nvim_get_current_buf() then
--             vim.api.nvim_command("noautocmd :update")
--         end
--     end
-- end

-- local on_format = function(client)
--     if client.resolved_capabilities.document_formatting then
--         vim.api.nvim_command [[augroup Format]]
--         -- vim.api.nvim_command [[autocmd! * <buffer>]]
--         vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
--         vim.api.nvim_command [[augroup END]]
--     end
-- end


local servers = { 'cssls','html', 'tsserver', 'vimls', 'pyls_ms', 'jsonls', 'bashls', 'vuels', 'diagnosticls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
  }
end

vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
   },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- This will disable virtual text, like doing:
    -- let g:diagnostic_enable_virtual_text = 0
    virtual_text = true,

    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = false,
    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = true,
  }
)

