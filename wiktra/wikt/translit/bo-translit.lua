local export = {}
local gsub = mw.ustring.gsub
local match = mw.ustring.match

local conv = {
    ["ཀ"] = "k",
    ["ཁ"] = "kh",
    ["ག"] = "g",
    ["ང"] = "ng",
    ["ཅ"] = "c",
    ["ཆ"] = "ch",
    ["ཇ"] = "j",
    ["ཉ"] = "ny",
    ["ཏ"] = "t",
    ["ཐ"] = "th",
    ["ད"] = "d",
    ["ན"] = "n",
    ["པ"] = "p",
    ["ཕ"] = "ph",
    ["བ"] = "b",
    ["མ"] = "m",
    ["ཙ"] = "ts",
    ["ཚ"] = "tsh",
    ["ཛ"] = "dz",
    ["ཝ"] = "w",
    ["ཞ"] = "zh",
    ["ཟ"] = "z",
    ["འ"] = "‘",
    ["ཡ"] = "y",
    ["ར"] = "r",
    ["ལ"] = "l",
    ["ཤ"] = "sh",
    ["ས"] = "s",
    ["ཧ"] = "h",
    ["ཨ"] = "a",
    ["ཊ"] = "ṭ",
    ["ཋ"] = "ṭh",
    ["ཌ"] = "ḍ",
    ["ཎ"] = "ṇ",
    ["ཥ"] = "ṣ",

    ["ི"] = "i",
    ["ུ"] = "u",
    ["ེ"] = "e",
    ["ོ"] = "o",
    ["ཱ"] = "ā",
    ["ཱི"] = "ī",
    ["ཱུ"] = "ū",
    ["ཻ"] = "ai",
    ["ཽ"] = "au",
    ["ྲྀ"] = "ṛ",
    ["ཷ"] = "ṝ",
    ["ླྀ"] = "ḷ",
    ["ཹ"] = "ḹ",
    ["ཾ"] = "ṃ",
    ["ྃ"] = "ṃ",
    ["ཿ"] = "aḥ",
    ["ༀ"] = "oṃ",

    ["ྐ"] = "k",
    ["ྑ"] = "kh",
    ["ྒ"] = "g",
    ["ྔ"] = "ng",
    ["ྕ"] = "c",
    ["ྖ"] = "ch",
    ["ྗ"] = "j",
    ["ྙ"] = "ny",
    ["ྟ"] = "t",
    ["ྠ"] = "th",
    ["ྡ"] = "d",
    ["ྣ"] = "n",
    ["ྤ"] = "p",
    ["ྥ"] = "ph",
    ["ྦ"] = "b",
    ["ྨ"] = "m",
    ["ྩ"] = "ts",
    ["ྪ"] = "tsh",
    ["ྫ"] = "dz",
    ["ྭ"] = "w",
    ["ྮ"] = "zh",
    ["ྯ"] = "z",
    ["ྰ"] = "‘",
    ["ྱ"] = "y",
    ["ྲ"] = "r",
    ["ླ"] = "l",
    ["ྴ"] = "sh",
    ["ྶ"] = "s",
    ["ྷ"] = "h",
    ["ྸ"] = "a",
    ["ྚ"] = "ṭ",
    ["ྛ"] = "ṭh",
    ["ྜ"] = "ḍ",
    ["ྞ"] = "ṇ",
    ["ྵ"] = "ṣ"
}

local symbol = {["༠"] = "0", ["༡"] = "1", ["༢"] = "2", ["༣"] = "3", ["༤"] = "4", ["༥"] = "5", ["༦"] = "6", ["༧"] = "7", ["༨"] = "8", ["༩"] = "9", ["༪"] = "0.5", ["༫"] = "1.5", ["༬"] = "2.5", ["༭"] = "3.5", ["༮"] = "4.5", ["༯"] = "5.5", ["༰"] = "6.5", ["༱"] = "7.5", ["༲"] = "8.5", ["༳"] = "9.5", ["་"] = " ", ["།"] = "·", ["‘"] = "'"}

function export.tr(text, lang, sc, debug_mode)
    text = gsub(text, "[༌་]+ ?", "་")
    text = gsub(text, "[་།]+$", "")
    text = gsub(text, "([^་])(འ[ཱིེོིུྲཷླཹཾཿ])", "%1་‘་%2")

    for Tibetan_word in mw.ustring.gmatch(text, "[་-༑ཀ-ྼ]+") do
        Tibetan_word = gsub(Tibetan_word, "་$", "")

        for syllable in mw.ustring.gmatch(Tibetan_word, "[ཀ-ྼ]+") do
            local tr = {}

            local syl = gsub(syllable, "ཨ([ཱིེོིུྲཷླཹཾཿ])", "%1")
            syl = gsub(syl, "([ྐྑྒྔྕྖྗྙྟྠྡྣྤྥྦྨྩྪྫྮྯྭྰྱྲླྴྶྷྸ]+)([^ཱིེོིུྲཷླཹཾཿྐྑྒྔྕྖྗྙྟྠྡྣྤྥྦྨྩྪྫྮྯྭྰྱྲླྴྶྷྸ]*)$", "%1a%2")
            letter = mw.text.split(syl, "", true)

            for i = 1, #letter do tr[i] = conv[letter[i]] or letter[i] end

            if not match(syllable, "[ྐྑྒྔྕྖྗྙྟྠྡྣྤྥྦྨྩྪྫྮྯྭྰྱྲླྴྶྷྸིེོུཨཱཱཱིཻཽུྲྀཷླྀཹཾྃཿ]") then
                if #letter < 5 then
                    if #letter > 3 then
                        if letter[2] ~= "འ" and letter[3] ~= "འ" then table.insert(tr, 3, "a") end

                    elseif #letter > 2 then
                        if letter[3] == "འ" then
                            if letter[1] == "འ" then
                                tr = {"‘", tr[2], "a", "‘"}
                            else
                                tr = {tr[1], tr[2], "a", "‘"}
                            end

                        elseif not match(letter[1], "[གདབའམ]") or (match(letter[1] .. letter[2] .. letter[3], "[གདབའམ][གངཐབམའརལ]ས")) then
                            table.insert(tr, 2, "a")
                        else
                            table.insert(tr, 3, "a")
                        end

                    elseif match(letter[1], "[གདབའམ]") and not match(letter[2] or "", "[གངདཐབམའརལསན]") then
                        table.insert(tr, "a")
                    else
                        table.insert(tr, 2, "a")
                    end
                end
            end

            tr = table.concat(tr)

            if match(syllable, "གཡ") then tr = gsub(tr, "gy", "g.y") end

            if syllable == "འགས" then tr = gsub(tr, "‘ags", "‘gas") end

            if syllable == "དབས" then tr = gsub(tr, "dabs", "dbas") end

            if syllable == "དགས" then tr = gsub(tr, "dags", "dgas") end

            if syllable == "དམས" then tr = gsub(tr, "dams", "dmas") end

            text = gsub(text, syllable, tr, 1)
        end
    end

    text = gsub(text, ".", symbol)
    text = gsub(text, " ' ", "")
    text = gsub(text, " *· *·? *", " · ")
    text = gsub(text, " *%.", ".")

    if match(text, "[ཀ-ྼ]") and not debug_mode then
        return nil
    else
        return text
    end
end

return export
