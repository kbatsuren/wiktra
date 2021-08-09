local export = {}

local bit32 = require("bit32")
local m_table = require("table")
local m_tag = require("hit-translit/tag")
local sign_list = mw.loadData("hit-translit/data")

local ulen = mw.ustring.len
local usub = mw.ustring.sub

local segments = {
    -- vowels
    ["a"] = "a",
    ["á"] = "a",
    ["à"] = "a",
    ["e"] = "e",
    ["é"] = "e",
    ["è"] = "e",
    ["i"] = "i",
    ["í"] = "i",
    ["ì"] = "i",
    ["u"] = "u",
    ["ú"] = "u",
    ["ù"] = "u",

    -- consonants with voicing alternaternates
    ["b"] = "b",
    ["p"] = "p",
    ["d"] = "d",
    ["t"] = "t",
    ["g"] = "g",
    ["k"] = "k",
    ["q"] = "q",

    -- single consonants
    ["ḫ"] = "h",
    ["r"] = "r",
    ["l"] = "l",
    ["m"] = "m",
    ["n"] = "n",
    ["š"] = "s",
    ["z"] = "z",
    ["y"] = "y",
    ["w"] = "w",

    -- numbers
    ["0"] = "0",
    ["1"] = "1",
    ["2"] = "2",
    ["3"] = "3",
    ["4"] = "4",
    ["5"] = "5",
    ["6"] = "6",
    ["7"] = "7",
    ["8"] = "8",
    ["9"] = "9"
}

--[=[
-- Set up bit array to for marking which onsets and codas are available for ambiguous characters
]=]
local sort_order = {
    -- vowels
    ["a"] = 2 ^ 0,
    ["i"] = 2 ^ 1, -- I've chosen "i" over "e"
    ["e"] = 2 ^ 2,
    ["u"] = 2 ^ 3,

    -- consonants with voicing alternaternates
    ["p"] = 2 ^ 4,
    ["b"] = 2 ^ 5,
    ["t"] = 2 ^ 6,
    ["d"] = 2 ^ 7,
    ["k"] = 2 ^ 8,
    ["g"] = 2 ^ 9,
    ["q"] = 2 ^ 10,

    -- single consonants
    ["h"] = 2 ^ 11,
    ["r"] = 2 ^ 12,
    ["l"] = 2 ^ 13,
    ["m"] = 2 ^ 14,
    ["n"] = 2 ^ 15,
    ["s"] = 2 ^ 16,
    ["z"] = 2 ^ 17,
    ["y"] = 2 ^ 18,
    ["w"] = 2 ^ 19,

    -- numbers
    ["0"] = 2 ^ 20,
    ["1"] = 2 ^ 21,
    ["2"] = 2 ^ 22,
    ["3"] = 2 ^ 23,
    ["4"] = 2 ^ 24,
    ["5"] = 2 ^ 25,
    ["6"] = 2 ^ 26,
    ["7"] = 2 ^ 27,
    ["8"] = 2 ^ 28,
    ["9"] = 2 ^ 29
}

local function inplace_multikey_sort(t)
    -- Sorts a table inplace by the onset and then coda
    table.sort(t, function(a, b)
        if a.o ~= b.o then return sort_order[a.o] < sort_order[b.o] end

        return sort_order[a.c] < sort_order[b.c]
    end)
    return t
end

local function find_seg(syl, rev)
    -- [=[
    -- A helper function that iterates forwards or backwards (if "rev" is set)
    -- 	in order to find the first phonetic segment and return the normalized
    -- 	form of that segment. Thus:
    -- 		find_seg("šaq") gives "s"
    -- 		find_seg("luḫ", true) gives "h"
    -- -- ]=]
    local f
    for i = 1, ulen(syl) do
        f = usub(syl, rev and -i or i, rev and -i or i)
        if segments[f] then --
            return segments[f]
        end
    end
    error("Could not find a " .. (rev and "coda" or "onset") .. " for the syllable \"" .. syl .. "\".")
end

function export.find_onset(syl)
    -- [=[
    -- Find the normalized onset character of a syllable
    -- -- ]=]
    return find_seg(syl)
end

function export.find_coda(syl)
    -- [=[
    -- Find the normalized coda character of a syllable
    -- -- ]=]
    return find_seg(syl, true)
end

function export.hash_sign(sign)
    -- [=[
    -- Turn the list of Hittite syllables into a list of list containing:
    -- 		The syllable
    -- 		The normalized onset character of the syllable
    -- 		The normalized coda character of the syllable
    -- And add a hashes of the onsets and codas in the syllables. Thus
    -- 		{ "it", "id", "et", "ed", hit = true }
    -- 		becomes:
    -- 		{
    -- 			{ "it", o = "i", c = "t" },
    -- 			{ "id", o = "i", c = "d" },
    -- 			{ "et", o = "e", c = "t" },
    -- 			{ "ed", o = "e", c = "d" },
    --			o_hash = 6, c_hash = 192, hit = true
    -- 		}
    -- -- ]=]
    sign.o_hash, sign.c_hash = 0, 0 -- init onset and coda hashes for signs
    for i, syl in ipairs(sign) do
        sign[i] = {syl, o = export.find_onset(syl), c = export.find_coda(syl)}
        sign.o_hash = bit32.bor(sign.o_hash, sort_order[sign[i].o])
        sign.c_hash = bit32.bor(sign.c_hash, sort_order[sign[i].c])
    end
