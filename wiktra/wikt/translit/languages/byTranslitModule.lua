return function(translitModule)
    local m_redirect = mw.loadData("translit-redirect/data")
    local langs = {}

    for code, data in pairs(require("languages/alldata")) do
        if data.translit_module == translitModule then
            langs[code] = data
        elseif data.translit_module == "translit-redirect" and m_redirect[code] then
            for scriptCode, translitRedirectData in pairs(m_redirect[code]) do if type(translitRedirectData) == "table" and translitRedirectData.module == translitModule then langs[code] = data end end
        end
    end

    local result = {}
    local i = 0
    for code, data in pairs(langs) do
        i = i + 1
        result[i] = require("languages").makeObject(code, data)
    end

    return result
end
