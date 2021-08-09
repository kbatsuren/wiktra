local export = {}
local gsub = mw.ustring.gsub
local sub = mw.ustring.sub
local match = mw.ustring.match

local system_list = {{1, ["type"] = "phonetic", ["name"] = "IPA"}, {2, ["type"] = "orthographic", ["name"] = "MLCTS"}, {3, ["type"] = "orthographic", ["name"] = "ALA-LC"}, {4, ["type"] = "phonetic", ["name"] = "BGN/PCGN"}, {5, ["type"] = "phonetic", ["name"] = "Okell"}}

local initial_table = {
    ["က"] = {"k", "k", "k", "k", "k"},
    ["ကျ"] = {"t͡ɕ", "ky", "ky", "ky", "c"},
    ["ကြ"] = {"t͡ɕ", "kr", "kr", "ky", "c"},
    ["ကျွ"] = {"t͡ɕw", "kyw", "kyv", "kyw", "cw"},
    ["ကြွ"] = {"t͡ɕw", "krw", "krv", "kyw", "cw"},
    ["ကွ"] = {"kw", "kw", "kv", "kw", "kw"},
    ["ခ"] = {"kʰ", "hk", "kh", "hk", "hk"},
    ["ချ"] = {"t͡ɕʰ", "hky", "khy", "ch", "hc"},
    ["ခြ"] = {"t͡ɕʰ", "hkr", "khr", "ch", "hc"},
    ["ချွ"] = {"t͡ɕʰw", "hkyw", "khyv", "chw", "hcw"},
    ["ခြွ"] = {"t͡ɕʰw", "hkrw", "khrv", "chw", "hcw"},
    ["ခွ"] = {"kʰw", "hkw", "khv", "hkw", "hkw"},
    ["ဂ"] = {"ɡ", "g", "g", "g", "g"},
    ["ဂျ"] = {"d͡ʑ", "gy", "gy", "gy", "j"},
    ["ဂြ"] = {"d͡ʑ", "gr", "gr", "gy", "j"},
    ["ဂျွ"] = {"d͡ʑw", "gyw", "gyv", "gyw", "jw"},
    ["ဂွ"] = {"ɡw", "gw", "gv", "gw", "gw"},
    ["ဃ"] = {"ɡ", "gh", "gh", "g", "g"},
    ["င"] = {"ŋ", "ng", "ṅ", "ng", "ng"},
    ["ငှ"] = {"ŋ̊", "hng", "ṅh", "hng", "hng"},
    ["ငြ"] = {"ɲ", "ngr", "ṅr", "ny", "ny"},
    ["ငြှ"] = {"ɲ̊", "hngr", "ṅrh", "hny", "hny"},
    ["ငွ"] = {"ŋw", "ngw", "ṅv", "ngw", "ngw"},
    ["ငွှ"] = {"ŋ̊w", "hngw", "ṅvh", "hngw", "hngw"},
    ["စ"] = {"s", "c", "c", "s", "s"},
    ["စွ"] = {"sw", "cw", "cv", "sw", "sw"},
    ["ဆ"] = {"sʰ", "hc", "ch", "hs", "hs"},
    ["ဆွ"] = {"sʰw", "hcw", "chv", "hsw", "hsw"},
    ["ဇ"] = {"z", "j", "j", "z", "z"},
    ["ဇွ"] = {"zw", "jw", "jv", "zw", "zw"},
    ["ဈ"] = {"z", "jh", "jh", "z", "z"},
    ["ဉ"] = {"ɲ", "ny", "ñ", "ny", "ny"},
    ["ည"] = {"ɲ", "ny", "ññ", "ny", "ny"},
    ["ဉှ"] = {"ɲ̊", "hny", "ñh", "hny", "hny"},
    ["ညှ"] = {"ɲ̊", "hny", "ññh", "hny", "hny"},
    ["ညွ"] = {"ɲw", "nyw", "ñv", "nyw", "nyw"},
    ["ညွှ"] = {"ɲ̊w", "hnyw", "ñvh", "hnyw", "hnyw"},
    ["ဋ"] = {"t", "t", "ṭ", "t", "t"},
    ["ဌ"] = {"tʰ", "ht", "ṭh", "ht", "ht"},
    ["ဍ"] = {"d", "d", "ḍ", "d", "d"},
    ["ဎ"] = {"d", "dh", "ḍh", "d", "d"},
    ["ဏ"] = {"n", "n", "ṇ", "n", "n"},
    ["ဏှ"] = {"n̥", "hn", "ṇh", "hn", "hn"},
    ["တ"] = {"t", "t", "t", "t", "t"},
    ["တျ"] = {"tj", "ty", "ty", "ty", "ty"},
    ["တြ"] = {"tɹ", "tr", "tr", "tr", "tr"},
    ["တွ"] = {"tw", "tw", "tv", "tw", "tw"},
    ["ထ"] = {"tʰ", "ht", "th", "ht", "ht"},
    ["ထွ"] = {"tʰw", "htw", "thv", "htw", "htw"},
    ["ဒ"] = {"d", "d", "d", "d", "d"},
    ["ဒျ"] = {"dj", "dy", "dy", "dy", "dy"},
    ["ဒြ"] = {"dɹ", "dr", "dr", "dr", "dr"},
    ["ဒွ"] = {"dw", "dw", "dv", "dw", "dw"},
    ["ဓ"] = {"d", "dh", "dh", "d", "d"},
    ["န"] = {"n", "n", "n", "n", "n"},
    ["နှ"] = {"n̥", "hn", "nh", "hn", "hn"},
    ["နျ"] = {"nj", "ny", "ny", "ny", "ny"},
    ["နွ"] = {"nw", "nw", "nv", "nw", "nw"},
    ["နွှ"] = {"n̥w", "hnw", "nvh", "hnw", "hnw"},
    ["ပ"] = {"p", "p", "p", "p", "p"},
    ["ပျ"] = {"pj", "py", "py", "py", "py"},
    ["ပြ"] = {"pj", "pr", "pr", "py", "py"},
    ["ပြွ"] = {"pw", "prw", "prv", "pw", "pw"},
    ["ပွ"] = {"pw", "pw", "pv", "pw", "pw"},
    ["ဖ"] = {"pʰ", "hp", "ph", "hp", "hp"},
    ["ဖျ"] = {"pʰj", "hpy", "phy", "hpy", "hpy"},
    ["ဖြ"] = {"pʰj", "hpr", "phr", "hpy", "hpy"},
    ["ဖွ"] = {"pʰw", "hpw", "phv", "hpw", "hpw"},
    ["ဗ"] = {"b", "b", "b", "b", "b"},
    ["ဗျ"] = {"bj", "by", "by", "by", "by"},
    ["ဗြ"] = {"bj", "br", "br", "by", "by"},
    ["ဗွ"] = {"bw", "bw", "bv", "bw", "bw"},
    ["ဘ"] = {"b", "bh", "bh", "b", "b"},
    ["-ဘ"] = {"pʰ", "bh", "bh", "hp", "hp"},
    ["ဘွ"] = {"bw", "bhw", "bhv", "bw", "bw"},
    ["-ဘွ"] = {"pʰw", "bhw", "bhw", "hpw", "hpw"},
    ["မ"] = {"m", "m", "m", "m", "m"},
    ["မှ"] = {"m̥", "hm", "mh", "hm", "hm"},
    ["မျ"] = {"mj", "my", "my", "my", "my"},
    ["မျှ"] = {"m̥j", "hmy", "myh", "hmy", "hmy"},
    ["မြ"] = {"mj", "mr", "mr", "my", "my"},
    ["မြှ"] = {"m̥j", "hmr", "mrh", "hmy", "hmy"},
    ["မြွ"] = {"mjw", "mrw", "mrv", "myw", "myw"},
    ["မြွှ"] = {"m̥w", "hmrw", "mrvh", "hmw", "hmw"},
    ["မွ"] = {"mw", "mw", "mv", "mw", "mw"},
    ["မွှ"] = {"m̥w", "hmw", "mvh", "hmw", "hmw"},
    ["ယ"] = {"j", "y", "y", "y", "y"},
    ["ယှ"] = {"ʃ", "hy", "yh", "sh", "hy"},
    ["သျှ"] = {"ʃ", "hsy", "syh", "sh", "hy"},
    ["ယွ"] = {"jw", "yw", "yv", "yw", "yw"},
    ["ရ"] = {"j", "r", "r", "y", "y"},
    ["*ရ"] = {"ɹ", "r", "r", "r", "r"},
    ["ရှ"] = {"ʃ", "hr", "rh", "sh", "hy"},
    ["ရွ"] = {"jw", "rw", "rv", "yw", "yw"},
    ["ရွှ"] = {"ʃw", "hrw", "rvh", "shw", "hyw"},
    ["လ"] = {"l", "l", "l", "l", "l"},
    ["လှ"] = {"l̥", "hl", "lh", "hl", "hl"},
    ["လျ"] = {"j", "ly", "ly", "y", "y"},
    ["+သျှ"] = {"j", "hsy", "syh", "y", "y"},
    ["*လျ"] = {"lj", "ly", "ly", "ly", "ly"},
    ["လျှ"] = {"ʃ", "hly", "lyh", "sh", "hy"},
    ["*လျှ"] = {"l̥j", "hly", "lyh", "hly", "hly"},
    ["လွ"] = {"lw", "lw", "lv", "lw", "lw"},
    ["လွှ"] = {"l̥w", "hlw", "lvh", "hlw", "hlw"},
    ["ဝ"] = {"w", "w", "v", "w", "w"},
    ["ဝှ"] = {"ʍ", "hw", "vh", "hw", "hw"},
    ["သ"] = {"θ", "s", "s", "th", "th"},
    ["+သ"] = {"ð", "s", "s", "dh", "th"},
    ["သွ"] = {"θw", "sw", "sv", "thw", "thw"},
    ["+သွ"] = {"ðw", "sw", "sw", "dhw", "thw"},
    ["ဟ"] = {"h", "h", "h", "h", "h"},
    ["ဟွ"] = {"hw", "hw", "hv", "hw", "hw"},
    ["ဠ"] = {"l", "l", "ḷ", "l", "l"},
    ["အ"] = {"ʔ", "", "ʼ", "", ""},
    -- only appears after a vowel in the same word
    ["ဿ"] = {"ʔθ", "ss", "ss", "tth", "ʔth"},
    [""] = {"ʔ", "", "", "", ""},
    ["-"] = {"", "", "", "", ""},

    ["ျ"] = {nil, "y", "y", nil, nil},
    ["ြ"] = {nil, "r", "r", nil, nil},
    ["ွ"] = {nil, "w", "w", nil, nil}
}

