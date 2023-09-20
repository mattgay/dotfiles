local util = require('lspconfig/util')
local path = util.path

return {
  has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
  end,

  get_python_path = function(workspace)
    -- Use activated virtualenv.
    if vim.env.VIRTUAL_ENV then
      return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
    end

    -- Find and use virtualenv via poetry in workspace directory.
    local match = vim.fn.glob(path.join(workspace, 'poetry.lock'))
    if match ~= '' then
      local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
      return path.join(venv, 'bin', 'python')
    end

    -- Fallback to system Python.
    return exepath('python3') or exepath('python') or 'python'
  end
}
