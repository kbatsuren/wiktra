local export = {}
local u = mw.ustring.char
local gsub = mw.ustring.gsub

local consonants = {
    -- defer transliteration of null consonant.
    ["𐨀"] = "𐨀",
    -- consonants
    ["𐨐"] = "k",
    ["𐨑"] = "kh",
    ["𐨒"] = "g",
    ["𐨓"] = "gh",
    ["𐨕"] = "c",
    ["𐨖"] = "ch",
    ["𐨗"] = "j",
    ["𐨙"] = "ñ",
    ["𐨚"] = "ṭ",
    ["𐨛"] = "ṭh",
    ["𐨜"] = "ḍ",
    ["𐨝"] = "ḍh",
    ["𐨞"] = "ṇ",
    ["𐨟"] = "t",
    ["𐨠"] = "th",
    ["𐨡"] = "d",
    ["𐨢"] = "dh",
    ["𐨣"] = "n",
    ["𐨤"] = "p",
    ["𐨥"] = "ph",
    ["𐨦"] = "b",
    ["𐨧"] = "bh",
    ["𐨨"] = "m",
    ["𐨩"] = "y",
    ["𐨪"] = "r",
    ["𐨫"] = "l",
    ["𐨬"] = "v",
    ["𐨭"] = "ś",
    ["𐨮"] = "ṣ",
    ["𐨯"] = "s",
    ["𐨰"] = "z",
    ["𐨱"] = "h",
    ["𐨲"] = "ḱ",
    ["𐨳"] = "ṭ́h",
    ["𐨴"] = "ṭ́",
    ["𐨵"] = "vh"
}

local diacritics = {
    -- matras
    ["𐨁"] = "i",
    ["𐨂"] = "u",
    ["𐨃"] = "ṛ",
    ["𐨅"] = "e",
    ["𐨆"] = "o",
    ["𐨌"] = "ā",
    ["𐨁𐨌"] = "ī",
    ["𐨂𐨌"] = "ū",
    ["𐨃𐨌"] = "ṝ",
    ["𐨅𐨌"] = "ai",
    ["𐨆𐨌"] = "au",
    ["𐨿"] = "",
    ["‍𐨿"] = "Ⓙ",
    ["𐨍"] = "a͚",
    ["𐨂𐨍"] = "u͚"
}

local tt = {

    -- vowels
    ["𐨀"] = "",
    -- anusvara    
    ["𐨎"] = "ṃ", -- until a better method is found
    -- visarga    
    ["𐨏"] = "ḥ",
    -- numerals
    ["𐩀"] = "1",
    ["𐩁"] = "2",
    ["𐩂"] = "3",
    ["𐩃"] = "4",
    ["𐩄"] = "10",
    ["𐩅"] = "20",
    ["𐩆"] = "100",
    ["𐩇"] = "1000",
    -- punctuation        
    ["𐩖"] = ".", -- danda
    ["𐩗"] = "." -- double danda
}

function export.tr(text, lang, sc)
    local failed = nil
    if sc ~= "Khar" then return nil end
    -- Consonants appear as part of sequences canonically equivalent to consonant+nukta+vowel, so
    -- allowing for multiplicity and the string being normalised (by Wikimedia policy), the matching
    -- RE is:
    local form = "([𐨀𐨐-𐨵])(𐨹?)(‍?𐨿?)(𐨺?)(𐨍?)(𐨸?)([𐨁-𐨆]?[𐨁-𐨆]?𐨌?𐨍?)"
    text = gsub(text, form, function(c, n1, h, n2, vi, n3, vm)
        local d = h .. vi .. vm -- Expect at most one catenand to be non-empty.
        local cdia = ""
        local cons = consonants[c]
        local retval
        if n1 ~= "" then -- Cauda
            if cons == "s" or cons == "ś" then
                cdia = cdia .. u(0x0331) -- Combining macron below
            else
                cdia = cdia .. u(0x0301) -- Combining acute
            end
        end
        if n2 ~= "" then cdia = cdia .. u(0x0323) end -- Combining dot below
        if n3 ~= "" then cdia = cdia .. u(0x0304) end -- Combining macron
        if d == "" then
            retval = cons .. cdia .. "a"
        else
            local dia = diacritics[d]
            if not dia then
                mw.addWarning("Failed to transliterate 𐨀" .. d .. " in " .. text)
                failed = true
                dia = "D"
            end
            retval = cons .. cdia .. dia
        end
        return mw.ustring.toNFD(retval)
    end)

    text = gsub(text, "(a)𐨀([iu])", "%1%2" .. u(0x308)) -- Apply diaeresis
    text = gsub(text, ".", tt)
    text = gsub(text, "lⒿy", "lý")
    text = gsub(text, "Ⓙ", "")
    text = gsub(text, u(0x301, 0x304), u(0x304, 0x301))

    if failed then return nil end
    return mw.ustring.toNFC(text)
end

return export
