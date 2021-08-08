-- For Lao script, see https://www.unicode.org/charts/PDF/U0E80.pdf (Unicode 12.0+)
local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match
local sub = mw.ustring.sub
local u = mw.ustring.char

local c = {
    ["Deva"] = {["k"] = "क", ["kh"] = "ख", ["g"] = "ग", ["gh"] = "घ", ["ṅ"] = "ङ", ["c"] = "च", ["ch"] = "छ", ["j"] = "ज", ["jh"] = "झ", ["ñ"] = "ञ", ["ṭ"] = "ट", ["ṭh"] = "ठ", ["ḍ"] = "ड", ["ḍh"] = "ढ", ["ṇ"] = "ण", ["t"] = "त", ["th"] = "थ", ["d"] = "द", ["dh"] = "ध", ["n"] = "न", ["p"] = "प", ["ph"] = "फ", ["b"] = "ब", ["bh"] = "भ", ["m"] = "म", ["y"] = "य", ["r"] = "र", ["l"] = "ल", ["v"] = "व", ["s"] = "स", ["h"] = "ह", ["ḷ"] = "ळ", ["a"] = "अ", ["ā"] = "आ", ["i"] = "इ", ["ī"] = "ई", ["u"] = "उ", ["ū"] = "ऊ", ["e"] = "ए", ["o"] = "ओ", ["ṃ"] = "ं", [""] = ""},

    ["Beng"] = {["k"] = "ক", ["kh"] = "খ", ["g"] = "গ", ["gh"] = "ঘ", ["ṅ"] = "ঙ", ["c"] = "চ", ["ch"] = "ছ", ["j"] = "জ", ["jh"] = "ঝ", ["ñ"] = "ঞ", ["ṭ"] = "ট", ["ṭh"] = "ঠ", ["ḍ"] = "ড", ["ḍh"] = "ঢ", ["ṇ"] = "ণ", ["t"] = "ত", ["th"] = "থ", ["d"] = "দ", ["dh"] = "ধ", ["n"] = "ন", ["p"] = "প", ["ph"] = "ফ", ["b"] = "ব", ["bh"] = "ভ", ["m"] = "ম", ["y"] = "য", ["r"] = "র", ["l"] = "ল", ["v"] = "ৰ", ["s"] = "স", ["h"] = "হ", ["ḷ"] = "ল়", ["a"] = "অ", ["ā"] = "আ", ["i"] = "ই", ["ī"] = "ঈ", ["u"] = "উ", ["ū"] = "ঊ", ["e"] = "এ", ["o"] = "ও", ["ṃ"] = "ং", [""] = ""},

    ["Brah"] = {["k"] = "𑀓", ["kh"] = "𑀔", ["g"] = "𑀕", ["gh"] = "𑀖", ["ṅ"] = "𑀗", ["c"] = "𑀘", ["ch"] = "𑀙", ["j"] = "𑀚", ["jh"] = "𑀛", ["ñ"] = "𑀜", ["ṭ"] = "𑀝", ["ṭh"] = "𑀞", ["ḍ"] = "𑀟", ["ḍh"] = "𑀠", ["ṇ"] = "𑀡", ["t"] = "𑀢", ["th"] = "𑀣", ["d"] = "𑀤", ["dh"] = "𑀥", ["n"] = "𑀦", ["p"] = "𑀧", ["ph"] = "𑀨", ["b"] = "𑀩", ["bh"] = "𑀪", ["m"] = "𑀫", ["y"] = "𑀬", ["r"] = "𑀭", ["l"] = "𑀮", ["v"] = "𑀯", ["s"] = "𑀲", ["h"] = "𑀳", ["ḷ"] = "𑀴", ["a"] = "𑀅", ["ā"] = "𑀆", ["i"] = "𑀇", ["ī"] = "𑀈", ["u"] = "𑀉", ["ū"] = "𑀊", ["e"] = "𑀏", ["o"] = "𑀑", ["ṃ"] = "𑀁", [""] = ""},

    ["Khmr"] = {["k"] = "ក", ["kh"] = "ខ", ["g"] = "គ", ["gh"] = "ឃ", ["ṅ"] = "ង", ["c"] = "ច", ["ch"] = "ឆ", ["j"] = "ជ", ["jh"] = "ឈ", ["ñ"] = "ញ", ["ṭ"] = "ដ", ["ṭh"] = "ឋ", ["ḍ"] = "ឌ", ["ḍh"] = "ឍ", ["ṇ"] = "ណ", ["t"] = "ត", ["th"] = "ថ", ["d"] = "ទ", ["dh"] = "ធ", ["n"] = "ន", ["p"] = "ប", ["ph"] = "ផ", ["b"] = "ព", ["bh"] = "ភ", ["m"] = "ម", ["y"] = "យ", ["r"] = "រ", ["l"] = "ល", ["v"] = "វ", ["s"] = "ស", ["h"] = "ហ", ["ḷ"] = "ឡ", ["a"] = "អ", ["ā"] = "អា", ["i"] = "ឥ", ["ī"] = "ឦ", ["u"] = "ឧ", ["ū"] = "ឨ", ["e"] = "ឯ", ["o"] = "ឲ", ["ṃ"] = "ំ", [""] = ""},

    ["Mymr"] = {["k"] = "က", ["kh"] = "ခ", ["g"] = "ဂ", ["gh"] = "ဃ", ["ṅ"] = "င", ["c"] = "စ", ["ch"] = "ဆ", ["j"] = "ဇ", ["jh"] = "ဈ", ["ñ"] = "ဉ", ["ṭ"] = "ဋ", ["ṭh"] = "ဌ", ["ḍ"] = "ဍ", ["ḍh"] = "ဎ", ["ṇ"] = "ဏ", ["t"] = "တ", ["th"] = "ထ", ["d"] = "ဒ", ["dh"] = "ဓ", ["n"] = "န", ["p"] = "ပ", ["ph"] = "ဖ", ["b"] = "ဗ", ["bh"] = "ဘ", ["m"] = "မ", ["y"] = "ယ", ["r"] = "ရ", ["l"] = "လ", ["v"] = "ဝ", ["s"] = "သ", ["h"] = "ဟ", ["ḷ"] = "ဠ", ["a"] = "အ", ["ā"] = "အာ", ["i"] = "ဣ", ["ī"] = "ဤ", ["u"] = "ဥ", ["ū"] = "ဦ", ["e"] = "ဧ", ["o"] = "ဩ", ["ṃ"] = "ံ", [""] = ""},

    ["Sinh"] = {["k"] = "ක", ["kh"] = "ඛ", ["g"] = "ග", ["gh"] = "ඝ", ["ṅ"] = "ඞ", ["c"] = "ච", ["ch"] = "ඡ", ["j"] = "ජ", ["jh"] = "ඣ", ["ñ"] = "ඤ", ["ṭ"] = "ට", ["ṭh"] = "ඨ", ["ḍ"] = "ඩ", ["ḍh"] = "ඪ", ["ṇ"] = "ණ", ["t"] = "ත", ["th"] = "ථ", ["d"] = "ද", ["dh"] = "ධ", ["n"] = "න", ["p"] = "ප", ["ph"] = "ඵ", ["b"] = "බ", ["bh"] = "භ", ["m"] = "ම", ["y"] = "ය", ["r"] = "ර", ["l"] = "ල", ["v"] = "ව", ["s"] = "ස", ["h"] = "හ", ["ḷ"] = "ළ", ["a"] = "අ", ["ā"] = "ආ", ["i"] = "ඉ", ["ī"] = "ඊ", ["u"] = "උ", ["ū"] = "ඌ", ["e"] = "එ", ["o"] = "ඔ", ["ṃ"] = "ං", [""] = ""},

    ["Thai"] = {
        ["k"] = "ก",
        ["kh"] = "ข",
        ["g"] = "ค",
        ["gh"] = "ฆ",
        ["ṅ"] = "ง",
        ["c"] = "จ",
        ["ch"] = "ฉ",
        ["j"] = "ช",
        ["jh"] = "ฌ",
        ["ñ"] = "ญ",
        ["ṭ"] = "ฏ",
        ["ṭh"] = "ฐ",
        ["ḍ"] = "ฑ",
        ["ḍh"] = "ฒ",
        ["ṇ"] = "ณ",
        ["t"] = "ต",
        ["th"] = "ถ",
        ["d"] = "ท",
        ["dh"] = "ธ",
        ["n"] = "น",
        ["p"] = "ป",
        ["ph"] = "ผ",
        ["b"] = "พ",
        ["bh"] = "ภ",
        ["m"] = "ม",
        ["y"] = "ย",
        ["r"] = "ร",
        ["l"] = "ล",
        ["v"] = "ว",
        ["s"] = "ส",
        ["h"] = "ห",
        ["ḷ"] = "ฬ",

        ["a"] = "อ",
        ["ā"] = "อา",
        ["i"] = "อิ",
        ["ī"] = "อี",
        ["u"] = "อุ",
        ["ū"] = "อู",
        ["e"] = "อเ", -- to be swapped later
        ["o"] = "อโ", -- to be swapped later

        ["ṃ"] = "ํ",
        [""] = ""
    },

    ["Lana"] = {["k"] = "ᨠ", ["kh"] = "ᨡ", ["g"] = "ᨣ", ["gh"] = "ᨥ", ["ṅ"] = "ᨦ", ["c"] = "ᨧ", ["ch"] = "ᨨ", ["j"] = "ᨩ", ["jh"] = "ᨫ", ["ñ"] = "ᨬ", ["ṭ"] = "ᨭ", ["ṭh"] = "ᨮ", ["ḍ"] = "ᨯ", ["ḍh"] = "ᨰ", ["ṇ"] = "ᨱ", ["t"] = "ᨲ", ["th"] = "ᨳ", ["d"] = "ᨴ", ["dh"] = "ᨵ", ["n"] = "ᨶ", ["p"] = "ᨷ", ["ph"] = "ᨹ", ["b"] = "ᨻ", ["bh"] = "ᨽ", ["m"] = "ᨾ", ["y"] = "ᨿ", ["r"] = "ᩁ", ["l"] = "ᩃ", ["v"] = "ᩅ", ["s"] = "ᩈ", ["h"] = "ᩉ", ["ḷ"] = "ᩊ", ["a"] = "ᩋ", ["ā"] = "ᩋᩣ", ["i"] = "ᩍ", ["ī"] = "ᩎ", ["u"] = "ᩏ", ["ū"] = "ᩐ", ["e"] = "ᩑ", ["o"] = "ᩋᩰ", ["ṃ"] = "ᩴ", [""] = ""},

    ["Laoo"] = {
        ["k"] = "ກ",
        ["kh"] = "ຂ",
        ["g"] = "ຄ",
        ["gh"] = "ຆ",
        ["ṅ"] = "ງ",
        ["c"] = "ຈ",
        ["ch"] = "ຉ",
        ["j"] = "ຊ",
        ["jh"] = "ຌ",
        ["ñ"] = "ຎ",
        ["ṭ"] = "ຏ",
        ["ṭh"] = "ຐ",
        ["ḍ"] = "ຑ",
        ["ḍh"] = "ຒ",
        ["ṇ"] = "ຓ",
        ["t"] = "ຕ",
        ["th"] = "ຖ",
        ["d"] = "ທ",
        ["dh"] = "ຘ",
        ["n"] = "ນ",
        ["p"] = "ປ",
        ["ph"] = "ຜ",
        ["b"] = "ພ",
        ["bh"] = "ຠ",
        ["m"] = "ມ",
        ["y"] = "ຍ",
        ["r"] = "ຣ",
        ["l"] = "ລ",
        ["v"] = "ວ",
        ["s"] = "ສ",
        ["h"] = "ຫ",
        ["ḷ"] = "ຬ",

        ["a"] = "ອ",
        ["ā"] = "ອາ",
        ["i"] = "ອິ",
        ["ī"] = "ອີ",
        ["u"] = "ອຸ",
        ["ū"] = "ອູ",
        ["e"] = "ອເ", -- to be swapped later
        ["o"] = "ອໂ", -- to be swapped later

        ["ṃ"] = "ໍ",
        [""] = ""
    }

}

