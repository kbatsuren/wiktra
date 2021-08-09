local export = {}
local U = mw.ustring.char
local gsub = mw.ustring.gsub

local sheva = U(0x05B0)
local hataf_segol = U(0x05B1)
local hataf_patah = U(0x05B2)
local hataf_qamats = U(0x05B3)
local hiriq = U(0x05B4)
local tsere = U(0x05B5)
local segol = U(0x05B6)
local patah = U(0x05B7)
local qamats = U(0x05B8)
local qamats_qatan = U(0x05C7)
local holam = U(0x05B9)
local holam_haser_for_waw = U(0x05BA)
local qubuts = U(0x05BB)
local dagesh_mappiq = U(0x05BC)
local shin_dot = U(0x05C1)
local sin_dot = U(0x05C2)

local macron_above = U(0x0304)
local macron_below = U(0x0331)
local macron = "[" .. macron_above .. macron_below .. "]"

local alef = "א"
local he = "ה"
local waw = "ו"
local yod = "י"
local vowel_letters = alef .. he .. waw .. yod
local vowel_letter = "[" .. vowel_letters .. "]"

-- '0' represents silent sheva
local vowel_points = (sheva .. hataf_segol .. hataf_patah .. hataf_qamats .. hiriq .. tsere .. segol .. patah .. qamats .. qamats_qatan .. holam .. qubuts .. "0" .. holam_haser_for_waw)
local vowel_point = "[" .. vowel_points .. "]"
local short_vowels = segol .. patah .. hiriq .. qubuts .. qamats_qatan
local short_vowel = "[" .. short_vowels .. "]"

local shuruq = waw .. dagesh_mappiq
local holam_male = waw .. holam

-- use dummies characters that do not match as punctuation
-- the dummy letter stands in for final silent alef or he, or for the hiatus before a furtive patah,
-- or comes before a pre-transliterated waw to aid in matching
local dummy_letter = U(0x0627) -- ARABIC LETTER ALEF
local dummy_geresh = U(0x064E) -- ARABIC FATHA
local dummy_gershayim = U(0x064B) -- ARABIC FATHATAN
local real_geresh = "׳"
local real_gershayim = "״"
local letter_modifier = "[" .. shin_dot .. sin_dot .. "]?[" .. dummy_geresh .. dummy_gershayim .. "]?"
local letters = "אבגדהוזחטיכךלמםנןסעפףצץקרשת"
local letter = "[" .. letters .. dummy_letter .. "]" .. letter_modifier
local letter_not_waw = "[אבגדהזחטיכךלמםנןסעפףצץקרשת" .. dummy_letter .. "]" .. letter_modifier
local gutturals = "אהחע"
local guttural = "[" .. gutturals .. "]"

local vowel_letter_or_geresh = "[" .. vowel_letters .. dummy_geresh .. dummy_gershayim .. "]"

-- note, the geresh and gershayim are included in this, which is why dummies are used in their place
local word_break_chars = "%s%p"
local word_break = "[" .. word_break_chars .. "]"
local word_start = "%f[^" .. word_break_chars .. "]" -- matches the boundary but not the actual word break characters
local word_end = "%f[" .. word_break_chars .. "]" -- matches the boundary but not the actual word break characters

local tr_vowels = "aeiouāēīōūəăĕŏ0"

local biblical_to_modern = {["ʾ"] = "'", ["b" .. macron_below] = "v", ["g" .. macron_above] = "g", ["d" .. macron_below] = "d", ["w"] = "v", ["ž"] = "zh", ["ḥ"] = "kh", ["ṭ"] = "t", ["k" .. macron_below] = "kh", ["ʿ"] = "'", ["p" .. macron_above] = "f", ["ṣ"] = "ts", ["č"] = "ch", ["q"] = "k", ["š"] = "sh", ["ś"] = "s", ["t" .. macron_below] = "t", ["ə"] = "'", ["ĕ"] = "e", ["ă"] = "a", ["ŏ"] = "o", ["ī"] = "i", ["ē"] = "e", ["ā"] = "a", ["ō"] = "o", ["ū"] = "u"}

-- helper function to remove vowel letters but keep gereshes
local function gereshes(str) return gsub(str, vowel_letter, "") end

