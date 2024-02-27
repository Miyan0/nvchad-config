-- put vim options, globals autocmds, commands etc. here
local autocmd = vim.api.nvim_create_autocmd

------------------------------- autocmds --------------------------------------
autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
