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
                    if m_redirect[code] then
                        for script_redir, script_rec in pairs(m_redirect[code]) do
                            if script_redir == script then
                                lr_mod = script_rec.module
                            end
                        end
                    end
                else
                    lr_mod = mod
                end
                local lr = {}
                lr.lang = code
                lr.script = script
                lr.name = name
                lr.family = family
                lr.translit = lr_mod
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
