local export = {}

local gsub = mw.ustring.gsub
local sub = mw.ustring.sub
local match = mw.ustring.match
local find = mw.ustring.find

local failed_cat = "[[Category:Entries with failed Isan transliterations]]"
local namespace = mw.title.getCurrentTitle().nsText
local Thai_range = "[ก-๛]"
local categories = {}

local systems = {["paiboon"] = 1, ["royin"] = 2, ["ipa"] = 3, ["charPhon"] = 4, ["homophone"] = 5, ["file"] = 6}

local initial = {
    ["ก"] = {"g", "k", "k", class = "mid"},
    ["จ"] = {"j", "ch", "t͡ɕ", class = "mid"},
    ["ด"] = {"d", "d", "d", class = "mid"},
    ["ฎ"] = {"d", "d", "d", class = "mid"},
    ["ฏ"] = {"dt", "t", "t", class = "mid"},
    ["ต"] = {"dt", "t", "t", class = "mid"},
    ["บ"] = {"b", "b", "b", class = "mid"},
    ["ป"] = {"bp", "p", "p", class = "mid"},
    ["อ"] = {"", "@", "ʔ", class = "mid"},

    ["ง"] = {"ng", "$ng", "ŋ", class = "low"},
    ["ณ"] = {"n", "n", "n", class = "low"},
    ["น"] = {"n", "n", "n", class = "low"},
    ["ม"] = {"m", "m", "m", class = "low"},
    ["ญ"] = {"ny", "y", "ɲ", class = "low"},
    ["ย"] = {"ny", "y", "ɲ", class = "low"},
    ["ร"] = {"r", "r", "r", class = "low"},
    ["ล"] = {"l", "l", "l", class = "low"},
    ["ฬ"] = {"l", "l", "l", class = "low"},
    ["ว"] = {"w", "w", "w", class = "low"},

    ["ค"] = {"k", "kh", "kʰ", class = "low"},
    ["ฅ"] = {"k", "kh", "kʰ", class = "low"},
    ["ฆ"] = {"k", "kh", "kʰ", class = "low"},
    ["ข"] = {"k", "kh", "kʰ", class = "high"},
    ["ฃ"] = {"k", "kh", "kʰ", class = "high"},
    ["ช"] = {"s", "ch", "s", class = "low"},
    ["ฌ"] = {"s", "ch", "s", class = "low"},
    ["ฉ"] = {"s", "ch", "s", class = "high"},
    ["ฑ"] = {"t", "th", "tʰ", class = "low"},
    ["ฒ"] = {"t", "th", "tʰ", class = "low"},
    ["ท"] = {"t", "th", "tʰ", class = "low"},
    ["ธ"] = {"t", "th", "tʰ", class = "low"},
    ["ฐ"] = {"t", "th", "tʰ", class = "high"},
    ["ถ"] = {"t", "th", "tʰ", class = "high"},
    ["พ"] = {"p", "ph", "pʰ", class = "low"},
    ["ภ"] = {"p", "ph", "pʰ", class = "low"},
    ["ผ"] = {"p", "ph", "pʰ", class = "high"},
    ["ฟ"] = {"f", "f", "f", class = "low"},
    ["ฝ"] = {"f", "f", "f", class = "high"},
    ["ซ"] = {"s", "s", "s", class = "low"},
    ["ศ"] = {"s", "s", "s", class = "high"},
    ["ษ"] = {"s", "s", "s", class = "high"},
    ["ส"] = {"s", "s", "s", class = "high"},
    ["ฮ"] = {"h", "h", "h", class = "low"},
    ["ห"] = {"h", "h", "h", class = "high"},

    ["หง"] = {"ng", "$ng", "ŋ", class = "high"},
    ["หน"] = {"n", "n", "n", class = "high"},
    ["หม"] = {"m", "m", "m", class = "high"},
    ["หญ"] = {"ny", "y", "ɲ", class = "high"},
    ["หย"] = {"ny", "y", "ɲ", class = "high"},
    ["หร"] = {"r", "r", "r", class = "high"},
    ["หล"] = {"l", "l", "l", class = "high"},
    ["หว"] = {"w", "w", "w", class = "high"},

    ["อย"] = {"y", "y", "j", class = "mid"},

    ["…"] = {"…", "…", "…", class = ""},
    [""] = {failed_cat, failed_cat, "", class = ""}
}

