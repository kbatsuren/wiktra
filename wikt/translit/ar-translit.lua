-- Authors: Benwing, ZxxZxxZ, Atitarev
local export = {}

local U = mw.ustring.char
local rfind = mw.ustring.find
local rsubn = mw.ustring.gsub
local rmatch = mw.ustring.match
local rsplit = mw.text.split
local gcodepoint = mw.ustring.gcodepoint

-- assigned below
local has_diacritics

-- version of rsubn() that discards all but the first return value
local function rsub(term, foo, bar)
    local retval = rsubn(term, foo, bar)
    return retval
end

local zwnj = U(0x200c) -- zero-width non-joiner
local alif_madda = U(0x622)
local alif_hamza_below = U(0x625)
local alif = U(0x627)
local taa_marbuuTa = U(0x629)
local laam = U(0x644)
local waaw = U(0x648)
local alif_maqSuura = U(0x649)
local yaa = U(0x64A)
local fatHataan = U(0x64B)
local Dammataan = U(0x64C)
local kasrataan = U(0x64D)
local fatHa = U(0x64E)
local Damma = U(0x64F)
local kasra = U(0x650)
local shadda = U(0x651)
local sukuun = U(0x652)
local dagger_alif = U(0x670)
local alif_waSl = U(0x671)
-- local zwj = U(0x200d) -- zero-width joiner
local lrm = U(0x200e) -- left-to-right mark
local rlm = U(0x200f) -- right-to-left mark

local tt = {
    -- consonants
    ["ب"] = "b",
    ["ت"] = "t",
    ["ث"] = "ṯ",
    ["ج"] = "j",
    ["ح"] = "ḥ",
    ["خ"] = "ḵ",
    ["د"] = "d",
    ["ذ"] = "ḏ",
    ["ر"] = "r",
    ["ز"] = "z",
    ["س"] = "s",
    ["ش"] = "š",
    ["ص"] = "ṣ",
    ["ض"] = "ḍ",
    ["ط"] = "ṭ",
    ["ظ"] = "ẓ",
    ["ع"] = "ʿ",
    ["غ"] = "ḡ",
    ["ف"] = "f",
    ["ق"] = "q",
    ["ك"] = "k",
    ["ڪ"] = "k",
    ["ل"] = "l",
    ["م"] = "m",
    ["ن"] = "n",
    ["ه"] = "h",
    -- tāʾ marbūṭa (special) - always after a fátḥa (a), silent at the end of
    -- an utterance, "t" in ʾiḍāfa or with pronounced tanwīn. We catch
    -- most instances of tāʾ marbūṭa before we get to this stage.
    [taa_marbuuTa] = "t", -- tāʾ marbūṭa = ة
    -- control characters
    [zwnj] = "-", -- ZWNJ (zero-width non-joiner)
    -- [zwj]="", -- ZWJ (zero-width joiner)
    -- rare letters
    ["پ"] = "p",
    ["چ"] = "č",
    ["ڤ"] = "v",
    ["ڥ"] = "v",
    ["گ"] = "g",
    ["ڨ"] = "g",
    ["ڧ"] = "q",
    ["ڢ"] = "f",
    ["ں"] = "n",
    ["ڭ"] = "g",
    -- semivowels or long vowels, alif, hamza, special letters
    ["ا"] = "ā", -- ʾalif
    -- hamzated letters
    ["أ"] = "ʾ", -- hamza over alif
    [alif_hamza_below] = "ʾ", -- hamza under alif
    ["ؤ"] = "ʾ", -- hamza over wāw
    ["ئ"] = "ʾ", -- hamza over yā
    ["ء"] = "ʾ", -- hamza on the line
    -- long vowels
    [waaw] = "w", -- "ū" after ḍamma (u) and not before diacritic
    [yaa] = "y", -- "ī" after kasra (i) and not before diacritic
    [alif_maqSuura] = "ā", -- ʾalif maqṣūra
    [alif_madda] = "ʾā", -- ʾalif madda
    [alif_waSl] = "", -- hamzatu l-waṣl
    [dagger_alif] = "ā", -- ʾalif xanjariyya = dagger ʾalif (Koranic diacritic)
    -- short vowels, šádda and sukūn
    [fatHataan] = "an", -- fatḥatan
    [Dammataan] = "un", -- ḍammatan
    [kasrataan] = "in", -- kasratan
    [fatHa] = "a", -- fatḥa
    [Damma] = "u", -- ḍamma
    [kasra] = "i", -- kasra
    -- šadda - doubled consonant
    [sukuun] = "", -- sukūn - no vowel
    -- ligatures
    ["ﻻ"] = "lā",
    ["ﷲ"] = "llāh",
    -- taṭwīl
    ["ـ"] = "", -- taṭwīl, no sound
    -- numerals
    ["١"] = "1",
    ["٢"] = "2",
    ["٣"] = "3",
    ["٤"] = "4",
    ["٥"] = "5",
    ["٦"] = "6",
    ["٧"] = "7",
    ["٨"] = "8",
    ["٩"] = "9",
    ["٠"] = "0",
    -- punctuation (leave on separate lines)
    ["؟"] = "?", -- question mark
    ["«"] = "“", -- quotation mark
    ["»"] = "”", -- quotation mark
    ["٫"] = ".", -- decimal point
    ["٬"] = ",", -- thousands separator
    ["٪"] = "%", -- percent sign
    ["،"] = ",", -- comma
    ["؛"] = ";" -- semicolon
}

