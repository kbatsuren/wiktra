local data = {}

data.notneeded = {["und"] = true, ["cmn"] = true, ["ja"] = true, ["zu"] = true, ["nan"] = true, ["yue"] = true, ["ko"] = true}

data.neededhassubpage = {["ga"] = true, ["gv"] = true, ["nv"] = true, ["roa-jer"] = true, ["fr"] = true, ["rm"] = true, ["prg"] = true, ["gd"] = true, ["twf"] = true, ["en"] = true, ["ro"] = true, ["egl"] = true, ["roa-tar"] = true, ["gl"] = true, ["ast"] = true, ["br"] = true}

--[[
	Script that should be applied to links in categories.
]]
data.catfix_scripts = {
    ["ab"] = "Cyrl",
    ["ae"] = "Avst",
    ["ar"] = "Arab",
    ["ary"] = "Arab",
    ["be"] = "Cyrl",
    ["cu"] = "Cyrs",
    ["el"] = "Grek",
    ["grc"] = "polytonic",
    ["he"] = "Hebr",
    ["ka"] = "Geor",
    ["orv"] = "Cyrs",
    ["ru"] = "Cyrl",
    ["sa"] = "Deva",
    ["syl"] = "Sylo",
    ["xfa"] = "Ital",
    ["zle-ono"] = "Cyrs",
    ["hi"] = "Deva",
    ["mr"] = "Deva"
    --[[
	[""] = "",
]]
}

-- Namespaces in which format_categories will add categories.
data.allowedNamespaces = {[""] = true, ["Appendix"] = true, ["Reconstruction"] = true, ["Citations"] = true}

-- Pages not in namespaces in which format_categories normally adds categories,
-- but where we make an exception.
data.allowedPrefixedPages = {["Wiktionary:Sandbox"] = true}

return data