local vowel = {
    ["open"] = {
        ["ะ"] = {"a", "a", "a"},
        [""] = {"a", "a", "a"},
        ["ิ"] = {"i", "i", "i"},
        ["ึ"] = {"ʉ", "ue", "ɯ"},
        ["ุ"] = {"u", "u", "u"},
        ["เะ"] = {"e", "e", "eʔ"},
        ["แะ"] = {"ɛ", "ae", "ɛʔ"},
        ["โะ"] = {"o", "o", "oʔ"},
        ["เาะ"] = {"ɔ", "o", "ɔʔ"},
        ["็"] = {"ɔ", "o", "ɔ"},
        ["เิ"] = {"ə", "oe", "ɤ"},
        ["เอะ"] = {"ə", "oe", "ɤʔ"},
        ["า"] = {"aa", "a", "aː"},
        ["ี"] = {"ii", "i", "iː"},
        ["ู"] = {"uu", "u", "uː"},
        ["ือ"] = {"ʉʉ", "ue", "ɯː"},
        ["เ"] = {"ee", "e", "eː"},
        ["แ"] = {"ɛɛ", "ae", "ɛː"},
        ["โ"] = {"oo", "o", "oː"},
        ["อ"] = {"ɔɔ", "o", "ɔː"},
        ["ร"] = {"ɔɔn", "on", "ɔːn"},
        ["เอ"] = {"əə", "oe", "ɤː"},
        ["เียะ"] = {"ia", "ia", "ia̯ʔ"},
        ["เือะ"] = {"ʉa", "uea", "ɯa̯ʔ"},
        ["ัวะ"] = {"ua", "ua", "ua̯ʔ"},
        ["เีย"] = {"iia", "ia", "ia̯"},
        ["เือ"] = {"ʉʉa", "uea", "ɯa̯"},
        ["ัว"] = {"uua", "ua", "ua̯"},
        ["ิว"] = {"iu", "io", "iw"},
        ["ีว"] = {"iiu", "io", "iːw"},
        ["เ็ว"] = {"eo", "eo", "ew"},
        ["แ็ว"] = {"ɛo", "aeo", "ɛw"},
        ["เา"] = {"ao", "ao", "aw"},
        ["เว"] = {"eeo", "eo", "eːw"},
        ["แว"] = {"ɛɛo", "aeo", "ɛːw"},
        ["าว"] = {"aao", "ao", "aːw"},
        ["เอว"] = {"əəo", "oeu", "ɤːw"}, -- royin inferred
        ["โว"] = {"oow", "ou", "oːw"}, -- royin inferred
        ["เียว"] = {"iao", "iao", "ia̯w"},
        ["ัย"] = {"ai", "ai", "aj"},
        ["ใ"] = {"ai", "ai", "aj"},
        ["ไ"] = {"ai", "ai", "aj"},
        ["ไย"] = {"ai", "ai", "aj"},
        ["ึย"] = {"ʉi", "uei", "ɯj"},
        ["็อย"] = {"ɔi", "oi", "ɔj"},
        ["เิ็ย"] = {"əi", "oei", "ɤj"},
        ["ุย"] = {"ui", "ui", "uj"},
        ["าย"] = {"aai", "ai", "aːj"},
        ["อย"] = {"ɔɔi", "oi", "ɔːj"},
        ["โย"] = {"ooi", "oi", "oːj"},
        ["เย"] = {"əəi", "oei", "ɤːj"},
        ["ูย"] = {"uui", "ui", "uːj"},
        ["วย"] = {"uai", "uai", "ua̯j"},
        ["เือย"] = {"ʉai", "ueai", "ɯa̯j"},
        ["ำ"] = {"am", "am", "am"}
    },
    ["closed"] = {["ั"] = {"a", "a", "a"}, ["รร"] = {"a", "a", "a"}, ["ิ"] = {"i", "i", "i"}, ["ึ"] = {"ʉ", "ue", "ɯ"}, ["ุ"] = {"u", "u", "u"}, ["เ"] = {"ee", "e", "eː"}, ["เ็"] = {"e", "e", "e"}, ["แ็"] = {"ɛ", "ae", "ɛ"}, ["แ"] = {"ɛɛ", "ae", "ɛː"}, [""] = {"o", "o", "o"}, ["็อ"] = {"ɔ", "o", "ɔ"}, ["เิ็"] = {"ə", "oe", "ɤ"}, ["า"] = {"aa", "a", "aː"}, ["ี"] = {"ii", "i", "iː"}, ["ื"] = {"ʉʉ", "ue", "ɯː"}, ["ู"] = {"uu", "u", "uː"}, ["โ"] = {"oo", "o", "oː"}, ["อ"] = {"ɔɔ", "o", "ɔː"}, ["เิ"] = {"əə", "oe", "ɤː"}, ["เอ"] = {"əə", "oe", "ɤː"}, ["เีย"] = {"iia", "ia", "ia̯"}, ["เือ"] = {"ʉʉa", "uea", "ɯa̯"}, ["ว"] = {"uua", "ua", "ua̯"}, ["ไ"] = {"ai", "ai", "aj"}, ["เา"] = {"ao", "ao", "aw"}, ["็อย"] = {"ɔi", "oi", "ɔj"}}
}

