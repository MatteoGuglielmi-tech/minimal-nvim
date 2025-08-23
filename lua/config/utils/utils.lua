local M = {}

--- Parses a .env file and returns its contents as a table.
-- @param path The path to the .env file (e.g., ".env").
-- @return A table with key-value pairs, or nil if the file is not found.
function M.load_env(path)
  local file = io.open(path, "r")
  if not file then
    print("Warning: Could not open .env file at: " .. path)
    return nil
  end

  local config = {}
  for line in file:lines() do
    local key, value = line:match("^([^=]+)=(.*)$")
    if key and value then
      value = value:match('^"(.*)"$') or value:match("^'(.*)'$") or value
      config[key] = value
    end
  end

  file:close()
  return config
end

-- @param file The filename to append.
-- @return string The correctly joined path.
function M.join_path(base, file)
  if not base or base == "" then return file end
  if base:sub(-1) == "/" then
    return base .. file
  end
  return base .. "/" .. file
end

--- Searches upwards from a starting path to find a directory containing one of the markers.
-- @param markers A table of strings representing marker files/dirs (e.g., {".git", "init.lua"}).
-- @param start_path The full path of the file or directory to start searching from.
-- @return string|nil The path to the project root, or nil if not found.
function M.find_project_root(markers, markers_type, start_path)
  local root_dir = vim.fs.find(markers, {
    path = start_path,
    upward = true,
    type = markers_type
  })

  -- vim.fs.find returns a list, get the first match
  if root_dir and root_dir[1] then
    return vim.fn.fnamemodify(root_dir[1], ":h")
  end

  return nil
end

return M