local v = {
    ["Deva"] = {["a"] = "", ["ā"] = "ा", ["i"] = "ि", ["ī"] = "ी", ["u"] = "ु", ["ū"] = "ू", ["e"] = "े", ["o"] = "ो", [""] = ""},

    ["Beng"] = {["a"] = "", ["ā"] = "া", ["i"] = "ি", ["ī"] = "ী", ["u"] = "ু", ["ū"] = "ূ", ["e"] = "ে", ["o"] = "ো", [""] = ""},

    ["Brah"] = {["a"] = "", ["ā"] = "𑀸", ["i"] = "𑀺", ["ī"] = "𑀻", ["u"] = "𑀼", ["ū"] = "𑀽", ["e"] = "𑁂", ["o"] = "𑁄", [""] = ""},

    ["Khmr"] = {["a"] = "", ["ā"] = "ា", ["i"] = "ិ", ["ī"] = "ី", ["u"] = "ុ", ["ū"] = "ូ", ["e"] = "េ", ["o"] = "ោ", [""] = ""},

    ["Mymr"] = {["a"] = "", ["ā"] = "ာ", ["i"] = "ိ", ["ī"] = "ီ", ["u"] = "ု", ["ū"] = "ူ", ["e"] = "ေ", ["o"] = "ော", [""] = ""},

    ["Sinh"] = {["a"] = "", ["ā"] = "ා", ["i"] = "ි", ["ī"] = "ී", ["u"] = "ු", ["ū"] = "ූ", ["e"] = "ෙ", ["o"] = "ො", [""] = ""},

    ["Thai"] = {["a"] = "", ["ā"] = "า", ["i"] = "ิ", ["ī"] = "ี", ["u"] = "ุ", ["ū"] = "ู", ["e"] = "เ", ["o"] = "โ", [""] = ""},

    ["Lana"] = {["a"] = "", ["ā"] = "ᩣ", ["i"] = "ᩥ", ["ī"] = "ᩦ", ["u"] = "ᩩ", ["ū"] = "ᩪ", ["e"] = "ᩮ", ["o"] = "ᩮᩣ", [""] = ""},

    ["Laoo"] = {["a"] = "", ["ā"] = "າ", ["i"] = "ິ", ["ī"] = "ີ", ["u"] = "ຸ", ["ū"] = "ູ", ["e"] = "ເ", ["o"] = "ໂ", [""] = ""}
}