local unromLong = {["เีย"] = true, ["เือ"] = true, ["ัว"] = true, ["ว"] = true, ["เือย"] = true, ["วาย"] = true, ["เอว"] = true, ["เียว"] = true}

local liveExc = {["ัย"] = true, ["ใ"] = true, ["ไ"] = true, ["ไย"] = true, ["ุย"] = true, ["วย"] = true, ["็อย"] = true, ["เิ็ย"] = true, ["เา"] = true, ["ิว"] = true, ["เ็ว"] = true, ["แ็ว"] = true, ["ำ"] = true}

-- ย,ว are not included.
-- ห,อ,ฮ can never be c2s.
local coda = {
    ["ก"] = {"k", "k", "k̚"},
    ["ข"] = {"k", "k", "k̚"},
    ["ฃ"] = {"k", "k", "k̚"},
    ["ค"] = {"k", "k", "k̚"},
    ["ฅ"] = {"k", "k", "k̚"},
    ["ฆ"] = {"k", "k", "k̚"},
    ["จ"] = {"t", "t", "t̚"},
    ["ฉ"] = {"t", "t", "t̚"},
    ["ช"] = {"t", "t", "t̚"},
    ["ซ"] = {"t", "t", "t̚"},
    ["ฌ"] = {"t", "t", "t̚"},
    ["ฎ"] = {"t", "t", "t̚"},
    ["ฏ"] = {"t", "t", "t̚"},
    ["ฐ"] = {"t", "t", "t̚"},
    ["ฑ"] = {"t", "t", "t̚"},
    ["ฒ"] = {"t", "t", "t̚"},
    ["ด"] = {"t", "t", "t̚"},
    ["ต"] = {"t", "t", "t̚"},
    ["ถ"] = {"t", "t", "t̚"},
    ["ท"] = {"t", "t", "t̚"},
    ["ธ"] = {"t", "t", "t̚"},
    ["ศ"] = {"t", "t", "t̚"},
    ["ษ"] = {"t", "t", "t̚"},
    ["ส"] = {"s", "s", "s"},
    ["บ"] = {"p", "p", "p̚"},
    ["ป"] = {"p", "p", "p̚"},
    ["ผ"] = {"p", "p", "p̚"},
    ["ฝ"] = {"p", "p", "p̚"},
    ["พ"] = {"p", "p", "p̚"},
    ["ฟ"] = {"p", "p", "p̚"},
    ["ภ"] = {"p", "p", "p̚"},
    ["ง"] = {"ng", "ng$", "ŋ"},
    ["ญ"] = {"n", "n", "n"},
    ["ณ"] = {"n", "n", "n"},
    ["น"] = {"n", "n", "n"},
    ["ร"] = {"n", "n", "n"},
    ["ล"] = {"l", "l", "l"},
    ["ฬ"] = {"n", "n", "n"},
    ["ม"] = {"m", "m", "m"}
}

