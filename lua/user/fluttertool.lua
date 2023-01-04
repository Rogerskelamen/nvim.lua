local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  return
end

-- Load telescope extension
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end
telescope.load_extension "flutter"

flutter_tools.setup {};