local initial_voicing = {["+က"] = "ဂ", ["+ခ"] = "ဂ", ["+စ"] = "ဇ", ["+ဆ"] = "ဇ", ["+ဋ"] = "ဍ", ["+ဌ"] = "ဍ", ["+တ"] = "ဒ", ["+ထ"] = "ဒ", ["+ပ"] = "ဗ", ["+ဖ"] = "ဗ", ["-ဘ"] = "ဖ"}

local final_table = {
    [""] = {"a̰", "a.", "a", "a.", "á"},
    ["က်"] = {"ɛʔ", "ak", "akʻ", "et", "eʔ"},
    ["င်"] = {"ɪ̀ɴ", "ang", "aṅʻ", "in", "iñ"},
    ["စ်"] = {"ɪʔ", "ac", "acʻ", "it", "iʔ"},
    ["ည်"] = {"ì", "any", "aññʻ", "i", "i"},
    ["ည်2"] = {"è", "any", "aññʻ", "e", "ei"},
    ["ည်3"] = {"ɛ̀", "any", "aññʻ", "è", "e"},
    ["ဉ်"] = {"ɪ̀ɴ", "any", "añʻ", "in", "iñ"},
    ["တ်"] = {"aʔ", "at", "atʻ", "at", "aʔ"},
    ["န်"] = {"àɴ", "an", "anʻ", "an", "añ"},
    ["ပ်"] = {"aʔ", "ap", "apʻ", "at", "aʔ"},
    ["မ်"] = {"àɴ", "am", "amʻ", "an", "añ"},
    ["ယ်"] = {"ɛ̀", "ai", "ayʻ", "è", "e"},
    ["ံ"] = {"àɴ", "am", "aṃ", "an", "añ"},
    ["ာ"] = {"à", "a", "ā", "a", "a"},
    ["ါ"] = {"à", "a", "ā", "a", "a"},
    ["ိ"] = {"ḭ", "i.", "i", "i.", "í"},
    ["ိတ်"] = {"eɪʔ", "it", "itʻ", "eik", "eiʔ"},
    ["ိန်"] = {"èɪɴ", "in", "inʻ", "ein", "eiñ"},
    ["ိပ်"] = {"eɪʔ", "ip", "ipʻ", "eik", "eiʔ"},
    ["ိမ်"] = {"èɪɴ", "im", "imʻ", "ein", "eiñ"},
    ["ိံ"] = {"èɪɴ", "im", "iṃ", "ein", "eiñ"},
    ["ီ"] = {"ì", "i", "ī", "i", "i"},
    ["ု"] = {"ṵ", "u.", "u", "u.", "ú"},
    ["ုတ်"] = {"oʊʔ", "ut", "utʻ", "ok", "ouʔ"},
    ["ုန်"] = {"òʊɴ", "un", "unʻ", "on", "ouñ"},
    ["ုပ်"] = {"oʊʔ", "up", "upʻ", "ok", "ouʔ"},
    ["ုမ်"] = {"òʊɴ", "um", "umʻ", "on", "ouñ"},
    ["ုံ"] = {"òʊɴ", "um", "uṃ", "on", "ouñ"},
    ["ူ"] = {"ù", "u", "ū", "u", "u"},
    ["ေ"] = {"è", "e", "e", "e", "ei"},
    ["ဲ"] = {"ɛ́", "ai:", "ai", "è:", "è"},
    ["ော"] = {"ɔ́", "au:", "o", "aw:", "ò"},
    ["ောက်"] = {"aʊʔ", "auk", "okʻ", "auk", "auʔ"},
    ["ောင်"] = {"àʊɴ", "aung", "oṅʻ", "aung", "auñ"},
    ["ော်"] = {"ɔ̀", "au", "oʻ", "aw", "o"},
    ["ို"] = {"ò", "ui", "ui", "o", "ou"},
    ["ိုက်"] = {"aɪʔ", "uik", "uikʻ", "aik", "aiʔ"},
    ["ိုင်"] = {"àɪɴ", "uing", "uiṅʻ", "aing", "aiñ"},
    ["ွတ်"] = {"ʊʔ", "wat", "vatʻ", "ut", "uʔ"},
    ["ွန်"] = {"ʊ̀ɴ", "wan", "vanʻ", "un", "uñ"},
    ["ွပ်"] = {"ʊʔ", "wap", "vapʻ", "ut", "uʔ"},
    ["ွမ်"] = {"ʊ̀ɴ", "wam", "vamʻ", "un", "uñ"},
    ["ွံ"] = {"ʊ̀ɴ", "wam", "vaṃ", "un", "uñ"},
    ["'"] = {"ə", "a", "a", "ă", "ă"},
    ["်"] = {"", "", "ʻ", "", ""}
}

