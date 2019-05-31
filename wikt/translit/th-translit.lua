local export = {}

local m_pron = require("translit/th-pron")

function export.tr(text, lang, sc)
	return m_pron.translit(text, lang, sc, "paiboon", "translit-module")
end

function export.tr1(text)
	return table.concat(m_pron.getCharSeqTbl(text))
end

return export