local export = {}

function export.tag_sumerogram(syl) return "<span style=\"font-style: normal;\">" .. syl .. "</span>" end

function export.tag_sumerogram_determiner(syl) return "<sup style=\"font-style: normal;\">" .. syl .. "</sup>" end

function export.tag_akkadogram(syl) return "<i>" .. syl .. "</i>" end

function export.tag_akkadogram_determiner(syl) return "<sup style=\"font-style: italic;\">" .. syl .. "</sup>" end

function export.tag_hittite_tr(tr) return "<i>" .. tr .. "</i>" end

function export.tag_hurrian_tr(tr) return "<i>" .. tr .. "</i>" end

function export.tag_hattic_tr(tr) return "<i>" .. tr .. "</i>" end

function export.tag_hittite(text) return "<span class=\"Xsux\" lang=\"hit\">[[" .. text .. "#Hittite|" .. text .. "]]</span>" end

function export.glossenkeil() return "<abbr title=\"Glossenkeil\" class=\"Xsux\" lang=\"hit\">𒑱</abbr>" end

return export