local nucleus_table = {[""] = {"à", "a", "a", "a", "a"}, ["ိ"] = {"ì", "i", "i", "i", "i"}, ["ု"] = {"ù", "u", "u", "u", "u"}, ["ော"] = {"ɔ̀", "au", "o", "aw", "o"}, ["ေါ"] = {"ɔ̀", "au", "o", "aw", "o"}, ["ွ"] = {"ʊ̀", "wa", "va", "u", "u"}}

local indep_letter_table = {["ဣ"] = {"ḭ", "i.", "i", "i.", "í"}, ["ဤ"] = {"ì", "i", "ī", "i", "i"}, ["ဥ"] = {"ṵ", "u.", "u", "u.", "ú"}, ["ဦ"] = {"ù", "u", "ū", "u", "u"}, ["ဧ"] = {"è", "e", "e", "e", "ei"}, ["၏"] = {"ɛ̰", "e", "e*", "è.", "é"}, ["ဩ"] = {"ɔ́", "au:", "o", "aw:", "ò"}, ["ဪ"] = {"ɔ̀", "au", "oʻ", "aw", "o"}, ["၌"] = {"n̥aɪʔ", "hnai.", "n*", "hnaik", "hnaiʔ"}, ["၍"] = {"jwḛ", "rwe", "r*", "ywe.", "yweí"}}

