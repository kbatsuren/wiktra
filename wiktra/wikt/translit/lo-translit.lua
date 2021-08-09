local export = {}
local gsub = mw.ustring.gsub
local len = mw.ustring.len
local match = mw.ustring.match
local sub = mw.ustring.sub

local initial_conv = {["ກ"] = "k", ["ຂ"] = "kh", ["ຄ"] = "kh", ["ງ"] = "ng", ["ຈ"] = "ch", ["ສ"] = "s", ["ຊ"] = "s", ["ຍ"] = "ny", ["ດ"] = "d", ["ຕ"] = "t", ["ຖ"] = "th", ["ທ"] = "th", ["ນ"] = "n", ["ບ"] = "b", ["ປ"] = "p", ["ຜ"] = "ph", ["ຝ"] = "f", ["ພ"] = "ph", ["ຟ"] = "f", ["ມ"] = "m", ["ຢ"] = "y", ["ຣ"] = "r", ["ລ"] = "l", ["ວ"] = "w", ["ຫ"] = "h", ["ອ"] = "ʼ", ["ຮ"] = "h", ["ຫງ"] = "ng", ["ຫຍ"] = "ny", ["ໜ"] = "n", ["ຫນ"] = "n", ["ໝ"] = "m", ["ຫມ"] = "m", ["ຫຼ"] = "r", ["ຫຣ"] = "r", ["ຫຼ"] = "l", ["ຫລ"] = "l", ["ຫວ"] = "w"}

local vowel_conv = {
    ["ະ"] = "a",
    ["ັ"] = "a",
    ["ິ"] = "i",
    ["ຶ"] = "ư",
    ["ຸ"] = "u",
    ["ເະ"] = "e",
    ["ເັ"] = "e",
    ["ແະ"] = "æ",
    ["ແັ"] = "æ",
    ["ໂະ"] = "o",
    ["ົ"] = "o",
    ["ເາະ"] = "ǫ",
    ["ັອ"] = "ǫ",
    ["ເິ"] = "œ",
    ["ເັຍ"] = "ia",
    ["ັຽ"] = "ia",
    ["ເຶອ"] = "ưa",
    ["ົວະ"] = "ua",
    ["ັວ"] = "ua",
    ["ວັ"] = "ua",
    ["ໄ"] = "ai",
    ["ໃ"] = "ai",
    ["ັຍ"] = "ai",
    ["ເົາ"] = "ao",
    ["ົາວ"] = "uau",
    ["ຳ"] = "am",
    ["ໍາ"] = "am",
    ["ວຳ"] = "uam",

    ["າ"] = "ā",
    ["າວ"] = "āo",
    ["ີ"] = "ī",
    ["ື"] = "ư̄",
    ["ູ"] = "ū",
    ["ເ"] = "ē",
    ["ແ"] = "ǣ",
    ["ໂ"] = "ō",
    ["ໂຍ"] = "ōi",
    ["ໂຽ"] = "ōi",
    ["ໍ"] = "ǭ",
    ["ອ"] = "ǭ",
    ["ອຍ"] = "ǭi",
    ["ອຽ"] = "ǭi",
    ["ເີ"] = "œ̄",
    ["ເີຽ"] = "œ̄i",
    ["ເີຍ"] = "œ̄i",
    ["ເຍ"] = "īa",
    ["ເັຽ"] = "īa",
    ["ຽ"] = "īa",
    ["ເືອ"] = "ư̄a",
    ["ົວ"] = "ūa",
    ["ວ"] = "ūa",
    ["ວຍ"] = "uāi",
    ["ວຽ"] = "uāi",
    ["ວຽນ"] = "uīan",
    ["າຍ"] = "āi",
    ["າຽ"] = "āi",
    ["ວາ"] = "uā",
    ["ວາຍ"] = "uāi",
    ["ວາຽ"] = "uāi",
    ["ແວ"] = "ǣu", -- ແ_ວ can bo both ǣu and uǣ. The first is more common.
    ["ີວ"] = "īu",
    ["ິວ"] = "iu",
    ["ຽວ"] = "iāu",
    ["ວີວ"] = "uīu"
}

