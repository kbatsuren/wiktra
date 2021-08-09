local export = {}
local gmatch = mw.ustring.gmatch
local find = mw.ustring.find
local gsub = mw.ustring.gsub

local corresp = {
    -- main
    ["ア"] = "¤a",
    ["イ"] = "¤i",
    ["ウ"] = "¤u",
    ["エ"] = "¤e",
    ["オ"] = "¤o",
    ["カ"] = "ka",
    ["キ"] = "ki",
    ["ク"] = "ku",
    ["ケ"] = "ke",
    ["コ"] = "ko",
    ["シャ"] = "sa",
    ["シ"] = "si",
    ["シュ"] = "su",
    ["シェ"] = "se",
    ["ショ"] = "so",
    ["タ"] = "ta",
    ["チ"] = "ci",
    ["ト゚"] = "tu",
    ["テ"] = "te",
    ["ト"] = "to",
    ["チャ"] = "ca",
    ["ツ"] = "cu",
    ["セ゚"] = "ce",
    ["チョ"] = "co",
    ["ナ"] = "na",
    ["ニ"] = "ni",
    ["ヌ"] = "nu",
    ["ネ"] = "ne",
    ["ノ"] = "no",
    ["ハ"] = "ha",
    ["ヒ"] = "hi",
    ["フ"] = "hu",
    ["ヘ"] = "he",
    ["ホ"] = "ho",
    ["バ"] = "ba",
    ["ビ"] = "bi",
    ["ブ"] = "bu",
    ["ベ"] = "be",
    ["ボ"] = "bo",
    ["パ"] = "pa",
    ["ピ"] = "pi",
    ["プ"] = "pu",
    ["ペ"] = "pe",
    ["ポ"] = "po",
    ["マ"] = "ma",
    ["ミ"] = "mi",
    ["ム"] = "mu",
    ["メ"] = "me",
    ["モ"] = "mo",
    ["ヤ"] = "ya",
    ["ユ"] = "yu",
    ["イェ"] = "ye",
    ["ヨ"] = "yo",
    ["ラ"] = "ra",
    ["リ"] = "ri",
    ["ル"] = "ru",
    ["レ"] = "re",
    ["ロ"] = "ro",
    ["ワ"] = "wa",
    ["ウィ"] = "wi",
    ["ウェ"] = "we",
    ["ウォ"] = "wo",

    -- finals
    ["ㇵ"] = "h¤",
    ["ㇶ"] = "h¤",
    ["ㇷ"] = "h¤",
    ["ㇸ"] = "h¤",
    ["ㇹ"] = "h¤",
    ["ㇻ"] = "r¤",
    ["ㇼ"] = "r¤",
    ["ㇽ"] = "r¤",
    ["ㇾ"] = "r¤",
    ["ㇿ"] = "r¤",
    ["ㇰ"] = "k¤",
    ["ㇱ"] = "s¤",
    ["ㇳ"] = "t¤",
    ["ㇴ"] = "n¤",
    ["ㇺ"] = "m¤",
    ["ㇷ゚"] = "p¤",

    -- misc
    ["ィ"] = "y¤",
    ["ゥ"] = "w¤",
    ["ー"] = "̄",
    ["・"] = "=",

    -- alt spellings
    ["サ"] = "sa",
    ["ス"] = "su",
    ["セ"] = "se",
    ["ソ"] = "so",
    ["ツ゚"] = "tu",
    ["チュ"] = "cu",
    ["チェ"] = "ce",
    ["ヰ"] = "wi",
    ["ヱ"] = "we",
    ["ヲ"] = "wo",
    ["ㇲ"] = "s¤",
    ["ッ"] = "x¤",
    ["ン"] = "n¤",
    ["トゥ"] = "tu",

    -- dialectal characters
    ["ヂャ"] = "zya",
    ["ヂ"] = "zi",
    ["ヂュ"] = "zyu",
    ["ヂェ"] = "zye",
    ["ヂョ"] = "zyo",
    ["ダ"] = "da",
    ["ドゥ"] = "du",
    ["デ"] = "de",
    ["ド"] = "do",
    ["ガ"] = "ga",
    ["ギ"] = "gi",
    ["グ"] = "gu",
    ["ゲ"] = "ge",
    ["ゴ"] = "go",

    -- loanword characters
    ["ジ"] = "zi",
    ["ジャ"] = "zya",
    ["ジュ"] = "zyu",
    ["ジェ"] = "zye",
    ["ジョ"] = "zyo",
    ["ディ"] = "di",
    ["ザ"] = "za",
    ["ズ"] = "zu",
    ["ゼ"] = "ze",
    ["ゾ"] = "zo"
}

function export.tr(text, lang, sc)
    local result = {}
    for string in gmatch(text, ".[ィゥェォャュョ゚]?") do
        if corresp[string] then -- try to convert character sequences
            string = corresp[string]
        else
            local str_result = {}
            for char in gmatch(string, ".") do -- try again over every individual character
                table.insert(str_result, corresp[char] or char)
            end
            string = table.concat(str_result)
        end
        table.insert(result, string)
    end
    text = table.concat(result)
    text = mw.ustring.toNFC(text)

    if find(text, "x¤[kbp]") then -- 'ッ'
        text = gsub(text, "x¤([kbp])", "%1¤%1")
    else
        text = gsub(text, "x¤", "t¤")
    end

    text = gsub(text, "¤", "")

    return text
end

return export