local s = {
    ["Deva"] = {["0"] = "०", ["1"] = "१", ["2"] = "२", ["3"] = "३", ["4"] = "४", ["5"] = "५", ["6"] = "६", ["7"] = "७", ["8"] = "८", ["9"] = "९", ["."] = "॥", [","] = "।", ["-"] = "-"},

    ["Beng"] = {["0"] = "০", ["1"] = "১", ["2"] = "২", ["3"] = "৩", ["4"] = "৪", ["5"] = "৫", ["6"] = "৬", ["7"] = "৭", ["8"] = "৮", ["9"] = "৯", ["."] = ".", [","] = ",", ["-"] = "-"},

    ["Brah"] = {["0"] = "𑁦", ["1"] = "𑁧", ["2"] = "𑁨", ["3"] = "𑁩", ["4"] = "𑁪", ["5"] = "𑁫", ["6"] = "𑁬", ["7"] = "𑁭", ["8"] = "𑁮", ["9"] = "𑁯", ["."] = "𑁈", [","] = "𑁇", ["-"] = "-"},

    ["Khmr"] = {["0"] = "០", ["1"] = "១", ["2"] = "២", ["3"] = "៣", ["4"] = "៤", ["5"] = "៥", ["6"] = "៦", ["7"] = "៧", ["8"] = "៨", ["9"] = "៩", ["."] = "៕", [","] = "។", ["-"] = "-"},

    ["Mymr"] = {["0"] = "၀", ["1"] = "၁", ["2"] = "၂", ["3"] = "၃", ["4"] = "၄", ["5"] = "၅", ["6"] = "၆", ["7"] = "၇", ["8"] = "၈", ["9"] = "၉", ["."] = "။", [","] = "၊", ["-"] = "-"},

    ["Sinh"] = {["0"] = "0", ["1"] = "1", ["2"] = "2", ["3"] = "3", ["4"] = "4", ["5"] = "5", ["6"] = "6", ["7"] = "7", ["8"] = "8", ["9"] = "9", ["."] = ".", [","] = ",", ["-"] = "-"},

    ["Thai"] = {["0"] = "๐", ["1"] = "๑", ["2"] = "๒", ["3"] = "๓", ["4"] = "๔", ["5"] = "๕", ["6"] = "๖", ["7"] = "๗", ["8"] = "๘", ["9"] = "๙", ["."] = "๚", [","] = "ฯ", ["-"] = "-"},

    ["Lana"] = {["0"] = "᪐", ["1"] = "᪑", ["2"] = "᪒", ["3"] = "᪓", ["4"] = "᪔", ["5"] = "᪕", ["6"] = "᪖", ["7"] = "᪗", ["8"] = "᪘", ["9"] = "᪙", ["."] = "᪩", [","] = "᪨", ["-"] = "-"},

    ["Laoo"] = {["0"] = "໐", ["1"] = "໑", ["2"] = "໒", ["3"] = "໓", ["4"] = "໔", ["5"] = "໕", ["6"] = "໖", ["7"] = "໗", ["8"] = "໘", ["9"] = "໙", ["."] = "ຯຯ", [","] = "ຯ", ["-"] = "-"}
}

