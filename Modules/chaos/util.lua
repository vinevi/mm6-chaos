local util = {}

util.getFilenameFromPath = function(path)
	local filename = path:match("[^\\]*.lua$")
	filename = filename:sub(0, #filename - 4)
	return filename
end

return util