local tone_table = {["း"] = {"́", ":", "ʺ", ":", "̀"}, ["့"] = {"̰", ".", "ʹ", ".", "́"}}

local ambig_intersyl = {[1] = {}, [2] = {["ky"] = 1, ["kr"] = 1, ["kw"] = 1, ["gy"] = 1, ["gr"] = 1, ["gw"] = 1, ["ng"] = 1, ["ny"] = 1, ["cw"] = 1, ["tw"] = 1, ["nw"] = 1, ["py"] = 1, ["pr"] = 1, ["pw"] = 1, ["my"] = 1, ["mr"] = 1, ["mw"] = 1}, [3] = {}, [4] = {["ky"] = 1, ["kr"] = 1, ["kw"] = 1, ["gy"] = 1, ["gr"] = 1, ["gw"] = 1, ["ng"] = 1, ["ny"] = 1, ["cw"] = 1, ["tw"] = 1, ["nw"] = 1, ["tr"] = 1, ["tw"] = 1, ["py"] = 1, ["pr"] = 1, ["pw"] = 1, ["my"] = 1, ["mr"] = 1, ["mw"] = 1}, [5] = {["ou"] = 1}}

local reverse_table = {
    ["hm"] = "မှ",
    ["m"] = "မ",
    ["hn"] = "နှ",
    ["n"] = "န",
    ["hny"] = "ညှ",
    ["ny"] = "ည",
    ["hng"] = "ငှ",
    ["ng"] = "င",
    ["p"] = "ပ",
    ["hp"] = "ဖ",
    ["b"] = "ဗ",
    ["t"] = "တ",
    ["ht"] = "ထ",
    ["d"] = "ဒ",
    ["c"] = "ကျ",
    ["hc"] = "ချ",
    ["j"] = "ဂျ",
    ["k"] = "က",
    ["hk"] = "ခ",
    ["g"] = "ဂ",
    [""] = "အ",
    ["th"] = "သ",
    ["+th"] = "+သ",
    ["s"] = "စ",
    ["hs"] = "ဆ",
    ["z"] = "ဇ",
    ["hy"] = "ရှ",
    ["h"] = "ဟ",
    ["r"] = "*ရ",
    ["y"] = "ယ",
    ["hw"] = "ဝှ",
    ["w"] = "ဝ",
    ["hl"] = "လှ",
    ["l"] = "လ",
    ["hmw"] = "မွှ",
    ["mw"] = "မွ",
    ["hmy"] = "မျှ",
    ["my"] = "မျ",
    ["hnw"] = "နွှ",
    ["nw"] = "နွ",
    ["hnyw"] = "ညွှ",
    ["nyw"] = "ညွ",
    ["hngw"] = "ငွှ",
    ["ngw"] = "ငွ",
    ["pw"] = "ပွ",
    ["hpw"] = "ဖွ",
    ["bw"] = "ဗွ",
    ["py"] = "ပျ",
    ["hpy"] = "ဖျ",
    ["by"] = "ဗျ",
    ["tw"] = "တွ",
    ["htw"] = "ထွ",
    ["dw"] = "ဒွ",
    ["cw"] = "ကျွ",
    ["hcw"] = "ချွ",
    ["jw"] = "ဂျွ",
    ["kw"] = "ကွ",
    ["hkw"] = "ခွ",
    ["gw"] = "ဂွ",
    ["thw"] = "သွ",
    ["sw"] = "စွ",
    ["hsw"] = "ဆွ",
    ["zw"] = "ဇွ",
    ["hyw"] = "ရွှ",
    ["hw"] = "ဟွ",
    ["yw"] = "ယွ",
    ["hlw"] = "လွှ",
    ["lw"] = "လွ",
    ["hly"] = "*လျှ",
    ["ly"] = "*လျ",

    ["i"] = "ီ",
    ["i\\"] = "ီး",
    ["i/"] = "ိ",
    ["i?"] = "စ်",
    ["i~"] = "င်",
    ["i\\~"] = "င်း",
    ["i/~"] = "င့်",
    ["ei"] = "ေ",
    ["ei\\"] = "ေး",
    ["ei/"] = "ေ့",
    ["ei?"] = "ိတ်",
    ["ei~"] = "ိန်",
    ["ei\\~"] = "ိန်း",
    ["ei/~"] = "ိန့်",
    ["e"] = "ယ်",
    ["e\\"] = "ဲ",
    ["e/"] = "ယ့်",
    ["e?"] = "က်",
    ["ai~"] = "ိုင်",
    ["ai\\~"] = "ိုင်း",
    ["ai/~"] = "ိုင့်",
    ["ai?"] = "ိုက်",
    ["a"] = "ာ",
    ["a\\"] = "ား",
    ["a/"] = "",
    ["a?"] = "တ်",
    ["a~"] = "န်",
    ["a\\~"] = "န်း",
    ["a/~"] = "န့်",
    ["o"] = "ော်",
    ["o\\"] = "ော",
    ["o/"] = "ော့",
    ["au?"] = "ောက်",
    ["au~"] = "ောင်",
    ["au\\~"] = "ောင်း",
    ["au/~"] = "ောင့်",
    ["ou"] = "ို",
    ["ou\\"] = "ိုး",
    ["ou/"] = "ို့",
    ["ou?"] = "ုပ်",
    ["ou~"] = "ုန်",
    ["ou\\~"] = "ုန်း",
    ["ou/~"] = "ုန့်",
    ["u"] = "ူ",
    ["u\\"] = "ူး",
    ["u/"] = "ု",
    ["u?"] = "ွတ်",
    ["u~"] = "ွန်",
    ["u\\~"] = "ွန်း",
    ["u/~"] = "ွန့်",
    ["a'"] = "'"
}