local coda_conv = {["ກ"] = "k", ["ຂ"] = "k", ["ຄ"] = "k", ["ງ"] = "ng", ["ຈ"] = "t", ["ສ"] = "t", ["ຊ"] = "t", ["ຍ"] = "ny", ["ດ"] = "t", ["ຕ"] = "t", ["ຖ"] = "t", ["ທ"] = "t", ["ນ"] = "n", ["ບ"] = "p", ["ປ"] = "p", ["ຜ"] = "p", ["ຝ"] = "p", ["ພ"] = "p", ["ຟ"] = "p", ["ມ"] = "m", ["ຢ"] = "y", ["ຣ"] = "n", ["ລ"] = "n", ["ວ"] = "w", [""] = ""}

local sp_symbols = {["ຯ"] = "〃", ["ໆ"] = "〃", ["໌"] = "", ["໐"] = "0", ["໑"] = "1", ["໒"] = "2", ["໓"] = "3", ["໔"] = "4", ["໕"] = "5", ["໖"] = "6", ["໗"] = "7", ["໘"] = "8", ["໙"] = "9"}

local char_type = {
    ["ກ"] = "coda",
    ["ຂ"] = "coda",
    ["ຄ"] = "coda",
    ["ງ"] = "coda",
    ["ຈ"] = "coda",
    ["ຊ"] = "coda",
    ["ຍ"] = "ambig",
    ["ດ"] = "coda",
    ["ຕ"] = "coda",
    ["ຖ"] = "coda",
    ["ທ"] = "coda",
    ["ນ"] = "coda",
    ["ບ"] = "coda",
    ["ປ"] = "coda",
    ["ຜ"] = "coda",
    ["ຝ"] = "coda",
    ["ພ"] = "coda",
    ["ຟ"] = "coda",
    ["ມ"] = "coda",
    ["ຢ"] = "coda",
    ["ຣ"] = "coda",
    ["ລ"] = "coda",
    ["ວ"] = "ambig",
    ["ສ"] = "coda",
    ["ຫ"] = "cons",
    ["ອ"] = "ambig",
    ["ຮ"] = "cons",
    ["ຯ"] = "iter_symbol",
    ["ະ"] = "vowel_let",
    ["ັ"] = "suf_vowel",
    ["າ"] = "vowel_let",
    ["ຳ"] = "suf_vowel",
    ["ິ"] = "suf_vowel",
    ["ີ"] = "suf_vowel",
    ["ຶ"] = "suf_vowel",
    ["ື"] = "suf_vowel",
    ["ຸ"] = "suf_vowel",
    ["ູ"] = "suf_vowel",
    ["ົ"] = "suf_vowel",
    ["ຼ"] = "cons",
    ["ຽ"] = "vowel_let",
    ["ເ"] = "pref_vowel",
    ["ແ"] = "pref_vowel",
    ["ໂ"] = "pref_vowel",
    ["ໃ"] = "pref_vowel",
    ["ໄ"] = "pref_vowel",
    ["ໆ"] = "iter_symbol",
    ["່"] = "tone",
    ["້"] = "tone",
    ["໊"] = "tone",
    ["໋"] = "tone",
    ["໌"] = "canc_symbol",
    ["ໍ"] = "suf_vowel",
    ["໐"] = "number",
    ["໑"] = "number",
    ["໒"] = "number",
    ["໓"] = "number",
    ["໔"] = "number",
    ["໕"] = "number",
    ["໖"] = "number",
    ["໗"] = "number",
    ["໘"] = "number",
    ["໙"] = "number",
    ["ໜ"] = "cons",
    ["ໝ"] = "cons"
}

