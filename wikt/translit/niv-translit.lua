local u = mw.ustring.char

local UTF8_char = "[\1-\127\194-\244][\128-\191]*"

local export = {}

local tab = {
    ["А"] = "A",
    ["а"] = "a",
    ["В"] = "V",
    ["в"] = "v",
    ["Е"] = "E",
    ["е"] = "e",
    ["Ё"] = "Jo",
    ["ё"] = "jo",
    ["Г"] = "G",
    ["г"] = "g",
    ["Ӷ"] = "",
    ["ӷ"] = "",
    ["Ғ"] = "Ꜧ",
    ["ғ"] = "ꜧ",
    ["Ӻ"] = "Ꜧ̇",
    ["ӻ"] = "ꜧ̇",
    ["Д"] = "D",
    ["д"] = "d",
    ["И"] = "I",
    ["и"] = "i",
    ["Й"] = "J",
    ["й"] = "j",
    ["К"] = "K",
    ["к"] = "k",
    ["Ӄ"] = "Q",
    ["ӄ"] = "q",
    ["Л"] = "L",
    ["л"] = "l",
    ["М"] = "M",
    ["м"] = "m",
    ["Н"] = "N",
    ["н"] = "n",
    ["Ӈ"] = "Ŋ",
    ["ӈ"] = "ŋ",
    ["О"] = "O",
    ["о"] = "o",
    ["П"] = "P",
    ["п"] = "p",
    ["Р"] = "R",
    ["р"] = "r",
    ["Р̌"] = "Ř",
    ["р̌"] = "ř",
    ["С"] = "S",
    ["с"] = "s",
    ["Т"] = "T",
    ["т"] = "t",
    ["У"] = "U",
    ["у"] = "u",
    ["Ф"] = "F",
    ["ф"] = "f",
    ["Х"] = "X",
    ["х"] = "x",
    ["Ӽ"] = "Ẋ",
    ["ӽ"] = "ẋ",
    ["Ӿ"] = "H",
    ["ӿ"] = "h",
    ["Ч"] = "Ț’",
    ["ч"] = "ț’",
    ["Ы"] = "Ə",
    ["ы"] = "ə",
    ["Э"] = "E",
    ["э"] = "e",
    ["Ю"] = "Ju",
    ["ю"] = "ju",
    ["Я"] = "Ja",
    ["я"] = "ja",
    ["’"] = "ʼ",
    ["ʼ"] = "ʼ",
    -- non-native letters
    ["Б"] = "B",
    ["б"] = "b",
    ["Ж"] = "ž",
    ["ж"] = "ž",
    ["З"] = "Z",
    ["з"] = "z",
    ["Ц"] = "C",
    ["ц"] = "c",
    ["Ш"] = "Š",
    ["ш"] = "š",
    ["Щ"] = "Šč",
    ["щ"] = "šč",
    ["Ъ"] = "ʺ",
    ["ъ"] = "ʺ",
    ["Ь"] = "’",
    ["ь"] = "’"
}

local palatal = {{"Дj", "D̦"}, {"дj", "d̦"}, {"Нj", "Ņ"}, {"нj", "ņ"}, {"Тj", "Ț"}, {"тj", "ț"}}

function export.tr(text, lang, sc)
    --[=[
	Unfortunately the Cyrillic alphabet doesn't distinguish between ţi and ti
	or ţe and te and so on.
	
	Represent iotation with j to allow the palatal consonant replacements.
	]=]
    text = string.gsub(text, UTF8_char, {["Я"] = "Ja", ["я"] = "ja", ["Ё"] = "Jo", ["ё"] = "jo", ["Ю"] = "Ju", ["ю"] = "ju", ["ь"] = "j"})

    for _, item in ipairs(palatal) do text = string.gsub(text, unpack(item)) end

    local vowels = {}
    for char in string.gmatch("АОУЫЕИЪЬаӣиоуыэеъьaeiou", UTF8_char) do vowels[char] = true end
    text = mw.ustring.gsub(text, "(.?)([Ее])", function(preceding, e)
        -- modifier letter apostrophe or right single quotation mark
        local capital = e == "Е"
        if preceding == "ʼ" or preceding == "’" then
            e = capital and "E" or "e"
        elseif preceding == "" or vowels[preceding] or mw.ustring.find(preceding, "[^Ѐ-ӿ]") then
            e = capital and "Je" or "je"
        else
            mw.log("Module:niv-translit could not decide how to transliterate " .. e .. " after " .. preceding .. ".")
        end
        return preceding .. e
    end)

    return string.gsub(text, UTF8_char, tab)
end

return export
