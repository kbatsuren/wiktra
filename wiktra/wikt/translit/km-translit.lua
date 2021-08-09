local export = {}
local gsub = mw.ustring.gsub
local len = mw.ustring.len
local match = mw.ustring.match
local sub = mw.ustring.sub

local cons_conv = {["ក"] = {"k", "a"}, ["ខ"] = {"kh", "a"}, ["គ"] = {"k", "o"}, ["ឃ"] = {"kh", "o"}, ["ង"] = {"ng", "o"}, ["ច"] = {"ch", "a"}, ["ឆ"] = {"chh", "a"}, ["ជ"] = {"ch", "o"}, ["ឈ"] = {"chh", "o"}, ["ញ"] = {"nh", "o"}, ["ដ"] = {"d", "a"}, ["ឋ"] = {"th", "a"}, ["ឌ"] = {"d", "o"}, ["ឍ"] = {"th", "o"}, ["ណ"] = {"n", "a"}, ["ត"] = {"t", "a"}, ["ថ"] = {"th", "a"}, ["ទ"] = {"t", "o"}, ["ធ"] = {"th", "o"}, ["ន"] = {"n", "o"}, ["ប"] = {"b", "a"}, ["ផ"] = {"ph", "a"}, ["ព"] = {"p", "o"}, ["ភ"] = {"ph", "o"}, ["ម"] = {"m", "o"}, ["យ"] = {"y", "o"}, ["រ"] = {"r", "o"}, ["ល"] = {"l", "o"}, ["វ"] = {"v", "o"}, ["ឝ"] = {"sh", "a"}, ["ឞ"] = {"ss", "o"}, ["ស"] = {"s", "a"}, ["ហ"] = {"h", "a"}, ["ឡ"] = {"l", "a"}, ["អ"] = {"ʼ", "a"}, [""] = {"", ""}, ["ប៉"] = {"p", "a"}}

local digraph = {["ហ្គ"] = "g", ["ហ្ន"] = "n", ["ហ្ម"] = "m", ["ហ្ល"] = "l", ["ហ្វ"] = "f", ["ហ្ស"] = "z"}

local indep_vowel = {["ឣ"] = "ʼâ", ["ឤ"] = "ʼa", ["ឥ"] = "ʼĕ", ["ឦ"] = "ʼei", ["ឧ"] = "ʼŏ", ["ឨ"] = "ʼŏk", ["ឩ"] = "ʼŭ", ["ឪ"] = "ʼŏu", ["ឫ"] = "rœ̆", ["ឬ"] = "rœ", ["ឭ"] = "lœ̆", ["ឮ"] = "lœ", ["ឯ"] = "ʼé", ["ឰ"] = "ʼai", ["ឱ"] = "ʼaô", ["ឲ"] = "ʼaô", ["ឳ"] = "ʼâu"}

local vowel_conv = {
    [""] = {["a"] = "â", ["o"] = "ô"},
    ["ា"] = {["a"] = "a", ["o"] = "éa"},
    ["ិ"] = {["a"] = "ĕ", ["o"] = "ĭ"},
    ["ី"] = {["a"] = "ei", ["o"] = "i"},
    ["ឹ"] = {["a"] = "œ̆", ["o"] = "œ̆"},
    ["ឺ"] = {["a"] = "œ", ["o"] = "œ"},
    ["ុ"] = {["a"] = "ŏ", ["o"] = "ŭ"},
    ["ូ"] = {["a"] = "o", ["o"] = "u"},
    ["ួ"] = {["a"] = "uŏ", ["o"] = "uŏ"},
    ["ើ"] = {["a"] = "aeu", ["o"] = "eu"},
    ["ឿ"] = {["a"] = "eua", ["o"] = "eua"},
    ["ៀ"] = {["a"] = "iĕ", ["o"] = "iĕ"},
    ["េ"] = {["a"] = "é", ["o"] = "é"},
    ["ែ"] = {["a"] = "ê", ["o"] = "ê"},
    ["ៃ"] = {["a"] = "ai", ["o"] = "ey"},
    ["ោ"] = {["a"] = "aô", ["o"] = "oŭ"},
    ["ៅ"] = {["a"] = "au", ["o"] = "ŏu"},
    ["ុំ"] = {["a"] = "om", ["o"] = "ŭm"},
    ["ំ"] = {["a"] = "âm", ["o"] = "um"},
    ["ាំ"] = {["a"] = "ăm", ["o"] = "ŏâm"},
    ["ាំង"] = {["a"] = "ăng", ["o"] = "eăng"},
    ["ះ"] = {["a"] = "ăh", ["o"] = "eăh"},
    ["ុះ"] = {["a"] = "ŏh", ["o"] = "uh"},
    ["េះ"] = {["a"] = "éh", ["o"] = "éh"},
    ["ោះ"] = {["a"] = "aŏh", ["o"] = "uŏh"},
    ["ឹះ"] = {["a"] = "ĕh", ["o"] = "ĭh"},
    ["ិះ"] = {["a"] = "ĕh", ["o"] = "ĭh"},
    ["ៈ"] = {["a"] = "aʼ", ["o"] = "éaʼ"},
    ["័"] = {["a"] = "<span style=\"font-color:#DCDCDC\">â</span>", ["o"] = "<span style=\"font-color:#DCDCDC\">ô</span>"}
}