local tFromMark = {
    -- common
    ["่"] = {["high"] = "high-level", ["mid"] = "high-level", ["low"] = "high-level"},
    ["้"] = {["high"] = "low", ["mid"] = "falling", ["low"] = "falling"},
    ["๊"] = {["high"] = "", ["mid"] = "high-rising", ["low"] = ""},
    ["๋"] = {["high"] = "", ["mid"] = "dipping", ["low"] = ""}
}

local tNoMark = {["live"] = {["high"] = "dipping", ["mid"] = "mid", ["low"] = "high-rising"}, ["dead-short"] = {["high"] = "mid", ["mid"] = "mid", ["low"] = "high-rising"}, ["dead-long"] = {["high"] = "low", ["mid"] = "low", ["low"] = "falling"}}

local tRomMarks = {["high-rising"] = "́", ["mid"] = "", ["low"] = "̀", ["dipping"] = "̌", ["falling"] = "̂", ["high-level"] = "̄"}

local tLevels = {["high-rising"] = "˦˥", ["mid"] = "˧", ["low"] = "˨˩", ["rising"] = "˧˨˧", ["falling"] = "˥˩", ["high-level"] = "˥"}

local symbols = {["๐"] = 0, ["๑"] = 1, ["๒"] = 2, ["๓"] = 3, ["๔"] = 4, ["๕"] = 5, ["๖"] = 6, ["๗"] = 7, ["๘"] = 8, ["๙"] = 9}

local permitted_cluster = {["ks"] = 1, ["ms"] = 1, ["ns"] = 1, ["ps"] = 1, ["ts"] = 1}

-- modified ISO 11940 (to make sound values are more apparent), uses spacing marks for signs
local char_table = {
    ["ก"] = "k",
    ["ข"] = "kʰ",
    ["ฃ"] = "x",
    ["ค"] = "g",
    ["ฅ"] = "ɣ",
    ["ฆ"] = "gʰ",
    ["ง"] = "ŋ",
    ["จ"] = "t͡ɕ",
    ["ฉ"] = "t͡ɕʰ",
    ["ช"] = "d͡ʑ",
    ["ซ"] = "z",
    ["ฌ"] = "d͡ʑʰ",
    ["ญ"] = "ɲ",
    ["ฎ"] = "ᶑ",
    ["ฏ"] = "ʈ",
    ["ฐ"] = "ʈʰ",
    ["ฑ"] = "ɖ",
    ["ฒ"] = "ɖʰ",
    ["ณ"] = "ɳ",
    ["ด"] = "ɗ",
    ["ต"] = "t",
    ["ถ"] = "tʰ",
    ["ท"] = "d",
    ["ธ"] = "dʰ",
    ["น"] = "n",
    ["บ"] = "ɓ",
    ["ป"] = "p",
    ["ผ"] = "pʰ",
    ["ฝ"] = "v",
    ["พ"] = "b",
    ["ฟ"] = "f",
    ["ภ"] = "bʰ",
    ["ม"] = "m",
    ["ย"] = "y",
    ["ร"] = "r",
    ["ฤ"] = "ṛ",
    ["ล"] = "l",
    ["ฦ"] = "ḷ",
    ["ว"] = "w",
    ["ศ"] = "ɕ",
    ["ษ"] = "ʂ",
    ["ส"] = "s",
    ["ห"] = "h",
    ["ฬ"] = "ɭ",
    ["อ"] = "ɒ",
    ["ฮ"] = "ɦ",

    ["ะ"] = "a",
    ["ั"] = "ạ",
    ["า"] = "ā",
    ["ำ"] = "å",
    ["ิ"] = "i",
    ["ี"] = "ī",
    ["ึ"] = "ụ",
    ["ื"] = "ụ̄",
    ["ุ"] = "u",
    ["ู"] = "ū",
    ["ๅ"] = "ɨ",
    ["ฺ"] = "̥",
    ["฿"] = "฿",

    ["เ"] = "e",
    ["แ"] = "æ",
    ["โ"] = "o",
    ["ใ"] = "au",
    ["ไ"] = "ai",

    ["่"] = "ˋ",
    ["้"] = "ˆ",
    ["๊"] = "ˊ",
    ["๋"] = "ˇ",

    ["ฯ"] = "ǂ",
    ["ๆ"] = "«",
    ["็"] = "˘",
    ["์"] = "ʻ",
    ["ํ"] = "˚",
    ["๎"] = "~",
    ["๏"] = "§",
    ["๚"] = "ǁ",
    ["๛"] = "»",

    ["๐"] = "0",
    ["๑"] = "1",
    ["๒"] = "2",
    ["๓"] = "3",
    ["๔"] = "4",
    ["๕"] = "5",
    ["๖"] = "6",
    ["๗"] = "7",
    ["๘"] = "8",
    ["๙"] = "9",

    [" "] = "&nbsp;&nbsp;",
    ["-"] = "&ndash;",
    ["…"] = "…"
}