local join = {["Deva"] = "्", ["Beng"] = "্", ["Brah"] = "𑁆", ["Khmr"] = "្", ["Mymr"] = "္", ["Sinh"] = u(0x200d, 0x0dca), ["Thai"] = "ฺ", ["Lana"] = "᩠", ["Laoo"] = "຺"}

local kill = {["Deva"] = "्", ["Beng"] = "্", ["Brah"] = "𑁆", ["Khmr"] = "៑", ["Mymr"] = "်", ["Sinh"] = "්", ["Thai"] = "ฺ", ["Lana"] = "᩺", ["Laoo"] = "຺"}

local sinh_cjct = {["ක‍්ව"] = "ක්‍ව", ["ත‍්ථ"] = "ත්‍ථ", ["ත‍්ව"] = "ත්‍ව", ["න‍්ථ"] = "න්‍ථ", ["න‍්ද"] = "න්‍ද", ["න‍්ධ"] = "න්‍ධ", ["න‍්ව"] = "න්‍ව"}

local nukta = u(0x09bc) -- Just list all those used here.

local variations = {
    ["Mon"] = {
        ["ဈ"] = "ၛ",
        ["ဤ"] = "ဣဳ",
        ["ဦ"] = "ဥု",
        ["ဧ"] = "ဨ",
        ["ီ"] = "ဳ" -- for IM fix below
        -- Unicode doesn't have "great nya" so just leave ည္ည as is. (It looks like ည with one extra curve.)
    },
    ["OldShan"] = {
        ["က"] = "ၵ",
        ["ခ"] = "ၶ",
        ["ဂ"] = "ၷ",
        ["ဃ"] = "ꧠ",
        ["စ"] = "ၸ",
        ["ဆ"] = "ꧡ",
        ["ဇ"] = "ၹ",
        ["ဈ"] = "ꧢ",
        ["ဉ"] = "ၺ",
        ["ည"] = "ၺ္ၺ",
        ["ဋ"] = "ꩦ",
        ["ဌ"] = "ꩧ",
        ["ဍ"] = "ꩨ",
        ["ဎ"] = "ꩩ",
        ["ဏ"] = "ꧣ",
        ["ဒ"] = "ၻ",
        ["ဓ"] = "ꩪ",
        ["န"] = "ၼ",
        ["ဖ"] = "ၽ",
        ["ဗ"] = "ၿ",
        ["ဘ"] = "ꧤ",
        ["ဟ"] = "ႁ",
        ["ဠ"] = "ꩮ",
        ["အ"] = "ဢ",
        ["ဣ"] = "ဢိ",
        ["ဤ"] = "ဢီ",
        ["ဥ"] = "ဢု",
        ["ဦ"] = "ဢူ",
        ["ဧ"] = "ဢေ",
        ["ဩ"] = "ဢေႃ",
        ["ါ"] = "ႃ",
        ["ာ"] = "ႃ"
        -- Unicode doesn't have "Shan great sa" so just leave ဿ as is.
    },
    ["NewShan"] = {
        -- includes all Old Shan and the followings
        ["ဿ"] = "သ်သ",
        ["္"] = "်"
    }
}

