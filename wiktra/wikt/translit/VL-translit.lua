local la_utils = require("la-utilities")

local export = {}

local vowel_patterns = {}

vowel_patterns["all"] = {{"ā", "a"}, {"ae", "ę"}, {"áé", "ę́"}, {"e", "ę"}, {"o", "ǫ"}}

vowel_patterns["It-W"] = {{"ē", "ẹ"}, {"i", "ẹ"}, {"ī", "i"}, {"ō", "ọ"}, {"u", "ọ"}, {"ū", "u"}}

vowel_patterns["Italo-Western"] = vowel_patterns["It-W"]
vowel_patterns["Western"] = vowel_patterns["It-W"]

vowel_patterns["E"] = {{"ē", "ẹ"}, {"i", "ẹ"}, {"ī", "i"}, {"ō", "o"}, {"ū", "u"}}

vowel_patterns["Eastern"] = vowel_patterns["E"]
vowel_patterns["Romanian"] = vowel_patterns["E"]

vowel_patterns["S"] = {{"ē", "e"}, {"ẹ", "e"}, {"ī", "i"}, {"ō", "o"}, {"ọ", "o"}, {"ū", "u"}}

vowel_patterns["Sardinian"] = vowel_patterns["S"]

local dictionary = {["a"] = "a", ["e"] = "e", ["i"] = "i", ["o"] = "o", ["u"] = "u", ["ā"] = "ā", ["ē"] = "ē", ["ī"] = "ī", ["ō"] = "ō", ["ū"] = "ū", ["ae"] = "ae", ["oe"] = "ē", ["ai"] = "aị", ["ei"] = "ėị", ["au"] = "aụ", ["eu"] = "ėụ", ["b"] = "b", ["d"] = "d", ["f"] = "f", ["c"] = "c", ["g"] = "g", ["v"] = "v", ["x"] = "x", ["qu"] = "qŭ", ["'"] = "'"}

local vowels = {"a", "e", "i", "o", "u", "ā", "ē", "ī", "ō", "ū", "ae", "oe", "aị", "ėị", "aụ", "ėụ", "-"}

local onsets = {"b", "p", "d", "t", "g", "c", "cu", "qŭ", "f", "s", "z", "l", "m", "n", "r", "j", "v", "w", "bl", "pl", "br", "pr", "ps", "dr", "tr", "gl", "cl", "gr", "cr", "fl", "fr", "sp", "st", "sc", "scu", "sl", "sm", "sn", "su", "spr", "str", "scr", "spl", "scl"}

local codas = {"b", "p", "d", "t", "g", "c", "f", "s", "z", "l", "m", "n", "r", "j", "sp", "st", "sc", "lp", "lt", "lc", "lb", "ld", "lg", "lf", "rp", "rt", "rc", "rb", "rd", "rg", "rf", "mp", "nt", "nc", "mb", "nd", "ng", "lm", "rl", "rm", "rn", "ps", "ts", "cs", "x", "ls", "ns", "rs", "lcs", "ncs", "rcs", "lms", "rls", "rms", "rns"}

for i, val in ipairs(vowels) do vowels[val] = true end

for i, val in ipairs(onsets) do onsets[val] = true end

for i, val in ipairs(codas) do codas[val] = true end

-- These phonetic rules apply to the whole word, not just a syllable
local word_rules_start = {
    {"h", ""}, {"k", "c"}, -- {"w", "v"},
    {"y", "i"}, {"ȳ", "ī"}, {"x('?)s", "x%1"}, {"x('?)([ct])", "s%1%2"}, {"b([st])", "p%1"}, {"d([st])", "t%1"}, {"g([st])", "c%1"}, {"n([bp])", "m%1"}, -- {"qu", "qv"},
    -- {"ngu([aeiouāēīōū])", "ngv%1"},
    {"([aeiouāēīōū])('?)b([aeiouāēīōū])", "%1%2v%3"}, -- This is not a copypaste error, the pattern needs to run twice to catch the edge case of -ababa-
    -- (common in the VL conditional)
    {"([aeiouāēīōū])('?)b([aeiouāēīōū])", "%1%2v%3"}, {"um$", "u"}
}

local stress_shift_rules = {["qu"] = "'qu", ["ngu"] = "n'gu", ["gu"] = "'gu", ["v"] = "'v", ["bl"] = "'bl", ["pl"] = "'pl", ["br"] = "'br", ["pr"] = "'pr", ["dr"] = "'dr", ["tr"] = "'tr", ["gl"] = "'gl", ["cl"] = "'cl", ["gr"] = "'gr", ["cr"] = "'cr", ["fl"] = "'fl", ["fr"] = "'fr", ["ct"] = "c't", ["pt"] = "p't", ["gd"] = "g'd", ["sl"] = "s'l", ["sm"] = "s'm", ["sn"] = "s'n", ["su"] = "s'u", ["st"] = "s't", ["xt"] = "x't", ["spr"] = "s'pr", ["str"] = "s'tr", ["scr"] = "s'cr", ["spl"] = "s'pl", ["scl"] = "s'cl", ["nct"] = "nc't"}