local repl_string = "([ကခဂဃငစဆဇဈဉညဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသဟဠအဿ][ျြွှ]*[ံ့းွာါါိီုူေဲ]*)([ကခဂဃငစဆဇဈဉညဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသဟဠအဿ][့]?[^့်္])"

function syllabify(text)
    text = gsub(text, "('?)([%+%-%*]*)", function(a, b) if a .. b ~= "" then return a .. " " .. b end end)

    text = gsub(text, "([ဣဤဥဦဧဩဪ၏၌၍][့း်]?)(.?)(.?)", function(a, b, c) return (c == "္" and " " .. a .. b .. " " .. c or (c == "်" and " " .. a .. b .. c or " " .. a .. " " .. b .. c)) end) .. " "

    text = gsub(text, "(်း?'?)", "%1 ")
    text = gsub(text, "([း့])([ကခဂဃငစဆဇဈဉညဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသဟဠအ]်)", "%2%1")

    while match(text, repl_string) do text = gsub(text, repl_string, "%1 %2") end

    text = gsub(text, "္", " , ")
    text = gsub(text, " +", " ")
    text = gsub(text, "^ ?(.*[^ ]) ?$", "%1")
    text = gsub(text, " , ", " ")
    text = gsub(text, " ([23])", "%1")
    return text
