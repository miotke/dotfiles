-- Global variable 
LAZY_PLUGIN_SPEC = {}

-- Global function named 'spec' which is callable in init.lua
function spec(item)
  table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