local word_rules_end = {
    {"^ĭ", "j"}, -- {"g([ei])", "j%1"},
    -- {"dĭ", "j"},
    -- {"gĭ", "j"},
    -- {"z", "j"},
    {"ė", "e"}, {"ị", "i"}, {"ụ", "u"}, {"ĭ", "i"}, {"ŭ", "u"}, {"ei", "i"}, {"ii", "i"}, {"ee$", "ie"}, {"([aẹęeọǫou])(́?)e$", "%1%2i"}
}

local nasalized = {}

nasalized["It-W"] = {{"[ẹęeēi](́?)[nm]", "ẽ%1"}, {"[ī](́?)[nm]", "ĩ%1"}, {"[ū](́?)[nm]", "ũ%1"}, {"[ọǫoōu](́?)[nm]", "õ%1"}}

nasalized["E"] = {{"[ẹęeēi](́?)[nm]", "ẽ%1"}, {"[ī](́?)[nm]", "ĩ%1"}, {"[uū](́?)[nm]", "ũ%1"}, {"[ọoō](́?)[nm]", "õ%1"}}

nasalized["S"] = {{"[eē](́?)[nm]", "ẽ%1"}, {"[iī](́?)[nm]", "ĩ%1"}, {"[uū](́?)[nm]", "ũ%1"}, {"[oō](́?)[nm]", "õ%1"}}

local function nasalize_vowels(word, family)
    word = mw.ustring.gsub(word, "[aā](́?)[nm]$", "ã%1")
    word = mw.ustring.gsub(word, "[aā][nm](́?)s", "ã%1s")
    for _, rule in ipairs(nasalized[family]) do
        word = mw.ustring.gsub(word, rule[1] .. "$", rule[2])
        word = mw.ustring.gsub(word, rule[1] .. "(́?)s", rule[2] .. "%2s")
    end
    return word
end

local function segment_word(word)
    local phonemes = {}

    while mw.ustring.len(word) > 0 do
        local longestmatch = ""

        for letter, ipa in pairs(dictionary) do if mw.ustring.len(letter) > mw.ustring.len(longestmatch) and mw.ustring.sub(word, 1, mw.ustring.len(letter)) == letter then longestmatch = letter end end

        if mw.ustring.len(longestmatch) > 0 then
            table.insert(phonemes, dictionary[longestmatch])
            word = mw.ustring.sub(word, mw.ustring.len(longestmatch) + 1)
        else
            table.insert(phonemes, mw.ustring.sub(word, 1, 1))
            word = mw.ustring.sub(word, 2)
        end
    end

    return phonemes
end

local function get_onset(syll)
    local consonants = {}

    for i = 1, #syll do
        if vowels[syll[i]] then break end
        if syll[i] ~= "'" then table.insert(consonants, syll[i]) end
    end

    return table.concat(consonants)
end

local function get_coda(syll)
    local consonants = {}

    for i = #syll, 1, -1 do
        if vowels[syll[i]] then break end

        table.insert(consonants, 1, syll[i])
    end

    return table.concat(consonants)
end

local function get_vowel(syll) for i = 1, #syll do if vowels[syll[i]] then return syll[i] end end end