local char_type = {
    ["ក"] = "consonant",
    ["ខ"] = "consonant",
    ["គ"] = "consonant",
    ["ឃ"] = "consonant",
    ["ង"] = "consonant",
    ["ច"] = "consonant",
    ["ឆ"] = "consonant",
    ["ជ"] = "consonant",
    ["ឈ"] = "consonant",
    ["ញ"] = "consonant",
    ["ដ"] = "consonant",
    ["ឋ"] = "consonant",
    ["ឌ"] = "consonant",
    ["ឍ"] = "consonant",
    ["ណ"] = "consonant",
    ["ត"] = "consonant",
    ["ថ"] = "consonant",
    ["ទ"] = "consonant",
    ["ធ"] = "consonant",
    ["ន"] = "consonant",
    ["ប"] = "consonant",
    ["ផ"] = "consonant",
    ["ព"] = "consonant",
    ["ភ"] = "consonant",
    ["ម"] = "consonant",
    ["យ"] = "consonant",
    ["រ"] = "consonant",
    ["ល"] = "consonant",
    ["វ"] = "consonant",
    ["ឝ"] = "consonant",
    ["ឞ"] = "consonant",
    ["ស"] = "consonant",
    ["ហ"] = "consonant",
    ["ឡ"] = "consonant",
    ["អ"] = "consonant",
    ["ឣ"] = "indep_vowel",
    ["ឤ"] = "indep_vowel",
    ["ឥ"] = "indep_vowel",
    ["ឦ"] = "indep_vowel",
    ["ឧ"] = "indep_vowel",
    ["ឨ"] = "indep_vowel",
    ["ឩ"] = "indep_vowel",
    ["ឪ"] = "indep_vowel",
    ["ឫ"] = "indep_vowel",
    ["ឬ"] = "indep_vowel",
    ["ឭ"] = "indep_vowel",
    ["ឮ"] = "indep_vowel",
    ["ឯ"] = "indep_vowel",
    ["ឰ"] = "indep_vowel",
    ["ឱ"] = "indep_vowel",
    ["ឲ"] = "indep_vowel",
    ["ឳ"] = "indep_vowel",
    ["ា"] = "vowel_sign",
    ["ិ"] = "vowel_sign",
    ["ី"] = "vowel_sign",
    ["ឹ"] = "vowel_sign",
    ["ឺ"] = "vowel_sign",
    ["ុ"] = "vowel_sign",
    ["ូ"] = "vowel_sign",
    ["ួ"] = "vowel_sign",
    ["ើ"] = "vowel_sign",
    ["ឿ"] = "vowel_sign",
    ["ៀ"] = "vowel_sign",
    ["េ"] = "vowel_sign",
    ["ែ"] = "vowel_sign",
    ["ៃ"] = "terminating_vowel",
    ["ោ"] = "vowel_sign",
    ["ៅ"] = "vowel_sign",
    ["ំ"] = "terminating_vowel",
    ["ះ"] = "terminating_vowel",
    ["ៈ"] = "terminating_vowel",
    ["៉"] = "consonant_shift",
    ["៊"] = "consonant_shift",
    ["់"] = "terminating_sign",
    ["៌"] = "sign",
    ["៍"] = "sign",
    ["៎"] = "sign",
    ["៏"] = "sign",
    ["័"] = "sign",
    ["៑"] = "sign",
    ["្"] = "combining_sign",
    ["៓"] = "sign",
    ["។"] = "punctuation",
    ["៕"] = "punctuation",
    ["៖"] = "sign",
    ["ៗ"] = "punctuation",
    ["៘"] = "punctuation",
    ["៙"] = "punctuation",
    ["៚"] = "punctuation",
    ["៛"] = "punctuation",
    ["ៜ"] = "sign",
    ["៝"] = "sign",
    ["​"] = "ZWS"
}

