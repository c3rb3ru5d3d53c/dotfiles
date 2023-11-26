local M = {}

local highlights = require("custom.highlights")

M.ui = {
  theme = "yoro",
  theme_toggle = { "yoro", "tokyodark" },
  statusline = {
    theme = "default",
    separator_style = "arrow",
    overriden_modules = nil,
  },
  tabufline = {
    lazyload = true,
    overriden_modules = nil,
  },
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
