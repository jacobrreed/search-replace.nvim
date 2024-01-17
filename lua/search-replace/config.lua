local M = {}

M.options = {}
M.loaded = false
M.ns = vim.api.nvim_create_namespace("search-replace")

local defaults = {}

M.options = nil

function M.setup(options)
  if vim.fn.has("nvim-0.8.0") == 0 then
    error("search-replace needs Neovim >= 0.8.0.")
  end
  M._options = options
  if vim.api.nvim_get_vvar("vim_did_enter") == 0 then
    vim.defer_fn(function()
      M._setup()
    end, 0)
  else
    M._setup()
  end
end

function M._setup()
  M.options = vim.tbl_deep_extend("force", defaults, M._options or {})
  M.loaded = true
end

return M
