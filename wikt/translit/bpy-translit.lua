local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    -- consonants
    ["ক্ষ"] = "kkh",
    ["জ্ঞ"] = "gy",
    ["ক"] = "k",
    ["খ"] = "kh",
    ["গ"] = "g",
    ["ঘ"] = "gh",
    ["ঙ"] = "ng",
    ["চ"] = "c",
    ["ছ"] = "ch",
    ["জ"] = "j",
    ["ঝ"] = "jh",
    ["ঞ"] = "n",
    ["ট"] = "ţ",
    ["ঠ"] = "ţh",
    ["ড"] = "đ",
    ["ঢ"] = "ŗh",
    ["ণ"] = "n",
    ["ত"] = "t",
    ["থ"] = "th",
    ["দ"] = "d",
    ["ধ"] = "dh",
    ["ন"] = "n",
    ["প"] = "p",
    ["ফ"] = "ph",
    ["ব"] = "b",
    ["ভ"] = "bh",
    ["ম"] = "m",
    ["য"] = "j",
    ["র"] = "r",
    ["ল"] = "l",
    ["ৱ"] = "w",
    ["শ"] = "ş",
    ["ষ"] = "şş",
    ["স"] = "s",
    ["হ"] = "h",
    ["য়"] = "y",
    ["ড়"] = "đh",
    ["ঢ়"] = "ŗh",

    -- visarga
    ["ঃ"] = "ḥ",

    -- vowel diacritics
    ["ি"] = "i",
    ["ু"] = "u",
    ["ৃ"] = "ri",
    ["ে"] = "e",
    ["ো"] = "o",
    ["া"] = "a",
    ["ী"] = "i",
    ["ূ"] = "u",
    ["ৈ"] = "oi",
    ["ৌ"] = "ou",

    -- vowel signs
    ["অ"] = "ô",
    ["ই"] = "i",
    ["উ"] = "u",
    ["ঋ"] = "ri",
    ["এ"] = "e",
    ["ও"] = "o",
    ["আ"] = "a",
    ["ঈ"] = "i",
    ["ঊ"] = "u",
    ["ঐ"] = "oi",
    ["ঔ"] = "ou",

    -- hôshôntô
    ["্"] = "",

    -- chôndrôbindu
    ["ঁ"] = "̃",

    -- ônusbar
    ["ং"] = "ng",

    -- khôndô tô
    ["ৎ"] = "t",

    -- numerals
    ["০"] = "0",
    ["১"] = "1",
    ["২"] = "2",
    ["৩"] = "3",
    ["৪"] = "4",
    ["৫"] = "5",
    ["৬"] = "6",
    ["৭"] = "7",
    ["৮"] = "8",
    ["৯"] = "9",

    -- punctuation
    ["।"] = "." -- dari
}

local deaspirate = {["খ"] = "ক", ["ঘ"] = "গ", ["ছ"] = "চ", ["ঝ"] = "জ", ["ঠ"] = "ট", ["ঢ"] = "ড", ["থ"] = "ত", ["ধ"] = "দ", ["ফ"] = "প", ["ভ"] = "ব", ["ঢ়"] = "ড়"}

function export.tr(text, lang, sc)
    local c = "([কষজঞকখগঘঙচছজঝঞটঠডঢণতথদধনপফবভমযরলৱশষসহ]়?)"
    local y = "য়"
    local r = "র"
    local v = "([ô্িুৃেোাীূৈৌঅইউঋএওআঈঊঐঔ])"
    local virama = "্"
    local n = "(ং?)"

    local no_virama = gsub(v, virama, "")

    text = text .. " "

    text = gsub(text, c .. "্য", function(f) if deaspirate[f] then return deaspirate[f] .. "্" .. f end end)

    text = gsub(text, c, "%1ô")
    text = gsub(text, "ô" .. "([ô্িুৃেোাীূৈৌ])", "%1")

    text = gsub(text, v .. n .. c .. "ô ", function(j, k, l) -- ending
        return l == y and j .. k .. l .. "ô " or j .. k .. l .. " "
    end)

    local pattern = v .. n .. c .. "ô" .. c .. no_virama
    local continue = true
    while continue do
        continue = false
        text = gsub(text, "(.*)" .. pattern, function(d, e, f, g, h, i)
            if g ~= y and g ~= r then continue = true end
            return (g == y or g == r) and d .. e .. f .. g .. "ô" .. h .. i or d .. e .. f .. g .. h .. i
        end)
    end

    text = gsub(text, "([যডঢ]়)", conv)
    text = gsub(text, "ক্ষ", "kkh")
    text = gsub(text, "জ্ঞ", "gg")
    text = gsub(text, ".", conv)

    text = gsub(text, "ː(.)", "%1%1")

    text = gsub(text, " ?।", ".")

    -- vowel fix
    text = gsub(text, "([āēeo]y)ô ", "%1")

    -- nasalization fix
    text = gsub(text, "ôN ", "ông")
    text = gsub(text, "N", "ng")

    -- tb / sb -> t / s
    text = gsub(text, "([tsś])b", "%1")

    text = gsub(text, " $", "")

    return mw.ustring.toNFC(text)
end

return export