local sun_letters = "تثدذرزسشصضطظلن"
-- For use in implementing sun-letter assimilation of ال (al-)
local ttsun1 = {}
local ttsun2 = {}
local ttsun3 = {}
for cp in gcodepoint(sun_letters) do
    local ch = U(cp)
    ttsun1[ch] = tt[ch]
    ttsun2["l-" .. ch] = tt[ch] .. "-" .. ch
    table.insert(ttsun3, tt[ch])
end
-- For use in implementing elision of al-
local sun_letters_tr = table.concat(ttsun3, "")

local consonants_needing_vowels = "بتثجحخدذرزسشصضطظعغفقكڪلمنهپچڤگڨڧڢںڭأإؤئءةﷲ"
-- consonants on the right side; includes alif madda
local rconsonants = consonants_needing_vowels .. "ويآ"
-- consonants on the left side; does not include alif madda
local lconsonants = consonants_needing_vowels .. "وي"
-- Arabic semicolon, comma, question mark; taṭwīl; period, exclamation point,
-- single quote for bold/italic, double quotes for quoted material
local punctuation = "؟،؛" .. "ـ" .. ".!'" .. "\""
local space_like = "%s'" .. "\""
local space_like_class = "[" .. space_like .. "]"
local numbers = "١٢٣٤٥٦٧٨٩٠"

