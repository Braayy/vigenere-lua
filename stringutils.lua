-- Adds indexing to strings
getmetatable('').__index = function(str, i) return string.sub(str, i, i) end