function export.tr(text, lang, sc, debug_mode)
    text = gsub(text, "[່້໊໋​]", "")

    for lao_text in mw.ustring.gmatch(text, "[ກ-ໝ]+") do
        local word, c, chartype, output = {}, {}, {}, {}
        local curr_word, curr_initial, curr_vowel, curr_coda = {}, {}, {}, {}
        local i = 1
        local original_text = lao_text

        for i = 1, len(lao_text) do
            c[i] = sub(lao_text, i, i)
            chartype[i] = char_type[c[i]] or table.insert(word, c[i])
        end

        for i = 1, #c + 1 do
            if chartype[i] == "pref_vowel" or i == #c + 1 then
                if #curr_word ~= 0 then
                    table.insert(word, table.concat(curr_word))
                    curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {}, {c[i]}, {}
                else
                    table.insert(curr_vowel, c[i])
                    table.insert(curr_word, c[i])
                end

            elseif chartype[i] == "suf_vowel" then
                table.insert(curr_vowel, c[i])
                table.insert(curr_word, c[i])

            elseif chartype[i] == "ambig" then
                if #curr_initial ~= 0 and vowel_conv[table.concat(curr_vowel) .. c[i]] and (chartype[i + 1] ~= "suf_vowel" or match(c[i + 1], "[ໍຳີັ]")) and #curr_coda == 0 then
                    table.insert(curr_vowel, c[i])
                    table.insert(curr_word, c[i])
                elseif (#curr_initial == 0 and char_type[table.concat(curr_vowel)] == "pref_vowel") or (#curr_initial ~= 0 and initial_conv[table.concat(curr_initial) .. c[i]]) then
                    table.insert(curr_initial, c[i])
                    table.insert(curr_word, c[i])
                else
                    if #curr_word ~= 0 then table.insert(word, table.concat(curr_word)) end
                    curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {c[i]}, {}, {}
                end

            elseif chartype[i] == "vowel_let" then
                table.insert(curr_vowel, c[i])
                table.insert(curr_word, c[i])

            elseif chartype[i] == "coda" and #curr_coda == 0 and #curr_initial ~= 0 and chartype[i + 1] ~= "suf_vowel" and chartype[i + 1] ~= "vowel_let" and not (chartype[i + 1] == "ambig" and match(chartype[i + 2] or "", "co")) and table.concat(curr_vowel) ~= "ວີວ" then
                table.insert(curr_coda, c[i])
                table.insert(curr_word, c[i])

            elseif chartype[i] == "cons" or chartype[i] == "coda" then
                if #curr_coda == 0 and initial_conv[table.concat(curr_initial) .. c[i]] and (#curr_vowel == 0 or char_type[table.concat(curr_vowel)] == "pref_vowel") then
                    table.insert(curr_initial, c[i])
                    table.insert(curr_word, c[i])
                else
                    table.insert(word, table.concat(curr_word))
                    curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {c[i]}, {}, {}
                end

            elseif chartype[i] == "iter_symbol" then
                if #curr_word ~= 0 then table.insert(word, table.concat(curr_word)) end
                curr_word, curr_initial, curr_vowel, curr_coda = {c[i]}, {}, {}, {}

            elseif chartype[i] == "canc_symbol" then
                table.insert(curr_word, c[i])

            elseif chartype[i] == "number" then
                table.insert(curr_word, sp_symbols[c[i]])
            end
        end
        for i = 1, #word do
            word[i] = gsub(word[i], "^([ເແໂໄໃຽ]?)(ຫ?[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວຫອຮໜໝ]ຼ?)([^໌]*)(໌?)$", function(a, b, c, e)
                if match(sub(c, -1, -1), "[ກຂຄງຈສຊຍດຕຖທນບປຜຝພຟມຢຣລວ]") then
                    d = sub(c, -1, -1)
                    c = sub(c, 1, -2)
                else
                    d = ""
                end
                if a .. c == "" then c = "ະ" end
                vowel = vowel_conv[a .. c .. d] or (vowel_conv[a .. c] or a .. c) .. (coda_conv[d] or d)
                if match(vowel, "[ກ-ໝ]") then vowel = gsub(vowel, "^(.*)([ຍອວ])(.*)$", function(x, y, z) return (vowel_conv[x] or x) .. " " .. (initial_conv[y] or y) .. (vowel_conv[z] or z) end) end
                return (initial_conv[b] or b) .. vowel .. e
            end)

            if char_type[word[i]] == "iter_symbol" and i >= 2 then word[i] = "<small><u>" .. word[i - 1] .. "</u></small>" end

            if match(word[i], "໌") and len(word[i]) > 1 then word[i] = gsub(word[i], "(.)໌", "<small><del>%1</del></small>") end

            table.insert(output, word[i])
        end
        lao_text = table.concat(output, " ")
        lao_text = gsub(lao_text, ".", sp_symbols)

        text = gsub(text, original_text, lao_text)
    end

    if match(text, "[ກ-ໝ]") and not debug_mode then
        return nil
    else
        return text
    end
end

return export