local before_diacritic_checking_subs = {
    ------------ transformations prior to checking for diacritics --------------
    -- convert llh for allāh into ll+shadda+dagger-alif+h
    {"لله", "للّٰه"}, -- shadda+short-vowel (including tanwīn vowels, i.e. -an -in -un) gets
    -- replaced with short-vowel+shadda during NFC normalisation, which
    -- MediaWiki does for all Unicode strings; however, it makes the
    -- transliteration process inconvenient, so undo it.
    {"([" .. fatHataan .. Dammataan .. kasrataan .. fatHa .. Damma .. kasra .. dagger_alif .. "])" .. shadda, shadda .. "%1"}, -- ignore alif jamīla (otiose alif in 3pl verb forms)
    --     #1: handle ḍamma + wāw + alif (final -ū)
    {Damma .. waaw .. alif, Damma .. waaw}, --     #2: handle wāw + sukūn + alif (final -w in -aw in defective verbs)
    --     this must go before the generation of w, which removes the waw here.
    {waaw .. sukuun .. alif, waaw .. sukuun}, -- ignore final alif or alif maqṣūra following fatḥatan (e.g. in accusative
    -- singular or words like عَصًا "stick" or هُدًى "guidance"; this is called
    -- tanwin nasb)
    {fatHataan .. "[" .. alif .. alif_maqSuura .. "]", fatHataan}, -- same but with the fatḥatan placed over the alif or alif maqṣūra
    -- instead of over the previous letter (considered a misspelling but
    -- common)
    {"[" .. alif .. alif_maqSuura .. "]" .. fatHataan, fatHataan}, -- tāʾ marbūṭa should always be preceded by fatḥa, alif, alif madda or
    -- dagger alif; infer fatḥa if not
    {"([^" .. fatHa .. alif .. alif_madda .. dagger_alif .. "])" .. taa_marbuuTa, "%1" .. fatHa .. taa_marbuuTa}, -- similarly for alif between consonants, possibly marked with shadda
    -- (does not apply to initial alif, which is silent when not marked with
    -- hamza, or final alif, which might be pronounced as -an)
    {"([" .. lconsonants .. "]" .. shadda .. "?)" .. alif .. "([" .. rconsonants .. "])", "%1" .. fatHa .. alif .. "%2"}, -- infer fatḥa in case of non-fatḥa + alif/alif-maqṣūra + dagger alif
    {"([^" .. fatHa .. "])([" .. alif .. alif_maqSuura .. "]" .. dagger_alif .. ")", "%1" .. fatHa .. "%2"}, -- infer kasra in case of hamza-under-alif not + kasra
    {alif_hamza_below .. "([^" .. kasra .. kasrataan .. "])", alif_hamza_below .. kasra .. "%1"}, -- ignore dagger alif placed over regular alif or alif maqṣūra
    {"([" .. alif .. alif_maqSuura .. "])" .. dagger_alif, "%1"}, ----------- rest of these concern definite article alif-lām ----------
    -- in kasra/ḍamma + alif + lam, make alif into hamzatu l-waṣl, so we
    -- handle cases like بِالتَّوْفِيق (bi-t-tawfīq) correctly
    {"([" .. Damma .. kasra .. "])" .. alif .. laam, "%1" .. alif_waSl .. laam}, -- al + consonant + shadda (only recognize word-initially if regular alif): remove shadda
    {"^(" .. alif .. fatHa .. "?" .. laam .. "[" .. lconsonants .. "])" .. shadda, "%1"}, {"(" .. space_like_class .. alif .. fatHa .. "?" .. laam .. "[" .. lconsonants .. "])" .. shadda, "%1"}, {"(" .. alif_waSl .. fatHa .. "?" .. laam .. "[" .. lconsonants .. "])" .. shadda, "%1"}, -- handle l- hamzatu l-waṣl or word-initial al-
    {"^" .. alif .. fatHa .. "?" .. laam, "al-"}, {"(" .. space_like_class .. ")" .. alif .. fatHa .. "?" .. laam, "%1al-"}, -- next one for bi-t-tawfīq
    {"([" .. Damma .. kasra .. "])" .. alif_waSl .. fatHa .. "?" .. laam, "%1-l-"}, -- next one for remaining hamzatu l-waṣl (at beginning of word)
    {alif_waSl .. fatHa .. "?" .. laam, "l-"}, -- special casing if the l in al- has a shadda on it (as in الَّذِي "that"),
    -- so we don't mistakenly double the dash
    {"l%-" .. shadda, "ll"}, -- implement assimilation of sun letters
    {"l%-[" .. sun_letters .. "]", ttsun2}
}

