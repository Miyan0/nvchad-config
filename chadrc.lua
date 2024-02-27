-- override table in default_config.lua
local M = {}
-- local core = require "custom.utils.core"
-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "aquarium",

  telescope = { style = "bordered" }, -- borderless / bordered
  -- statusline = core.statusline,
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
  },
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
