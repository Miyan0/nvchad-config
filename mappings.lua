local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap_go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap_go").debug_last()
      end,
      "Debug last go test",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsdb"] = {
      "<cmd> GoTagAdd db <CR>",
      "Add db struct tags",
    },
  },
}

M.general = {
  plugin = false,
  n = {
    ["<leader>qq"] = {
      "<cmd> qa <CR>",
      "Quit without saving",
    },
    ["cp"] = { ":Copilot panel<enter>", "Copilot panel" },
  },
}

M.harpoon = {
  n = {
    ["<leader>a"] = {
      function()
        require("harpoon"):list():append()
      end,
      "󱡁 Harpoon Add file",
    },
    ["<C-e>"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      "󱠿 Harpoon Menu Toggle",
    },
    ["<leader>1"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "󱪼 Navigate to file 1",
    },
    ["<leader>2"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "󱪽 Navigate to file 2",
    },
    ["<leader>3"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "󱪾 Navigate to file 3",
    },
    ["<leader>4"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "󱪿 Navigate to file 4",
    },
    ["<leader>5"] = {
      function()
        require("harpoon"):list():select(5)
      end,
      "󱪿 Navigate to file 5",
    },
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

-- M.copilot {
--   plugin = true,
--   i = {
--     ["<TAB>"] = {
--       function()
--         require("copilot.suggestion").accept()
--       end,
--       "Accept copilot suggestion",
--     },
--   },
-- }

return M