-- Transliterate the word(s) in TEXT. LANG (the language) and SC (the script)
-- are ignored. OMIT_I3RAAB means leave out final short vowels (ʾiʿrāb).
-- GRAY_I3RAAB means render transliterate short vowels (ʾiʿrāb) in gray.
-- FORCE_TRANSLIT causes even non-vocalized text to be transliterated
-- (normally the function checks for non-vocalized text and returns nil,
-- since such text is ambiguous in transliteration).
function export.tr(text, lang, sc, omit_i3raab, gray_i3raab, force_translit)
    -- make it possible to call this function from a template
    if type(text) == "table" then
        local function f(x) return (x ~= "") and x or nil end
        text, lang, sc, omit_i3raab, force_translit = f(text.args[1]), f(text.args[2]), f(text.args[3]), f(text.args[4]), f(text.args[5])
    end

    for _, sub in ipairs(before_diacritic_checking_subs) do text = rsub(text, sub[1], sub[2]) end

    if not force_translit and not has_diacritics(text) then return nil end

    ------------ transformations after checking for diacritics --------------
    -- Replace plain alif with hamzatu l-waṣl when followed by fatḥa/ḍamma/kasra.
    -- Must go after handling of initial al-, which distinguishes alif-fatḥa
    -- from alif w/hamzatu l-waṣl. Must go before generation of ū and ī, which
    -- eliminate the ḍamma/kasra.
    text = rsub(text, alif .. "([" .. fatHa .. Damma .. kasra .. "])", alif_waSl .. "%1")
    -- ḍamma + waw not followed by a diacritic is ū, otherwise w
    text = rsub(text, Damma .. waaw .. "([^" .. fatHataan .. Dammataan .. kasrataan .. fatHa .. Damma .. kasra .. shadda .. sukuun .. dagger_alif .. "])", "ū%1")
    text = rsub(text, Damma .. waaw .. "$", "ū")
    -- kasra + yaa not followed by a diacritic (or ū from prev step) is ī, otherwise y
    text = rsub(text, kasra .. yaa .. "([^" .. fatHataan .. Dammataan .. kasrataan .. fatHa .. Damma .. kasra .. shadda .. sukuun .. dagger_alif .. "ū])", "ī%1")
    text = rsub(text, kasra .. yaa .. "$", "ī")
    -- convert shadda to double letter.
    text = rsub(text, "(.)" .. shadda, "%1%1")
    if not omit_i3raab and gray_i3raab then -- show ʾiʿrāb grayed in transliteration
        -- decide whether to gray out the t in ﺓ. If word begins with al- or l-, yes.
        -- Otherwise, no if word ends in a/i/u, yes if ends in an/in/un.
        text = rsub(text, "^(a?l%-[^%s]+)" .. taa_marbuuTa .. "([" .. fatHataan .. Dammataan .. kasrataan .. fatHa .. Damma .. kasra .. "])", "%1<span style=\"color: #888888\">t</span>%2")
        text = rsub(text, "(" .. space_like_class .. "a?l%-[^%s]+)" .. taa_marbuuTa .. "([" .. fatHataan .. Dammataan .. kasrataan .. fatHa .. Damma .. kasra .. "])", "%1<span style=\"color: #888888\">t</span>%2")
        text = rsub(text, taa_marbuuTa .. "([" .. fatHa .. Damma .. kasra .. "])", "t%1")
        text = rsub(text, taa_marbuuTa .. "([" .. fatHataan .. Dammataan .. kasrataan .. "])", "<span style=\"color: #888888\">t</span>%1")
        text = rsub(text, ".", {[fatHataan] = "<span style=\"color: #888888\">an</span>", [kasrataan] = "<span style=\"color: #888888\">in</span>", [Dammataan] = "<span style=\"color: #888888\">un</span>"})
        text = rsub(text, "([" .. fatHa .. Damma .. kasra .. "])(" .. space_like_class .. ")", function(vowel, space)
            vowel_repl = {[fatHa] = "<span style=\"color: #888888\">a</span> ", [kasra] = "<span style=\"color: #888888\">i</span> ", [Damma] = "<span style=\"color: #888888\">u</span> "}
            return vowel_repl[vowel] .. space
        end)
        text = rsub(text, "[" .. fatHa .. Damma .. kasra .. "]$", {[fatHa] = "<span style=\"color: #888888\">a</span>", [kasra] = "<span style=\"color: #888888\">i</span>", [Damma] = "<span style=\"color: #888888\">u</span>"})
        text = rsub(text, "</span><span style=\"color: #888888\">", "")
    elseif omit_i3raab then -- omit ʾiʿrāb in transliteration
        text = rsub(text, "[" .. fatHataan .. Dammataan .. kasrataan .. "]", "")
        text = rsub(text, "[" .. fatHa .. Damma .. kasra .. "](" .. space_like_class .. ")", "%1")
        text = rsub(text, "[" .. fatHa .. Damma .. kasra .. "]$", "")
    end
    -- tāʾ marbūṭa should not be rendered by -t if word-final even when
    -- ʾiʿrāb (desinential inflection) is shown; instead, use (t) before
    -- whitespace, nothing when final; but render final -ﺍﺓ and -ﺁﺓ as -āh,
    -- consistent with Wehr's dictionary
    -- Left-to-right or right-to-left mark at end of text will prevent tāʾ marbūṭa
    -- from being transliterated correctly.
    text = string.gsub(text, lrm, "")
    text = string.gsub(text, rlm, "")
    text = rsub(text, "([" .. alif .. alif_madda .. "])" .. taa_marbuuTa .. "$", "%1h")
    -- Ignore final tāʾ marbūṭa (it appears as "a" due to the preceding
    -- short vowel). Need to do this after graying or omitting word-final
    -- ʾiʿrāb.
    text = rsub(text, taa_marbuuTa .. "$", "")
    text = rsub(text, taa_marbuuTa .. "(%p)", "%1")
    if not omit_i3raab then -- show ʾiʿrāb in transliteration
        text = rsub(text, taa_marbuuTa .. "(" .. space_like_class .. ")", "(t)%1")
    else
        -- When omitting ʾiʿrāb, show all non-absolutely-final instances of
        -- tāʾ marbūṭa as (t), with trailing ʾiʿrāb omitted.
        text = rsub(text, taa_marbuuTa, "(t)")
    end
    -- tatwīl should be rendered as - at beginning or end of word. It will
    -- be rendered as nothing in the middle of a word (FIXME, do we want
    -- this?)
    text = rsub(text, "^ـ", "-")
    text = rsub(text, "(" .. space_like_class .. ")ـ", "%1-")
    text = rsub(text, "ـ$", "-")
    text = rsub(text, "ـ(" .. space_like_class .. ")", "-%1")
    -- Now convert remaining Arabic chars according to table.
    text = rsub(text, ".", tt)
    text = rsub(text, "aā", "ā")
    -- Implement elision of al- after a final vowel. We do this
    -- conservatively, only handling elision of the definite article rather
    -- than elision in other cases of hamzat al-waṣl (e.g. form-I imperatives
    -- or form-VII and above verbal nouns) partly because elision in
    -- these cases isn't so common in MSA and partly to avoid excessive
    -- elision in case of words written with initial bare alif instead of
    -- properly with hamzated alif. Possibly we should reconsider.
    -- At the very least we currently don't handle elision of الَّذِي (allaḏi)
    -- correctly because we special-case it to appear without the hyphen;
    -- perhaps we should reconsider that.
    text = rsub(text, "([aiuāīū]'* +'*)a([" .. sun_letters_tr .. "]%-)", "%1%2")
    if gray_i3raab then text = rsub(text, "([aiuāīū]'*</span>'* +'*)a([" .. sun_letters_tr .. "]%-)", "%1%2") end
    -- Special-case the transliteration of allāh, without the hyphen
    text = rsub(text, "^(a?)l%-lāh", "%1llāh")
    text = rsub(text, "(" .. space_like_class .. "a?)l%-lāh", "%1llāh")

    return text