end

function export.copy_sign(sign)
    -- copy, sort, and set up new sign
    local new = m_table.deepcopy(sign_list[sign], true)
    if new.hit then -- has Hittite signs
        export.hash_sign(new)
        inplace_multikey_sort(new)
    end

    return new
end

local function remove_syls(first, second, mask)
    -- [=[
    -- For two adjacent sets of Hittite syllables and a mask of their shared characters,
    -- 	go through each one and remove the unnecessary values, and update the hashes.
    -- -- ]=]
    local new_o_hash, new_c_hash, new_first, new_second = 0, 0, {hit = true}, {hit = true}
    for _, syl in ipairs(first) do
        if bit32.band(sort_order[syl.c], mask) > 0 then
            table.insert(new_first, syl)
            new_o_hash = bit32.bor(new_o_hash, sort_order[syl.o]) -- unnecessary, but useful for tracking
        end
    end
    new_first.o_hash = new_o_hash
    new_first.c_hash = mask

    for _, syl in ipairs(second) do
        if bit32.band(sort_order[syl.o], mask) > 0 then
            table.insert(new_second, syl)
            new_c_hash = bit32.bor(new_c_hash, sort_order[syl.c])
        end
    end
    new_second.o_hash = mask
    new_second.c_hash = new_c_hash

    return new_first, new_second
end

local related_character_masks = {
    -- voicing alternates
    bit32.bor(sort_order["p"], sort_order["b"]), bit32.bor(sort_order["t"], sort_order["d"]), bit32.bor(sort_order["k"], sort_order["g"], sort_order["q"]), -- "u" patterns next to "w"
    bit32.bor(sort_order["u"], sort_order["w"]), -- numbers pattern together
    bit32.bor(sort_order["0"], sort_order["1"], sort_order["2"], sort_order["3"], sort_order["4"], sort_order["5"], sort_order["6"], sort_order["7"], sort_order["8"], sort_order["9"])
}

local function approx_match(first_hash, second_hash)
    -- [=[
    -- Builds a bit mask for all approximate matches like "p" and "b", or "t" and "d".
    -- -- ]=]
    local new_mask = 0
    for _, mask in ipairs(related_character_masks) do if bit32.band(mask, first_hash) > 0 and bit32.band(mask, second_hash) > 0 then new_mask = bit32.bor(new_mask, mask) end end
    return new_mask
end

function export.fit_signs(first, second)
    -- [=[
    -- Takes two adjacent signs and removes unlikely Hittite syllables.
    -- -- ]=]
    if first and second then -- two signs
        if first.hit and second.hit then -- both have Hittite syllables
            local match_mask = bit32.band(first.c_hash, second.o_hash)
            if match_mask > 0 then -- there are matching chars in each
                return remove_syls(first, second, match_mask)
            end

            match_mask = approx_match(first.c_hash, second.o_hash)
            if match_mask > 0 then -- there are approxiamtely matching chars in each
                return remove_syls(first, second, match_mask)
            end
        end
    elseif first then -- final sign
        -- nothing yet
    else -- initial sing
        -- nothing yet
    end
    return first, second
end

local function assemble_word(signs)
    -- [=[
    -- Choose all the signs, tag when appropriate, then concatenate
    -- -- ]=]
    local word = {}
    for _, sign in ipairs(signs) do
        if sign.hit then -- If Hittite, take first sign
            table.insert(word, sign[1][1])
        elseif sign.sum then -- If Sumerogram, take and  tag first sign
            table.insert(word, m_tag.tag_sumerogram(sign[1]))
        elseif sign.akk then -- If Akkadogram, take and tag first sign
            table.insert(word, m_tag.tag_akkadogram(sign[1]))
        elseif sign.hurr then -- If Hurrian, take and tag first sign
            table.insert(word, m_tag.tag_hurrian_tr(sign[1]))
        elseif sign.hatt then -- If Hattic, take and tag first sign
            table.insert(word, m_tag.tag_hattic_tr(sign[1]))
        elseif sign.glossenkeil then -- If Glossenkeil, display it
            table.insert(word, m_tag.glossenkeil())
        end
    end

    return table.concat(word, "-")
end

function export.transpose(text)
    -- [=[
    -- Takes a continuous Cuneiform string and converts it to transliteration
    -- -- ]=]
    local signs = {}
    while ulen(text) > 0 do
        if sign_list[usub(text, 1, 3)] then
            table.insert(signs, export.copy_sign(usub(text, 1, 3))) -- add in new sign
            text = usub(text, 4) -- truncate string
        elseif sign_list[usub(text, 1, 2)] then
            table.insert(signs, export.copy_sign(usub(text, 1, 2)))
            text = usub(text, 3)
        elseif sign_list[usub(text, 1, 1)] then
            table.insert(signs, export.copy_sign(usub(text, 1, 1)))
            text = usub(text, 2)
        end
        signs[#signs - 1], signs[#signs] = export.fit_signs(signs[#signs - 1], signs[#signs]) -- fit two signs
    end

    signs[#signs] = export.fit_signs(signs[#signs], nil) -- fit end of word

    return assemble_word(signs)
end

function export.tr(text, lang, sc)
    if sc ~= "Xsux" then return nil end

    text = mw.ustring.gsub(text, "[𒀀-𒑱]+", export.transpose)

    return m_tag.tag_hittite_tr(text)
end

return export