local function split_syllables(remainder)
    local syllables = {}
    local syll = {}

    while #remainder > 0 do
        local phoneme = table.remove(remainder, 1)

        if phoneme == "'" then
            if #syll > 0 then table.insert(syllables, syll) end
            syll = {"'"}
        elseif vowels[phoneme] then
            table.insert(syll, phoneme)
            table.insert(syllables, syll)
            syll = {}
        else
            table.insert(syll, phoneme)
        end
    end

    -- If there are phonemes left, then the word ends in a consonant
    -- Add them to the last syllable
    for _, phoneme in ipairs(syll) do table.insert(syllables[#syllables], phoneme) end

    -- Split consonant clusters between syllables
    for i, current in ipairs(syllables) do
        if i > 1 then
            local previous = syllables[i - 1]
            local onset = get_onset(current)
            -- Shift over consonants until the syllable onset is valid
            while not (onset == "" or onsets[onset]) do
                table.insert(previous, table.remove(current, 1))
                onset = get_onset(current)
            end

            -- If the preceding syllable still ends with a vowel, and the current one begins with s + another consonant, or with gn, then shift it over
            if get_coda(previous) == "" and ((current[1] == "s" and not vowels[current[2]]) or (current[1] == "g" and current[2] == "n")) then table.insert(previous, table.remove(current, 1)) end

            -- If there is no vowel at all in this syllable
            if not get_vowel(current) then
                for j = 1, #current do table.insert(syllables[i - 1], table.remove(current, 1)) end
                table.remove(syllables, i)
            end

        end
    end

    for i, syll in ipairs(syllables) do
        local onset = get_onset(syll)
        local coda = get_coda(syll)

        if not (onset == "" or onsets[onset]) then
            require("debug").track("VL-noun/bad onset")
            error("onset error:[" .. onset .. "]")
        end

        if not (coda == "" or codas[coda]) then
            require("debug").track("VL-noun/bad coda")
            error("coda error:[" .. coda .. "]")
        end
    end

    return syllables
end

local function detect_accent(syllables)
    -- Manual override
    for i = 1, #syllables do
        for j = 1, #syllables[i] do
            if syllables[i][j] == "'" then
                table.remove(syllables[i], j)
                return i
            end
        end
    end
    if #syllables > 2 then
        -- Does the penultimate syllable end in a single vowel?
        local penult = syllables[#syllables - 1]

        if mw.ustring.find(penult[#penult], "^[aeiou]$") then
            local ult = syllables[#syllables]
            if ult[2] and mw.ustring.find(ult[1] .. ult[2], "[bdg][lr]") then
                return #syllables - 1
            else
                return #syllables - 2
            end
        else
            return #syllables - 1
        end
    elseif #syllables == 2 then
        return #syllables - 1
    end
    return #syllables
end

local function place_accent(syllable)
    -- Special case: i before a or o
    new_syllable = mw.ustring.gsub(syllable, "i([aoāō])", "i%1́")
    if syllable == new_syllable then new_syllable = mw.ustring.gsub(syllable, "([aeẹęioọǫuāēīōūėịụ-])", "%1́") end

    return new_syllable
end

local function convert_word(word, vowel_pattern)
    -- Prothetic i before s + consonant
    if vowel_pattern == "It-W" then word = mw.ustring.gsub(word, "^s([ptclmn])", "is%1") end

    -- do starting word-based rules
    for _, rule in ipairs(word_rules_start) do word = mw.ustring.gsub(word, rule[1], rule[2]) end

    for k, v in pairs(stress_shift_rules) do word = mw.ustring.gsub(word, k .. "'", v) end

    -- Double consonant stress shifts
    for _, v in ipairs({"b", "c", "d", "f", "g", "l", "m", "n", "p", "r", "s", "t"}) do word = mw.ustring.gsub(word, v .. v .. "'", v .. "'" .. "v") end

    local phonemes = segment_word(word)

    local syllables = split_syllables(phonemes)

    local accent = detect_accent(syllables)

    -- Check antepenult for e, i > j (written i)
    --[[local antepenult = syllables[#syllables - 2]
	local penult = syllables[#syllables - 1]
	
	if antepenult and penult then
		if syllables[accent] == antepenult and mw.ustring.find(antepenult[#antepenult], "^[eēiī]$") and mw.ustring.find(penult[#penult], "^[aāoō]$") then
			syllables[#syllables-2][#antepenult] = "ị"
			accent = accent + 1
		end
	end]] --

    for i, syll in ipairs(syllables) do
        if syllables[i + 1] then
            if mw.ustring.find(syll[#syll], "^[eēiī]$") and mw.ustring.find(syllables[i + 1][1], "^[aāoōuū]$") then
                syll[#syll] = "ĭ"
                if syllables[accent] == syll then accent = accent + 1 end
            end
        end
    end

    for i, syll in ipairs(syllables) do
        syll = table.concat(syll)
        for i, rule in ipairs(vowel_patterns["all"]) do syll = mw.ustring.gsub(syll, rule[1], rule[2]) end
        for i, rule in ipairs(vowel_patterns[vowel_pattern]) do syll = mw.ustring.gsub(syll, rule[1], rule[2]) end
        --[[if i ~= accent then
			syll = mw.ustring.gsub(syll, "ẹ", "e")
			syll = mw.ustring.gsub(syll, "ọ", "o")
		end]]
        syllables[i] = (i == accent and place_accent(syll) or syll)
    end

    word = table.concat(syllables)

    for _, rule in ipairs(word_rules_end) do word = mw.ustring.gsub(word, rule[1], rule[2]) end

    word = nasalize_vowels(word, vowel_pattern)

    return word
end

function export.convert_words(words, vowel_pattern)
    word_table = {}

    for word in mw.ustring.gmatch(words, "%S+") do table.insert(word_table, convert_word(word, vowel_pattern)) end

    return "*" .. table.concat(word_table, " ")
end

return export