end

function initial_by_char(initial_string, system_index, ref_table)
    local initial_set = {}
    for character in mw.text.gsplit(initial_string, "") do
        local temp_initial = ref_table[character] or error("Initial data not found.")
        table.insert(initial_set, temp_initial[system_index] or temp_initial)
    end
    return table.concat(initial_set)
end

function generate_respelling(text)
    text = gsub(text, " ", " 　 ")
    text = gsub(text, "ါ", "ာ")
    if match(text, "[က-႟ꩠ-ꩻ]") then return text end
    text = gsub(text, "(%+?)([^%?%+'/\\~aeiou　]*)(/?)([%?'/\\~aeiou]+)", function(voicing_mark, latin_initial, opt_sep, latin_final) return voicing_mark .. (reverse_table[latin_initial] or initial_by_char(latin_initial, nil, reverse_table)) .. opt_sep .. reverse_table[latin_final] end)
    return text
end

function process(initial, final, tone, schwa, system, system_index)
    if match(initial .. final, "ွှ?[တနပမံ]") and system["type"] == "phonetic" then
        initial = gsub(initial, "[ွ/]", "")
        final = "ွ" .. final
    else
        initial = gsub(initial, "/", "")
    end

    initial_new = system["type"] == "phonetic" and gsub(initial, "%+.", initial_voicing) or initial

    if indep_letter_table[initial_new] then
        initial_new = match(initial_new, "[၌၍]") and "-" or ""
        final = initial .. final
    end
    if initial_new == "မြွ" then require("debug").track("my-pron/mrw") end

    initial_data = initial_table[initial_new] or initial_table[gsub(initial_new, "[%+%-%*]", "")] or (system["type"] == "orthographic" and initial_by_char(initial_new, system_index, initial_table) or error("Initial data not found."))

    initial_value = initial_data[system_index] or initial_data

    if match(initial, "^%+") and system_index == 5 then
        initial_value = initial_table[gsub(initial, "%+", "")][system_index]
        initial_value = gsub(initial_value, "^([^rwy]+)", "<u>%1</u>")
    end

    final_data = final_table[system["type"] .. schwa == "phonetic'" and schwa or final] or (system["type"] == "phonetic" and (final_table[final .. "်"] or indep_letter_table[final]) or indep_letter_table[final]) or gsub(final, "^([^်]*)([^်])(်?)$", function(first, second, third)
        first_data = nucleus_table[first] or final_table[first] or indep_letter_table[first] or first
        second_data = initial_table[second] or second
        first = first_data ~= first and first_data[system_index] or first
        second = second_data ~= second and second_data[system_index] .. ((system_index == 3 and third ~= "") and "ʻ" or "") or second
        return (gsub(first .. second, "([%.:])(.*)", "%2"))
    end)

    final_value = type(final_data) == "table" and final_data[system_index] or final_data
    final_value = mw.ustring.toNFD(final_value)
    if tone == "" then
        tone_value = ""
    else
        if system_index ~= 4 then final_value = gsub(final_value, "̀", "") end
        final_value = gsub(final_value, "[́:%.]", "")
        if system["type"] .. schwa == "phonetic'" then
            tone_value = ""
        else
            tone_data = tone_table[tone] or error("Tone data not found.")
            tone_value = tone_data[system_index]
        end
    end

    if system_index == 1 then
        final_value = gsub(final_value, "^([aeəɛiɪoɔuʊ])", "%1" .. tone_value)
    elseif system_index == 5 then
        final_value = gsub(final_value, "([aeiou])([^aeiou]*)$", "%1" .. tone_value .. "%2")
    else
        final_value = final_value .. tone_value
    end

    return mw.ustring.toNFC(initial_value .. final_value)
