local data = {}

data.high_memory_entries = {"a", "animal", "book", "coffee", "do", "e", "language", "night", "smoke", "son", "sun", "water", "wind"}

local U = mw.ustring.char
local soft_hyphen = U(0xAD)

--[[	The "actual title" is the page name with the prefix "Unsupported titles/" removed.
		["displayed_title"] = "actual title"	]]
data.unsupported_titles = {
    [" "] = "Space",
    ["{"] = "Left curly bracket",
    ["}"] = "Right curly bracket",
    ["["] = "Left square bracket",
    ["]"] = "Right square bracket",
    ["<"] = "Less than",
    [">"] = "Greater than",
    ["=<"] = "Equal less than",
    ["=>"] = "Equal greater than",
    [">="] = "Greater than equal",
    ["<="] = "Less than equal",
    ["->"] = "Hyphen greater than",
    ["<-"] = "Less than hyphen",
    [">_<"] = "Greater than low line less than",
    ["::"] = "Double colon",
    [": :"] = "Enclosing colons",
    [":/"] = "Colon slash",
    [":="] = "Colon equals",
    [":Þ"] = "Colon capital thorn",
    [":þ"] = "Colon lowercase thorn",
    [":("] = "Colon left paren",
    [":)"] = "Colon right paren",
    [":3"] = "Colon three",
    ["<>"] = "Less than greater than",
    ["<3"] = "Less than three",
    ["</3"] = "Less than slash three",
    ["< >"] = "Enclosing less than greater than",
    ["< />"] = "Less than trailing slash greater than",
    ["< > </ >"] = "HTML start tag end tag",
    ["<!-- -->"] = "HTML comment",
    ["<g>"] = "g tag",
    [":-("] = "Colon hyphen left paren",
    [":-)"] = "Colon hyphen right paren",
    ["|"] = "Vertical line",
    ["||"] = "Vertical line vertical line",
    ["| |"] = "Enclosing vertical lines",
    ["C#"] = "C sharp",
    ["#"] = "Number sign",
    ["# #"] = "Enclosing number signs",
    ["&amp;"] = "Amp",
    [":"] = "Colon",
    [".."] = "Double period",
    ["."] = "Full stop",
    ["_"] = "Low line",
    ["-_-"] = "Low line interfix",
    [U(0xFFFD)] = "Replacement character",
    [U(0x1680)] = "Ogham space",
    ["[ ]"] = "Square brackets",
    ["{ }"] = "Curly brackets",
    ["[…]"] = "Square bracketed ellipsis",
    ["_ _"] = "Enclosing low lines",
    ["C|N>K"] = "C through N to K",
    ["#MeToo"] = "MeToo",
    ["о/."] = "о slash dot",
    ["กรุงเทพมหานคร อมรรัตนโกสินทร์ มหินทรายุธยา มหาดิลกภพ นพรัตนราชธานีบูรีรมย์ อุดมราชนิเวศน์มหาสถาน อมรพิมานอวตารสถิต สักกะทัตติยวิษณุกรรมประสิทธิ์"] = "Thai name of Bangkok",
    ["λοπαδοτεμαχοσελαχογαλεοκρανιολειψανοδριμυποτριμματοσιλφιοκαραβομελιτοκατακεχυμενοκιχλ" .. soft_hyphen .. "επικοσσυφοφαττοπεριστεραλεκτρυονοπτοκεφαλλιοκιγκλοπελειολαγῳοσιραιοβαφητραγανοπτερύγων"] = "Ancient Greek dish",
    [":≠"] = ":≠",
    ["S:t"] = "S:t",
    ["S:ta"] = "S:ta",
    ["c:a"] = "c:a",
    ["eq #"] = "eq number sign",
    ["hr #"] = "hr number sign",
    ["n:a"] = "n:a",
    ["n:o"] = "n:o",
    ["n:r"] = "n:r",
    ["s:a"] = "s:a",
    ["st:a"] = "st:a",
    ["v:a"] = "v:a"
}

for i, item in ipairs(data.high_memory_entries) do
    data.high_memory_entries[i] = nil
    data.high_memory_entries[item] = true
end

return data