local mgvc_pattern = "^([รลว]?)([ิึุ็ีืัำู]?[าอรยว]?[วยร]?ะ?)([คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?)$"
local full_pattern = "^([เแโใไ]?)([หอ]ฺ[ก-รลว-ฮ])(ฺ?[รลว]?)([ิึุ็ีืัู]?็?[่้๊๋]?[าอรยวำ]?[วยร]?ะ?)([คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?[คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?)$"
local partial_pattern = "^([เแโใไ]?)([ก-รลว-ฮ])(ฺ?[รลว]?)([ิึุ็ีืัู]?็?[่้๊๋]?[าอรยวำ]?[วยร]?ะ?)([คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?[คฅฆกขฃพฟภบปชฌฑฒทธจฎฏดตฐถศษสมญณนรลฬง]?)$"

function export.translit(text, lang, sc, mode, source)
    local seq = systems[mode]
    for word in mw.ustring.gmatch(text, Thai_range .. "+") do
        local orig_word, class, tMark, tone, long, c2 = word, "", false, false, false, false
        if match(word, "[่้๊๋].?[่้๊๋]") then return nil end

        local function c2_decomp(c2_char, seq, source)
            local converted_c2 = {}
            for character in mw.text.gsplit(c2_char, "") do table.insert(converted_c2, coda[character] and coda[character][seq] or nil) end
            local cluster = table.concat(converted_c2)
            if source == "translit-module" and not permitted_cluster[gsub(cluster, "̚", "")] then
                return c2_char
            else
                return cluster
            end
        end

        local function syllable(v1, c1, g, v2, c2)
            tMark = match(v2, "[่้๊๋]")
            v2 = gsub(v2, "[่้๊๋]", "")

            if match(c1, "^ห.$") then
                if match(sub(c1, 2, 2) .. g .. v2 .. c2, mgvc_pattern) then
                    c1, g, v2, c2 = "ห", match(sub(c1, 2, 2) .. g .. v2 .. c2, mgvc_pattern)
                    if g ~= "" and not v2 == "ย" then c1, g = c1 .. g, "" end
                end
            end

            if g == "ล" and v2 .. c2 == "" then
                c2 = g
                g = ""
            end

            openness = c2 ~= "" and "closed" or "open"

            if source == "pron-module" and (mw.ustring.len(c1) > 1 or match(g, "[รล]")) and not match(c1 .. g, "ฺ") then error("Please replace " .. c1 .. g .. " in the respelling with " .. sub(c1, 1, 1) .. "ฺ" .. (sub(c1, 2, -1) or "") .. g .. ".") end

            if vowel[openness][v1 .. g .. v2] then
                orig_v = v1 .. g .. v2
                v, g = vowel[openness][v1 .. g .. v2][seq], ""
            else
                orig_v = v1 .. v2
                v = vowel[openness][v1 .. v2] and vowel[openness][v1 .. v2][seq] or (v1 .. v2)
                g = (initial[gsub(g, "ฺ", "")] or initial[""])[seq]
            end

            c1 = gsub(c1, "ฺ", "")
            ini, class = "", ""

            if initial[c1] then
                ini, class = initial[c1][seq], initial[c1].class
            else
                return nil
            end

            length = (match(v, "([aiʉueɛoɔə])%1") or match(v, "ː") or unromLong[orig_v]) and "long" or "short"
            life = (match(c2, "[มญณนรลฬง]") or (match(orig_v, "ย$") and match(v, "i$")) or c2 .. length == "long" or liveExc[orig_v]) and "live" or "dead"
            c2 = coda[c2] and coda[c2][seq] or c2_decomp(c2, seq, source)

            -- note: not add tone for royin
            tone = tMark and tFromMark[tMark][class] or (tNoMark[life .. "-" .. length] or tNoMark[life])[class]
            if mode == "paiboon" then
                v = gsub(v, "^([^aiʉueɛoɔə]*)([aiʉueɛoɔə])", "%1%2" .. tRomMarks[tone])
            elseif mode == "ipa" then
                c2 = c2 .. tLevels[tone]
            end

            return ini .. g .. v .. c2
        end

        word = gsub(word, full_pattern, syllable)
        word = gsub(word, partial_pattern, syllable)

        text = gsub(text, orig_word, word, 1)
    end

    text = gsub(text, "[๐-๙]", symbols)

    -- postprocessing
    if mode == "royin" then
        -- initial อ
        text = gsub(text, "^@", "")
        text = gsub(text, "([%s%p])@", "%1")
        text = gsub(text, "@", "-")
        -- initial ง
        text = gsub(text, "^%$ng", "ng")
        text = gsub(text, "([%s%p])%$ng", "%1ng")
        text = gsub(text, "([aeiou])%$ng", "%1-ng")
        text = gsub(text, "%$ng", "ng")
        -- final ง
        text = gsub(text, "ng%$$", "ng")
        text = gsub(text, "ng%$([%s%p])", "ng%1") -- includes hyphen
        text = gsub(text, "ng%$", "ng")
    end

    local count_syl = 0
    if mode == "ipa" then
        text, count_syl = gsub(text, "[ %-–]", ".") -- space, common hyphen, en dash
        if not match(text, "%.$") then count_syl = count_syl + 1 end
        text = gsub(text, "([aiɯu])([˥-˩]+)$", "%1ʔ%2") -- add ʔ if last syllable ends with [aiɯu]
    end

    if match(text, Thai_range) then
        if source == "translit-module" or namespace ~= "" then
            return nil
        else
            return failed_cat
        end
    else
        table.insert(categories, count_syl > 0 and "[[Category:Isan " .. count_syl .. "-syllable words]]" or "")
        return mw.ustring.toNFC(text)
    end
