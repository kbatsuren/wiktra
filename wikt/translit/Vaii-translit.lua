local export = {}

function export.tr(text)
    local data = mw.loadData("Vaii-translit/data")

    text = mw.ustring.gsub(text, "꘎꘎", "!")
    text = mw.ustring.gsub(text, "..", data.tt_doubled)
    text = mw.ustring.gsub(text, ".", data.tt)

    return text

end

return export