-- Unnatural sequences of combining marks are frequently unreadable.  Therefore, they are displayed on
-- bearers so that the code can be understood and, if necessary, corrected.
local dc = function(text) return gsub(text, "[อອ]", "") end -- Discard bearer

local transform
function export.mono_form(text, script)

    local result = text

    if script == "Thai" then
        result = gsub(result, "ํ", "งฺ")
        result = gsub(result, "([ก-ฮ])ฺ", "ั%1ฺ")
        result = gsub(result, "([ก-ฮ])([^ะัาิีฺุู])", "%1ะ%2")
        result = gsub(result, "([ก-ฮ])([^ะัาิีฺุู])", "%1ะ%2") -- twice
        result = gsub(result, "([ก-ฮ])$", "%1ะ")
        --		result = gsub(result, "([ก-ฮ])([าิีุู])ั", "%1%2")
        result = gsub(result, dc("([ก-ฮ])([าอิอีอฺอุอู])อั"), "%1%2")
        result = gsub(result, "([เโ])([ก-ฮ])([ะั])", "%1%2")
        result = gsub(result, "^ั", "")
        result = gsub(result, "([%s%p])ั", "%1")
        result = gsub(result, "ฺ", "")
    elseif script == "Laoo" then
        -- Calculating transform in argument list of gsub() fails!
        if not transform then
            transform = {
                {dc("ອໍ"), dc("ງອ຺")}, {dc("([ກ-ຮ])ອ຺"), dc("ອັ%1ອ຺")}, {dc("([ກ-ຮ])([^ະອັາອິອີອ຺ອຸອູ])"), "%1ະ%2"}, {dc("([ກ-ຮ])([^ະອັາອິອີອ຺ອຸອູ])"), "%1ະ%2"}, -- twice!
                {"([ກ-ຮ])$", "%1ະ"}, {dc("([ກ-ຮ])([າອິອີອ຺ອຸອູ])ອັ"), "%1%2"}, {dc("([ເໂ])([ກ-ຮ])([ະອັ])"), "%1%2"}, {dc("^ອັ"), ""}, {dc("([%s%p])ອັ"), "%1"}, {dc("ອ຺"), ""}
            }
        end
        for _, v in ipairs(transform) do result = gsub(result, v[1], v[2]) end
    end

    return result
