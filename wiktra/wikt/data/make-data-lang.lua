local m_redirect = mw.loadData("translit-redirect/data")
local translit = {}

for code, data in pairs(require("languages/alldata")) do
    mod = data.translit_module
    if mod then
        name = data[1]
        family = data[3]
        scripts = data[4]
        if not scripts then
            scripts = {}
            if code == "cdj" then
                scripts[1] = "Deva"
            elseif code == "lbj" then
                scripts[1] = "Tibt"
            end
        end
        for i, script in pairs(scripts) do
            i = i + 1
            if script ~= "Latn" and script ~= "Latinx" then
                if mod == "translit-redirect" then
                    if m_redirect[code]
                    and m_redirect[code][script]
                    and m_redirect[code][script].module
                    then
                        mod = m_redirect[code][script].module
                    end
                end
                local lr = {}
                lr.code = code
                lr.script = script
                lr.name = name
                lr.family = family
                lr.translit = mod
                lr.translit_override = data.override_translit
                lr.type = data.type
                lr.ancestors = data.ancestors
                lr.aliases = data.aliases
                lr.other_names = data.otherNames
                lr.varieties = data.varieties
                translit[script .. '/' .. code] = lr
            end
        end
    end
end
return translit