end

function annotate(c1_text, annotation)
    if not annotation then return c1_text end
    return tostring(mw.html.create("span"):css("border-bottom", "1px dotted #000"):css("cursor", "help"):attr("title", annotation):wikitext(c1_text))
end

local front_v = "[เแโใไ]"
local char_annotation = {["์"] = "CANCEL"}

function export.getCharSeqTbl(text)
    local result = {}
    for character in mw.text.gsplit(text, "") do
        local charDetail = char_table[character] or nil

        if find(character, front_v) then
            table.insert(result, tostring(mw.html.create("span"):css("border", "1px dotted gray"):css("border-radius", "50%"):css("cursor", "help"):attr("title", "Vowel sign appearing in front of the initial consonant."):wikitext(charDetail)))
        else
            table.insert(result, annotate(charDetail, char_annotation[character]))
        end
    end
    return result
end

function getCharSeq(text) return "<br><small>" .. table.concat(export.getCharSeqTbl(text), "&thinsp;") .. "</small>" end

local note_set = {["aaw"] = annotate("-ɔɔ r-", "In this word, the double consonant combinations กร, ทร, ธร, มร and หร are pronounced 'gaaw ra', two times 'thaaw ra', 'maaw ra' and 'haaw ra', respectively."), ["redup"] = annotate("Reduplication", "This word exhibits reduplication in pronunciation, i.e. one written consonant is used as the final consonant of a syllable as well as the initial consonant of the next syllable."), ["short"] = annotate("Short", "The vowel in this word is pronounced irregularly short."), ["unorthographical"] = annotate("Unorthographical", "This phonetic respelling violates Isan alphabet rules to indicate an irregular pronunciation.")}