end

local has_diacritics_subs = {
    -- FIXME! What about lam-alif ligature?
    -- remove punctuation and shadda
    -- must go before removing final consonants
    {"[" .. punctuation .. shadda .. "]", ""}, -- Remove consonants at end of word or utterance, so that we're OK with
    -- words lacking iʿrāb (must go before removing other consonants).
    -- If you want to catch places without iʿrāb, comment out the next two lines.
    {"[" .. lconsonants .. "]$", ""}, {"[" .. lconsonants .. "](" .. space_like_class .. ")", "%1"}, -- remove consonants (or alif) when followed by diacritics
    -- must go after removing shadda
    -- do not remove the diacritics yet because we need them to handle
    -- long-vowel sequences of diacritic + pseudo-consonant
    {"[" .. lconsonants .. alif .. "]([" .. fatHataan .. Dammataan .. kasrataan .. fatHa .. Damma .. kasra .. sukuun .. dagger_alif .. "])", "%1"}, -- the following two must go after removing consonants w/diacritics because
    -- we only want to treat vocalic wāw/yā' in them (we want to have removed
    -- wāw/yā' followed by a diacritic)
    -- remove ḍamma + wāw
    {Damma .. waaw, ""}, -- remove kasra + yā'
    {kasra .. yaa, ""}, -- remove fatḥa/fatḥatan + alif/alif-maqṣūra
    {"[" .. fatHataan .. fatHa .. "][" .. alif .. alif_maqSuura .. "]", ""}, -- remove diacritics
    {"[" .. fatHataan .. Dammataan .. kasrataan .. fatHa .. Damma .. kasra .. sukuun .. dagger_alif .. "]", ""}, -- remove numbers, hamzatu l-waṣl, alif madda
    {"[" .. numbers .. "ٱ" .. "آ" .. "]", ""}, -- remove non-Arabic characters
    {"[^" .. U(0x0600) .. "-" .. U(0x06FF) .. U(0x0750) .. "-" .. U(0x077F) .. U(0x08A0) .. "-" .. U(0x08FF) .. U(0xFB50) .. "-" .. U(0xFDFF) .. U(0xFE70) .. "-" .. U(0xFEFF) .. "]", ""}
}

