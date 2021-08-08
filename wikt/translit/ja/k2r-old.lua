local export = {}

local data = mw.loadData("ja/data")

function export.kana_to_romaji(text, nodiacr, keepdot)
    if type(text) == "table" then -- assume a frame.
        text, nodiacr = text.args[1], text.args[2]
    end

    -- remove %
    text = mw.ustring.gsub(text, "%%", "")

    text = mw.ustring.gsub(text, "%^'''", "'''^")
    text = mw.ustring.gsub(text, "%^ ", " ^")

    -- local kr_minus_period = data.kr
    -- kr_minus_period["。"] = "。"

    -- convert Japanese spaces to western spaces
    text = mw.ustring.gsub(text, "　", " ")

    -- if there is a は separated by halfwidth spaces, romanize it as " wa "
    text = mw.ustring.gsub(text, " は ", " wa ")
    -- also if it follows a space and is the last character, e.g. それでは
    text = mw.ustring.gsub(text, " は$", " wa")
    -- or " は、"
    text = mw.ustring.gsub(text, " は、", " wa, ")
    -- or " は。"
    text = mw.ustring.gsub(text, " は。", " wa. ")
    text = mw.ustring.gsub(text, " は？", " wa? ")
    text = mw.ustring.gsub(text, " は）", " wa)")
    -- or " '''は''' "
    text = mw.ustring.gsub(text, " '''は''' ", " '''wa''' ")
    -- romanize では as "dewa"
    text = mw.ustring.gsub(text, " では ", " dewa ")
    text = mw.ustring.gsub(text, " では$", " dewa")
    text = mw.ustring.gsub(text, " では、", " dewa, ")
    text = mw.ustring.gsub(text, " では。", " dewa. ")
    text = mw.ustring.gsub(text, " では？", " dewa? ")
    text = mw.ustring.gsub(text, " では）", " dewa)")
    text = mw.ustring.gsub(text, "'''では'''", "'''dewa'''")
    -- romanize で は (with space) as "de wa"
    text = mw.ustring.gsub(text, "'''で は'''", "'''de wa'''")
    -- same sort of thing for へ
    text = mw.ustring.gsub(text, " へ ", " e ")
    text = mw.ustring.gsub(text, " '''へ''' ", " '''e''' ")
    text = mw.ustring.gsub(text, " へ$", " e")
    text = mw.ustring.gsub(text, " へ、", " e, ")
    text = mw.ustring.gsub(text, " へ。", " e. ")
    text = mw.ustring.gsub(text, " へ？", " e?")
    text = mw.ustring.gsub(text, " へ）", " e)")
    -- dangling small tsu is romanized as <s>nothing</s> apostrophe
    text = mw.ustring.gsub(text, "[ッっ]。", "&apos;。")
    text = mw.ustring.gsub(text, "[ッっ]！", "&apos;！")
    text = mw.ustring.gsub(text, "[ッっ]」", "&apos;」")
    text = mw.ustring.gsub(text, "[ッっ]、", "&apos;、")

    -- ゝ means "repeat the previous character" and is used with hiragana, like 々 is for kanji
    text = mw.ustring.gsub(text, "(.)ゝ", "%1%1")
    text = mw.ustring.gsub(text, "(.)ゞ", function(char) return mw.ustring.toNFC(char .. char .. "゙") end)

    -- romanising ヶ
    text = mw.ustring.gsub(text, "ヶげつ", "kagetsu")
    text = mw.ustring.gsub(text, "ヶ", "ga")

    -- convert hiragana to katakana
    text = require("ja").hira_to_kata(text)
    -- replace katakana with romaji (?? not sure what the pattern below does ??)
    -- this is hackish, but we're using the period to indicate morpheme boundaries to prevent macrons
    -- from forming across them, so we'll remove the ASCII periods used for markup but not the Japanese periods

    -- convert the Japanese periods at the end
    -- table.remove(kr_minus_period, "。")
    text = mw.ustring.gsub(text, ".[ィェォャュョァヮゥ゜]?ェ?", function(char)
        if char == "。" then
            return char
        else
            return data.kr_old[char] or char
        end
    end)

    text = require("ja").fullwidth_to_halfwidth(text)

    -- replace long vowel mark with the vowel that comes before
    text = mw.ustring.gsub(text, "([aeiou])ー", "%1%1")

    -- add vowels with diacritics
    if not nodiacr then
        text = mw.ustring.gsub(text, "oo", "ō")
        text = mw.ustring.gsub(text, "aa", "ā")
        text = mw.ustring.gsub(text, "ee", "ē")
        text = mw.ustring.gsub(text, "ou", "ō")
        text = mw.ustring.gsub(text, "uu", "ū")
        text = mw.ustring.gsub(text, "ii", "ī")
    end

    if not keepdot then
        -- if input had spaces, keep them
        -- if the input string had periods, then remove them now
        text = mw.ustring.gsub(text, "%.", "")
        -- now that markup periods are gone, convert the Japanese periods to western periods
        text = mw.ustring.gsub(text, "。", ". ")
    end

    -- 
    text = mw.ustring.gsub(text, "◇◆", "")
    text = mw.ustring.gsub(text, "◆◇", "")
    text = mw.ustring.gsub(text, " *◆ *", "")
    text = mw.ustring.gsub(text, " *◇ *", " ")

    -- romanize sokuon or geminate consonants
    -- text = mw.ustring.gsub(text, '^ッ', '')
    -- double the previous consonant letter if there is a small tsu
    text = mw.ustring.gsub(text, "ッ([kstpgdbjzrfh])", "%1%1")
    text = mw.ustring.gsub(text, "ッ'''([kstpgdbjzrfh])", "%1'''%1")
    -- replace ッc with tc
    text = mw.ustring.gsub(text, "ッc", "tc")
    text = mw.ustring.gsub(text, "ッ'''c", "t'''c")
    -- if small tsu comes at the end, just throw it away
    -- text = mw.ustring.gsub(text, 'ッ$', '')

    text = mw.ustring.gsub(text, "ッ", "&apos;")

    -- the @ is used to determine when to insert an opostrophe after ん or ン
    -- (all is kata at that point)
    -- insert apostrophe when ン is followed by a vowel or
    -- y, which corresponds to the cases んや (n'ya) んゆ (n'yu) and んよ (n'yo)
    text = mw.ustring.gsub(text, "@([aeiouāēīōūy])", "'%1")
    -- remove @
    text = mw.ustring.gsub(text, "@", "")

    -- capitalize any letter following a ^ symbol
    text = mw.ustring.gsub(text, "%^%l", mw.ustring.upper)
    -- remove ^
    text = mw.ustring.gsub(text, "%^", "")

    -- clean up spaces
    text = mw.text.trim(text)
    text = mw.ustring.gsub(text, " +", " ")

    text = mw.ustring.toNFC(text)

    return text
end

return export
