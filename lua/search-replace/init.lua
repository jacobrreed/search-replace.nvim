local config = require("search-replace.config")

local M = {}

M.set = config.setup

function M.reset()
  require("search-replace").setup()
end

function M.disable()
  require("search-replace").stop()
end

function M.enable()
  require("search-replace").start()
end

return M
