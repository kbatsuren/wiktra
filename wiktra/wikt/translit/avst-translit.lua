local export = {}

local mapping = {
    ["𐬀"] = "a", -- AVESTAN LETTER A 
    ["𐬁"] = "ā", -- AVESTAN LETTER AA 
    ["𐬂"] = "å", -- AVESTAN LETTER AO 
    ["𐬃"] = "ā̊", -- AVESTAN LETTER AAO 
    ["𐬄"] = "ą", -- AVESTAN LETTER AN 
    ["𐬅"] = "ą̇̇", -- AVESTAN LETTER AAN 
    ["𐬆"] = "ə", -- AVESTAN LETTER AE 
    ["𐬇"] = "ə̄", -- AVESTAN LETTER AEE 
    ["𐬈"] = "e", -- AVESTAN LETTER E 
    ["𐬉"] = "ē", -- AVESTAN LETTER EE 
    ["𐬊"] = "o", -- AVESTAN LETTER O 
    ["𐬋"] = "ō", -- AVESTAN LETTER OO 
    ["𐬌"] = "i", -- AVESTAN LETTER I 
    ["𐬍"] = "ī", -- AVESTAN LETTER II 
    ["𐬎"] = "u", -- AVESTAN LETTER U 
    ["𐬏"] = "ū", -- AVESTAN LETTER UU 

    ["𐬐"] = "k", -- AVESTAN LETTER KE 
    ["𐬑"] = "x", -- AVESTAN LETTER XE 
    ["𐬒"] = "x́", -- AVESTAN LETTER XYE 
    ["𐬓"] = "xᵛ", -- AVESTAN LETTER XVE
    ["𐬔"] = "g", -- AVESTAN LETTER GE 
    ["𐬕"] = "ġ", -- AVESTAN LETTER GGE 
    ["𐬖"] = "γ", -- AVESTAN LETTER GHE 
    ["𐬗"] = "c", -- AVESTAN LETTER CE 
    ["𐬘"] = "j", -- AVESTAN LETTER JE 
    ["𐬙"] = "t", -- AVESTAN LETTER TE 
    ["𐬚"] = "θ", -- AVESTAN LETTER THE 
    ["𐬛"] = "d", -- AVESTAN LETTER DE 
    ["𐬜"] = "δ", -- AVESTAN LETTER DHE 
    ["𐬝"] = "t̰", -- AVESTAN LETTER TTE 
    ["𐬞"] = "p", -- AVESTAN LETTER PE 
    ["𐬟"] = "f", -- AVESTAN LETTER FE 
    ["𐬠"] = "b", -- AVESTAN LETTER BE 
    ["𐬡"] = "β", -- AVESTAN LETTER BHE 
    ["𐬢"] = "ŋ", -- AVESTAN LETTER NGE 
    ["𐬣"] = "ŋ́", -- AVESTAN LETTER NGYE 
    ["𐬤"] = "ŋᵛ", -- AVESTAN LETTER NGVE
    ["𐬥"] = "n", -- AVESTAN LETTER NE 
    ["𐬦"] = "ń", -- AVESTAN LETTER NYE 
    ["𐬧"] = "ṇ", -- AVESTAN LETTER NNE 
    ["𐬨"] = "m", -- AVESTAN LETTER ME 
    ["𐬩"] = "m̨", -- AVESTAN LETTER HME 
    ["𐬪"] = "ẏ", -- AVESTAN LETTER YYE 
    ["𐬫"] = "y", -- AVESTAN LETTER YE 
    ["𐬬"] = "v", -- AVESTAN LETTER VE 
    ["𐬭"] = "r", -- AVESTAN LETTER RE 
    ["𐬮"] = "l", -- AVESTAN LETTER LE 
    ["𐬯"] = "s", -- AVESTAN LETTER SE 
    ["𐬰"] = "z", -- AVESTAN LETTER ZE 
    ["𐬱"] = "š", -- AVESTAN LETTER SHE 
    ["𐬲"] = "ž", -- AVESTAN LETTER ZHE 
    ["𐬳"] = "š́", -- AVESTAN LETTER SHYE 
    ["𐬴"] = "ṣ̌", -- AVESTAN LETTER SSHE 
    ["𐬵"] = "h", -- AVESTAN LETTER HE 
    ["𐬹"] = " ", -- AVESTAN ABBREVIATION MARK
    ["⸱"] = "." -- WORD SEPARATOR MIDDLE DOT
}

function export.tr(text, lang, sc)
    text = mw.ustring.gsub(text, "[⸱𐬹]?[𐬺𐬻𐬼𐬽𐬾𐬿]", ".") -- punctuation
    text = string.gsub(text, "[\1-\127\194-\244][\128-\191]*", mapping) -- transliterate letters
    -- text = mw.ustring.gsub(text, "ii", "y")
    -- text = mw.ustring.gsub(text, "uu", "v")

    text = mw.ustring.gsub(text, "([aāəō])rə([kxgγcjtθδpfbβnmrlszšž])", "%1r<sup><small>ə</small></sup>%2") -- r > rə /V_C
    text = mw.ustring.gsub(text, "([aāəō])rə$", "%1r<sup><small>ə</small></sup>") -- r > rə /V_#

    text = mw.ustring.gsub(text, "([aāeēəoōuū])i(rm[eiī])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
    text = mw.ustring.gsub(text, "([aāeēəoōuū])i(ṇt[eiī])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
    text = mw.ustring.gsub(text, "([aāeēəoōuū])i([kxgγtθδpfbβnrl][eiī])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
    text = mw.ustring.gsub(text, "(%.%s)i([θr][iī])", "%1<sup><small>i</small></sup>%2") -- i-epenthesis
    text = mw.ustring.gsub(text, "^i([θr][iī])", "<sup><small>i</small></sup>%1") -- i-epenthesis

    text = mw.ustring.gsub(text, "([aāeēəiīoō])u(r[ouū])", "%1<sup><small>u</small></sup>%2") -- u-epenthesis

    return text
end

return export