end

function remove_wide_space(text) return (gsub(text, "　", "")) end

function concatenate(set, system_index)
    if system_index == 1 then return remove_wide_space(table.concat(set)) end
    result_text = remove_wide_space(table.concat(set, " "))

    for count = 1, 3 do
        result_text = gsub(result_text, "(.) (.)([^ ]?)", function(previous, next, after_next)
            if ambig_intersyl[system_index][previous .. next] or ((system_index == 2 or system_index == 4) and (match(previous .. " " .. next, "[ptkgmngy] [aeiou]") or (match(previous .. next .. after_next, "[aeiou][ptkmn][rwyg]") and not match(after_next, "[aeiou]")))) then
                return previous .. "-" .. next .. after_next
            else
                return previous .. next .. after_next
            end
        end)
    end

    return result_text
end

function export.get_romanisation(word, pronunciations, system, system_index, mode)
    local sentences = {}
    word = gsub(word, " ", "|")
    if system["type"] == "phonetic" then word = gsub(word, "ဿ", "တ်သ") end
    word = syllabify(word)
    word = gsub(word, "ါ", "ာ")
    if system["type"] == "phonetic" then word = gsub(word, "ဝ([တနပမံ])", "ဝွ%1") end
    for phrase in mw.text.gsplit(word, "|", true) do
        local temp = {}
        local syllable = mw.text.split(phrase, " ", true)
        for syllable_index = 1, #syllable do
            syllable[syllable_index] = gsub(syllable[syllable_index], "([း့])(်)", "%2%1")
            temp[syllable_index] = gsub(syllable[syllable_index], "^([%+%-%*]*[ကခဂဃငစဆဇဈဉညဋဌဍဎဏတထဒဓနပဖဗဘမယရလဝသဟဠအဣဤဥဦဧဩဪ၏၌၍ဿ][ျြ]?ွ?ှ?/?)([^း့']*)([း့]?)('?)$", function(initial, final, tone, schwa) return process(initial, final, tone, schwa, system, system_index) end)
        end
        table.insert(sentences, concatenate(temp, system_index))
    end
    if mode == "translit_module" then return table.concat(sentences, " ") end
    table.insert(pronunciations[system_index], table.concat(sentences, " "))
    return pronunciations[system_index]
