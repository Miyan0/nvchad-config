-- --------------------------------------------------
-- https://www.youtube.com/watch?v=i04sSQjd-qo&t=414s
-- --------------------------------------------------
-- 
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"


------------------------------------------------------------------------------
-- GOPLS
------------------------------------------------------------------------------
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl", "templ"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      -- auto import completeUnimported
      completeUnimported = true,
      -- show placeholders in functions
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    }
  }
}

------------------------------------------------------------------------------
-- TEMPL custom function for format on save 
------------------------------------------------------------------------------
local custom_format = function()
    if vim.bo.filetype == "templ" then
        local bufnr = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local cmd = "templ fmt " .. vim.fn.shellescape(filename)

        vim.fn.jobstart(cmd, {
            on_exit = function()
                -- Reload the buffer only if it's still the current buffer
                if vim.api.nvim_get_current_buf() == bufnr then
                    vim.cmd('e!')
                end
            end,
        })
    else
        vim.lsp.buf.format()
    end
end
vim.filetype.add({ extension = { templ = "templ" } })

lspconfig.templ.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"templ"},

vim.api.nvim_create_autocmd({"BufWritePre"},
  { pattern = { "*.templ" },
    callback = custom_format
  })
}

------------------------------------------------------------------------------
-- LUA
------------------------------------------------------------------------------
lspconfig["lua_ls"].setup({
    capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

