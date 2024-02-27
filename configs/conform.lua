-- conform is a replacement for null-ls
local opts = {
  require("conform").setup {
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "goimports", "gofumpt", "goimports_reviser", "golines" },
      -- If this is set, Conform will run the formatter on save.
      -- It will pass the table to conform.format().
      -- This can also be a function that returns the table.
      format_on_save = {
        -- I recommend these options. See :help conform.format for details.
        lsp_fallback = true,
        timeout_ms = 500,
      },
      -- Conform will run multiple formatters sequentially
      -- python = { "isort", "black" },
      -- Use a sub-list to run only the first available formatter
      -- javascript = { { "prettierd", "prettier" } },
    },
  },
}

return opts
