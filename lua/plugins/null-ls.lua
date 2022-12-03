local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local diagnostics = null_ls.builtins.diagnostics
local utils = require("null-ls.utils")

-- :echo executable('phpcs')

null_ls.setup({
    sources = {
        diagnostics.phpcs
    }
})

