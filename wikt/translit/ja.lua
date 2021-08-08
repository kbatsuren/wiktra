local export = {}

local titleObj = mw.title.getCurrentTitle()
local pagename = titleObj.text
local namespace = titleObj.nsText

local str_gsub = string.gsub
local find = mw.ustring.find
local length = mw.ustring.len
local trim = mw.text.trim
local split = mw.text.split
local sub, gsub = mw.ustring.sub, mw.ustring.gsub
local match, gmatch = mw.ustring.match, mw.ustring.gmatch
local to_cp, to_char = mw.ustring.codepoint, mw.ustring.char

local Jpan = require("scripts").getByCode("Jpan")
local lang = require("languages").getByCode("ja")

-- note that arrays loaded by mw.loadData cannot be directly used by gsub
local data = mw.loadData("ja/data")

-- Unicode normalization often converts these to the corresponding CJK Unified Ideographs characters
local compat_ideo = mw.ustring.char(0xF900) .. "-" .. mw.ustring.char(0xFAD9)

export.data = {joyo_kanji = data.joyo_kanji, jinmeiyo_kanji = data.jinmeiyo_kanji, grade1 = data.grade1, grade2 = data.grade2, grade3 = data.grade3, grade4 = data.grade4, grade5 = data.grade5, grade6 = data.grade6}

local function track(code)
    if type(code) ~= "string" then error("The track function requires a string as argument.") end
    require("debug").track("ja/" .. code)
end

local function change_codepoint(added_value) return function(char) return to_char(to_cp(char) + added_value) end end

function export.hira_to_kata(text)
    if type(text) == "table" then text = text.args[1] end

    return (gsub(gsub(text, "[ぁ-ゖ]", change_codepoint(96)), "[𛅐-𛅒]", change_codepoint(20)))
end

function export.kata_to_hira(text)
    if type(text) == "table" then text = text.args[1] end

    return (gsub(gsub(text, "[ァ-ヶ]", change_codepoint(-96)), "[𛅤-𛅦]", change_codepoint(-20)))
end

function export.fullwidth_to_halfwidth(text)
    if type(text) == "table" then text = text.args[1] end

    text = gsub(text, "　", " ")
    return (gsub(text, "[！-～]", change_codepoint(-65248)))
end