end

function respelling_format(phonetic, page_title)
    local page_title_set = mw.text.split(syllabify(page_title), " ")
    local new_respellings = {}
    for _, respelling in ipairs(phonetic) do
        local respelling_set = mw.text.split(syllabify(respelling), " ")
        if gsub(table.concat(respelling_set), "[%+%-%*']", "") == (gsub(table.concat(page_title_set), "ါ", "ာ")) then for index, element in ipairs(respelling_set) do if element ~= page_title_set[index] then respelling_set[index] = "<span style=\"font-size:110%; color:#A32214; font-weight: bold\">" .. element .. "</span>" end end end
        table.insert(new_respellings, table.concat(respelling_set))
    end
    text = table.concat(new_respellings, ", ")
    text = remove_wide_space(text)
    text = gsub(text, "[%+%-].", initial_voicing)
    text = gsub(text, "([ခဂငဒပဝ]ေ?)ာ", "%1ါ")
    return text
end

function export.generate_tests(word, respelling)
    respelling, word = generate_respelling(respelling), generate_respelling(word)
    local pronunciations = {[1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}}
    local p, result = {["orthographic"] = word, ["phonetic"] = respelling or word}, {}

    table.sort(system_list, function(first, second) return first[1] < second[1] end)
    for system_index, system in ipairs(system_list) do pronunciations[system_index] = export.get_romanisation(p[system["type"]], pronunciations, system, system_index) end
    for system_index = 1, 5 do table.insert(result, table.concat(pronunciations[system_index])) end
    return (gsub(gsub(table.concat(result, " | "), "<u>", "("), "</u>", ")"))
end

function export.make(frame)
    local args = frame:getParent().args
    local page_title = mw.title.getCurrentTitle().text
    local title = generate_respelling(args["word"] or page_title)

    local p, result = {["orthographic"] = {title}, ["phonetic"] = {}}, {}
    local pronunciations = {[1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}}

    if not args[1] then args = {title} end
    for index, item in ipairs(args) do table.insert(p["phonetic"], (item ~= "") and generate_respelling(item) or nil) end

    table.sort(system_list, function(first, second) return first[1] < second[1] end)
    for system_index, system in ipairs(system_list) do for _, word in ipairs(p[system["type"]]) do pronunciations[system_index] = export.get_romanisation(word, pronunciations, system, system_index) end end

    if title ~= table.concat(args) then table.insert(result, "* Phonetic respelling" .. (#p["phonetic"] > 1 and "s" or "") .. ": " .. tostring(mw.html.create("span"):attr("lang", "my"):attr("class", "Mymr"):wikitext(respelling_format(p["phonetic"], page_title))) .. "\n") end

    table.insert(result, "* [[Wiktionary:International Phonetic Alphabet|IPA]]" .. "<sup>([[Appendix:Burmese pronunciation|key]])</sup>: " .. (tostring(mw.html.create("span"):attr("class", "IPA"):wikitext("/" .. gsub(table.concat(pronunciations[1], "/, /"), "ʔʔ", "ʔ.ʔ") .. "/"))) .. "\n* [[Wiktionary:Burmese transliteration|Romanization:]] ")

    for system_index = 2, 5 do table.insert(result, (system_index ~= 2 and " • " or "") .. "''" .. system_list[system_index]["name"] .. ":'' " .. table.concat(pronunciations[system_index], "/")) end

    return table.concat(result)
end

return export