end

local function return_error(text) return error(("Unrecognised part: \"%s\""):format(text)) end

function export.tr(text, script, options)
    if type(text) == "table" then
        options = {}
        options.impl = text.args["impl"]
        options.variation = text.args["variation"] -- ID of variation: [Mymr: 1=Mon, 2=Old Shan, 3=New Shan]
        text, script = text.args[1], text.args[2]
    end
    if script == "Latn" then return text end
    if not s[script] then return nil end

    text = mw.ustring.lower(text)
    text = gsub(text, "[0-9%.,%-]", s[script])
    -- Compose patterns for processing onsets. 
    local letter = "[^" .. join[script] .. nukta .. "][" .. nukta .. "]?"
    local letter_pair = "(" .. letter .. ")(" .. letter .. ")"

    for word in mw.ustring.gmatch(text, "[aāiīuūeoṃkhgṅcjñṭḍṇtdnpbmyrlḷvs]+") do
        local word_conv, orig_word = {}, word
        word = gsub(word, "([aāiīuūeo]ṃ?)", "%1 ")
        word = gsub(word, " $", "")

        for syllable in mw.text.gsplit(word, " ") do
            if not match(syllable, "[aāiīuūeoṃ]$") then syllable = syllable .. "a" .. kill[script] end
            syllable = gsub(syllable, "^([khgṅcjñṭḍṇtdnpbmyrlḷvs]*)([aāiīuūeo])(ṃ?)([्্៑်්ฺ𑁆຺᩺]?)$", function(onset, vowel, coda, optJoin)
                if onset == "" then
                    onset = vowel
                    vowel = ""
                end
                if not c[script][onset] then
                    onset = gsub(onset, ".h", c[script])
                    onset = gsub(onset, ".", c[script])
                    -- Join pairs of consonants
                    onset = gsub(onset, letter_pair, "%1" .. join[script] .. "%2")
                    -- Join adjacent consonants that were in different pairs.
                    onset = gsub(onset, letter_pair, "%1" .. join[script] .. "%2")
                else
                    onset = c[script][onset]
                end

                return onset .. (v[script][vowel] or return_error(vowel)) .. c[script][coda] .. optJoin
            end)

            table.insert(word_conv, syllable)
        end
        word = table.concat(word_conv, "")
        if script == "Thai" then
            word = gsub(word, "(.)([เโ])", "%2%1")
        elseif script == "Mymr" then
            word = gsub(word, "င္", "င်္")
            word = gsub(word, "(င်္)([ခဂငဒပဝ])(ေ?)ာ", "%1%2%3ါ")
            word = gsub(word, "္[ယရ]", {["္ယ"] = "ျ", ["္ရ"] = "ြ"}) -- these not need tall aa
            word = gsub(word, "^([ခဂငဒပဝ])(ေ?)ာ", "%1%2ါ")
            word = gsub(word, "([^္])([ခဂငဒပဝ])(ေ?)ာ", "%1%2%3ါ")
            word = gsub(word, "([ခဂငဒပဝ])(္[က-အဿ])(ေ?)ာ", "%1%2%3ါ")
            word = gsub(word, "္[ဝဟ]", {["္ဝ"] = "ွ", ["္ဟ"] = "ှ"})
            word = gsub(word, "ဉ္ဉ", "ည")
            word = gsub(word, "သ္သ", "ဿ")
            if not (options and options.variation) then
                -- Arg options should be optional, so nothing to do. 
            elseif options.variation == "1" then
                word = gsub(word, ".", variations.Mon)
                word = gsub(word, "ိံ", "ီ") -- fix IM
            elseif options.variation == "2" then
                word = gsub(word, ".", variations.OldShan)
            elseif options.variation == "3" then
                word = gsub(word, ".", variations.OldShan)
                word = gsub(word, ".", variations.NewShan)
                word = gsub(word, "်" .. "်", "်") -- fix nga
            end
        elseif script == "Lana" then
            word = gsub(word, "ᨦ᩠", "ᩘ")
            word = gsub(word, "^([ᨣᨴᨵᨷᩅ])(ᩮ?)ᩣ", "%1%2ᩤ")
            word = gsub(word, "([^᩠])([ᨣᨴᨵᨷᩅ])(ᩮ?)ᩣ", "%1%2%3ᩤ")
            word = gsub(word, "([ᨣᨴᨵᨷᩅ])(᩠[ᨠ-ᩌᩔ])(ᩮ?)ᩣ", "%1%2%3ᩤ")
            word = gsub(word, "᩠[ᩁᩃ]", {["᩠ᩁ"] = "ᩕ", ["᩠ᩃ"] = "ᩖ"})
            word = gsub(word, "([ᨭ-ᨱ])᩠ᨮ", "%1ᩛ")
            word = gsub(word, "([ᨷ-ᨾ])᩠ᨻ", "%1ᩛ")
            word = gsub(word, "ᩈ᩠ᩈ", "ᩔ")
        elseif script == "Beng" then
            word = gsub(word, "ৰ্", "ৰ" .. u(0x200d) .. "্") -- ৰ্(v-) needs ZWJ to display correctly
        elseif script == "Sinh" then
            local js = join["Sinh"]
            word = gsub(word, "(" .. js .. ")([යර])", u(0xdca, 0x200d) .. "%2")
            word = gsub(word, "[කතන]" .. js .. "[ථදධව]", sinh_cjct)
        elseif script == "Laoo" then
            word = gsub(word, "(.)([ເໂ])", "%2%1")
        end
        text = gsub(text, orig_word, word, 1)
    end
    local impl = options and options.impl or "yes"
    if impl == "no" then text = export.mono_form(text, script) end
    return text
end

return export