local sp_symbols = {["០"] = "0", ["១"] = "1", ["២"] = "2", ["៣"] = "3", ["៤"] = "4", ["៥"] = "5", ["៦"] = "6", ["៧"] = "7", ["៨"] = "8", ["៩"] = "9", ["៰"] = "0", ["៱"] = "1", ["៲"] = "2", ["៳"] = "3", ["៴"] = "4", ["៵"] = "5", ["៶"] = "6", ["៷"] = "7", ["៸"] = "8", ["៹"] = "9"}

function export.tr(text, lang, sc, debug_mode)
    text = gsub(text, "[០-៹]", sp_symbols)
    text = gsub(text, "(.)្(.្.)", "%1​%2")
    text = gsub(text, "([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ]្[កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ])([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ])", "​%1%2")
    text = gsub(text, "([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ])([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ]្?[កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ])", "%1​%2")
    text = gsub(text, "(.៍)", "​%1")

    for word in mw.ustring.gmatch(text, "[ក-៝​]+") do
        local original_text = word
        local c, chartype, syl, curr_syl = {}, {}, {}, {}
        local progress = "none"

        for i = 1, len(word) do
            c[i] = sub(word, i, i)
            chartype[i] = char_type[c[i]]
        end

        for i = 1, #c + 1 do
            local next_types = {}
            if i == #c + 1 or chartype[i] == "ZWS" then
                progress = "none"
                table.insert(syl, table.concat(curr_syl, ""))
                curr_syl = {}
            elseif progress == "none" then
                if chartype[i] == "consonant" then
                    table.insert(curr_syl, c[i])
                    progress = "initial"
                else
                    table.insert(syl, c[i])
                end
            elseif progress == "initial" then
                if chartype[i] == "combining_sign" then
                    table.insert(curr_syl, c[i])
                    progress = "initial_combining"
                elseif chartype[i] == "sign" or chartype[i] == "consonant_shift" then
                    table.insert(curr_syl, c[i])
                elseif chartype[i] == "vowel_sign" then
                    table.insert(curr_syl, c[i])
                    progress = "vowel"
                elseif chartype[i] == "terminating_vowel" then
                    if c[i - 1] .. c[i] .. (c[i + 1] or "") == "ាំង" and (i == #c - 1 or (i > #c + 1 and chartype[i + 2] == "consonant")) then
                        table.insert(curr_syl, c[i])
                        progress = "vowel"
                    else
                        table.insert(curr_syl, c[i])
                        table.insert(syl, table.concat(curr_syl, ""))
                        curr_syl = {}
                        progress = "none"
                    end
                elseif chartype[i] == "consonant" then
                    vowel_found = false
                    local j, skipped = i, 0
                    while not vowel_found do
                        if not chartype[j] or chartype[j] == "punctuation" or chartype[j] == "indep_vowel" or chartype[j] == "terminating_sign" or chartype[j] == "ZWS" then
                            skipped = 1
                            break
                        elseif chartype[j] == "consonant" or chartype[j] == "combining_sign" or (chartype[j] == "sign" and c[j] ~= "័") then
                            table.insert(next_types, chartype[j])
                        else
                            vowel_found = true
                        end
                        j = j + 1
                    end
                    if skipped ~= 0 or match(table.concat(next_types, " "), "consonant s?i?g?n? ?consonant") then
                        table.insert(curr_syl, c[i])
                        progress = "coda"
                    else
                        table.insert(syl, table.concat(curr_syl, ""))
                        curr_syl = {c[i]}
                        progress = "initial"
                    end
                else
                    table.insert(syl, c[i])
                    progress = "none"
                end
            elseif progress == "initial_combining" then
                if chartype[i] == "consonant" then
                    table.insert(curr_syl, c[i])
                    progress = "initial"
                else
                    table.insert(syl, c[i])
                    progress = "none"
                end
            elseif progress == "vowel" then
                if chartype[i] == "vowel_sign" then
                    table.insert(curr_syl, c[i])
                elseif chartype[i] == "terminating_vowel" then
                    if c[i - 1] .. c[i] .. (c[i + 1] or "") == "ាំង" and (i == #c - 1 or (i > #c + 1 and chartype[i + 2] == "consonant")) then
                        table.insert(curr_syl, c[i])
                        progress = "vowel"
                    else
                        table.insert(curr_syl, c[i])
                        table.insert(syl, table.concat(curr_syl, ""))
                        curr_syl = {}
                        progress = "none"
                    end
                elseif chartype[i] == "consonant" then
                    vowel_found = false
                    local j, skipped = i, 0
                    while not vowel_found do
                        if not chartype[j] or chartype[j] == "punctuation" or chartype[j] == "indep_vowel" or chartype[j] == "terminating_sign" or chartype[j] == "ZWS" then
                            skipped = 1
                            break
                        elseif chartype[j] == "consonant" or chartype[j] == "combining_sign" or (chartype[j] == "sign" and c[j] ~= "័") then
                            table.insert(next_types, chartype[j])
                        else
                            vowel_found = true
                        end
                        j = j + 1
                    end
                    if skipped ~= 0 or match(table.concat(next_types, " "), "consonant s?i?g?n? ?consonant") then
                        table.insert(curr_syl, c[i])
                        progress = "coda"
                    else
                        table.insert(syl, table.concat(curr_syl, ""))
                        curr_syl = {c[i]}
                        progress = "initial"
                    end
                else
                    table.insert(syl, c[i])
                    progress = "none"
                end
            elseif progress == "coda" then
                if chartype[i] == "combining_sign" then
                    table.insert(curr_syl, c[i])
                    progress = "coda_combining"
                elseif chartype[i] == "sign" or chartype[i] == "terminating_sign" then
                    table.insert(curr_syl, c[i])
                else
                    table.insert(syl, table.concat(curr_syl, ""))
                    curr_syl = {}
                    if chartype[i] == "consonant" then
                        table.insert(curr_syl, c[i])
                        progress = "initial"
                    else
                        table.insert(syl, c[i])
                        progress = "none"
                    end
                end
            elseif progress == "coda_combining" then
                if chartype[i] == "consonant" then
                    table.insert(curr_syl, c[i])
                    progress = "coda"
                else
                    table.insert(syl, table.concat(curr_syl, ""))
                    curr_syl = {}
                    progress = "none"
                end
            end
        end

        for i = 1, #syl do
            if match(syl[i], "៍") then
                syl[i] = "<small><del>" .. gsub(syl[i], ".", function(consonant) if cons_conv[consonant] then return cons_conv[consonant][1] end end) .. "</del></small>"
                break
            end
            syl[i] = gsub(syl[i], "់$", "")

            syl[i] = gsub(syl[i], "^([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ])្?([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ]?)([៉៊]?)([ិីឹឺុូួើឿៀេែៃោៅា័]?[ំះៈ]?)([៉៊]?)([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ]?៉?)្?([កខគឃងចឆជឈញដឋឌឍណតថទធនបផពភមយរលវឝឞសហឡអ]?)(៖?)$", function(initial_a, initial_b, cons_shifter_a, vowel, cons_shifter_b, coda_a, coda_b, optional_sign)
                if cons_shifter_a .. cons_shifter_b .. vowel .. coda_a .. coda_b == "" and initial_b ~= "" and not match(syl[i], "្") then
                    coda_a = initial_b
                    initial_b = ""
                end
                base = initial_a
                if initial_b ~= "" and not match(initial_b, "[ងញនមយរលវ]") then base = initial_b end
                if vowel .. coda_a .. coda_b == "ាំង" then vowel, coda_a, coda_b = "ាំង", "", "" end
                optional_sign = gsub(optional_sign, "៖", "ː")

                cons_shifter = cons_shifter_a .. cons_shifter_b
                if cons_shifter == "" and cons_conv[base] then
                    vowel_class = cons_conv[base][2]
                elseif cons_shifter == "៉" then
                    vowel_class = "a"
                elseif cons_shifter == "៊" then
                    vowel_class = "o"
                else
                    return initial_a .. initial_b .. cons_shifter .. vowel .. coda_a .. coda_b .. optional_sign
                end

                if digraph[initial_a .. "្" .. initial_b] and (digraph[coda_a .. "្" .. coda_b] or (cons_conv[coda_a] and cons_conv[coda_b])) and vowel_conv[vowel] then
                    return digraph[initial_a .. "្" .. initial_b] .. vowel_conv[vowel][vowel_class] .. (digraph[coda_a .. "្" .. coda_b] or cons_conv[coda_a][1] .. cons_conv[coda_b][1]) .. optional_sign

                elseif cons_conv[initial_a] and cons_conv[initial_b] and vowel_conv[vowel] and cons_conv[coda_a] and cons_conv[coda_b] then
                    return cons_conv[initial_a][1] .. cons_conv[initial_b][1] .. vowel_conv[vowel][vowel_class] .. cons_conv[coda_a][1] .. cons_conv[coda_b][1] .. optional_sign
                end
            end)

            if syl[i] == "ៗ" and i > 1 then syl[i] = syl[i - 1] end
        end
        word = table.concat(syl, "")
        text = gsub(text, original_text, word)
    end

    text = gsub(text, ".", indep_vowel)
    text = gsub(text, "([^ ]*) ៗ", "%1 %1")

    if match(text, "[ក-៹]") and not debug_mode then
        return nil
    else
        return text
    end

    -- To do: other signs
end

return export