function export.kana_to_romaji(text, options)
    -- options: no_diacritics, keep_period, hist, phonetic
    local str_find = string.find

    if type(text) == "table" then text = text.args[1] end

    if not options then options = {} end

    -- conversions
    if not options.phonetic then
        text = gsub(text, "(%-)([はハ])$", "%1㊟㈛㊟%2") -- は as suffix (派 "-ha", etc.) and appearing at the end of string
        text = gsub(text, "(%-)([はハ]) ", "%1㊟㈛㊟%2 ") -- は as suffix and appearing mid-sentence
    end

    text = str_gsub(text, "％", "㊟㌫㊟") -- at [[見込む]], for example; avoid collision with % used in our ruby syntax
    text = str_gsub(text, "'''", "㊟⒝㊟")
    text = str_gsub(text, "<u>", "㊟㋑⒰㊟")
    text = str_gsub(text, "</u>", "㊟㋺⒰㊟")

    local text_styling = "㊟[㋑㋺⒝⒰]+㊟"

    -- avoid tampering with existing latin text: store it away
    local escape = {}
    local id = 0
    for latin in string.gmatch(text, "[a-z]+") do
        escape[id] = latin
        text = str_gsub(text, latin, "㊟㊕㊕㊟" .. id .. "㊟㊕㊕㊟")
        id = id + 1
    end

    -- special preformatting
    text = str_gsub(text, "ヶげつ", "かげつ")
    text = gsub(text, "ヶ(" .. text_styling .. ")げつ", "か%1げつ") -- 「'''ヶ'''げつ」
    text = str_gsub(text, "ヶ", "が")
    text = str_gsub(text, "ヵ", "か")
    text = gsub(text, "(.)[ゝヽ]", "%1%1")
    text = gsub(text, "(.)[ゞヾ]", function(char) return mw.ustring.toNFC(char .. char .. "゙") end) -- unicode hax

    -- [[Wiktionary:Grease_pit/2017/May#Formatting_for_individual_Japanese_readings]]
    if options.hist then
        text = gsub(text, "[やゆよわゐゑを]", "㊟⒳㊟%0")
        text = gsub(text, ".", {["し"] = "si", ["じ"] = "zi", ["ち"] = "ti", ["ぢ"] = "di", ["つ"] = "tu", ["づ"] = "du", ["𛀁"] = "ye", ["𛀆"] = "yi", ["ゐ"] = "wi", ["を"] = "wo"})
    end

    text = export.hira_to_kata(text)
    text = gsub(text, ".", data.kr)
    text = export.fullwidth_to_halfwidth(text)

    if options.hist then
        text = str_gsub(text, "oo", "o.o")
        text = str_gsub(text, "ou", "o.u")
        text = str_gsub(text, "h", "f")

        local old = text
        text = str_gsub(text, "i㊟⒳㊟y", "y") -- くゐやう kwyau
        text = str_gsub(text, "([kg])u㊟⒳㊟w", "%1w")
        if old ~= text then
            --[=[
				There may be cases in which i or u is deleted incorrectly, and a
				period should be inserted.
				"Syncope" isn't quite accurate, as there wasn't a sound change.
				It's just an orthographic convention.
				[[Special:WhatLinksHere/Template:tracking/ja/mora syncope]]
			]=]
            -- mw.log(str_gsub(old, '㊟⒳㊟', '')  .. ' → ' .. str_gsub(text, '㊟⒳㊟', '') )
            track("mora syncope")
        end

        text = str_gsub(text, "㊟⒳㊟", "") -- ゑつ wetsu
    end

    -- markup
    text = str_gsub(text, "%%", ".") -- ruby "percent sign" syntax
    text = gsub(text, "([ッ¤])%.", "%1") -- 「し を ぼっ.す」; 「るい%じん%えん」→「rui.jin¤.en¤」

    -- 「テェェェ」→「テェーー」 (avoid funky romaji effected by the "(テュ→)teユ→tyu" line below)
    local kogaki_vowels = {"ァ", "ィ", "ゥ", "ェ", "ォ"}
    for _, char in ipairs(kogaki_vowels) do text = gsub(text, "(" .. char .. ")(" .. char .. "+)", function(a, b) return a .. mw.ustring.rep("ー", length(b)) end) end

    -- (ゲェ→)geェ→gee (note that this causes things like ウゥ→ū and ギィ→gī)
    text = gsub(text, "[aiueo][ァィゥェォ]", {["aァ"] = "aa", ["iィ"] = "ii", ["uゥ"] = "uu", ["eェ"] = "ee", ["oォ"] = "oo"})

    -- (クヮ→)kuヮ→kwa, (ク𛅤→)ku𛅤→kwi, (ク𛅥→)ku𛅥→kwe, (ク𛅦→)ku𛅦→kwo
    text = gsub(text, "[uo]([ヮ𛅤𛅥𛅦])", {["ヮ"] = "wa", ["𛅤"] = "wi", ["𛅥"] = "we", ["𛅦"] = "wo"})

    -- (クァ→)kuァ→kwa, (トァ→)toァ→twa, (ウィ→)uィ→wi
    text = gsub(text, "[uo]([ァィェォ])", {["ァ"] = "wa", ["ィ"] = "wi", ["ェ"] = "we", ["ォ"] = "wo"})
    if not options.hist then
        -- (ツァ→)cwa→ca
        text = str_gsub(text, "([fvcsz])w", "%1")
    end

    -- (テュ→)teユ→tyu, (ギェ→)giェ→gye
    text = gsub(text, "[aiueo]([ャュェョ])", {["ャ"] = "ya", ["ュ"] = "yu", ["ェ"] = "ye", ["ョ"] = "yo"})
    -- (ジュ→)jyu→ju
    text = gsub(text, "([xjq])y", "%1")

    -- (ティ→)teィ→ti (essentially forget about the vowel in between)
    text = gsub(text, "[aiueo]([ァィゥェォ])", {["ァ"] = "a", ["ィ"] = "i", ["ゥ"] = "u", ["ェ"] = "e", ["ォ"] = "o"})

    -- chouonpu and sokuon
    while str_find(text, "[aiueo]ー") or str_find(text, "ッ *[bcdfghjklmnpqrstvwxyz]") or find(text, "ッ" .. text_styling .. "[bcdfghjklmnpqrstvwxyz]") do
        text = str_gsub(text, "([aiueo])ー", "%1%1")
        text = str_gsub(text, "ッ( *)([bcdfghjklmnpqrstvwxyz])", "%2%1%2")
        text = gsub(text, "ッ(" .. text_styling .. ")([bcdfghjklmnpqrstvwxyz])", "%2%1%2")
    end
    -- deal with leftover sokuon not used as geminate
    text = str_gsub(text, "ッ", "&#39;") -- Apostrophe

    -- (ん→)n¤
    text = str_gsub(text, "¤([aiueoy])", "'%1")
    text = str_gsub(text, "¤", "")

    -- は, へ
    if not options.phonetic and str_find(text, "h[ae]") then
        for i, v in ipairs {{"ha", "wa"}, {"he", "e"}} do
            local thingy = "[^a-z.㊟-]" -- not sure what this should be named
            text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "(" .. thingy .. ")", "%1" .. v[2] .. "%2")
            text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "$", "%1" .. v[2])
            text = gsub(text, "^" .. v[1] .. "(" .. thingy .. ")", v[2] .. "%1")
            if find(text, text_styling) then
                text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "(" .. text_styling .. thingy .. ")", "%1" .. v[2] .. "%2")
                text = gsub(text, "(" .. thingy .. ")" .. v[1] .. "(" .. text_styling .. ")$", "%1" .. v[2] .. "%2")
                text = gsub(text, "(" .. thingy .. text_styling .. ")" .. v[1] .. "(" .. text_styling .. thingy .. ")", "%1" .. v[2] .. "%2")
                text = gsub(text, "(" .. thingy .. text_styling .. ")" .. v[1] .. "(" .. text_styling .. ")$", "%1" .. v[2] .. "%2")
            end
        end
    end
    -- change only when
    --   ① not flanked by a-z or a period ("^sore wa nani$", "^hyappou no .he hitotsu$")
    --   ② at the end of the string and not preceded by a-z or a period ("^are wa$")
    --   ③ at the beginning of the string and not followed by a-z or a period ("^he ikou$") [not sure this is actually necessary, but I suppose it is consistent with ②]
    -- this also means that "^ha$" becomes "ha"
    -- period can be used next to the kana (either side) to force the "dumb" romanization (i.e. "ha", "he")

    -- fix sh, ch, ts
    local function handle_digraphs(geminate, intervening, main, following)
        -- 「めちゃ」→「mecha」
        -- 「めっちゃ」→「metcha」
        -- 「めっっちゃ」→「mettcha」
        local corresp_geminate_form = {["x"] = "s", ["q"] = "t", ["c"] = "t"}
        local corresp_main = {["x"] = "sh", ["q"] = "ch", ["c"] = "ts"}

        local geminate_repl, main_repl

        -- So as not to convert ch to tsh.
        if not following or main .. following ~= "ch" then main_repl = corresp_main[main] end

        if geminate ~= "" then geminate_repl = string.rep(corresp_geminate_form[main], #geminate) end

        return (geminate_repl or geminate) .. (intervening or "") .. (main_repl or main) .. (following or "")
    end

    local function handle_digraphs2(geminate, main, following) return handle_digraphs(geminate, nil, main, following) end

    text = gsub(text, "([xqc]+)(" .. text_styling .. ")([xqc])", handle_digraphs)
    text = gsub(text, "([xqc]*)([xqc])(.?)", handle_digraphs2)

    -- macrons
    -- Will cause problems if combined vowel-macron characters are used below.
    if not options.no_diacritics then
        if not options.phonetic then text = str_gsub(text, "ou", "ō") end
        local macron = to_char(0x304)
        text = str_gsub(text, "([oaeui])%1", "%1" .. macron)
    end

    -- remove markup and convert real periods
    if not options.keep_period then
        text = str_gsub(text, "%.", "")
        text = str_gsub(text, "。", "◆.◇")
    end

    --
    text = str_gsub(text, "◇◆", "")
    text = str_gsub(text, "◆◇", "")
    text = str_gsub(text, " *◆ *", "")
    text = str_gsub(text, " *◇ *", " ")

    -- restore latin text
    text = str_gsub(text, "㊟㊕㊕㊟(%d+)㊟㊕㊕㊟", function(id) return escape[tonumber(id)] end)

    -- clean up spaces
    text = trim(text)
    text = str_gsub(text, " +", " ")

    -- remove double ampersands used in ruby
    text = str_gsub(text, "&&(.-)&&", "%1")

    -- uppercase markup
    text = str_gsub(text, "(%^)(㊟⒝㊟)", "%2%1") -- move ^ to an effective position if placed before bold markup
    text = str_gsub(text, "(%^)( )", "%2%1") -- same but with spaces
    text = gsub(text, "%^(.)", mw.ustring.upper) -- uppercase conversion

    -- clean up spaces again
    text = str_gsub(text, " +", " ")

    -- conversions
    text = str_gsub(text, "㊟⒝㊟", "'''")
    text = str_gsub(text, "㊟㋑⒰㊟", "<u>")
    text = str_gsub(text, "㊟㋺⒰㊟", "</u>")
    text = str_gsub(text, "㊟㈛㊟", "")
    text = str_gsub(text, "㊟㌫㊟", "%%")

    -- unicode NFC
    text = mw.ustring.toNFC(text)

    if find(text, "[ぁ-ー]") then track("k2r failure") end

    return text
end

-- removes spaces and hyphens from input
-- intended to be used when checking manual romaji to allow the
-- insertion of spaces or hyphens in manual romaji without appearing "wrong"
function export.rm_spaces_hyphens(f)
    local text = type(f) == "table" and f.args[1] or f
    text = str_gsub(text, ".", {[" "] = "", ["-"] = "", ["."] = "", ["'"] = ""})
    text = str_gsub(text, "&nbsp;", "")
    return text
end

function export.romaji_to_kata(f)
    local text = type(f) == "table" and f.args[1] or f
    text = gsub(text, ".", data.rd)
    text = str_gsub(text, "(.)%1", {k = "ッk", s = "ッs", t = "ッt", p = "ッp", b = "ッb", d = "ッd", g = "ッg", j = "ッj"})
    text = str_gsub(text, "tc", "ッc")
    text = str_gsub(text, "tsyu", "ツュ")
    text = str_gsub(text, "ts[uoiea]", {["tsu"] = "ツ", ["tso"] = "ツォ", ["tsi"] = "ツィ", ["tse"] = "ツェ", ["tsa"] = "ツァ"})
    text = str_gsub(text, "sh[uoiea]", {["shu"] = "シュ", ["sho"] = "ショ", ["shi"] = "シ", ["she"] = "シェ", ["sha"] = "シャ"})
    text = str_gsub(text, "ch[uoiea]", {["chu"] = "チュ", ["cho"] = "チョ", ["chi"] = "チ", ["che"] = "チェ", ["cha"] = "チャ"})
    text = str_gsub(text, "n[uoiea']?", {["nu"] = "ヌ", ["no"] = "ノ", ["ni"] = "ニ", ["ne"] = "ネ", ["na"] = "ナ"})
    text = str_gsub(text, "[wvtrpsnmlkjhgfdbzy][yw]?[uoiea]", data.rk)
    text = str_gsub(text, "n'?", "ン")
    text = str_gsub(text, "[aeiou]", {u = "ウ", o = "オ", i = "イ", e = "エ", a = "ア"})
    return text
end

-- expects: any mix of kanji and kana
-- determines the script types used
-- e.g. given イギリス人, it returns Kana+Hani
function export.script(f)
    text, script = type(f) == "table" and f.args[1] or f, {}

    if find(text, "[ぁ-ゖ]") or find(text, "[𛅐-𛅒]") then table.insert(script, "Hira") end
    -- TODO: there are two kanas.  This should insert Kata.
    if find(text, "[ァ-ヺー]") or find(text, "[𛅤-𛅦]") then table.insert(script, "Kana") end
    -- 一 is unicode 4e00, previously used 丁 is 4e01
    if find(text, "[㐀-䶵一-鿌" .. compat_ideo .. "𠀀-𯨟]") then table.insert(script, "Hani") end
    -- matching %a should have worked but matched the end of every string
    if find(text, "[a-zA-ZāēīōūĀĒĪŌŪａ-ｚＡ-Ｚ]") then table.insert(script, "Romaji") end
    if find(text, "[0-9０-９]") then table.insert(script, "Number") end
    if find(text, "[〆々]") then table.insert(script, "Abbreviation") end

    return table.concat(script, "+")
end

-- when counting morae, most small hiragana belong to the previous mora,
-- so for purposes of counting them, they can be removed and the characters
-- can be counted to get the number of morae.  The exception is small tsu,
-- so data.nonmora_to_empty maps all small hiragana except small tsu.
function export.count_morae(text)
    if type(text) == "table" then text = text.args[1] end
    -- convert kata to hira (hira is untouched)
    text = export.kata_to_hira(text)
    -- remove all of the small hiragana such as ょ except small tsu
    text = gsub(text, ".", data.nonmora_to_empty)
    -- remove zero-width spaces
    text = gsub(text, "‎", "")
    -- return number of characters, which should be the number of morae
    return length(text)
end

-- accepts: any mix of kana
-- returns: a hiragana sort key designed for WMF software
-- this is like sort() but doesn't return |sort=sortkey,
-- just the sort key itself, but unlike sort(), this
-- replaces the long vowel mark with its vowel
function export.jsort(text)
    if type(text) == "table" then text = text.args[1] end
    local textsub = ""
    local convertedten = ""
    local result = ""
    local len = 1

    -- remove western spaces, hyphens, and periods
    -- diff=41967612: also remove caret
    text = gsub(text, "[ %-%.%^]", "")

    text = export.kata_to_hira(text)

    -- if the first character has dakuten, replace it with the corresponding
    -- character without dakuten and add an apostrophe to the end, e.g.
    -- がす > かす'
    if gsub(sub(text, 1, 1), ".", data.dakuten) == "" then
        len = length(text)
        textsub = sub(text, 2, len)
        convertedten = gsub(sub(text, 1, 1), ".", data.tenconv)
        text = (convertedten .. textsub .. "'")
    else
        -- similar thing but with handuken and two apostrophes, e.g. ぱす -> はす''
        if gsub(sub(text, 1, 1), ".", data.handakuten) == "" then
            len = length(text)
            textsub = sub(text, 2, len)
            convertedten = gsub(sub(text, 1, 1), ".", data.tenconv)
            text = (convertedten .. textsub .. "''")
        end
    end
    -- replace the long vowel mark with the vowel that it stands for
    for key, value in pairs(data.longvowels) do text = gsub(text, key, value) end
    return text
end

-- returns a sort key with |sort= in front, e.g.
-- |sort=はつぐん' if given ばつぐん
function export.sort(f)
    local text = type(f) == "table" and f.args[1] or f
    local textsub = ""
    local convertedten = ""
    local result = ""
    local len = 1
    local kyreplace = ""
    kyreplace = gsub(text, "[ァ-ヺ]", "")
    if kyreplace == "" then result = ("|" .. "sort" .. "=") end
    text = export.kata_to_hira(text)
    if gsub(sub(text, 1, 1), ".", data.dakuten) == "" then
        if kyreplace == "" then
        else
            result = ("|" .. "sort" .. "=")
        end
        len = length(text)
        textsub = sub(text, 2, len)
        convertedten = gsub(sub(text, 1, 1), ".", data.tenconv)
        result = (result .. convertedten .. textsub .. "'")
    else
        if gsub(sub(text, 1, 1), ".", data.handakuten) == "" then
            if kyreplace == "" then
            else
                result = ("|" .. "sort" .. "=")
            end
            len = length(text)
            textsub = sub(text, 2, len)
            convertedten = gsub(sub(text, 1, 1), ".", data.tenconv)
            result = (result .. convertedten .. textsub .. "''")
        else
            if kyreplace == "" then result = (result .. text) end
        end
    end
    return result
end

-- returns the "stem" of a verb or -i adjective, that is the term minus the final character
function export.definal(f) return sub(f.args[1], 1, (length(f.args[1]) - 1)) end

function export.remove_ruby_markup(text) return (string.gsub(text, "[%^%-%. %%]", "")) end

-- do the work of Template:ja-kanji
function export.kanji(frame)
    local pagename = mw.title.getCurrentTitle().text
    -- only do this if this entry is a kanji page and not some user's page
    if namespace == "" then
        local params = {grade = {}, rs = {}, shin = {}, kyu = {}, head = {}}
        local args = require("parameters").process(frame:getParent().args, params)

        local rs = args["rs"] or require("zh-sortkey").makeSortKey(pagename, "ja")
        local shin = args["shin"]
        local kyu = args["kyu"]
        local head = args["head"]

        local grade_replacements = {["c"] = 7, ["n"] = 8, ["uc"] = 9, ["r"] = 0}
        local grade = tonumber(args["grade"]) or args["grade"]
        grade = grade_replacements[grade] or grade

        local wikitext = {}
        local categories = {}

        local catsort = rs or pagename

        -- display the kanji itself at the top at 275% size
        table.insert(wikitext, "<div><span lang=\"ja\" class=\"Jpan\" style=\"font-size:275%; line-height:1;\">" .. (args["head"] or pagename) .. "</span></div>")

        -- display information for the grade

        -- if grade was not specified, determine it now
        if not grade then grade = export.kanji_grade(pagename) end

        local in_parenthesis = {}
        local grade_links = {[1] = "[[w:Kyōiku kanji|grade 1 “Kyōiku” kanji]]", [2] = "[[w:Kyōiku kanji|grade 2 “Kyōiku” kanji]]", [3] = "[[w:Kyōiku kanji|grade 3 “Kyōiku” kanji]]", [4] = "[[w:Kyōiku kanji|grade 4 “Kyōiku” kanji]]", [5] = "[[w:Kyōiku kanji|grade 5 “Kyōiku” kanji]]", [6] = "[[w:Kyōiku kanji|grade 6 “Kyōiku” kanji]]", [7] = "[[w:Jōyō kanji|common “Jōyō” kanji]]", [8] = "[[w:Jinmeiyō kanji|“Jinmeiyō” kanji used for names]]", [9] = "[[w:Hyōgai kanji|uncommon “Hyōgai” kanji]]", [0] = "[[w:Radical_(Chinese_character)|Radical]]"}
        if grade_links[grade] then
            table.insert(in_parenthesis, grade_links[grade])
        else
            table.insert(categories, "[[Category:Japanese kanji missing grade|" .. catsort .. "]]")
        end

        -- link to shinjitai if shinjitai was specified, and link to kyujitai if kyujitai was specified

        if kyu then
            table.insert(in_parenthesis, "[[shinjitai]] kanji, [[kyūjitai]] form <span lang=\"ja\" class=\"Jpan\">[[" .. kyu .. "#Japanese|" .. kyu .. "]]</span>")
        elseif shin then
            table.insert(in_parenthesis, "[[kyūjitai]] kanji, [[shinjitai]] form <span lang=\"ja\" class=\"Jpan\">[[" .. shin .. "#Japanese|" .. shin .. "]]</span>")
        end
        table.insert(wikitext, "''(" .. table.concat(in_parenthesis, ",&nbsp;") .. "'')")

        -- add categories
        table.insert(categories, "[[Category:Japanese Han characters|" .. catsort .. "]]")
        local grade_categories = {[1] = "Grade 1 kanji", [2] = "Grade 2 kanji", [3] = "Grade 3 kanji", [4] = "Grade 4 kanji", [5] = "Grade 5 kanji", [6] = "Grade 6 kanji", [7] = "Common kanji", [8] = "Kanji used for names", [9] = "Uncommon kanji", [0] = "CJKV radicals"}
        table.insert(categories, "[[Category:" .. (grade_categories[grade] or error("The grade " .. grade .. " is invalid.")) .. "|" .. (grade == "0" and " " or catsort) .. "]]")

        -- error category
        if not rs then table.insert(categories, "[[Category:Japanese kanji missing radical and strokes]]") end

        return table.concat(wikitext, "") .. table.concat(categories, "\n")
    end
end

local grade1_pattern = ("[" .. data.grade1 .. "]")
local grade2_pattern = ("[" .. data.grade2 .. "]")
local grade3_pattern = ("[" .. data.grade3 .. "]")
local grade4_pattern = ("[" .. data.grade4 .. "]")
local grade5_pattern = ("[" .. data.grade5 .. "]")
local grade6_pattern = ("[" .. data.grade6 .. "]")
local secondary_pattern = ("[" .. data.secondary .. "]")
local jinmeiyo_kanji_pattern = ("[" .. data.jinmeiyo_kanji .. "]")
local hyogaiji_pattern = ("[^" .. data.joyo_kanji .. data.jinmeiyo_kanji .. "]")

function export.kanji_grade(kanji)
    if type(kanji) == "table" then kanji = kanji.args[1] end

    if find(kanji, hyogaiji_pattern) then
        return 9
    elseif find(kanji, jinmeiyo_kanji_pattern) then
        return 8
    elseif find(kanji, secondary_pattern) then
        return 7
    elseif find(kanji, grade6_pattern) then
        return 6
    elseif find(kanji, grade5_pattern) then
        return 5
    elseif find(kanji, grade4_pattern) then
        return 4
    elseif find(kanji, grade3_pattern) then
        return 3
    elseif find(kanji, grade2_pattern) then
        return 2
    elseif find(kanji, grade1_pattern) then
        return 1
    end

    return false
end

return export