function getRhymeFromIPA(ipa) return match(ipa, "([a̯iɯueɛoɔɤː]+[ʔk̚ŋtnpmjwfls]-)[˥-˩]+$") end

function export.show(frame)
    local lang, sc = "tts", "Isan"
    local args = frame:getParent().args
    local pagename = args.pagename or mw.title.getCurrentTitle().text
    local p, note = {}, {}

    if args["note"] then for ind_note in mw.text.gsplit(args["note"], ",") do table.insert(note, note_set[ind_note]) end end

    if args[1] then
        for index, item in ipairs(args) do table.insert(p, (item ~= "") and item or nil) end
    else
        table.insert(p, pagename)
    end

    local p_concatenated = table.concat(p, "/")
    if match(p_concatenated, "็" .. Thai_range .. "*[่้๊๋]") or match(p_concatenated, "[่้๊๋]" .. Thai_range .. "*็") or match(p_concatenated, "ิ็") then

        table.insert(note, note_set["unorthographical"])
        if not match(args["note"] or "", "short") then table.insert(note, note_set["short"]) end

    elseif match(p_concatenated, "็") and not match(pagename, "็") and not match(args["note"] or "", "short") then
        table.insert(note, note_set["short"])
    end

    homEdit = tostring(mw.html.create("div"):css("float", "right"):css("clear", "right"):css("font-size", "60%"):wikitext(tostring(mw.html.create("span"):attr("class", "plainlinks"):wikitext("[" .. tostring(mw.uri.fullUrl("Module:th-hom/data", {["action"] = "edit"})) .. " edit]"))))

    function formatIsan(text, pron, qualifiers)
        local readclass = ""
        if pron == true then readclass = "th-reading" end
        return ((qualifiers and table.concat(qualifiers) ~= "") and "<span style=\"background-color:#ffffe6\"><small>[" .. table.concat(qualifiers, ", ") .. "]</small></span><br>" or "") .. "<span lang=\"tts\" class=\"Isan " .. readclass .. "\">" .. text .. "</span>"
    end

    local result = {["charPhon"] = {}, ["paiboon"] = {}, ["royin"] = {}, ["ipa"] = {}, ["homophone"] = {}, ["file"] = {}}

    table.insert(categories, "[[Category:Isan terms with IPA pronunciation]]")

    local m_hom_data = require("th-hom/data")
    local m_hom = require("th-hom").makeList
    local m_fileData = require("tts-pron/files")
    local qualifiers = {}

    for system, _ in pairs(systems) do

        local function f(text, system)
            if system == "paiboon" or system == "royin" then
                return "<span class=\"tr\">" .. text .. "</span>"

            elseif system == "ipa" then
                rhyme = getRhymeFromIPA(text)
                return "<span class=\"IPA\">/" .. text .. "/</span>" .. (rhyme and ("<sup>([[Rhymes:Isan/" .. rhyme .. "|R]])</sup>") or "")

            elseif system == "file" then
                local length = ((mw.ustring.len(gsub(text, "[^ %-]", "")) + 1) * 25 + 50)
                if m_fileData[text] then
                    table.insert(categories, "[[Category:Isan terms with audio links]]")
                    return "[[File:" .. m_fileData[text] .. "|" .. (length > 200 and 200 or length) .. "px|center]]"
                else
                    return ""
                end

            else
                return m_hom_data[text] and (#m_hom_data[text] > 3 and tostring(mw.html.create("div"):attr{["class"] = "vsSwitcher", ["data-toggle-category"] = "homophones"}:wikitext(tostring(mw.html.create("span"):attr("class", "vsToggleElement"):wikitext("&nbsp;")) .. tostring(mw.html.create("div"):attr("class", "vsShow"):css("display", "none")) .. tostring(mw.html.create("div"):attr("class", "vsHide"):wikitext((gsub(m_hom(text), ", ", "<br>")))))) or gsub(m_hom(text), ", ", "<br>")) or ""
            end
        end

        for i, spelling in ipairs(p) do
            if system == "charPhon" then
                qualifiers = {}
                if match(spelling, "%:") then
                    table.insert(qualifiers, match(spelling, "%:(.+)"))
                    spelling = match(spelling, "([^%:]+)")
                end
                if match(spelling, "-$") then table.insert(qualifiers, "bound form") end
            else
                spelling = match(spelling, "([^%:]+)")
            end
            table.insert(result[system], tostring(mw.html.create("td"):css("border-right", i < #p and "1px solid lightgray" or "0px"):wikitext((system == "charPhon" and tostring(mw.html.create("div"):attr("class", "th-reading"):wikitext(formatIsan(spelling, false, qualifiers) .. getCharSeq(spelling))) or f(find(system, "^[pri]") and export.translit(spelling, lang, sc, system, "pron-module") or spelling, system)))))
        end
    end

    has_hom = match(table.concat(result["homophone"]), "Isan") or false
    has_file = match(table.concat(result["file"]), "File") or false
    notes = (#note > 0 and "<br><small>{" .. table.concat(note, "; ") .. "}</small>" or "")

    local function row(a, b, o) return ((o and o["pr"]) and "" or "\n<tr>") .. tostring(mw.html.create("td"):attr("bgcolor", "fafeff"):attr((o and o["rom"]) and "rowspan" or "colspan", (o and o["pr"]) and 1 or 2):css("border-bottom", (o and o["bt"]) and "0px" or "1px solid lightgray"):css("border-right", "1px solid lightgray"):css("font-weight", "bold"):wikitext(a)) .. ((o and o["rom"]) and "" or ((o and o["ortho"]) and tostring(mw.html.create("td"):attr("colspan", #p):css("border-bottom", "1px solid lightgray"):wikitext(b)) or b) .. "</tr>") end

    if find(pagename, "ทร") and find(table.concat(result["charPhon"]), "ซ") then table.insert(categories, "[[Category:Isan terms spelled with ทร read as ซ]]") end

    return "<table cellpadding=10 style=\"border-spacing: 2px; border: 1px solid darkgray; text-align:center\">" .. ((namespace ~= "" and not args.pagename) and row("''[[w:Thai alphabet|Phonemic]]''" .. notes, table.concat(result["charPhon"])) or (pagename == table.concat(p) and row("''[[w:Thai alphabet|Orthographic/Phonemic]]''", formatIsan(pagename, true) .. getCharSeq(pagename), {["ortho"] = true}) or row("''[[w:Thai alphabet|Orthographic]]''", formatIsan(pagename, true) .. getCharSeq(pagename), {["ortho"] = true}) .. row("''[[w:Thai alphabet|Phonemic]]''" .. notes, table.concat(result["charPhon"])))) .. row("''[[Wiktionary:Isan Romanization|Romanization]]''", nil, {["rom"] = true}) .. row("''[[Wiktionary:Isan Romanization|Paiboon]]''", table.concat(result["paiboon"]), {["pr"] = true}) .. row("''[[Wiktionary:Isan Romanization|Royal Institute]]''", table.concat(result["royin"]), {["pr"] = true}) ..

               row("(''[[w:Isan language|standard]]'') " .. "[[Wiktionary:International Phonetic Alphabet|IPA]]" .. "<sup>([[Appendix:Thai pronunciation|key]])</sup>", table.concat(result["ipa"]), {["bt"] = not has_hom and not has_file}) .. (has_hom and row("''Homophones''" .. homEdit, table.concat(result["homophone"]) or "", {["bt"] = not has_file}) or "") .. (has_file and row("''Audio''", table.concat(result["file"]) or "", {["bt"] = true}) or "") .. "\n</table>" .. (namespace == "" and table.concat(categories) or "")
end

return export