local biblical = {
    {
        -- replace geresh and gershayim with their dummy equivalents so that they won't match as word boundaries
        [real_geresh] = dummy_geresh,
        [real_gershayim] = dummy_gershayim
    }, {
        -- The default order is: consonant, vowel point, dagesh or mappiq, shin or sin dot.
        -- The desired order is: consonant, shin or sin dot, dagesh or mappiq, vowel point.
        -- Also, move geresh and gershayim closer to the letter for easier handling (will be moved back later if not actually a modifier)
        ["([" .. letters .. "])(" .. vowel_point .. "*)(" .. dagesh_mappiq .. "*)([" .. shin_dot .. sin_dot .. "]*)([" .. dummy_geresh .. dummy_gershayim .. "]*)"] = "%1%4%5%3%2"
    }, {
        -- special case: change qamats in כל to qamats qatan
        -- the problem is that כל might be preceded by prefixed clitics, which maybe be chained indefinitely,
        -- while other unrelated words might happen to end in כל with a qamats gadol; therefore, match either
        -- the entire word or only when preceded by a precisely recognized prefix
        [word_start .. "(כ" .. dagesh_mappiq .. "?)" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2",
        ["([הבכל]" .. dagesh_mappiq .. "?" .. patah .. "כ" .. dagesh_mappiq .. ")" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2",
        ["(מ" .. dagesh_mappiq .. "?" .. hiriq .. "כ" .. dagesh_mappiq .. ")" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2",
        ["(ש" .. shin_dot .. dagesh_mappiq .. "?[" .. segol .. patah .. "]כ" .. dagesh_mappiq .. ")" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2", -- patah is very archaic
        ["([ובכלד]" .. dagesh_mappiq .. "?" .. sheva .. "כ)" .. qamats .. "(ל)" .. word_end] = "%1" .. qamats_qatan .. "%2"
    }, {
        -- remove final alef and he, but only when preceded by a vowel
        ["(" .. vowel_point .. vowel_letter_or_geresh .. "*)[" .. alef .. he .. "]" .. word_end] = "%1" .. dummy_letter,
        ["(" .. shuruq .. vowel_letter_or_geresh .. "*)[" .. alef .. he .. "]" .. word_end] = "%1" .. dummy_letter
    }, {
        -- these are the cases, other than the above, where a final letter should be ignored
        [hiriq .. vowel_letter_or_geresh .. "-[" .. yod .. dummy_letter .. "]" .. word_end] = "ī",
        ["([" .. tsere .. segol .. "])" .. vowel_letter_or_geresh .. "-[" .. yod .. "]" .. word_end] = "%1",
        ["([" .. holam .. qubuts .. "])" .. vowel_letter_or_geresh .. "-[" .. waw .. "]" .. word_end] = "%1"
    }, {
        [sheva .. "(" .. letter .. ")" .. sheva] = "0%1" .. sheva, -- two shevas in a row
        ["(" .. short_vowel .. letter .. ")" .. sheva] = "%10", -- after a short vowel, assume(!) a silent sheva
        ["(" .. guttural .. ")" .. sheva] = "%10", -- gutturals cannot have a vocal sheva

        ["(" .. vowel_point .. ")" .. shuruq] = "%1" .. dummy_letter .. "ww", -- when waw + dagesh is not a shuruq
        ["(" .. vowel_point .. vowel_letter_or_geresh .. "-)" .. shuruq .. "(" .. vowel_letter_or_geresh .. "-" .. vowel_point .. ")"] = "%1" .. dummy_letter .. "ww%2", -- when waw + dagesh is not a shuruq
        ["(" .. vowel_point .. ")" .. holam_male] = "%1" .. dummy_letter .. "w" .. holam, -- when waw + holam is not a holam male

        ["([" .. alef .. he .. "])" .. dagesh_mappiq] = "%1" -- handle mappiq (very rarely occurs on an alef)
    }, {
        [shuruq .. shuruq] = shuruq .. "ww", -- another potential case when waw + dagesh is not a shuruq
        [shuruq .. holam_male] = shuruq .. "w" .. holam, -- another potential case when waw + holam is not a holam male

        -- tentatively lengthen hiriqs with vowel letters
        [hiriq .. "(" .. vowel_letter_or_geresh .. "+)(" .. letter .. ")"] = function(vlg, l) return "ī" .. gereshes(vlg) .. l end,

        -- rearrange furtive patach (mappiq should already have been removed, but handle it just in case)
        ["(" .. guttural .. dagesh_mappiq .. "?)" .. patah .. word_end] = dummy_letter .. "a%1"
    }, {
        -- remove vowel letters
        ["(" .. letter .. ")(" .. vowel_letter_or_geresh .. "+)" .. shuruq] = function(l, vlg) return l .. gereshes(vlg) .. shuruq end,
        [shuruq .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. letter_not_waw .. ")"] = function(vlg, l) return shuruq .. gereshes(vlg) .. l end,
        [shuruq .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. waw .. "[^" .. holam .. dagesh_mappiq .. "])"] = function(vlg, l) return shuruq .. gereshes(vlg) .. l end,
        ["(" .. vowel_point .. ")" .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. letter_not_waw .. ")"] = function(vp, vlg, l) return vp .. gereshes(vlg) .. l end,
        ["(" .. vowel_point .. ")" .. "(" .. vowel_letter_or_geresh .. "+)" .. "(" .. waw .. "[^" .. holam .. dagesh_mappiq .. "])"] = function(vp, vlg, l) return vp .. gereshes(vlg) .. l end
    }, {
        -- handle two-character combinations first
        ["ג" .. dummy_geresh] = "j",
        ["ז" .. dummy_geresh] = "ž",
        ["[צץ]" .. dummy_geresh] = "č",
        ["ש" .. shin_dot] = "š",
        ["ש" .. sin_dot] = "ś"
    }, {["א"] = "ʾ", ["ב"] = "b" .. macron_below, ["ג"] = "g" .. macron_above, ["ד"] = "d" .. macron_below, ["ה"] = "h", ["ז"] = "z", ["ח"] = "ḥ", ["ט"] = "ṭ", ["י"] = "y", ["[כך]"] = "k" .. macron_below, ["ל"] = "l", ["[מם]"] = "m", ["[נן]"] = "n", ["ס"] = "s", ["ע"] = "ʿ", ["[פף]"] = "p" .. macron_above, ["[צץ]"] = "ṣ", ["ק"] = "q", ["ר"] = "r", ["ת"] = "t" .. macron_below}, {
        [word_start .. "([bgdkptj])" .. macron .. "?" .. dagesh_mappiq] = "%1", -- assume(!) dagesh qal at the beginning of a word
        ["[0" .. sheva .. "]([bgdkptj])" .. macron .. "?" .. dagesh_mappiq] = "0%1", -- dagesh qal after sheva, and assume(!) silent sheva
        ["(%l)0%1"] = "%1" .. sheva .. "%1", -- vocal sheva between identical consonants
        [shuruq] = "ū"
    }, {
        -- restore geresh and gershayim order
        ["([" .. dummy_geresh .. dummy_gershayim .. "])(" .. dagesh_mappiq .. "*)(" .. vowel_point .. "*)"] = "%2%3%1"
    }, {
        -- handle ירושלם
        [hiriq .. patah] = "ayi", -- in this case, the vowels are reversed by Unicode normalization rules
        [patah .. hiriq] = "ayi", -- just in case they're in the correct order
        [hiriq .. qamats] = "āyi", -- pausal form of above
        [qamats .. hiriq] = "āyi", -- as above
        -- handle ירושלמה
        ["[0" .. sheva .. "]" .. patah] = "ay", -- in this case, the vowels are reversed by Unicode normalization rules
        [patah .. "[0" .. sheva .. "]"] = "ay", -- just in case they're in the correct order
        ["[0" .. sheva .. "]" .. qamats] = "āy", -- pausal form of above
        [qamats .. "[0" .. sheva .. "]"] = "āy" -- as above
    }, {[sheva] = "ə", [hataf_segol] = "ĕ", [hataf_patah] = "ă", [hataf_qamats] = "ŏ", [hiriq] = "i", [tsere] = "ē", [segol] = "e", [patah] = "a", [qamats] = "ā", [qamats_qatan] = "o", [qubuts] = "u", [shin_dot] = "", [sin_dot] = "", [holam_male] = "ō", [waw .. holam_haser_for_waw] = "wō"}, {
        ["(.)" .. macron .. "?" .. dagesh_mappiq] = "%1%1" -- gemination
    }, {
        ["(śśā)[שś](k" .. macron_below .. ")"] = "%1%2" -- special case for יששכר
    }, {
        ["ā(%l" .. macron .. "?0)"] = "o%1", -- assume(!) qamats qatan before silent sheva

        [holam] = "ō",
        ["ו"] = "w",
        ["ש"] = "š" -- assume(!) shin if no shin or sin dot
    }, {
        -- handle bgdkpt letters in unvocalized words (such as acronyms)
        [word_start .. "([^" .. tr_vowels .. "]-[bgdkpt]" .. macron .. "[^" .. tr_vowels .. "]-)" .. word_end] = function(w) return gsub(w, "([bgdkpt])" .. macron, "%1") end
    }, {
        ["[0" .. dummy_letter .. "]"] = "",

        -- short vowels in non-final closed syllables (this rule should be expanded)
        ["ū(%l)%1"] = "u%1%1",
        ["ī(%l)%1"] = "i%1%1"
    }, {
        ["ə" .. word_end] = "", -- final sheva is always silent

        [dummy_geresh] = "′",
        [dummy_gershayim] = "″",
        ["׃"] = ".", -- sof pasuq
        ["־"] = "-" -- maqaf
    }
}

function export.tr(text, lang, sc)
    -- default to modern for Hebrew, but not for other languages, such as Aramaic
    local modern = lang == "he"
    return export.biblical(text, modern)
end

function export.biblical(text, modern)
    -- decompose
    text = mw.ustring.toNFD(text)

    -- wrap with spaces to make initial and final replacements easier
    text = " " .. text .. " "

    for _, replacements in ipairs(biblical) do for regex, replacement in pairs(replacements) do text = gsub(text, regex, replacement) end end

    -- unwrap spaces
    text = mw.ustring.match(text, "^ (.*) $")
    if text == nil then error("Something went wrong, wrapped spaces were deleted.") end

    -- must happen before recomposition
    if modern then
        text = gsub(text, "([%lʾʿ])%1", "%1")
        text = gsub(text, "[%lʾʿ]" .. macron .. "?", function(x) return biblical_to_modern[x] or x end)
        text = gsub(text, "''", "'")
    end

    -- recompose
    text = mw.ustring.toNFC(text)

    return text
end

return export