-- declared as local above
function has_diacritics(text)
    local count
    text, count = rsubn(text, "[" .. lrm .. rlm .. "]", "")
    if count > 0 then require("debug").track("ar-translit/lrm or rlm") end
    for _, sub in ipairs(has_diacritics_subs) do text = rsub(text, unpack(sub)) end
    return #text == 0
end

-- Return true if transliteration TR is an irregular transliteration of
-- ARABIC. Return false if ARABIC can't be transliterated. For purposes of
-- establishing regularity, hyphens are ignored and word-final tāʾ marbūṭa
-- can be transliterated as "(t)", "" or "t".
function export.irregular_translit(arabic, tr)
    if not arabic or arabic == "" or not tr or tr == "" then return false end
    local regtr = export.tr(arabic)
    if not regtr or regtr == tr then return false end
    local arwords = rsplit(arabic, " ")
    local regwords = rsplit(regtr, " ")
    local words = rsplit(tr, " ")
    if #regwords ~= #words or #regwords ~= #arwords then return true end
    for i = 1, #regwords do
        local regword = regwords[i]
        local word = words[i]
        local arword = arwords[i]
        -- Resolve final (t) in auto-translit to t, h or nothing
        if rfind(regword, "%(t%)$") then regword = rfind(word, "āh$") and rsub(regword, "%(t%)$", "h") or rfind(word, "t$") and rsub(regword, "%(t%)$", "t") or rsub(regword, "%(t%)$", "") end
        -- Resolve clitics + short a + alif-lām, which may get auto-transliterated
        -- to contain long ā, to short a if the manual translit has it; note
        -- that currently in cases with assimilated l, the auto-translit will
        -- fail, so we won't ever get here and don't have to worry about
        -- auto-translit l against manual-translit assimilated char.
        local clitic_chars = "^[وفكل]" -- separate line to avoid L2R display weirdness
        if rfind(arword, clitic_chars .. fatHa .. "?[" .. alif .. alif_waSl .. "]" .. laam) and rfind(word, "^[wfkl]a%-") then regword = rsub(regword, "^([wfkl])ā", "%1a") end
        -- Ignore hyphens when comparing
        if rsub(regword, "%-", "") ~= rsub(word, "%-", "") then return true end
    end
    return false
end

return export

-- For Vim, so we get 4-space tabs
-- vim: set ts=4 sw=4 noet:
