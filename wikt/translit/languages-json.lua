local export = {}

function export.getByCode(frame)
	local args = frame.args
	local langcode = args[1] or error("Language code has not been specified. Please pass parameter 1 to the module invocation.")
	local lang = require("Module:languages").getByCode(langcode) or error("Language code not found")
	
	return lang:toJSON()
end

return export