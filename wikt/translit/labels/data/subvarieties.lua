local labels = {}
local aliases = {}
local deprecated = {}

local m_functions = require("labels/data/functions")

-- A 
labels["Bzyb"] = {Wikipedia = "Bzyb dialect", plain_categories = {"Bzyb Abkhaz"}, language = "ab"}
aliases["Bzyp"] = "Bzyb"

labels["Shapsug"] = {Wikipedia = "Shapsug Adyghe dialect", plain_categories = {"Shapsug Adyghe"}, language = "ady"}

-- ae start
labels["Old"] = {display = "[[w:Old Avestan|Old Avestan]]", language = "ae", track = true}
aliases["Old Avestan"] = "Old"

labels["Young"] = {display = "[[w:Young Avestan|Young Avestan]]", language = "ae"}
aliases["Young Avestan"] = "Young"
aliases["Younger"] = "Young"
aliases["Younger Avestan"] = "Young"
-- ae end

labels["Cape Afrikaans"] = {Wikipedia = "Kaapse Afrikaans", plain_categories = {"Cape Afrikaans"}, language = "af"}
aliases["Kaapse Afrikaans"] = "Cape Afrikaans"

-- ak start
labels["Fante"] = {Wikipedia = "Fante dialect", plain_categories = {"Fante Akan"}, language = "ak"}
aliases["Fantse"] = "Fante"
aliases["Fanti"] = "Fante"
aliases["Mfantse"] = "Fante"

labels["Kromanti"] = {display = "Kromanti spirit possession language", Wikipedia = "Jamaican Maroon spirit-possession language", plain_categories = {"Kromanti Akan"}, language = "ak"}

labels["Twi"] = {Wikipedia = true, plain_categories = {"Twi Akan"}, language = "ak"}
aliases["Akan Kasa"] = "Twi"
-- ak end

-- ang start
labels["Anglian"] = {Wikipedia = "Anglian dialect", plain_categories = {"Anglian Old English"}, language = "ang"}

labels["Early West Saxon"] = {Wikipedia = true, plain_categories = {"Early West Saxon Old English"}, language = "ang"}

labels["Kentish"] = {Wikipedia = "Kentish dialect (Old English)", plain_categories = {"Kentish Old English"}, language = "ang"} -- This will conflict with a Kentish dialect label for Modern English, if someone wants to make one.

labels["Late West Saxon"] = {Wikipedia = true, plain_categories = {"Late West Saxon Old English"}, language = "ang"}

labels["Mercian"] = {Wikipedia = "Mercian dialect", plain_categories = {"Mercian Old English"}, language = "ang"}

labels["Northumbrian"] = {Wikipedia = "Northumbrian dialect", plain_categories = {"Northumbrian Old English", "Anglian Old English"}, language = "ang"}

labels["West Saxon"] = {Wikipedia = "West Saxon dialect", plain_categories = {"West Saxon Old English"}, language = "ang"}
-- ang end

labels["West Arabian"] = {display = "Hejazi", plain_categories = {"Hejazi Arabic"}, language = "ar"}
aliases["Hejazi Arabic"] = "West Arabian"

-- arc start
labels["Old Aramaic"] = {Wikipedia = "Old_Aramaic_language", plain_categories = {"Old Aramaic"}, language = "arc"}
aliases["Ancient Aramaic"] = "Old Aramaic"

labels["Imperial Aramaic"] = {Wikipedia = true, plain_categories = {"Imperial Aramaic"}, language = "arc"}
aliases["Official Aramaic"] = "Imperial Aramaic"
aliases["OffA"] = "Imperial Aramaic"
aliases["ImpA"] = "Imperial Aramaic"

labels["Biblical Aramaic"] = {Wikipedia = true, plain_categories = {"Biblical Aramaic"}, language = "arc"}

labels["Hatran"] = {Wikipedia = "Aramaic of Hatra", plain_categories = {"Hatran Aramaic"}, language = "arc"}
aliases["Hatra"] = "Hatran"
aliases["Hatran Aramaic"] = "Hatran"

labels["Jewish Babylonian Aramaic"] = {Wikipedia = true, plain_categories = {"Jewish Babylonian Aramaic"}, language = "arc"}
aliases["JBA"] = "Jewish Babylonian Aramaic"
aliases["Talmudic Aramaic"] = "Jewish Babylonian Aramaic"
aliases["Babylonian Talmudic Aramaic"] = "Jewish Babylonian Aramaic"

labels["Jewish Literary Aramaic"] = {plain_categories = {"Jewish Literary Aramaic"}, language = "arc"}
aliases["JLA"] = "Jewish Literary Aramaic"
aliases["Targumic Aramaic"] = "Jewish Literary Aramaic"

labels["Jewish Palestinian Aramaic"] = {Wikipedia = true, plain_categories = {"Jewish Palestinian Aramaic"}, language = "arc"}
aliases["JPA"] = "Jewish Palestinian Aramaic"
aliases["Judean Aramaic"] = "Jewish Palestinian Aramaic"
aliases["Galilean Aramaic"] = "Jewish Palestinian Aramaic"

labels["Christian Palestinian Aramaic"] = {Wikipedia = true, plain_categories = {"Christian Palestinian Aramaic"}, language = "arc"}

aliases["CPA"] = "Christian Palestinian Aramaic"
aliases["Melkite Aramaic"] = "Christian Palestinian Aramaic"
aliases["Palestinian Syriac"] = "Christian Palestinian Aramaic"
aliases["Syropalestinian Aramaic"] = "Christian Palestinian Aramaic"
aliases["Syropalestinian"] = "Christian Palestinian Aramaic"

labels["Nabataean"] = {Wikipedia = "Nabataean Aramaic", plain_categories = {"Nabataean Aramaic"}, language = "arc"}
aliases["Nabataean Aramaic"] = "Nabataean"
aliases["NabA"] = "Nabataean"

labels["Palmyrene"] = {Wikipedia = "Palmyrene Aramaic", plain_categories = {"Palmyrene Aramaic"}, language = "arc"}
aliases["Palmyrene Aramaic"] = "Palmyrene"
aliases["PalA"] = "Palmyrene"
-- arc end

labels["Jijel"] = {Wikipedia = "Jijel Arabic", plain_categories = {"Jijel Arabic"}, language = "arq"}
aliases["Jijel Arabic"] = "Jijel"
aliases["Jijeli"] = "Jijel"
aliases["Djidjelli"] = "Jijel"

labels["Upper Egypt"] = {Wikipedia = "Saʽidi Arabic", plain_categories = {"Upper Egyptian Arabic"}, language = "arz"}
aliases["Saidi"] = "Upper Egypt"
aliases["Saʽidi"] = "Upper Egypt"
aliases["Sa'idi"] = "Upper Egypt"
aliases["Upper Egyptian"] = "Upper Egypt"

-- as start
labels["Central Assam"] = {plain_categories = {"Central Assamese"}, language = "as"}
aliases["central Assam"] = "Central Assam"
aliases["Central Assamese"] = "Central Assam"
aliases["central Assamese"] = "Central Assam"

labels["Central Standard"] = {plain_categories = {"Central Standard Assamese"}, language = "as"}

labels["Eastern Standard"] = {plain_categories = {"Eastern Standard Assamese"}, language = "as"}

labels["Kamrupi"] = {Wikipedia = "Kamrupi dialects", plain_categories = {"Kamrupi Assamese"}, language = "as"}
aliases["Kamruipa"] = "Kamrupi"
aliases["Kamrupiya"] = "Kamrupi"
aliases["Kamrup"] = "Kamrupi"
-- as end

-- az start
labels["North Azerbaijani"] = {Wikipedia = true, plain_categories = {"North Azerbaijani"}, language = "az"}

labels["South Azerbaijani"] = {Wikipedia = true, plain_categories = {"South Azerbaijani"}, language = "az"}
-- az end

-- B 
labels["Taraškievica"] = {Wikipedia = true, plain_categories = {"Belarusian Taraškievica spellings"}, language = "be"}
aliases["Taraskievica"] = "Taraškievica"
aliases["Belarusian Classical Orthography"] = "Taraškievica"

labels["Shopski"] = {Wikipedia = "Shopi#Dialects", plain_categories = {"Shopski Bulgarian"}, language = "bg"}

-- bn start
labels["Rāṛha"] = {plain_categories = {"Rāṛha Bengali"}, language = "bn"}
aliases["Rarha"] = "Rāṛha"

labels["Vaṅga"] = {plain_categories = {"Vaṅga Bengali"}, language = "bn"}
aliases["Vanga"] = "Vaṅga"
-- bn end

labels["Gwened"] = {Wikipedia = "Gwenedeg", plain_categories = {"Gwenedeg Breton"}, language = "br"}
aliases["Vannes"] = "Gwened"
aliases["Vannetais"] = "Gwened"
aliases["Gwenedeg"] = "Gwened"

-- C 
-- ca start
labels["Eastern Catalan"] = {Wikipedia = "Catalan dialects", plain_categories = {"Eastern Catalan"}, language = "ca"}

labels["Valencia"] = {Wikipedia = "Valencian language", plain_categories = {"Valencian"}, language = "ca"}
aliases["Valencian"] = "Valencia"

labels["Western Catalan"] = {Wikipedia = "Catalan dialects", plain_categories = {"Western Catalan"}, language = "ca"}
-- ca end

-- cim start
labels["Sette Comuni"] = {Wikipedia = true, plain_categories = {"Sette Comuni Cimbrian"}, language = "cim"}
aliases["7"] = "Sette Comuni"
aliases["Seven Communities"] = "Sette Comuni"

labels["Tredici Comuni"] = {Wikipedia = true, plain_categories = {"Tredici Comuni Cimbrian"}, language = "cim"}
aliases["13"] = "Tredici Comuni"
aliases["13 Communities"] = "Tredici Comuni"
aliases["Thirteen Communities"] = "Tredici Comuni"
-- cim end

-- cop start
labels["Akhmimic"] = {Wikipedia = "Coptic language#Akhmimic", plain_categories = {"Akhmimic Coptic"}, language = "cop"}

labels["Bohairic"] = {Wikipedia = "Coptic language#Bohairic", plain_categories = {"Bohairic Coptic"}, language = "cop"}
aliases["Memphitic"] = "Bohairic"

labels["Fayyumic"] = {Wikipedia = "Coptic language#Fayyumic", plain_categories = {"Fayyumic Coptic"}, language = "cop"}
aliases["Faiyumic"] = "Fayyumic"
aliases["Bashmuric"] = "Fayyumic"

labels["Lycopolitan"] = {Wikipedia = "Coptic language#Lycopolitan", plain_categories = {"Lycopolitan Coptic"}, language = "cop"}
aliases["Subakhmimic"] = "Lycopolitan"
aliases["Assiutic"] = "Lycopolitan"

labels["Old Coptic"] = {plain_categories = {"Old Coptic"}, language = "cop"}

labels["Oxyrhynchite"] = {Wikipedia = "Coptic language#Oxyrhynchite", plain_categories = {"Oxyrhynchite Coptic"}, language = "cop"}
aliases["Mesokemic"] = "Oxyrhynchite"

labels["Sahidic"] = {Wikipedia = "Coptic language#Sahidic", plain_categories = {"Sahidic Coptic"}, language = "cop"}
aliases["Thebaic"] = "Sahidic"
-- cop end

-- D 
-- dcc start
labels["Hyderabad"] = {Wikipedia = "Hyderabadi Deccani", plain_categories = {"Hyderabadi Deccani"}, language = "dcc"}
-- dcc end

-- de start
labels["central Germany"] = {Wikipedia = "Central German", plain_categories = {"Central German"}, language = "de"}
aliases["Central German"] = "central Germany"
aliases["Central Germany"] = "central Germany"
aliases["central German"] = "central Germany"

labels["Hessian"] = {Wikipedia = "Hessian dialects", plain_categories = {"Hessian German"}, language = "de"}
aliases["Hessisch"] = "Hessian"

labels["Northern Germany"] = {Wikipedia = true, plain_categories = {"Northern German"}, language = "de"}
aliases["northern Germany"] = "Northern Germany"
aliases["Northern German"] = "Northern Germany"
aliases["northern German"] = "Northern Germany"
aliases["North Germany"] = "Northern Germany"
aliases["north Germany"] = "Northern Germany"
aliases["North German"] = "Northern Germany"
aliases["north German"] = "Northern Germany"

labels["Northern and Central Germany"] = {display = "[[w:Northern Germany|northern]] and central Germany", plain_categories = {"Northern German", "Central German"}, language = "de"}
aliases["northern and central Germany"] = "Northern and Central Germany"
aliases["Northern and Central German"] = "Northern and Central Germany"
aliases["northern and central German"] = "Northern and Central Germany"
aliases["North and Central Germany"] = "Northern and Central Germany"
aliases["north and central Germany"] = "Northern and Central Germany"
aliases["North and Central German"] = "Northern and Central Germany"
aliases["north and central German"] = "Northern and Central Germany"

labels["Southern German"] = {plain_categories = {"Southern German"}, language = "de"}
aliases["southern German"] = "Southern German"
aliases["South German"] = "Southern German"
aliases["south German"] = "Southern German"

labels["Swiss German"] = {display = "Switzerland", Wikipedia = true, plain_categories = {"Switzerland German"}, language = "de"}

labels["Switzerland and Liechtenstein spelling"] = {display = "[[Switzerland]] and [[Liechtenstein]]", plain_categories = {"Switzerland and Liechtenstein German forms"}, language = "de"}
aliases["SLDE"] = "Switzerland and Liechtenstein spelling"
-- de end

labels["Vegliot"] = {Wikipedia = "Vegliot dialect", plain_categories = {"Vegliot Dalmatian"}, language = "dlm"}
aliases["Krk"] = "Vegliot"

-- E 
-- el start
labels["Cretan"] = {Wikipedia = "Cretan Greek", plain_categories = {"Cretan Greek"}, language = "el"}
aliases["cretan"] = "Cretan"
aliases["Crete"] = "Cretan"

labels["Demotic"] = {display = "[[Demotic Greek#English|Demotic]]", plain_categories = {"Demotic Greek"}, language = "el"}

labels["Kaliarda"] = {display = "[[Kaliarda]]", plain_categories = {"Kaliarda"}, language = "el"}
aliases["Kaliarnta"] = "Kaliarda"

labels["Katharevousa"] = {display = "[[Katharevousa#English|Katharevousa]]", plain_categories = {"Katharevousa"}, language = "el"}

labels["Maniot"] = {Wikipedia = "Maniot dialect", plain_categories = {"Maniot Greek"}, language = "el"}
aliases["maniot"] = "Maniot"
-- el end

-- en start
labels["African-American Vernacular English"] = {display = "African-American Vernacular", Wikipedia = true, plain_categories = {"African-American Vernacular English"}, language = "en"}
aliases["AAVE"] = "African-American Vernacular English"
aliases["African American Vernacular English"] = "African-American Vernacular English"
aliases["ebonics"] = "African-American Vernacular English"

labels["African-American English"] = {display = "African-American", plain_categories = {"African-American English"}, language = "en"}
aliases["AA"] = "African-American English"
aliases["African-American"] = "African-American English"
aliases["African American"] = "African-American English"
aliases["African American English"] = "African-American English"

labels["Australian English"] = {display = "[[w:Australian English|Australia]]", plain_categories = {"Australian English"}, language = "en"}

labels["Australian Aboriginal English"] = {display = "Australian Aboriginal", Wikipedia = true, plain_categories = {"Australian Aboriginal English"}, language = "en"}
aliases["Australian Aboriginal"] = "Australian Aboriginal English"

labels["Birmingham"] = {display = "[[wikipedia:Brummie|Birmingham]]", plain_categories = {"Birmingham English"}, language = "en"}
aliases["Brummie"] = "Birmingham"
aliases["Brummy"] = "Birmingham"

labels["British English"] = {display = "British", Wikipedia = true, plain_categories = {"British English"}, language = "en"}

labels["British Indian English"] = {display = "British India", Wikipedia = "British India", plain_categories = {"British Indian English"}, language = "en"}
aliases["British India"] = "British Indian English"

labels["Canadian English"] = {display = "Canada", Wikipedia = true, plain_categories = {"Canadian English"}, language = "en"}

labels["Chinglish"] = {Wikipedia = true, plain_categories = {"Chinglish"}, language = "en"}

labels["Cockney"] = {Wikipedia = "Cockney#Speech", plain_categories = {"Cockney English"}, language = "en"}

labels["East Anglian English"] = {display = "East Anglia", Wikipedia = true, plain_categories = {"East Anglian English"}, language = "en"}

labels["East Midlands English"] = {display = "East Midlands", Wikipedia = true, plain_categories = {"East Midlands English"}, language = "en"}

labels["Geordie"] = {Wikipedia = true, plain_categories = {"Geordie English"}, language = "en"}

labels["Indian English"] = {display = "India", Wikipedia = true, plain_categories = {"Indian English"}, language = "en"}

labels["Jamaican English"] = {display = "Jamaican", Wikipedia = true, plain_categories = {"Jamaican English"}, language = "en"}
aliases["Jamaica"] = "Jamaican English"
aliases["Jamaican"] = "Jamaican English"
aliases["Jamaican Standard English"] = "Jamaican English"

labels["Midlands English"] = {display = "Midlands", Wikipedia = true, plain_categories = {"Midlands English"}, language = "en"}

labels["Midland US"] = {Wikipedia = "Midland American English", plain_categories = {"Midland US English"}, language = "en"}
aliases["North Midland US"] = "Midland US" -- split North and South off?
aliases["Northern Midland US"] = "Midland US"
aliases["South Midland US"] = "Midland US"
aliases["Southern Midland US"] = "Midland US"

labels["Multicultural London English"] = {display = "MLE", Wikipedia = true, plain_categories = {"Multicultural London English"}, language = "en"}
aliases["MLE"] = "Multicultural London English"

labels["New Zealand English"] = {display = "New Zealand", Wikipedia = true, plain_categories = {"New Zealand English"}, language = "en"}

labels["Non-Oxford British spelling"] = {display = "Non-[[w:Oxford spelling|Oxford]] [[British English]]", plain_categories = {"British English forms"}, language = "en"}
aliases["non-Oxford British spelling"] = "Non-Oxford British spelling"
aliases["Non-Oxford"] = "Non-Oxford British spelling"
aliases["non-Oxford"] = "Non-Oxford British spelling"

labels["North America"] = {display = "[[Canada]], [[American English|US]]", plain_categories = {"Canadian English", "American English"}, language = "en"}
aliases["North American"] = "North America"

labels["Oxford British spelling"] = {display = "[[w:Oxford spelling|Oxford]] [[British English]]", plain_categories = {"Oxford spellings"}, language = "en"}
aliases["Oxford"] = "Oxford British spelling"

labels["Pennsylvania Dutch English"] = {Wikipedia = true, plain_categories = {"Pennsylvania Dutch English"}, language = "en"}

labels["Potteries"] = {Wikipedia = "Potteries dialect", plain_categories = {"Potteries English"}, language = "en"}
aliases["Potteries dialect"] = "Potteries"

labels["Scottish English"] = {display = "Scotland", Wikipedia = true, plain_categories = {"Scottish English"}, language = "en"}

labels["Singlish"] = {Wikipedia = true, plain_categories = {"Singlish"}, language = "en"}
aliases["Colloquial Singaporean English"] = "Singlish"
aliases["Colloquial Singapore English"] = "Singlish"

labels["Shropshire"] = {Wikipedia = true, plain_categories = {"Shropshire English"}, language = "en"}
aliases["Shropshire dialect"] = "Shropshire"
aliases["Shrops"] = "Shropshire"
aliases["Salop"] = "Shropshire"
aliases["Salopian"] = "Shropshire"

labels["South African English"] = {display = "South Africa", Wikipedia = true, plain_categories = {"South African English"}, language = "en"}

labels["Southern England English"] = {display = "Southern England", Wikipedia = "English in southern England", plain_categories = {"Southern England English"}, language = "en"}
aliases["Southern English"] = "Southern England English"
aliases["Southern English dialect"] = "Southern England English"

labels["Southern US English"] = {display = "Southern US", Wikipedia = "Southern American English", plain_categories = {"Southern US English"}, language = "en"}
aliases["Southern American English"] = "Southern US English"

labels["Sussex"] = {Wikipedia = "Sussex dialect", plain_categories = {"Sussex English"}, language = "en"}

labels["Tyneside"] = {plain_categories = {"Geordie English"}, language = "en"}
aliases["Geordie"] = "Tyneside"

labels["US English"] = {display = "US", Wikipedia = "American English", plain_categories = {"American English"}, language = "en"}
aliases["U.S. English"] = "US English"
aliases["American English"] = "US English"

labels["West Country English"] = {display = "West Country", Wikipedia = true, plain_categories = {"West Country English"}, language = "en"}
aliases["West Country dialect"] = "West Country English"

labels["West Midlands English"] = {display = "West Midlands", Wikipedia = true, plain_categories = {"West Midlands English"}, language = "en"}
aliases["West Midlands dialect"] = "West Midlands English"
-- en end

-- enm start
labels["Early Middle English"] = {Wikipedia = "Middle English#Early Middle English", plain_categories = {"Early Middle English"}, language = "enm"}
aliases["Early ME"] = "Early Middle English"
aliases["Earlier ME"] = "Early Middle English"
aliases["early ME"] = "Early Middle English"

labels["East Midland Middle English"] = {display = "East Midlands", plain_categories = {"East Midland Middle English"}, language = "enm"}
aliases["East Midlands ME"] = "East Midland Middle English"
aliases["East Midland ME"] = "East Midland Middle English"

labels["Late Middle English"] = {Wikipedia = "Middle English#Late Middle English", plain_categories = {"Late Middle English"}, language = "enm"}
aliases["Late ME"] = "Late Middle English"
aliases["Later ME"] = "Late Middle English"
aliases["late ME"] = "Late Middle English"

labels["Northern Middle English"] = {display = "Northern", plain_categories = {"Northern Middle English"}, language = "enm"}
aliases["Northern ME"] = "Northern Middle English"
aliases["North ME"] = "Northern Middle English"

labels["Ormulum"] = {Wikipedia = "Ormulum", plain_categories = {"Middle English terms unique to the Ormulum"}, language = "enm"}

labels["Southern Middle English"] = {display = "Southern", plain_categories = {"Southern Middle English"}, language = "enm"}
aliases["Southern ME"] = "Southern Middle English"
aliases["South ME"] = "Southern Middle English"
aliases["Southwest ME"] = "Southern Middle English"

labels["West Midland Middle English"] = {display = "West Midlands", plain_categories = {"West Midland Middle English"}, language = "enm"}
aliases["West Midlands ME"] = "West Midland Middle English"
aliases["West Midland ME"] = "West Midland Middle English"
-- enm end

-- es start
labels["Latin America"] = {plain_categories = {"Latin American Spanish"}, language = "es"}
aliases["Latin American Spanish"] = "Latin America"

labels["US Spanish"] = {display = "[[w:Spanish language in the United States|US]]", plain_categories = {"United States Spanish"}, language = "es"}
aliases["United States Spanish"] = "US Spanish"
-- es end

-- eu start
labels["Biscayan"] = {Wikipedia = "Biscayan dialect", plain_categories = {"Biscayan Basque"}, language = "eu"}

labels["Gipuzkoan"] = {Wikipedia = "Gipuzkoan dialect", plain_categories = {"Gipuzkoan Basque"}, language = "eu"}

labels["Navarrese"] = {Wikipedia = "Upper Navarrese dialect", plain_categories = {"Navarrese Basque"}, language = "eu"}

labels["Navarro-Lapurdian"] = {Wikipedia = "Navarro-Lapurdian dialect", plain_categories = {"Navarro-Lapurdian Basque"}, language = "eu"}

labels["Souletin"] = {Wikipedia = "Souletin dialect", plain_categories = {"Souletin Basque"}, language = "eu"}
-- eu end

-- F 
-- fa start
labels["Dari"] = {Wikipedia = "Dari language", plain_categories = {"Dari"}, language = "fa"}
aliases["prs"] = "Dari"

labels["Sistani"] = {Wikipedia = "Sistani dialect", plain_categories = {"Sistani Persian"}, language = "fa"}
-- fa end

-- fi start

labels["Helsinki slang"] = {Wikipedia = true, plain_categories = {"Helsinki slang"}, language = "fi"}

labels["Finglish"] = {Wikipedia = true, plain_categories = {"Finglish"}, language = "fi"}

-- fi end

-- fiu-fin-pro start

labels["Northern Finnic"] = {plain_categories = {"Northern Proto-Finnic"}, language = "fiu-fin-pro"}

-- fiu-fin-pro end

-- fr
labels["European French"] = {display = "Europe", Wikipedia = true, plain_categories = {"European French"}, language = "fr"}

labels["Ivory Coast French"] = {display = "Ivory Coast", Wikipedia = "African French#Abidjan French vocabulary", plain_categories = {"Ivorian French"}, language = "fr"}
aliases["Ivory Coast"] = "Ivory Coast French"
aliases["Côte d’Ivoire"] = "Ivory Coast French"
aliases["Côte d'Ivoire"] = "Ivory Coast French"
aliases["Ivorian"] = "Ivory Coast French"

labels["Ivory Coast French slang"] = {display = "Ivory Coast slang", Wikipedia = "fr:Nouchi", plain_categories = {"Ivorian French"}, language = "fr"}
aliases["nouchi"] = "Ivory Coast French slang"
aliases["Nouchi"] = "Ivory Coast French slang"
aliases["noussi"] = "Ivory Coast French slang"
aliases["Noussi"] = "Ivory Coast French slang"
aliases["Ivory Coast slang"] = "Ivory Coast French slang"
aliases["Côte d’Ivoire slang"] = "Ivory Coast French slang"
aliases["Côte d'Ivoire slang"] = "Ivory Coast French slang"
aliases["Ivorian slang"] = "Ivory Coast French slang"

labels["Louisiana French"] = {display = "Louisiana", Wikipedia = "Cajun French", plain_categories = {"Louisiana French"}, language = "fr"}
-- fr end

labels["Anglo-Norman"] = {Wikipedia = "Anglo-Norman language", plain_categories = {"Anglo-Norman Old French"}, language = "fro"}

-- frr start
labels["Halligen"] = {Wikipedia = "Halligen Frisian", plain_categories = {"Halligen North Frisian"}, language = "frr"}
aliases["Halligen Dialect"] = "Halligen"
aliases["Hallifreesk"] = "Halligen"
aliases["Halligen dialect"] = "Halligen"
aliases["Halligen Frisian"] = "Halligen"
aliases["Hallig Frisian"] = "Halligen"
aliases["Hallig"] = "Halligen"
aliases["Hallig dialect"] = "Halligen"

labels["Mooring"] = {Wikipedia = "Mooring (North Frisian dialect)", plain_categories = {"Mooring North Frisian"}, language = "frr"}
aliases["Mooring dialect"] = "Mooring"
-- frr end

-- fy start
labels["Clay"] = {Wikipedia = "Clay Frisian", plain_categories = {"Clay Frisian"}, language = "fy"}
aliases["Clay Frisian"] = "Clay"

labels["Wood"] = {Wikipedia = "Wood Frisian", plain_categories = {"Wood Frisian"}, language = "fy"}
aliases["Wood Frisian"] = "Wood"
-- fy end

-- G 
-- ga start
labels["Cois Fharraige"] = {Wikipedia = "Gaeltacht Cois Fharraige", plain_categories = {"Cois Fharraige Irish"}, language = "ga"}
aliases["Cois Fhairrge"] = "Cois Fharraige"

labels["Kerry"] = {Wikipedia = "Kerry Gaeltacht", plain_categories = {"Munster Irish"}, language = "ga"}

labels["Waterford"] = {Wikipedia = "Gaeltacht na nDéise", plain_categories = {"Munster Irish"}, language = "ga"}
-- ga end

-- gem-pro start
labels["East Germanic"] = {Wikipedia = "East Germanic languages", plain_categories = {"East Proto-Germanic"}, language = "gem-pro"}

labels["North Germanic"] = {Wikipedia = "North Germanic languages", plain_categories = {"North Proto-Germanic"}, language = "gem-pro"}

labels["Northwest Germanic"] = {Wikipedia = "Northwest Germanic languages", plain_categories = {"Northwest Proto-Germanic"}, language = "gem-pro"}

labels["West Germanic"] = {Wikipedia = "West Germanic languages", plain_categories = {"West Proto-Germanic"}, language = "gem-pro"}
-- gem-pro end

labels["Apulia"] = {display = "[[Apulia]]", plain_categories = {"Apulian Greek"}, language = "grk-ita"}
aliases["Apulian"] = "Apulia"

-- gmw-cfr start
labels["Aachen"] = {Wikipedia = "Aachen dialect", plain_categories = {"Aachen Franconian"}, language = "gmw-cfr"}

labels["Kölsch"] = {Wikipedia = "Colognian language", plain_categories = {"Kölsch"}, language = "gmw-cfr"}
aliases["Colognian"] = "Kölsch"
aliases["Cologne"] = "Kölsch"
aliases["Köln"] = "Kölsch"

labels["Moselle Franconian"] = {Wikipedia = "Moselle Franconian dialects", plain_categories = {"Moselle Franconian"}, language = "gmw-cfr"}
aliases["Moselfränkisch"] = "Moselle Franconian"

labels["Ripuarian"] = {Wikipedia = "Ripuarian language", plain_categories = {"Ripuarian Franconian"}, language = "gmw-cfr"}
aliases["Ripuarian Franconian"] = "Ripuarian"
aliases["Ripuarisch"] = "Ripuarian"
-- gmw-cfr end

-- gmw-ecg start
labels["Silesian"] = {Wikipedia = "Silesian German", plain_categories = {"Silesian German"}, language = "gmw-ecg"} -- gmw-ecg dialect; cf Upper Saxon, also "Silesia" at /regional. don't add "Silesia" alias

labels["Upper Saxon"] = {Wikipedia = true, plain_categories = {"Upper Saxon"}, language = "gmw-ecg"}
aliases["Upper Saxony"] = "Upper Saxon"
aliases["Upper Saxon German"] = "Upper Saxony" -- gmw-ecg dialect; cf Silesian; move to data/subvarieties?
-- gmw-ecg end

-- gmw-pro start
labels["Frankish"] = {Wikipedia = true, plain_categories = {"Frankish"}, language = "gmw-pro"}

labels["Elbe Germanic"] = {Wikipedia = "Elbe Germanic", plain_categories = {"Elbe Germanic"}, language = "gmw-pro"}

labels["North Sea Germanic"] = {Wikipedia = "North Sea Germanic", plain_categories = {"North Sea Germanic"}, language = "gmw-pro"}

labels["Weser-Rhine Germanic"] = {Wikipedia = "Weser-Rhine Germanic", plain_categories = {"Weser-Rhine Germanic"}, language = "gmw-pro"}

labels["Anglo-Frisian Germanic"] = {Wikipedia = "Anglo-Frisian languages", plain_categories = {"Anglo-Frisian Germanic"}, language = "gmw-pro"}

-- gmw-pro end

-- gmw-rfr start
labels["East Palatine"] = {display = "Vorderpfälzisch", Wikipedia = "Palatine German language", plain_categories = {"East Palatine German"}, language = "gmw-rfr"}
aliases["Vorderpfälzisch"] = "East Palatine"

labels["Hessian"] = {Wikipedia = "Hessian dialects", plain_categories = {"Hessian German"}, language = "gmw-rfr"}
aliases["Hesse"] = "Hessian"
aliases["Hessen"] = "Hessian"
aliases["Hessisch"] = "Hessian"

labels["Palatine German"] = {display = "Palatine", Wikipedia = "Palatine German language", plain_categories = {"Palatine German"}, language = "gmw-rfr"}
aliases["Palatinate German"] = "Palatine German"
aliases["Pälzisch"] = "Palatine German"
aliases["Pfälzisch"] = "Palatine German"
aliases["Palatine"] = "Palatine German" -- remove if other languages have 'palatine' varieties

labels["South Hessian"] = {plain_categories = {"South Hessian German"}, language = "gmw-rfr"}
aliases["South Hesse"] = "South Hessian"
aliases["south Hesse"] = "South Hessian"
aliases["South Hessen"] = "South Hessian"
aliases["south Hessen"] = "South Hessian"
aliases["south Hessian"] = "South Hessian"
aliases["Südhessisch"] = "South Hessian"

labels["West Palatine"] = {display = "Westpfälzisch", Wikipedia = "Palatine German language", plain_categories = {"West Palatine German"}, language = "gmw-rfr"}
aliases["Westpfälzisch"] = "West Palatine"
-- gmw-rfr end

labels["Lombardic"] = {Wikipedia = "Lombardic language", plain_categories = {"Lombardic"}, language = "goh"}

-- grc start
labels["Aeolic"] = {Wikipedia = "Aeolic Greek", plain_categories = {"Aeolic Greek"}, language = "grc"}
aliases["Aeolic Greek"] = "Aeolic"

labels["Arcadocypriot"] = {Wikipedia = "Arcadocypriot Greek", plain_categories = {"Arcadocypriot Greek"}, language = "grc"}
aliases["Arcadocypriot Greek"] = "Arcadocypriot"

labels["Attic"] = {Wikipedia = "Attic Greek", plain_categories = {"Attic Greek"}, language = "grc"}
aliases["Attic Greek"] = "Attic"

labels["Boeotian"] = {Wikipedia = "Boeotian Greek", plain_categories = {"Boeotian Greek"}, language = "grc"}
aliases["Boeotian Greek"] = "Boeotian"

labels["Old Attic"] = {Wikipedia = "Attic Greek", plain_categories = {"Attic Greek"}, language = "grc"}

labels["Byzantine"] = {Wikipedia = "Medieval Greek", plain_categories = {"Byzantine Greek"}, language = "grc"}
aliases["Byzantine Greek"] = "Byzantine"
aliases["Medieval Greek"] = "Byzantine"

labels["Doric"] = {Wikipedia = "Doric Greek", plain_categories = {"Doric Greek"}, language = "grc"}
aliases["Megarian"] = "Doric"

labels["Epic"] = {Wikipedia = "Homeric Greek", plain_categories = {"Epic Greek"}, language = "grc"}
aliases["Homeric"] = "Epic"
aliases["Epic Greek"] = "Epic"
aliases["Homeric Greek"] = "Homeric"

labels["Ionic"] = {Wikipedia = "Ionic Greek", plain_categories = {"Ionic Greek"}, language = "grc"}
aliases["Ionic Greek"] = "Ionic"

labels["Koine"] = {Wikipedia = "Koine Greek", plain_categories = {"Koine Greek"}, language = "grc"}
aliases["Koine Greek"] = "Koine"
aliases["Hellenistic"] = "Koine"
aliases["Hellenistic Koine"] = "Koine"

labels["Laconian"] = {Wikipedia = "Doric Greek#Laconian", plain_categories = {"Doric Greek"}, language = "grc"}

-- grc end

-- gsw start
labels["Alsatian"] = {Wikipedia = "Alsatian dialect", plain_categories = {"Alsatian German"}, language = "gsw"}
aliases["Elsässisch"] = "Alsatian"
aliases["Alsatian"] = "Alsatian"
aliases["Alsacien"] = "Alsatian"
aliases["Alsatian German"] = "Alsatian"
aliases["Alsace"] = "Alsatian"

labels["Carcoforo"] = {Wikipedia = true, plain_categories = {"Carcoforo Walser"}, language = "gsw"}

labels["Formazza"] = {Wikipedia = true, plain_categories = {"Formazza Walser"}, language = "gsw"}

labels["Gressoney"] = {Wikipedia = true, plain_categories = {"Gressoney Walser"}, language = "gsw"}

labels["Issime"] = {Wikipedia = true, plain_categories = {"Issime Walser"}, language = "gsw"}

labels["Rimella and Campello Monti"] = {display = "[[w:Rimella|Rimella]] and [[:it:w:Campello Monti|Campello Monti]]", plain_categories = {"Rimella and Campello Monti Walser"}, language = "gsw"}
aliases["Rimella"] = "Rimella and Campello Monti"
aliases["Campello Monti"] = "Rimella and Campello Monti"
aliases["RCM"] = "Rimella and Campello Monti"

labels["Walser"] = {Wikipedia = "Walser German", plain_categories = {"Walser German"}, language = "gsw"}
aliases["wae"] = "Walser"
aliases["Waser German"] = "Walser"
aliases["Walserdeutsch"] = "Walser"
-- gsw end

labels["Lisan ud-Dawat"] = {Wikipedia = true, plain_categories = {"Lisan ud-Dawat Gujarati"}, language = "gu"}
aliases["LDA"] = "Lisan ud-Dawat"
aliases["Lisaan ud-Da'wat"] = "Lisan ud-Dawat"
aliases["Lisaan ud-Da'wat il-'Alaviyah"] = "Lisan ud-Dawat"

-- H 
-- he start
labels["Biblical Hebrew"] = {Wikipedia = true, plain_categories = {"Biblical Hebrew"}, language = "he"}
aliases["hbo"] = "Biblical Hebrew"
aliases["Classical Hebrew"] = "Biblical Hebrew"
aliases["Ancient Hebrew"] = "Biblical Hebrew"
aliases["Old Hebrew"] = "Biblical Hebrew"

labels["Medieval Hebrew"] = {Wikipedia = true, plain_categories = {"Medieval Hebrew"}, language = "he"}

labels["Mishnaic Hebrew"] = {Wikipedia = true, plain_categories = {"Mishnaic Hebrew"}, language = "he"}
aliases["Mishnaic"] = "Mishnaic Hebrew"
-- he end

-- hi start
labels["Bombay"] = {Wikipedia = "Bombay Hindi", plain_categories = {"Bombay Hindi"}, language = "hi"}
aliases["Bambaiyya"] = "Bombay"
aliases["Mumbai"] = "Bombay"

labels["Braj"] = {Wikipedia = "Braj Bhasha", plain_categories = {"Braj Bhāṣā"}, language = "hi"}

labels["Hariyanvi"] = {display = "Hariyāṇvī", Wikipedia = "Hariyanvi language", plain_categories = {"Hariyāṇvī"}, language = "hi"}
aliases["Hariyana"] = "Hariyanvi"

labels["Bihar"] = {display = "Bihar", Wikipedia = "Bihari Hindi", plain_categories = {"Bihari Hindi"}, language = "hi"}
-- hi end

-- hit start
labels["Middle Hittite"] = {Wikipedia = true, language = "hit", plain_categories = {"Middle Hittite"}}

labels["Old Hittite"] = {Wikipedia = true, language = "hit", plain_categories = {"Old Hittite"}}

labels["New Hittite"] = {Wikipedia = true, language = "hit", plain_categories = {"New Hittite"}}
aliases["Neo-Hittite"] = "New Hittite"
-- hit end

-- hy start
labels["Ararat"] = {Wikipedia = "Araratian dialect", plain_categories = {"Ararat Armenian"}, language = "hy"}

labels["Eastern Armenian"] = {Wikipedia = true, plain_categories = {"Eastern Armenian"}, language = "hy"}

labels["Hamshen"] = {Wikipedia = "Homshetsi dialect", plain_categories = {"Hamshen Armenian"}, language = "hy"}
aliases["Homshetsi"] = "Hamshen"
aliases["Homshetsma"] = "Hamshen"

labels["Karabakh"] = {Wikipedia = "Karabakh dialect (Armenian)", plain_categories = {"Karabakh Armenian"}, language = "hy"}
aliases["Gharabagh"] = "Karabakh"
aliases["Artsakh"] = "Karabakh"

labels["traditional orthography"] = {Wikipedia = "Classical Armenian orthography", plain_categories = {"Armenian Traditional orthography forms"}, language = "hy"}
aliases["TAO"] = "traditional orthography"

labels["Western Armenian"] = {Wikipedia = true, plain_categories = {"Western Armenian"}, language = "hy"}
-- hy end

-- I 
-- inc-ash start
labels["Allahabad"] = {Wikipedia = "Allahabad pillar", plain_categories = {"Kosambi Ashokan Prakrit"}, language = "inc-ash"}
labels["Delhi-Meerut"] = {Wikipedia = "Ashokan Edicts in Delhi#Delhi-Meerut pillar", plain_categories = {"Delhi-Meerut Ashokan Prakrit"}, language = "inc-ash"}
aliases["Meerut"] = "Delhi-Meerut"

labels["Delhi-Topra"] = {Wikipedia = "Ashokan Edicts in Delhi#Delhi-Topra pillar", plain_categories = {"Delhi-Topra Ashokan Prakrit"}, language = "inc-ash"}
aliases["Topra"] = "Delhi-Topra"

labels["Dhauli"] = {Wikipedia = true, plain_categories = {"Dhauli Ashokan Prakrit"}, language = "inc-ash"}

labels["Girnar"] = {Wikipedia = true, plain_categories = {"Girnar Ashokan Prakrit"}, language = "inc-ash"}

labels["Gujarra"] = {plain_categories = {"Gujarra Ashokan Prakrit"}, language = "inc-ash"}

labels["Jaugada"] = {Wikipedia = true, plain_categories = {"Jaugada Ashokan Prakrit"}, language = "inc-ash"}

labels["Kalsi"] = {Wikipedia = "Rock edicts of Khalsi", plain_categories = {"Kalsi Ashokan Prakrit"}, language = "inc-ash"}

labels["Lumbini"] = {Wikipedia = "Lumbini pillar inscription", plain_categories = {"Lumbini Ashokan Prakrit"}, language = "inc-ash"}

labels["Mansehra"] = {Wikipedia = true, plain_categories = {"Mansehra Ashokan Prakrit"}, language = "inc-ash"}

labels["Maski"] = {Wikipedia = true, plain_categories = {"Maski Ashokan Prakrit"}, language = "inc-ash"}

labels["Shahbazgarhi"] = {Wikipedia = "Shahbaz Garhi", plain_categories = {"Shahbazgarhi Ashokan Prakrit"}, language = "inc-ash"}

labels["Sopara"] = {Wikipedia = true, plain_categories = {"Sopara Ashokan Prakrit"}, language = "inc-ash"}

labels["Yerragudi"] = {plain_categories = {"Yerragudi Ashokan Prakrit"}, language = "inc-ash"}
-- inc-ash end

-- inc-pra start
labels["Epigraphic Prakrit"] = {Wikipedia = "Epigraphy", plain_categories = {"Epigraphic Prakrit"}, language = "inc-pra"}

labels["Jain Maharastri"] = {Wikipedia = "Jain Maharashtri", plain_categories = {"Jain Maharastri"}, language = "inc-pra"}

labels["Culikapaisaci"] = {Wikipedia = "Culikapaisaci", plain_categories = {"Culikapaisaci"}, language = "inc-pra"}

labels["Magadhi"] = {Wikipedia = "Magadhi Prakrit", plain_categories = {"Magadhi Prakrit"}, language = "inc-pra"}

labels["Maharastri"] = {Wikipedia = "Maharashtri Prakrit", plain_categories = {"Maharastri Prakrit"}, language = "inc-pra"}

labels["Paisaci"] = {Wikipedia = "Paishaci", plain_categories = {"Paisaci Prakrit"}, language = "inc-pra"}

labels["Ardhamagadhi"] = {Wikipedia = "Ardhamagadhi Prakrit", plain_categories = {"Ardhamagadhi Prakrit"}, language = "inc-pra"}

labels["Khasa"] = {Wikipedia = "Khas people", plain_categories = {"Khasa Prakrit"}, language = "inc-pra"}

labels["Helu"] = {Wikipedia = "Elu", plain_categories = {"Helu Prakrit"}, language = "inc-pra"}
aliases["Elu"] = "Helu"

labels["Sauraseni"] = {Wikipedia = "Shauraseni Prakrit", plain_categories = {"Sauraseni Prakrit"}, language = "inc-pra"}

-- inc-pra end

-- it start
labels["central Italy"] = {Wikipedia = "Central Italian", plain_categories = {"Central Italian"}, language = "it"}
aliases["Central Italian"] = "central Italy"
aliases["Central Italy"] = "central Italy"
aliases["central Italian"] = "central Italy"

labels["northern Italy"] = {Wikipedia = "Northern Italy", plain_categories = {"Northern Italian"}, language = "it"}
aliases["Northern Italian"] = "northern Italy"
aliases["Northern Italy"] = "northern Italy"
aliases["northern Italian"] = "northern Italy"

labels["Rome"] = {Wikipedia = "Romanesco dialect", plain_categories = {"Romanesco Italian"}, language = "it"}
aliases["Roman Italian"] = "Rome"
aliases["Romanesco Italian"] = "Rome"
aliases["Roman"] = "Rome"
aliases["Romanesco"] = "Rome"

labels["southern Italy"] = {Wikipedia = "Southern Italy", plain_categories = {"Southern Italian"}, language = "it"}
aliases["Southern Italian"] = "southern Italy"
aliases["Southern Italy"] = "southern Italy"
aliases["southern Italian"] = "southern Italy"

labels["Tuscany"] = {Wikipedia = "Tuscan dialect", plain_categories = {"Tuscan Italian"}, language = "it"}
aliases["Tuscan"] = "Tuscany"
-- it end

-- iu start
labels["Aivilik"] = {Wikipedia = "Aivilik dialect", plain_categories = {"Aivilik Inuktitut"}, language = "iu"}

labels["Inuktun"] = {plain_categories = {"Inuktun Inuktitut"}, language = "iu"}
aliases["Polar Eskimo"] = "Inuktun"

labels["Inuttut"] = {plain_categories = {"Inuttut Inuktitut"}, language = "iu"}
aliases["Nunatsiavummiutut"] = "Inuttut"
aliases["Labradorimiutut"] = "Inuttut"

labels["Itivimuit"] = {plain_categories = {"Itivimuit Inuktitut"}, language = "iu"}

labels["Nunavik"] = {Wikipedia = "Inuktitut#Nunavik", plain_categories = {"Nunavik Inuktitut"}, language = "iu"}
aliases["Nunavimmiutitut"] = "Nunavik"
aliases["Inuttitut"] = "Nunavik"
-- iu end

-- J 
-- ja start
labels["Akita"] = {Wikipedia = "Akita dialect", plain_categories = {"Akita Japanese"}, language = "ja"}

labels["Amami"] = {Wikipedia = "Amami Japanese", plain_categories = {"Amami Japanese"}, language = "ja"}

labels["Awa"] = {Wikipedia = "Shikoku dialect", plain_categories = {"Awa Japanese"}, language = "ja"}

labels["Awaji"] = {Wikipedia = "Awaji dialect", plain_categories = {"Awaji Japanese"}, language = "ja"}

labels["Banshū"] = {Wikipedia = "Banshū dialect", plain_categories = {"Banshū Japanese"}, language = "ja"}
aliases["Banshu"] = "Banshū"

labels["Chikugo"] = {Wikipedia = "Hichiku dialect", plain_categories = {"Chikugo Japanese"}, language = "ja"}

labels["Chikuhō"] = {Wikipedia = "Hichiku dialect", plain_categories = {"Chikuhō Japanese"}, language = "ja"}
aliases["Chikuho"] = "Chikuhō"

labels["Chūgoku"] = {Wikipedia = "Chūgoku dialect", plain_categories = {"Chūgoku Japanese"}, language = "ja"}
aliases["Chugoku"] = "Chūgoku"

labels["Fukui"] = {Wikipedia = "Hokuriku dialect#Fukui", plain_categories = {"Fukui Japanese"}, language = "ja"}

labels["Gunma"] = {Wikipedia = "Kantō dialect", plain_categories = {"Gunma Japanese"}, language = "ja"}

labels["Hachijō"] = {Wikipedia = "Hachijō language", plain_categories = {"Hachijō Japanese"}, language = "ja"}
aliases["Hachijo"] = "Hachijō"

labels["Hakata"] = {Wikipedia = "Hakata dialect", plain_categories = {"Hakata Japanese"}, language = "ja"}

labels["Hata"] = {Wikipedia = "Shikoku dialect", plain_categories = {"Hata Japanese"}, language = "ja"}

labels["Hichiku"] = {Wikipedia = "Hichiku dialect", plain_categories = {"Hichiku Japanese"}, language = "ja"}

labels["Hida"] = {Wikipedia = "Hida dialect", plain_categories = {"Hida Japanese"}, language = "ja"}

labels["Hokkaidō"] = {Wikipedia = "Hokkaidō dialect", plain_categories = {"Hokkaidō Japanese"}, language = "ja"}
aliases["Hokkaido"] = "Hokkaidō"

labels["Hokuriku"] = {Wikipedia = "Hokuriku dialect", plain_categories = {"Hokuriku Japanese"}, language = "ja"}

labels["Hōnichi"] = {Wikipedia = "Hōnichi dialect", plain_categories = {"Hōnichi Japanese"}, language = "ja"}
aliases["Honichi"] = "Hōnichi"

labels["Ibaraki"] = {Wikipedia = "Ibaraki dialect", plain_categories = {"Ibaraki Japanese"}, language = "ja"}

labels["Iyo"] = {Wikipedia = "Iyo dialect", plain_categories = {"Iyo Japanese"}, language = "ja"}

labels["Kagoshima"] = {Wikipedia = "Kagoshima dialect", plain_categories = {"Kagoshima Japanese"}, language = "ja"}
aliases["Satsugu"] = "Kagoshima"
aliases["Satsugū"] = "Kagoshima"
aliases["Satsuma"] = "Kagoshima"

labels["Kansai"] = {Wikipedia = "Kansai dialect", plain_categories = {"Kansai Japanese"}, language = "ja"}

labels["Kantō"] = {Wikipedia = "Kantō dialect", plain_categories = {"Kantō Japanese"}, language = "ja"}
aliases["Kanto"] = "Kantō"

labels["Kesen"] = {Wikipedia = "Kesen dialect", plain_categories = {"Kesen Japanese"}, language = "ja"}

labels["Kumamoto"] = {Wikipedia = "Kumamoto dialect", plain_categories = {"Kumamoto Japanese"}, language = "ja"}

labels["Mikawa"] = {Wikipedia = "Mikawa dialect", plain_categories = {"Mikawa Japanese"}, language = "ja"}

labels["Mino"] = {Wikipedia = "Mino dialect", plain_categories = {"Mino Japanese"}, language = "ja"}

labels["Nagaoka"] = {Wikipedia = "Nagaoka dialect", plain_categories = {"Nagaoka Japanese"}, language = "ja"}

labels["Nagoya"] = {Wikipedia = "Nagoya dialect", plain_categories = {"Nagoya Japanese"}, language = "ja"}

labels["Ōita"] = {Wikipedia = "Ōita Japanese", plain_categories = {"Ōita Japanese"}, language = "ja"}
aliases["Oita"] = "Ōita"

labels["Okinawa"] = {Wikipedia = "Okinawan Japanese", plain_categories = {"Okinawa Japanese"}, language = "ja"}

labels["Saga"] = {Wikipedia = "Saga dialect", plain_categories = {"Saga Japanese"}, language = "ja"}

labels["Sanuki"] = {Wikipedia = "Sanuki dialect", plain_categories = {"Sanuki Japanese"}, language = "ja"}

labels["Shikoku"] = {Wikipedia = "Shikoku dialect", plain_categories = {"Shikoku Japanese"}, language = "ja"}

labels["Shizuoka"] = {plain_categories = {"Shizuoka Japanese"}, language = "ja"}

labels["Tōhoku"] = {Wikipedia = "Tōhoku dialect", plain_categories = {"Tōhoku Japanese"}, language = "ja"}
aliases["Tohoku"] = "Tōhoku"

labels["Tōkai–Tōsan"] = {Wikipedia = "Tōkai–Tōsan dialect", plain_categories = {"Tōkai–Tōsan Japanese"}, language = "ja"}
aliases["Tokai"] = "Tōkai–Tōsan"
aliases["Tōkai"] = "Tōkai–Tōsan"
aliases["Tosan"] = "Tōkai–Tōsan"
aliases["Tōsan"] = "Tōkai–Tōsan"
aliases["Tokai-Tosan"] = "Tōkai–Tōsan"
aliases["Tōkai-Tosan"] = "Tōkai–Tōsan"
aliases["Tokai-Tōsan"] = "Tōkai–Tōsan"
aliases["Tōkai-Tōsan"] = "Tōkai–Tōsan"

labels["Tōkyō"] = {Wikipedia = "Tokyo dialect", plain_categories = {"Tōkyō Japanese"}, language = "ja"}
aliases["Tokyo"] = "Tōkyō"

labels["Tosa"] = {Wikipedia = "Tosa dialect", plain_categories = {"Tosa Japanese"}, language = "ja"}

labels["Toyama"] = {Wikipedia = "Hokuriku dialect#Toyama", plain_categories = {"Toyama Japanese"}, language = "ja"}

labels["Tsugaru"] = {Wikipedia = "Tsugaru dialect", plain_categories = {"Tsugaru Japanese"}, language = "ja"}

labels["Tsushima"] = {Wikipedia = "Tsushima dialect", plain_categories = {"Tsushima Japanese"}, language = "ja"}

labels["Umpaku"] = {Wikipedia = "Umpaku dialect", plain_categories = {"Umpaku Japanese"}, language = "ja"}

labels["Yamagata"] = {Wikipedia = "Yamagata dialect", plain_categories = {"Yamagata Japanese"}, language = "ja"}

-- ja end

labels["Cirebon"] = {plain_categories = {"Cirebon Javanese"}, language = "jv"}

-- K 
labels["Ingilo"] = {Wikipedia = "Ingiloy people", plain_categories = {"Ingilo Georgian"}, language = "ka"}
aliases["Ingiloy"] = "Ingilo"
aliases["Saingilo"] = "Ingilo"

labels["Middle Georgian"] = {Wikipedia = "Middle Georgian", plain_categories = {"Middle Georgian"}, language = "ka"}

-- kea start

-- Barlavento dialects:

labels["Barlavento"] = {Wikipedia = "Barlavento Islands", plain_categories = {"Barlavento Kabuverdianu"}, language = "kea"}

labels["Santo Antão"] = {Wikipedia = "Santo Antão, Cape Verde", plain_categories = {"Santo Antão Kabuverdianu"}, language = "kea"}
aliases["Santoantão"] = "Santo Antão"

labels["São Vicente"] = {Wikipedia = "São Vicente, Cape Verde", plain_categories = {"São Vicente Kabuverdianu"}, language = "kea"}

labels["São Nicolau"] = {Wikipedia = "São Nicolau, Cape Verde", plain_categories = {"São Nicolau Kabuverdianu"}, language = "kea"}

labels["Sal"] = {Wikipedia = "Sal, Cape Verde", plain_categories = {"Sal Kabuverdianu"}, language = "kea"}

labels["Boa Vista"] = {Wikipedia = "Boa Vista, Cape Verde", plain_categories = {"Boa Vista Kabuverdianu"}, language = "kea"}
aliases["Boavista"] = "Boa Vista"

-- Sotavento dialects:

labels["Sotavento"] = {Wikipedia = "Sotavento Islands", plain_categories = {"Sotavento Kabuverdianu"}, language = "kea"}

labels["Maio"] = {Wikipedia = "Maio, Cape Verde", plain_categories = {"Maio Kabuverdianu"}, language = "kea"}

labels["Fogo"] = {Wikipedia = "Fogo, Cape Verde", plain_categories = {"Fogo Kabuverdianu"}, language = "kea"}

labels["Brava"] = {Wikipedia = "Brava, Cape Verde", plain_categories = {"Brava Kabuverdianu"}, language = "kea"}

labels["Santiago"] = {Wikipedia = "Santiago, Cape Verde", plain_categories = {"Santiago Kabuverdianu"}, language = "kea"}
aliases["Badiú"] = "Santiago"
aliases["Badiú or Santiago"] = "Santiago"

-- kea end

-- kmr
labels["Badini"] = {Wikipedia = true, plain_categories = {"Badini"}, language = "kmr"}

labels["Havyaka"] = {Wikipedia = "Havigannada dialect", plain_categories = {"Havyaka Kannada"}, language = "kn"}

-- ko start
labels["Chungcheong"] = {Wikipedia = "Chungcheong dialect", plain_categories = {"Chungcheong Korean"}, language = "ko"}

labels["Chungnam"] = {Wikipedia = "Chungcheong dialect", plain_categories = {"Chungcheong Korean"}, language = "ko"}

labels["Gangwon"] = {Wikipedia = "Gangwon dialect", plain_categories = {"Gangwon Korean"}, language = "ko"}
aliases["Kangwon"] = "Gangwon"
aliases["Kangwŏn"] = "Gangwon"

labels["Gyeonggi"] = {Wikipedia = "Gyeonggi dialect", plain_categories = {"Gyeonggi Korean"}, language = "ko"}

labels["Gyeongsang"] = {Wikipedia = "Gyeongsang dialect", plain_categories = {"Gyeongsang Korean"}, language = "ko"}

labels["Hamgyong"] = {Wikipedia = "Hamgyŏng dialect", plain_categories = {"Hamgyong Korean"}, language = "ko"}
aliases["Hamgyŏng"] = "Hamgyong"
aliases["Hamgyeong"] = "Hamgyong"

labels["Hwanghae"] = {Wikipedia = "Hwanghae dialect", plain_categories = {"Hwanghae Korean"}, language = "ko"}

labels["Koryo-mar"] = {Wikipedia = true, plain_categories = {"Koryo-mar"}, language = "ko"}

labels["North Korea"] = {Wikipedia = true, plain_categories = {"North Korean"}, language = "ko"}
aliases["North Korean"] = "North Korea"

labels["Pyongan"] = {Wikipedia = "Pyongan dialect", plain_categories = {"Pyongan Korean"}, language = "ko"}
aliases["P'yŏng'an"] = "Pyongan"
aliases["Pyong'an"] = "Pyongan"
aliases["Pyŏngan"] = "Pyongan"
aliases["P'yŏngan"] = "Pyongan"
aliases["Pyeongan"] = "Pyongan"
aliases["Pyeong'an"] = "Pyongan"
aliases["Pyeong-an"] = "Pyongan"

labels["South Korea"] = {Wikipedia = true, plain_categories = {"South Korean"}, language = "ko"}
aliases["South Korean"] = "South Korea"

labels["Yanbian"] = {Wikipedia = "Korean language in China", plain_categories = {"Yanbian Korean"}, language = "ko"}

labels["Yukjin"] = {Wikipedia = "Yukjin dialect", plain_categories = {"Yukjin Korean"}, language = "ko"}

labels["Early Modern"] = {plain_categories = {"Early Modern Korean"}, language = "ko"}

labels["highly formal Literary Chinese-style Korean"] = {plain_categories = {"Literary Chinese-style Korean"}, language = "ko"}

aliases["Hanmuntu"] = "highly formal Literary Chinese-style Korean"

labels["speech of the royal court"] = {plain_categories = {"Joseon court Korean"}, language = "ko"}

aliases["Gungjung"] = "speech of the royal court"

labels["ginseng-harvesters' cant"] = {display = "[[심마니말|ginseng-harvesters' cant]]", plain_categories = {"Korean ginseng-harvesters' cant"}, language = "ko"}

aliases["Simmani"] = "ginseng-harvesters' cant"

labels["traditional acrobats' cant"] = {display = "[[wikipedia:Namsadang|traditional acrobats]]' cant", plain_categories = {"Namsadang cant"}, language = "ko"}

aliases["Namsadang"] = "traditional acrobats' cant"

-- ko end

labels["Catholic"] = {Wikipedia = "Goan Catholics", plain_categories = {"Catholic Konkani"}, language = "kok"}

-- krc start
labels["Balkar"] = {plain_categories = {"Balkar"}, language = "krc"}

labels["Karachay"] = {plain_categories = {"Karachay"}, language = "krc"}
-- krc end

-- krl start
labels["North Karelian"] = {plain_categories = {"North Karelian"}, language = "krl"}
labels["Northern Karelian"] = labels["North Karelian"]

labels["South Karelian"] = {plain_categories = {"South Karelian"}, language = "krl"}
labels["Southern Karelian"] = labels["South Karelian"]

labels["Tver Karelian"] = {plain_categories = {"Tver Karelian"}, language = "krl"}
labels["Tver"] = labels["Tver Karelian"]
-- krl end

-- kw start
labels["Common Cornish"] = {Wikipedia = "Kernewek Kemmyn", plain_categories = {"Common Cornish spellings"}, language = "kw"}

labels["Revived Late Cornish"] = {Wikipedia = "Modern Cornish", plain_categories = {"Revived Late Cornish spellings"}, language = "kw"}
aliases["RLC"] = "Revived Late Cornish"

labels["Standard Cornish"] = {Wikipedia = "Kernowek Standard", plain_categories = {"Standard Cornish spellings"}, language = "kw"}

labels["Standard Written Form"] = {Wikipedia = "Standard Written Form", plain_categories = {"Standard Written Form Cornish spellings"}, language = "kw"}
aliases["SWF"] = "Standard Written Form"

labels["Unified Cornish"] = {Wikipedia = "Unified Cornish", plain_categories = {"Unified Cornish spellings"}, language = "kw"}
aliases["UC"] = "Unified Cornish"

labels["Unified Cornish Revised"] = {Wikipedia = "Unified Cornish#Unified Cornish, Revised", plain_categories = {"Unified Cornish Revised spellings"}, language = "kw"}
aliases["UCR"] = "Unified Cornish Revised"
-- kw end

-- L 
-- la start
labels["British Contemporary Latin"] = {display = "British [[w:Contemporary Latin|Contemporary Latin]]", plain_categories = {"British Contemporary Latin"}, language = "la"}
aliases["Contemporary Anglo-Latin"] = "British Contemporary Latin"
aliases["Contemporary British"] = "British Contemporary Latin"

labels["British Late Latin"] = {display = "British [[w:Late Latin|Late Latin]]", plain_categories = {"British Late Latin"}, language = "la"}
aliases["Late Anglo-Latin"] = "British Late Latin"
aliases["Late British"] = "British Late Latin"

labels["British Medieval Latin"] = {display = "British [[w:Medieval Latin|Medieval Latin]]", plain_categories = {"British Medieval Latin"}, language = "la"}
aliases["British Mediaeval Latin"] = "British Medieval Latin"
aliases["Mediaeval Anglo-Latin"] = "British Medieval Latin"
aliases["Mediaeval British"] = "British Medieval Latin"
aliases["Medieval Anglo-Latin"] = "British Medieval Latin"
aliases["Medieval British"] = "British Medieval Latin"

labels["British New Latin"] = {display = "British [[w:New Latin|New Latin]]", plain_categories = {"British New Latin"}, language = "la"}
aliases["New Anglo-Latin"] = "British New Latin"
aliases["New British"] = "British New Latin"

labels["British Renaissance Latin"] = {display = "British [[w:Renaissance Latin|Renaissance Latin]]", plain_categories = {"British Renaissance Latin"}, language = "la"}
aliases["Renaissance Anglo-Latin"] = "British Renaissance Latin"
aliases["Renaissance British"] = "British Renaissance Latin"

labels["British Vulgar Latin"] = {Wikipedia = true, plain_categories = {"British Vulgar Latin"}, language = "la"}
aliases["Vulgar Anglo-Latin"] = "British Vulgar Latin"
aliases["Vulgar British"] = "British Vulgar Latin"

labels["Ecclesiastical Latin"] = {Wikipedia = true, plain_categories = {"Ecclesiastical Latin"}, language = "la"}
aliases["Church Latin"] = "Ecclesiastical Latin"

labels["Late Latin"] = {Wikipedia = true, plain_categories = {"Late Latin"}, language = "la"}

labels["Medieval Latin"] = {Wikipedia = true, plain_categories = {"Medieval Latin"}, language = "la"}

labels["New Latin"] = {Wikipedia = true, plain_categories = {"New Latin"}, language = "la"}

labels["Contemporary Latin"] = {Wikipedia = true, plain_categories = {"Contemporary Latin"}, language = "la"}

labels["Old Latin"] = {Wikipedia = true, plain_categories = {"Old Latin"}, language = "la"}
aliases["ante-classical"] = "Old Latin"

labels["Vulgar Latin"] = {Wikipedia = true, plain_categories = {"Vulgar Latin"}, language = "la"}
-- la end

labels["Haketia"] = {Wikipedia = true, plain_categories = {"Haketia"}, language = "lad"}
aliases["Hakitia"] = "Haketia"
aliases["Haquitía"] = "Haketia"

labels["Maastrichtian"] = {Wikipedia = "Maastrichtian dialect", plain_categories = {"Maastrichtian Limburgish"}, language = "li"}

-- M 
-- mch start
labels["De'kwana"] = {display = "De'kwana dialect", plain_categories = {"De'kwana Maquiritari"}, language = "mch"}
aliases["De'kwana dialect"] = "De'kwana"

labels["Ye'kwana"] = {display = "Ye'kwana dialect", plain_categories = {"Ye'kwana Maquiritari"}, language = "mch"}
aliases["Ye'kwana dialect"] = "Ye'kwana"
-- mch end

-- mco start
labels["Ixcuintepec"] = {plain_categories = {"Ixcuintepec Mixe"}, language = "mco"}

labels["Malacatepec"] = {plain_categories = {"Malacatepec Mixe"}, language = "mco"}
-- mco end

-- mh start
labels["Rālik"] = {Wikipedia = "Rālik Chain", plain_categories = {"Rālik Marshallese"}, language = "mh"}
aliases["Ralik"] = "Rālik"

labels["Ratak"] = {Wikipedia = "Ratak Chain", plain_categories = {"Ratak Marshallese"}, language = "mh"}
-- mh end

-- mhd start
labels["Inner Mbugu"] = {display = "[[Wiktionary:About Mbugu|Ma'a]]", plain_categories = {"Inner Mbugu"}, language = "mhd"}
aliases["inner Mbugu"] = "Inner Mbugu"

labels["Normal Mbugu"] = {display = "[[Wiktionary:About Mbugu|Mbugu]]", plain_categories = {"Normal Mbugu"}, language = "mhd"}
aliases["normal Mbugu"] = "Normal Mbugu"
-- mhd end

-- mkh-okm start
labels["Angkorian"] = {Wikipedia = "Khmer language#Historical periods", plain_categories = {"Angkorian Old Khmer"}, language = "mkh-okm"}

labels["Pre-Angkorian"] = {Wikipedia = "Khmer language#Historical periods", plain_categories = {"Pre-Angkorian Old Khmer"}, language = "mkh-okm"}
-- mkh-okm end

-- mlm start
labels["Dongmen"] = {Wikipedia = "Mulam language#Dialects", plain_categories = {"Dongmen Mulam"}, language = "mlm"}

labels["Huangjin"] = {Wikipedia = "Mulam language#Dialects", plain_categories = {"Huangjin Mulam"}, language = "mlm"}

labels["Long'an"] = {Wikipedia = "Mulam language#Dialects", plain_categories = {"Long'an Mulam"}, language = "mlm"}

labels["Qiaotou"] = {Wikipedia = "Mulam language#Dialects", plain_categories = {"Qiaotou Mulam"}, language = "mlm"}

labels["Siba"] = {Wikipedia = "Mulam language#Dialects", plain_categories = {"Siba Mulam"}, language = "mlm"}

labels["Xiali"] = {Wikipedia = "Mulam language#Dialects", plain_categories = {"Xiali Mulam"}, language = "mlm"}
-- mlm end

labels["Thanjavur"] = {Wikipedia = "Thanjavur Marathi dialect", plain_categories = {"Thanjavur Marathi"}, language = "mr"}
aliases["Tanjore"] = "Thanjavur"

-- ms start
labels["Batavia"] = {display = "[[w:Betawi language|Batavian Malay]]", plain_categories = {"Batavian Malay"}, language = "ms"}
aliases["Batavian"] = "Batavia"
aliases["Betawi"] = "Batavia"

labels["Hulu Pahang"] = {plain_categories = {"Hulu Pahang Malay"}, language = "ms"}

labels["Minangkabau"] = {display = "[[w:Minangkabau language|Minangkabau Malay]]", plain_categories = {"Minangkabau Malay"}, language = "ms"}

labels["Pahang"] = {Wikipedia = true, plain_categories = {"Pahang Malay"}, language = "ms"}

labels["Palace Malay"] = {plain_categories = {"Malay royal terms"}, language = "ms"}

labels["Terengganu"] = {display = "[[w:Terengganu Malay|Terengganu Malay]]", plain_categories = {"Terengganu Malay"}, language = "ms"}

-- ms end

-- mvi start
labels["Aragusuku"] = {plain_categories = {"Aragusuku Miyako"}, language = "mvi"}

labels["Hirara"] = {plain_categories = {"Hirara Miyako"}, language = "mvi"}
aliases["Pїsara"] = "Hirara"
aliases["Psїsara"] = "Hirara"

labels["Ikema"] = {plain_categories = {"Ikema Miyako"}, language = "mvi"}
aliases["Ikema Island"] = "Ikema"
aliases["Ikemajima"] = "Ikema"
aliases["Ikema-jima"] = "Ikema"
aliases["Ikyaama"] = "Ikema"
aliases["Ikyama"] = "Ikema"
aliases["Ikima"] = "Ikema"

labels["Irabu"] = {plain_categories = {"Irabu Miyako"}, language = "mvi"}
aliases["Irav"] = "Irabu"
aliases["Irau"] = "Irabu"
aliases["Irabujima"] = "Irabu"
aliases["Irabu-jima"] = "Irabu"
aliases["Irabu Island"] = "Irabu"

labels["Kurima"] = {display = "Kurima-jima", plain_categories = {"Kurijima Miyako"}, language = "mvi"}
aliases["Kurima-jima"] = "Kurima"
aliases["Kurimajima"] = "Kurima"
aliases["Kurima Island"] = "Kurima"
aliases["Kurema-jima"] = "Kurima"
aliases["Kuremajima"] = "Kurima"
aliases["Kurema"] = "Kurima"
aliases["Kurema Island"] = "Kurima"
aliases["Ffima"] = "Kurima"
aliases["Ffyama"] = "Kurima"

labels["Minna"] = {plain_categories = {"Minna Miyako"}, language = "mvi"}
aliases["Minna-jima"] = "Minna"
aliases["Minnajima"] = "Minna"
aliases["Minna Island"] = "Minna"

labels["Ōgami"] = {plain_categories = {"Ōgami Miyako"}, language = "mvi"}
aliases["Ōgamijima"] = "Ōgami"
aliases["Ōgami-jima"] = "Ōgami"
aliases["Ōgami Island"] = "Ōgami"
aliases["Ogami"] = "Ōgami"
aliases["Ogamijima"] = "Ōgami"
aliases["Ogami-jima"] = "Ōgami"
aliases["Ogami Island"] = "Ōgami"

labels["Tarama"] = {plain_categories = {"Tarama Miyako"}, language = "mvi"}

labels["Yonaha"] = {plain_categories = {"Yonaha Miyako"}, language = "mvi"}
-- mvi end

labels["Mandalay"] = {Wikipedia = "Burmese language#Irrawaddy River valley", plain_categories = {"Mandalay Burmese"}, language = "my"}

-- N 

-- nai-bvy start
labels["Hometwoli"] = {plain_categories = {"Hometwoli Yokuts"}, language = "nai-bvy"}

labels["Tulamni"] = {plain_categories = {"Tulamni Yokuts"}, language = "nai-bvy"}
aliases["Tulamne"] = "Tulamni"
-- nai-bvy end

-- nai-dly start
labels["Chulamni"] = {plain_categories = {"Chulamni Yokuts"}, language = "nai-dly"}
aliases["Yachikumne"] = "Chulamni"
aliases["Yachikumni"] = "Chulamni"

labels["Lakisamni"] = {plain_categories = {"Lakisamni Yokuts"}, language = "nai-dly"}

labels["Tawalimni"] = {plain_categories = {"Tawalimni Yokuts"}, language = "nai-dly"}
-- nai-dly end

-- nai-kry start
labels["Choinimni"] = {plain_categories = {"Choinimni Yokuts"}, language = "nai-kry"}
aliases["Choynimni"] = "Choinimni"

labels["Chukaimina"] = {plain_categories = {"Chukaimina Yokuts"}, language = "nai-kry"}
aliases["Chukaymina"] = "Chukaimina"

labels["Kocheyali"] = {plain_categories = {"Kocheyali Yokuts"}, language = "nai-kry"}
aliases["Ayitcha"] = "Kocheyali"
aliases["Ayticha"] = "Kocheyali"

labels["Michahay"] = {plain_categories = {"Michahay Yokuts"}, language = "nai-kry"}
-- nai-kry end

-- nai-nvy start
labels["Chawchila"] = {plain_categories = {"Chawchila Yokuts"}, language = "nai-nvy"}

labels["Chukchansi"] = {plain_categories = {"Chukchansi Yokuts"}, language = "nai-nvy"}

labels["Dumna"] = {plain_categories = {"Dumna Yokuts"}, language = "nai-nvy"}

labels["Kechayi"] = {plain_categories = {"Kechayi Yokuts"}, language = "nai-nvy"}

labels["Noptinte"] = {plain_categories = {"Noptinte Yokuts"}, language = "nai-nvy"}
aliases["Nopṭinṭe"] = "Noptinte"
aliases["Nopthrinthre"] = "Noptinte"
aliases["Nopchinchi"] = "Noptinte"
-- nai-nvy end

-- nai-svy start
labels["Choinok"] = {plain_categories = {"Choinok Yokuts"}, language = "nai-svy"}
aliases["Choynok"] = "Choinok"

labels["Koyeti"] = {plain_categories = {"Koyeti Yokuts"}, language = "nai-svy"}

labels["Tachi"] = {plain_categories = {"Tachi Yokuts"}, language = "nai-svy"}

labels["Wechihit"] = {plain_categories = {"Wechihit Yokuts"}, language = "nai-svy"}

labels["Wo'lasi"] = {plain_categories = {"Wo'lasi Yokuts"}, language = "nai-svy"}

labels["Yawelmani"] = {plain_categories = {"Yawelmani Yokuts"}, language = "nai-svy"}
-- nai-svy end

-- nai-tky start
labels["Wukchumni"] = {plain_categories = {"Wukchumni Yokuts"}, language = "nai-tky"}
aliases["Wukchamni"] = "Wukchumni"
aliases["Wikchamni"] = "Wukchumni"

labels["Yawdanchi"] = {plain_categories = {"Yawdanchi Yokuts"}, language = "nai-tky"}
-- nai-tky end

labels["Bokmål"] = {Wikipedia = true, plain_categories = {"Norwegian Bokmål"}, language = "nb"}

-- nds-de start
labels["East Frisian"] = {Wikipedia = "East Frisian Low Saxon", plain_categories = {"East Frisian Low German"}, language = "nds-de"} -- for East Frisian dialectal German Low German, not the Frisian language

labels["Hamburgisch"] = {Wikipedia = "Hamburgisch dialect", plain_categories = {"Hamburg Low German"}, language = "nds-de"}
aliases["Hamburg"] = "Hamburgisch"

labels["Holstein"] = {Wikipedia = true, plain_categories = {"Holstein Low German"}, language = "nds-de"}
aliases["Holsteinisch"] = "Holstein"

labels["Low Prussian"] = {Wikipedia = "Low Prussian dialect", plain_categories = {"Low Prussian Low German"}, language = "nds-de"}

labels["Märkisch"] = {Wikipedia = "Brandenburgisch dialect", plain_categories = {"Märkisch Low German"}, language = "nds-de"}

labels["Mecklenburg Low German"] = {display = "Mecklenburgisch", Wikipedia = "Mecklenburgisch dialect", plain_categories = {"Mecklenburg Low German"}, language = "nds-de"}
aliases["Mecklenburgisch Low German"] = "Mecklenburg Low German"
aliases["Mecklenburgisch"] = "Mecklenburg Low German"
aliases["Mecklenburg"] = "Mecklenburg Low German"
aliases["Mecklenburgish"] = "Mecklenburg Low German"

labels["Münsterland"] = {Wikipedia = true, plain_categories = {"Münsterland Low German"}, language = "nds-de"}
aliases["Münster"] = "Münsterland"
aliases["Münsterländisch"] = "Münsterland"

labels["Oldenburg"] = {Wikipedia = true, plain_categories = {"Oldenburg Low German"}, language = "nds-de"}
aliases["Bremen"] = "Oldenburg"
aliases["Breemsch"] = "Oldenburg"
aliases["Ollnborg"] = "Oldenburg"

labels["Pomeranian Low German"] = {display = "Pomeranian", Wikipedia = true, plain_categories = {"Pomeranian Low German"}, language = "nds-de"}
aliases["Pomeranian LG"] = "Pomeranian Low German"

labels["Schleswig"] = {Wikipedia = true, plain_categories = {"Schleswig Low German"}, language = "nds-de"}
aliases["Schleswigsch"] = "Schleswig"

labels["Western Pomeranian Low German"] = {display = "Western Pomeranian", plain_categories = {"Western Pomeranian Low German"}, language = "nds-de"}
aliases["West Pomeranian Low German"] = "Western Pomeranian Low German"
aliases["Western Pomeranian LG"] = "Western Pomeranian Low German"
aliases["West Pomeranian LG"] = "Western Pomeranian Low German"

labels["Westphalian"] = {Wikipedia = "Westphalian language", plain_categories = {"Westphalian Low German"}, language = "nds-de"}
aliases["Westphalia"] = "Westphalian"
-- nds-de end

-- nds-nl start
labels["Achterhoeks"] = {Wikipedia = true, plain_categories = {"Achterhoeks Low Saxon"}, language = "nds-nl"}
aliases["Achterhooks"] = "Achterhoeks"
aliases["Achterhoek"] = "Achterhoeks"

labels["Drents"] = {Wikipedia = true, plain_categories = {"Drents Low Saxon"}, language = "nds-nl"}
aliases["Drèents"] = "Drents"
aliases["Drenthe"] = "Drents"

labels["Gronings"] = {Wikipedia = true, plain_categories = {"Gronings Low Saxon"}, language = "nds-nl"}
aliases["Grunnegs"] = "Gronings"
aliases["Grönnegs"] = "Gronings"
aliases["Groningen"] = "Gronings"

labels["Sallands"] = {Wikipedia = true, plain_categories = {"Sallands Low Saxon"}, language = "nds-nl"}
aliases["Sallaans"] = "Sallands"
aliases["Salland"] = "Sallands"

labels["Stellingwerfs"] = {Wikipedia = true, plain_categories = {"Stellingwerfs Low Saxon"}, language = "nds-nl"}
aliases["Stellingwarfs"] = "Stellingwarfs"
aliases["Stellingwerf"] = "Stellingwerfs"

labels["Twents"] = {Wikipedia = true, plain_categories = {"Twents Low Saxon"}, language = "nds-nl"}
aliases["Tweants"] = "Twents"
aliases["Twente"] = "Twents"

labels["Veluws"] = {Wikipedia = true, plain_categories = {"Veluws Low Saxon"}, language = "nds-nl"}
aliases["Veluwe"] = "Veluws"
-- nds-nl end

-- nhx start
labels["Mecayapan"] = {plain_categories = {"Mecayapan Nahuatl proper"}, language = "nhx"}

labels["Tatahuicapan"] = {plain_categories = {"Tatahuicapan Nahuatl"}, language = "nhx"}
-- nhx end

-- nl start
labels["East and West Flanders"] = {display = "[[w:East Flanders|East]] and [[w:West Flanders|West Flanders]]", plain_categories = {"East and West Flemish Dutch"}, language = "nl"}
aliases["Flanders"] = "East and West Flanders"
aliases["Flemish"] = "East and West Flanders"

labels["Northern Dutch"] = {display = "Northern", Wikipedia = "Dutch dialects", plain_categories = {"Northern Dutch"}, language = "nl"}

labels["Southern Dutch"] = {display = "Southern", Wikipedia = "Dutch dialects", plain_categories = {"Southern Dutch"}, language = "nl"}
-- nl end

labels["Nynorsk"] = {plain_categories = {"Norwegian Nynorsk"}, language = "nn"}

-- non start
labels["Old East Norse"] = {Wikipedia = true, plain_categories = {"Old East Norse"}, language = "non"}
aliases["East Norse"] = "Old East Norse"

labels["Old Gutnish"] = {Wikipedia = true, plain_categories = {"Old Gutnish"}, language = "non"}
aliases["Old Gotlandic"] = "Old Gutnish"

labels["Old West Norse"] = {Wikipedia = true, plain_categories = {"Old West Norse"}, language = "non"}
aliases["West Norse"] = "Old West Norse"
-- non end

labels["Sark"] = {Wikipedia = "Sercquiais", plain_categories = {"Sarkese Norman"}, language = "nrf"}
aliases["Sarkese"] = "Sark"
aliases["Sercquiais"] = "Sark"

-- O 
-- oc start
labels["Auvergne"] = {Wikipedia = "Auvergnat", plain_categories = {"Auvergnat"}, language = "oc"}
aliases["Auvergnat"] = "Auvergne"
aliases["Auvernhat"] = "Auvergne"

labels["Gascony"] = {Wikipedia = "Gascon language", plain_categories = {"Gascon"}, language = "oc"}
aliases["Gascon"] = "Gascony"

labels["Guardiol"] = {Wikipedia = "Guardia Piemontese", plain_categories = {"Guardiol"}, language = "oc"}

labels["Languedoc"] = {Wikipedia = "Languedocien dialect", plain_categories = {"Languedocien"}, language = "oc"}
aliases["Languedocian"] = "Languedoc"
aliases["Languedocien"] = "Languedoc"

labels["Limousin"] = {Wikipedia = "Limousin dialect", plain_categories = {"Limousin"}, language = "oc"}
aliases["Lemosin"] = "Limousin"

labels["Mistralian"] = {Wikipedia = "Occitan language#Writing system", plain_categories = {"Mistralian Occitan"}, language = "oc"}

labels["Provençal"] = {Wikipedia = "Provençal dialect", plain_categories = {"Provençal"}, language = "oc"}
aliases["Provencal"] = "Provençal"
-- don't add Provence as an alias

labels["Vivaro-Alpine"] = {Wikipedia = "Vivaro-Alpine dialect", plain_categories = {"Vivaro-Alpine"}, language = "oc"}
-- oc end

-- oko start
labels["Balhae"] = {plain_categories = {"Balhae Old Korean"}, language = "oko"}

labels["Silla"] = {plain_categories = {"Silla Old Korean"}, language = "oko"}
-- oko end

-- onb start
labels["Bolian"] = {Wikipedia = "zh:波蓮鎮", plain_categories = {"Bolian Lingao"}, language = "onb"}

labels["Lincheng"] = {Wikipedia = "zh:臨城鎮 (臨高縣)", plain_categories = {"Lincheng Lingao"}, language = "onb"}

labels["Longtang"] = {Wikipedia = "zh:龍塘鎮 (海口市)", plain_categories = {"Longtang Lingao"}, language = "onb"}
-- onb end

-- os start
labels["Digor"] = {Wikipedia = "Digor Ossetian", plain_categories = {"Digor Ossetian"}, language = "os"}
aliases["Digor dialect"] = "Digor"

labels["Iron"] = {Wikipedia = "Iron Ossetian", plain_categories = {"Iron Ossetian"}, language = "os"}
aliases["Iron dialect"] = "Iron"
-- os end

-- P 
labels["Skiri Pawnee"] = {plain_categories = {"Skiri Pawnee"}, language = "paw"}

-- pl start
labels["Białystok"] = {Wikipedia = true, plain_categories = {"Białystok Polish"}, language = "pl"}
aliases["Bialystok"] = "Białystok"

labels["Cieszyn Silesia"] = {Wikipedia = true, plain_categories = {"Cieszyn Silesia Polish"}, language = "pl"}
aliases["Cieszyn Silesian"] = "Cieszyn Silesia"

labels["Góral"] = {Wikipedia = true, plain_categories = {"Góral Polish"}, language = "pl"}
aliases["Goral"] = "Góral"

labels["Greater Poland"] = {Wikipedia = true, plain_categories = {"Greater Poland Polish"}, language = "pl"}
aliases["Wielkopolska"] = "Greater Poland"

labels["Kraków"] = {Wikipedia = true, plain_categories = {"Kraków Polish"}, language = "pl"}
aliases["Krakow"] = "Kraków"
aliases["Cracow"] = "Kraków"

labels["Kresy"] = {Wikipedia = true, plain_categories = {"Kresy Polish"}, language = "pl"}

labels["Kujawy"] = {Wikipedia = true, plain_categories = {"Kujawy Polish"}, language = "pl"}
aliases["Kuyavia"] = "Kujawy"
aliases["Cuyavia"] = "Kujawy"

labels["Łódź"] = {Wikipedia = true, plain_categories = {"Łódź Polish"}, language = "pl"}
aliases["Lodz"] = "Łódź"

labels["Łowicz"] = {Wikipedia = true, plain_categories = {"Łowicz Polish"}, language = "pl"}
aliases["Lowicz"] = "Łowicz"

labels["Masuria"] = {Wikipedia = true, plain_categories = {"Masuria Polish"}, language = "pl"}
aliases["Mazury"] = "Masuria"

labels["Poznań"] = {Wikipedia = true, plain_categories = {"Poznań Polish"}, language = "pl"}
aliases["Poznan"] = "Poznań"

labels["Upper Silesia"] = {Wikipedia = true, plain_categories = {"Upper Silesia Polish"}, language = "pl"}

labels["Warmia"] = {Wikipedia = true, plain_categories = {"Warmia Polish"}, language = "pl"}

labels["Warsaw"] = {Wikipedia = true, plain_categories = {"Warsaw Polish"}, language = "pl"}

labels["Zaolzie"] = {Wikipedia = true, plain_categories = {"Zaolzie Polish"}, language = "pl"}
-- pl end

labels["Western Malayo-Polynesian"] = {Wikipedia = "Western Malayo-Polynesian languages", plain_categories = {"Western Proto-Malayo-Polynesian"}, language = "poz-pro"}

labels["Beira"] = {Wikipedia = "Beira (Portugal)", plain_categories = {"Beirão Portuguese"}, language = "pt"}

labels["Trás-os-Montes"] = {Wikipedia = true, plain_categories = {"Transmontane Portuguese"}, language = "pt"}

-- Q 
labels["Kichwa"] = {display = "Standard Ecuadorian Kichwa", Wikipedia = "Kichwa language", plain_categories = {"Standard Kichwa"}, language = "qu"}

-- qwm start
labels["Armeno-Kipchak"] = {Wikipedia = "Kipchaks#Language", plain_categories = {"Armeno-Kipchak"}, language = "qwm"}
aliases["Armenian Kipchak"] = "Armeno-Kipchak"

labels["Mamluk-Kipchak"] = {Wikipedia = "Kipchaks#Language", plain_categories = {"Mamluk-Kipchak"}, language = "qwm"}
aliases["Mamluk"] = "Mamluk-Kipchak"
-- qwm end

-- R 
-- rm start
labels["Puter"] = {Wikipedia = "Putèr", plain_categories = {"Puter Romansch"}, language = "rm"}

labels["Rumantsch Grischun"] = {Wikipedia = true, language = "rm"}

labels["Surmiran"] = {Wikipedia = "Surmiran dialect", plain_categories = {"Surmiran Romansch"}, language = "rm"}

labels["Sursilvan"] = {Wikipedia = "Sursilvan dialects (Romansh)", plain_categories = {"Sursilvan Romansch"}, language = "rm"}

labels["Sutsilvan"] = {Wikipedia = "Sutsilvan", plain_categories = {"Sutsilvan Romansch"}, language = "rm"}

labels["Vallader"] = {Wikipedia = "Vallader dialect (Romansh)", plain_categories = {"Vallader Romansch"}, language = "rm"}
-- rm end

-- rmc start
labels["Burgenland"] = {plain_categories = {"Burgenland Romani"}, language = "rmc"}

labels["East Slovakia"] = {plain_categories = {"East Slovak Romani"}, language = "rmc"}

labels["Gurvari"] = {plain_categories = {"Gurvari Romani"}, language = "rmc"}

labels["Hungarian Vend"] = {plain_categories = {"Hungarian Vend Romani"}, language = "rmc"}

labels["Prekmurski"] = {plain_categories = {"Prekmurski Romani"}, language = "rmc"}

labels["Romungro"] = {plain_categories = {"Romungro Romani"}, language = "rmc"}

labels["Veršend"] = {plain_categories = {"Veršend Romani"}, language = "rmc"}
-- rmc end

-- rml begin

labels["North Russia"] = {plain_categories = {"North Russian Romani"}, language = "rml"}
aliases["Xaladitka"] = "North Russia"
-- rml end

-- rmn start
labels["Bugurdži"] = {plain_categories = {"Bugurdži Romani"}, language = "rmn"}

labels["Crimean Romani"] = {display = "Crimea", plain_categories = {"Crimean Romani"}, language = "rmn"}

labels["Kosovo Arli"] = {plain_categories = {"Kosovo Arli Romani"}, language = "rmn"}

labels["Macedonian Arli"] = {plain_categories = {"Macedonian Arli Romani"}, language = "rmn"}

labels["Sepečides"] = {plain_categories = {"Sepečides Romani"}, language = "rmn"}

labels["Sofia Erli"] = {plain_categories = {"Sofia Erli Romani"}, language = "rmn"}

labels["Ursari"] = {plain_categories = {"Ursari Romani"}, language = "rmn"}
-- rmn end

-- rmy start
labels["Banatiski Gurbet"] = {plain_categories = {"Banatiski Gurbet Romani"}, language = "rmy"}

labels["Gurbet"] = {plain_categories = {"Gurbet Romani"}, language = "rmy"}

labels["Kalderaš"] = {plain_categories = {"Kalderaš Romani"}, language = "rmy"}

labels["Lovara"] = {plain_categories = {"Lovara Romani"}, language = "rmy"}

labels["Macedonian Džambazi"] = {plain_categories = {"Macedonian Džambazi Romani"}, language = "rmy"}

labels["Sremski Gurbet"] = {plain_categories = {"Sremski Gurbet Romani"}, language = "rmy"}
-- rmy end

-- rom start
labels["Anglicized"] = {Wikipedia = "Romani alphabets#Anglicised", plain_categories = {"Romani Anglicized spellings"}, language = "rom"}

labels["Dolenjski"] = {plain_categories = {"Dolenjski Romani"}, language = "rom"}

labels["International Standard"] = {Wikipedia = "Romani alphabets#International Standard", plain_categories = {"Romani International Standard spellings"}, language = "rom"}

labels["Pan-Vlax"] = {Wikipedia = "Romani alphabets#Pan-Vlax", plain_categories = {"Romani Pan-Vlax spellings"}, language = "rom"}
-- rom end

-- ru start
labels["Northern Russia"] = {Wikipedia = "Northern Russian dialects", plain_categories = {"Northern Russian"}, language = "ru"}

labels["Southern Russia"] = {Wikipedia = true, plain_categories = {"Southern Russian"}, language = "ru"}
aliases["South of Russia"] = "Southern Russia"
aliases["south of Russia"] = "Southern Russia"
aliases["South Russia"] = "Southern Russia"
aliases["Southern Russian"] = "Southern Russia"
aliases["southern Russia"] = "Southern Russia"
aliases["southern Russian"] = "Southern Russia"

labels["Ukraine"] = {Wikipedia = true, plain_categories = {"Ukrainian Russian"}, language = "ru"}
aliases["Ukrainian"] = "Ukraine"

labels["Belarus"] = {Wikipedia = true, plain_categories = {"Belarusian Russian"}, language = "ru"}
aliases["Belarusian"] = "Belarus"
-- ru end

labels["Pannonia"] = {Wikipedia = "Pannonian Rusyn", plain_categories = {"Pannonian Rusyn"}, language = "rue"}
aliases["Pannonian"] = "Panonnia"

-- rw start
labels["Kinyarwanda"] = {plain_categories = {"Kinyarwanda"}, language = "rw"}

labels["Kirundi"] = {plain_categories = {"Kirundi"}, language = "rw"}

labels["Giha"] = {plain_categories = {"Giha"}, language = "rw"}
-- rw end

-- rys start
labels["Aragusuku"] = {plain_categories = {"Aragusuku Yaeyama"}, language = "rys"}

labels["Hateruma"] = {Wikipedia = "Yaeyama language#Hateruma", plain_categories = {"Hateruma Yaeyama"}, language = "rys"}
labels["Hatoma"] = {Wikipedia = "Yaeyama language#Hatoma", plain_categories = {"Hatoma Yaeyama"}, language = "rys"}

labels["Kuroshima"] = {plain_categories = {"Kuroshima Yaeyama"}, language = "rys"}

labels["Miraya"] = {Wikipedia = "Yaeyama language#Miraya", plain_categories = {"Miraya Yaeyama"}, language = "rys"}
-- rys end

-- ryu start
labels["Naha"] = {plain_categories = {"Naha Okinawan"}, language = "ryu"}

labels["Shuri"] = {plain_categories = {"Shuri Okinawan"}, language = "ryu"}
-- ryu end

-- S 
-- sa start
labels["Buddhist Hybrid Sanskrit"] = {Wikipedia = true, plain_categories = {"Buddhist Hybrid Sanskrit"}, language = "sa"}
aliases["BHS"] = "Buddhist Hybrid Sanskrit"

labels["Epigraphic Sanskrit"] = {Wikipedia = "Epigraphy", plain_categories = {"Epigraphic Sanskrit"}, language = "sa"}

labels["New Sanskrit"] = {Wikipedia = "Sanskrit Revival", plain_categories = {"New Sanskrit"}, language = "sa"}
aliases["Neo-Sanskrit"] = "New Sanskrit"

labels["Later Sanskrit"] = {display = "[[later|Later]] [[Sanskrit]]", plain_categories = {"Later Sanskrit"}, language = "sa"}
aliases["Later-Sanskrit"] = "Later Sanskrit"
aliases["Later"] = "Later Sanskrit"
aliases["later"] = "Later Sanskrit"
aliases["later Sanskrit"] = "Later Sanskrit"
aliases["later-Sanskrit"] = "Later Sanskrit"

labels["Vedic"] = {Wikipedia = "Vedic Sanskrit", plain_categories = {"Vedic Sanskrit"}, language = "sa"}

labels["Rigvedic"] = {Wikipedia = "Rigvedic Sanskrit", plain_categories = {"Rigvedic Sanskrit"}, language = "sa"}
-- sa end

-- sc start
labels["Campidanese"] = {Wikipedia = true, plain_categories = {"Campidanese"}, language = "sc"}

labels["Logudorese"] = {Wikipedia = true, plain_categories = {"Logudorese"}, language = "sc"}
-- sc end

-- scl start
labels["Drasi"] = {Wikipedia = "Dras", plain_categories = {"Dras Shina"}, language = "scl"}

labels["Gilgiti"] = {Wikipedia = "Gilgit", plain_categories = {"Gilgit Shina"}, language = "scl"}
-- scl end

-- sco start
labels["Border Scots"] = {plain_categories = {"Border Scots"}, language = "sco"}

labels["Central Scots"] = {display = "[[w:Central Scots|Central]]", plain_categories = {"Central Scots"}, language = "sco"}

labels["Doric Scots"] = {display = "[[w:Doric dialect (Scotland)|Doric]]", plain_categories = {"Doric Scots"}, language = "sco"}

labels["East Central Scots"] = {display = "East [[w:Central Scots|Central]]", plain_categories = {"East Central Scots"}, language = "sco"}
aliases["EC Scots"] = "East Central Scots"

labels["Lowlands Scots"] = {plain_categories = {"Lowlands Scots"}, language = "sco"}

labels["Middle Scots"] = {Wikipedia = true, plain_categories = {"Middle Scots"}, language = "sco"}

labels["North Northern Scots"] = {display = "[[w:North Northern Scots|North Northern]]", plain_categories = {"North Northern Scots"}, language = "sco"}
aliases["NN Scots"] = "North Northern Scots"

labels["Northeast Central Scots"] = {display = "Northeast [[w:Central Scots|Central]]", plain_categories = {"Northeast Central Scots"}, language = "sco"}
aliases["NEC Scots"] = "Northeast Central Scots"

labels["Northern Scots"] = {display = "[[w:Northern Scots|Northern]]", plain_categories = {"Northern Scots"}, language = "sco"}
aliases["North Scots"] = "Northern Scots"

labels["South Northern Scots"] = {display = "South [[w:Northern Scots|Northern]]", plain_categories = {"South Northern Scots"}, language = "sco"}
aliases["SN Scots"] = "South Northern Scots"

labels["South Scots"] = {Wikipedia = "Southern Scots", plain_categories = {"South Scots"}, language = "sco"}
aliases["Southern Scots"] = "South Scots"

labels["Southeast Central Scots"] = {display = "Southeast [[w:Central Scots|Central]]", plain_categories = {"Southeast Central Scots"}, language = "sco"}
aliases["SEC Scots"] = "Southeast Central Scots"

labels["Southwest Central Scots"] = {display = "Southwest [[w:Central Scots|Central]]", plain_categories = {"Southwest Central Scots"}, language = "sco"}
aliases["SWC Scots"] = "Southwest Central Scots"

labels["Ulster Scots"] = {Wikipedia = "Ulster Scots dialects", plain_categories = {"Ulster Scots"}, language = "sco"}
aliases["Ullans"] = "Ulster Scots"

labels["West Central Scots"] = {display = "West [[w:Central Scots|Central]]", plain_categories = {"West Central Scots"}, language = "sco"}
aliases["WC Scots"] = "West Central Scots"
-- sco end

-- sh start
labels["Chakavian"] = {display = "[[Chakavian]]", plain_categories = {"Chakavian Serbo-Croatian"}, language = "sh"}
aliases["Čakavian"] = "Chakavian"

labels["Ekavian"] = {display = "[[Ekavian]]", language = "sh"}

labels["Ikavian"] = {display = "[[Ikavian]]", plain_categories = {"Ikavian Serbo-Croatian"}, language = "sh"}

labels["Kajkavian"] = {display = "[[Kajkavian]]", plain_categories = {"Kajkavian Serbo-Croatian"}, language = "sh"}

labels["Torlakian"] = {Wikipedia = "Torlakian dialect", plain_categories = {"Torlakian Serbo-Croatian"}, language = "sh"}
-- sh end

labels["Western Samic"] = {plain_categories = {"Western Proto-Samic"}, language = "smi-pro"}

-- sq start
labels["Arbëresh"] = {Wikipedia = "Arbëresh", plain_categories = {"Arbëresh Albanian"}, language = "sq"}
aliases["Arbëreshë"] = "Arbëresh"
aliases["Arbërisht"] = "Arbëresh"

labels["Arvanitika"] = {Wikipedia = "Arvanitika", plain_categories = {"Arvanitika Albanian"}, language = "sq"}

labels["Cham Albanian"] = {display = "Cham", Wikipedia = "Cham Albanian dialect", plain_categories = {"Cham Albanian"}, language = "sq"}
aliases["Cham"] = "Cham Albanian"

labels["Gheg"] = {Wikipedia = "Gheg Albanian", plain_categories = {"Gheg Albanian"}, language = "sq"}

labels["Tosk"] = {Wikipedia = "Tosk Albanian", plain_categories = {"Tosk Albanian"}, language = "sq"}
-- sq end

-- sn start
labels["Karanga"] = {Wikipedia = "Shona language#Dialects", plain_categories = {"Karanga Shona"}, language = "sn"}

labels["Korekore"] = {Wikipedia = "Shona language#Dialects", plain_categories = {"Korekore Shona"}, language = "sn"}

labels["Manyika"] = {Wikipedia = "Manyika dialect", plain_categories = {"Manyika Shona"}, language = "sn"}

labels["Zezuru"] = {Wikipedia = "Shona language#Dialects", plain_categories = {"Zezuru Shona"}, language = "sn"}
-- sn end

labels["Southern Sweden"] = {display = "[[w:South Swedish dialects|Southern]]", plain_categories = {"Southern Swedish"}, language = "sv"}
aliases["southern Sweden"] = "Southern Sweden"
aliases["Southern Swedish"] = "Southern Sweden"
aliases["southern Swedish"] = "Southern Sweden"
aliases["South Sweden"] = "Southern Sweden"
aliases["south Sweden"] = "Southern Sweden"
aliases["South Swedish"] = "Southern Sweden"
aliases["south Swedish"] = "Southern Sweden"

-- T 
-- ta start
labels["Brahmin Tamil"] = {Wikipedia = "Brahmin Tamil", plain_categories = {"Brahmin Tamil"}, language = "ta"}
aliases["Brahmin"] = "Brahmin Tamil"

labels["Tamil Nadu"] = {Wikipedia = "Tamil Nadu", plain_categories = {"Tamil Nadu Tamil"}, language = "ta"}
-- ta end
-- te start
labels["Andhra Pradesh"] = {Wikipedia = "Andhra Pradesh", plain_categories = {"Andhra Telugu"}, language = "te"}
aliases["Andhra"] = "Andhra Pradesh"
aliases["Andhra Telugu"] = "Andhra Pradesh"

labels["Chittoor"] = {Wikipedia = "Chittoor district", plain_categories = {"Chittoor Telugu"}, language = "te"}
aliases["Chitoor"] = "Chittoor"

labels["Coastal Andhra"] = {Wikipedia = "Coastal Andhra", plain_categories = {"Coastal Andhra Telugu"}, language = "te"}
aliases["Coastal"] = "Coastal Andhra"
aliases["Kosta"] = "Coastal Andhra"
aliases["Tirandhra"] = "Coastal Andhra"
aliases["Tira Andhra"] = "Coastal Andhra"

labels["Kurnool"] = {Wikipedia = "Kurnool district", plain_categories = {"Coastal Andhra Telugu"}, language = "te"}

labels["Mahabubnagar"] = {Wikipedia = "Mahabub Nagar district", plain_categories = {"Telangana Telugu"}, language = "te"}
aliases["Mahabub Nagar"] = "Mahabubnagar"
aliases["Mahbubnagar"] = "Mahabubnagar"
aliases["Mahboobnagar"] = "Mahabubnagar"

labels["North Andhra"] = {Wikipedia = "Uttarandhra", plain_categories = {"North Andhra Telugu"}, language = "te"}
aliases["Uttarandhra"] = "North Andhra"
aliases["Uttarandhra Telugu"] = "North Andhra"
aliases["Kalingandhra"] = "North Andhra"
aliases["Kalingandhra Telugu"] = "North Andhra"
aliases["Kalinga Andhra"] = "North Andhra"
aliases["Kalinga Andhra Telugu"] = "North Andhra"

labels["Rayalaseema"] = {Wikipedia = "Rayalaseema", plain_categories = {"Rayalaseema Telugu"}, language = "te"}
aliases["Seema"] = "Rayalaseema"
aliases["Seema Telugu"] = "Rayalaseema"

labels["South Coastal Andhra"] = {Wikipedia = "Coastal Andhra", plain_categories = {"South Coastal Andhra Telugu"}, language = "te"}
aliases["Dakshina Andhra"] = "South Coastal Andhra"
aliases["South Andhra"] = "South Coastal Andhra"
aliases["South Coastal"] = "South Coastal Andhra"

labels["Telangana"] = {Wikipedia = "Telangana Baasha", plain_categories = {"Telangana Telugu"}, language = "te"}
aliases["Telangana Telugu"] = "Telangana"
-- te end

labels["Royal Thai"] = {display = "royal", plain_categories = {"Thai royal vocabulary"}, language = "th"}

labels["Batangas"] = {Wikipedia = "Batangas Tagalog", plain_categories = {"Batangas Tagalog"}, language = "tl"}
aliases["Batangas Tagalog"] = "Batangas"
aliases["Batangueño"] = "Batangas"

labels["Common Turkic"] = {Wikipedia = "Common Turkic languages", plain_categories = {"Common Turkic"}, language = "trk-pro"}

-- U 

-- V 
-- vi start
labels["Bình Định"] = {Wikipedia = true, plain_categories = {"Southern Vietnamese"}, language = "vi"}
aliases["Binh Dinh"] = "Bình Định"
aliases["Bình Định dialect"] = "Bình Định"
aliases["Binh Dinh dialect"] = "Bình Định"

labels["Central Vietnam"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["central Vietnam"] = "Central Vietnam"
aliases["central Vietnamese"] = "Central Vietnam"
aliases["Central Vietnamese"] = "Central Vietnam"

labels["Fangcheng"] = {Wikipedia = "Gin people", plain_categories = {"Fangcheng Vietnamese"}, language = "vi"}

labels["Hải Phòng"] = {Wikipedia = true, plain_categories = {"Northern Vietnamese"}, language = "vi"}
aliases["Hai Phong"] = "Hải Phòng"
aliases["Haiphong"] = "Hải Phòng"
aliases["Hải Phòng dialect"] = "Hải Phòng"
aliases["Hai Phong dialect"] = "Hải Phòng"

labels["Hà Tĩnh"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["Ha Tinh"] = "Hà Tĩnh"
aliases["Hà Tĩnh dialect"] = "Hà Tĩnh"
aliases["Ha Tinh dialect"] = "Hà Tĩnh"

labels["Huế"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["Hue"] = "Huế"
aliases["Huế dialect"] = "Huế"
aliases["Hue dialect"] = "Huế"

labels["Mekong Delta"] = {Wikipedia = true, plain_categories = {"Southern Vietnamese"}, language = "vi"}
aliases["Mekong Delta dialect"] = "Mekong Delta"

labels["Nghệ An"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["Nghe An"] = "Nghệ An"
aliases["Nghệ An dialect"] = "Nghệ An"
aliases["Nghe An dialect"] = "Nghệ An"

labels["Nghệ Tĩnh"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["Nghe Tinh"] = "Nghệ Tĩnh"
aliases["Nghệ Tinh dialect"] = "Nghệ Tĩnh"
aliases["Nghe Tinh dialect"] = "Nghệ Tĩnh"

labels["North Central Vietnam"] = {Wikipedia = "North Central Coast", plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["North-Central Vietnam"] = "North Central Vietnam"

labels["Northern Vietnam"] = {Wikipedia = true, plain_categories = {"Northern Vietnamese"}, language = "vi"}
aliases["north Vietnam"] = "Northern Vietnam"
aliases["North Vietnam"] = "Northern Vietnam"
aliases["north Vietnamese"] = "Northern Vietnam"
aliases["North Vietnamese"] = "Northern Vietnam"
aliases["northern Vietnam"] = "Northern Vietnam"
aliases["northern Vietnamese"] = "Northern Vietnam"
aliases["Northern Vietnamese"] = "Northern Vietnam"

labels["Overseas Vietnamese"] = {Wikipedia = true, plain_categories = {"Overseas Vietnamese"}, language = "vi"}
aliases["overseas Vietnamese"] = "Overseas Vietnamese"

labels["Phú Yên"] = {Wikipedia = true, plain_categories = {"Southern Vietnamese"}, language = "vi"}
aliases["Phu Yen"] = "Phú Yên"
aliases["Phú Yên dialect"] = "Phú Yên"
aliases["Phu Yen dialect"] = "Phú Yên"

labels["Quảng Bình"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["Quang Binh"] = "Quảng Bình"
aliases["Quảng Bình dialect"] = "Quảng Bình"
aliases["Quang Binh dialect"] = "Quảng Bình"

labels["Quảng Nam"] = {Wikipedia = true, plain_categories = {"Southern Vietnamese"}, language = "vi"}
aliases["Quang Nam"] = "Quảng Nam"
aliases["Quảng Nam dialect"] = "Quảng Nam"
aliases["Quang Nam dialect"] = "Quảng Nam"

labels["Quảng Ngãi"] = {Wikipedia = true, plain_categories = {"Southern Vietnamese"}, language = "vi"}
aliases["Quang Ngai"] = "Quảng Ngãi"
aliases["Quảng Ngãi dialect"] = "Quảng Ngãi"
aliases["Quang Ngai dialect"] = "Quảng Ngãi"

labels["Quảng Trị"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["Quang Tri"] = "Quảng Trị"
aliases["Quảng Trị dialect"] = "Quảng Trị"
aliases["Quang Tri dialect"] = "Quảng Trị"

labels["Saigon"] = {Wikipedia = true, plain_categories = {"Saigon Vietnamese"}, language = "vi"}
aliases["Saigonese"] = "Saigon"

labels["Southern Vietnam"] = {Wikipedia = true, plain_categories = {"Southern Vietnamese"}, language = "vi"}
aliases["south Vietnam"] = "Southern Vietnam"
aliases["South Vietnam"] = "Southern Vietnam"
aliases["south Vietnamese"] = "Southern Vietnam"
aliases["South Vietnamese"] = "Southern Vietnam"
aliases["southern Vietnam"] = "Southern Vietnam"
aliases["southern Vietnamese"] = "Southern Vietnam"
aliases["Southern Vietnamese"] = "Southern Vietnam"

labels["Thanh Hoá"] = {Wikipedia = true, plain_categories = {"Central Vietnamese"}, language = "vi"}
aliases["Thanh Hoa"] = "Thanh Hoá"
aliases["Thanh Hoá dialect"] = "Thanh Hoá"
aliases["Thanh Hoa dialect"] = "Thanh Hoá"
-- vi end

-- W 

-- X 

-- xcl start
labels["Hellenizing School"] = {Wikipedia = "Hellenizing School", plain_categories = {"Hellenizing Old Armenian"}, language = "xcl"}
aliases["hellenizing school"] = "Hellenizing School"
aliases["Philhellene School"] = "Hellenizing School"
aliases["philhellene school"] = "Hellenizing School"
aliases["Hellenophile School"] = "Hellenizing School"
aliases["hellenophile school"] = "Hellenizing School"
aliases["Hellenizing"] = "Hellenizing School"
aliases["hellenizing"] = "Hellenizing School"
aliases["Philhellene"] = "Hellenizing School"
aliases["philhellene"] = "Hellenizing School"
aliases["Hellenophile"] = "Hellenizing School"
aliases["hellenophile"] = "Hellenizing School"
aliases["hunaban"] = "Hellenizing School"
aliases["yunaban"] = "Hellenizing School"

-- xcl end

-- xh start

labels["Mpondo"] = {Wikipedia = "Xhosa language#Dialects", plain_categories = {"Mpondo Xhosa"}, language = "xh"}

labels["Mpondomise"] = {Wikipedia = "Xhosa language#Dialects", plain_categories = {"Mpondomise Xhosa"}, language = "xh"}

-- xh end

-- Y 
-- yi start
labels["Daytshmerish"] = {display = "[[דײַטשמעריש|Daytshmerish]]", plain_categories = {"Daytshmerish Yiddish"}, language = "yi"}
aliases["daytshmerish"] = "Daytshmerish"

-- yi end

-- yo start
labels["Ìgbómìnà"] = {Wikipedia = "Igbomina", plain_categories = {"Ìgbómìnà Yoruba"}, language = "yo"}
aliases["Igbomina"] = "Ìgbómìnà"
aliases["igbomina"] = "Ìgbómìnà"
aliases["ìgbómìnà"] = "Ìgbómìnà"
aliases["Ogboona"] = "Ìgbómìnà"
aliases["Igboona"] = "Ìgbómìnà"
aliases["ogboona"] = "Ìgbómìnà"
aliases["igboona"] = "Ìgbómìnà"

-- yo end

-- Z 
-- zh start
labels["Beijing"] = {Wikipedia = "Beijing dialect", plain_categories = {"Beijing Mandarin"}, language = "zh"}
aliases["Peking"] = "Beijing"
aliases["Pekingese"] = "Beijing"
aliases["Beijing Mandarin"] = "Beijing"

labels["Cantonese"] = {Wikipedia = true, plain_categories = {"Cantonese Chinese"}, language = "zh"}

labels["dialectal Cantonese"] = {display = "dialectal [[w:Cantonese|Cantonese]]", plain_categories = {"Cantonese Chinese"}, language = "zh"}

labels["Central Plains Mandarin"] = {Wikipedia = true, plain_categories = {"Central Plains Mandarin"}, language = "zh"}
aliases["Zhongyuan Mandarin"] = "Central Plains Mandarin"

labels["Datian Min"] = {Wikipedia = true, plain_categories = {"Datian Min Chinese"}, language = "zh"}

labels["Dungan"] = {Wikipedia = "Dungan language", plain_categories = {"Dungan Chinese"}, language = "zh"}

labels["Gan"] = {Wikipedia = "Gan Chinese", plain_categories = {"Gan Chinese"}, language = "zh"}

labels["dialectal Gan"] = {display = "dialectal [[w:Gan Chinese|Gan]]", plain_categories = {"Gan Chinese"}, language = "zh"}

labels["Guangxi Mandarin"] = {display = "Guangxi [[w:Southwestern Mandarin|Mandarin]]", plain_categories = {"Guangxi Mandarin"}, language = "zh"}

labels["dialectal Guangxi Mandarin"] = {display = "dialectal Guangxi [[w:Southwestern Mandarin|Mandarin]]", plain_categories = {"Guangxi Mandarin"}, language = "zh"}

labels["Guilin Mandarin"] = {display = "Guilin [[w:Southwestern Mandarin|Mandarin]]", plain_categories = {"Guilin Mandarin"}, language = "zh"}

labels["Hainanese"] = {Wikipedia = "Hainanese", plain_categories = {"Hainanese"}, language = "zh"}
aliases["Hainan Min"] = "Hainanese"
aliases["Hainan Min Chinese"] = "Hainanese"

labels["Hakka"] = {Wikipedia = "Hakka Chinese", plain_categories = {"Hakka Chinese"}, language = "zh"}

labels["dialectal Hakka"] = {display = "dialectal [[w:Hakka Chinese|Hakka]]", plain_categories = {"Hakka Chinese"}, language = "zh"}

labels["Hokkien"] = {Wikipedia = true, plain_categories = {"Hokkien Chinese"}, language = "zh"}

labels["Hong Kong Cantonese"] = {Wikipedia = true, plain_categories = {"Hong Kong Cantonese"}, language = "zh"}

labels["Hong Kong Hakka"] = {display = "Hong Kong [[w:Hakka language|Hakka]]", plain_categories = {"Hong Kong Hakka"}, language = "zh"}

labels["Huizhou"] = {Wikipedia = true, plain_categories = {"Huizhou Chinese"}, language = "zh"}

labels["Jianghuai Mandarin"] = {Wikipedia = "Lower Yangtze Mandarin", plain_categories = {"Mandarin Chinese"}, language = "zh"}
aliases["Jiang-Huai Mandarin"] = "Jianghuai Mandarin"
aliases["Lower Yangtze Mandarin"] = "Jianghuai Mandarin"

labels["Jiaoliao Mandarin"] = {Wikipedia = true, plain_categories = {"Mandarin Chinese"}, language = "zh"}
aliases["Jiao-Liao Mandarin"] = "Jiaoliao Mandarin"

labels["Jilu Mandarin"] = {Wikipedia = true, plain_categories = {"Mandarin Chinese"}, language = "zh"}
aliases["Ji-Lu Mandarin"] = "Jilu Mandarin"

labels["Jin"] = {Wikipedia = "Jin Chinese", plain_categories = {"Jin Chinese"}, language = "zh"}

labels["dialectal Jin"] = {display = "dialectal [[w:Jin Chinese|Jin]]", plain_categories = {"Jin Chinese"}, language = "zh"}

labels["Korean Classical Chinese"] = {Wikipedia = "Chinese-language literature of Korea", plain_categories = {"Korean Classical Chinese"}, language = "zh"}

labels["Lanyin Mandarin"] = {Wikipedia = true, plain_categories = {"Lanyin Mandarin"}, language = "zh"}
aliases["Lan-Yin Mandarin"] = "Lanyin Mandarin"

labels["Leizhou Min"] = {Wikipedia = true, plain_categories = {"Leizhou Min Chinese"}, language = "zh"}

labels["Liuzhou Mandarin"] = {display = "Liuzhou [[w:Southwestern Mandarin|Mandarin]]", plain_categories = {"Liuzhou Mandarin"}, language = "zh"}

labels["Mandarin"] = {Wikipedia = "Mandarin Chinese", plain_categories = {"Mandarin Chinese"}, language = "zh"}

labels["dialectal Mandarin"] = {display = "dialectal [[w:Mandarin Chinese|Mandarin]]", plain_categories = {"Mandarin Chinese"}, language = "zh"}

labels["Min"] = {Wikipedia = "Min Chinese", plain_categories = {"Min Chinese"}, language = "zh"}

labels["Min Bei"] = {Wikipedia = true, plain_categories = {"Min Bei Chinese"}, language = "zh"}

labels["Min Dong"] = {Wikipedia = true, plain_categories = {"Min Dong Chinese"}, language = "zh"}

labels["dialectal Min Dong"] = {display = "dialectal [[w:Min Dong|Min Dong]]", plain_categories = {"Min Dong Chinese"}, language = "zh"}

labels["Min Nan"] = {Wikipedia = true, plain_categories = {"Min Nan Chinese"}, language = "zh"}

labels["dialectal Min Nan"] = {display = "dialectal [[w:Min Nan|Min Nan]]", plain_categories = {"Min Nan Chinese"}, language = "zh"}

labels["Min Zhong"] = {Wikipedia = true, plain_categories = {"Min Zhong Chinese"}, language = "zh"}

labels["Nanning Pinghua"] = {display = "Nanning [[w:Pinghua|Pinghua]]", plain_categories = {"Nanning Pinghua"}, language = "zh"}

labels["Northeastern Mandarin"] = {Wikipedia = true, plain_categories = {"Northeastern Mandarin"}, language = "zh"}
aliases["northeastern Mandarin"] = "Northeastern Mandarin"
aliases["NE Mandarin"] = "Northerastern Mandarin"

labels["Northern Wu"] = {Wikipedia = true, plain_categories = {"Northern Wu"}, language = "zh"}
aliases["Taihu"] = "Northern Wu"
aliases["Taihu Wu"] = "Northern Wu"

labels["Penang Hokkien"] = {Wikipedia = {"Penang Hokkien"}, plain_categories = {"Penang Hokkien"}, language = "zh"}

labels["Pinghua"] = {Wikipedia = true, plain_categories = {"Pinghua Chinese"}, language = "zh"}

labels["Puxian Min"] = {Wikipedia = "Pu-Xian Min", plain_categories = {"Puxian Min"}, language = "zh"}
aliases["Puxian"] = "Puxian Min"
aliases["Pu-Xian Min"] = "Puxian Min"
aliases["Pu-Xian"] = "Puxian Min"
aliases["Xinghua"] = "Puxian Min"
aliases["Hinghwa"] = "Puxian Min"

labels["Quanzhou"] = {Wikipedia = "Quanzhou dialect", plain_categories = {"Quanzhou Hokkien"}, language = "zh"}
aliases["Quanzhou dialect"] = "Quanzhou"
aliases["Chinchew"] = "Quanzhou"
aliases["Chinchew dialect"] = "Quanzhou"
aliases["Choanchew"] = "Quanzhou"
aliases["Choanchew dialect"] = "Quanzhou"

labels["Shanghainese Wu"] = {display = "Shanghainese Wu", Wikipedia = "Shanghainese", plain_categories = {"Shanghainese"}, language = "zh"}

labels["Shehua"] = {Wikipedia = "Shehua", plain_categories = {"Shehua Chinese"}, language = "zh"}

labels["Sichuanese"] = {Wikipedia = "Sichuanese dialect", plain_categories = {"Sichuanese Mandarin"}, language = "zh"}
aliases["Sichuan"] = "Sichuanese"

labels["Singaporean Hokkien"] = {Wikipedia = "Singaporean Hokkien", plain_categories = {"Singaporean Hokkien"}, language = "zh"}
aliases["Singapore Hokkien"] = "Singaporean Hokkien"

labels["Siyi"] = {Wikipedia = "Siyi Yue", language = "zh"}

labels["Southern Wu"] = {display = "Southern [[w:Wu Chinese|Wu]]", plain_categories = {"Southern Wu"}, language = "zh"}

labels["Southwestern Mandarin"] = {Wikipedia = true, plain_categories = {"Southwestern Mandarin"}, language = "zh"}
aliases["southwestern Mandarin"] = "Southwestern Mandarin"
aliases["Upper Yangtze Mandarin"] = "Southwestern Mandarin"
aliases["Southwest Mandarin"] = "Southwestern Mandarin"

labels["Taishanese"] = {Wikipedia = true, plain_categories = {"Taishanese Chinese"}, language = "zh"}
aliases["Toishanese"] = "Taishanese"
aliases["Hoisanese"] = "Taishanese"

labels["Taiwanese Hakka"] = {Wikipedia = true, plain_categories = {"Taiwanese Hakka"}, language = "zh"}
aliases["Taiwan Hakka"] = "Taiwanese Hakka"

labels["Taiwanese Hokkien"] = {Wikipedia = "Taiwanese Hokkien", plain_categories = {"Taiwanese Min Nan"}, language = "zh"}
aliases["Taiwanese Min Nan"] = "Taiwanese Hokkien"
aliases["Taiwan Hokkien"] = "Taiwanese Hokkien"
aliases["Taiwan Min Nan"] = "Taiwanese Hokkien"

labels["Taiwanese Hokkien and Hakka"] = {display = "[[w:Taiwanese Hokkien|Taiwanese Hokkien]] and [[w:Taiwanese Hakka|Hakka]]", plain_categories = {"Taiwanese Min Nan", "Taiwanese Hakka"}, language = "zh"}
aliases["Taiwanese Min Nan and Hakka"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwanese Hakka and Min Nan"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwanese Hakka and Hokkien"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwanese Min Nan & Hakka"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwanese Hokkien & Hakka"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwanese Hakka & Min Nan"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwanese Hakka & Hokkien"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwan Hokkien and Hakka"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwan Hakka and Min Nan"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwan Hakka and Hokkien"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwan Min Nan & Hakka"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwan Hokkien & Hakka"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwan Hakka & Min Nan"] = "Taiwanese Hokkien and Hakka"
aliases["Taiwan Hakka & Hokkien"] = "Taiwanese Hokkien and Hakka"

labels["Taiwanese Mandarin"] = {Wikipedia = true, plain_categories = {"Taiwanese Mandarin"}, language = "zh"}
aliases["Taiwan Mandarin"] = "Taiwanese Mandarin"

labels["Teochew"] = {Wikipedia = "Teochew dialect", plain_categories = {"Teochew Chinese"}, language = "zh"}

labels["Tianjin"] = {Wikipedia = "Tianjin dialect", plain_categories = {"Tianjin Mandarin"}, language = "zh"}
aliases["Tianjin dialect"] = "Tianjin"
aliases["Tianjin Mandarin"] = "Tianjin"
aliases["Tianjinese"] = "Tianjin"

labels["Waxiang"] = {Wikipedia = "Waxiang Chinese", plain_categories = {"Waxiang Chinese"}, language = "zh"}

labels["Wenzhou"] = {Wikipedia = "Wenzhounese", plain_categories = {"Wenzhounese Wu"}, language = "zh"}
aliases["Wenzhounese"] = "Wenzhou"
aliases["Wenzhou Wu"] = "Wenzhou"
aliases["Oujiang"] = "Wenzhou"

labels["Wu"] = {Wikipedia = "Wu Chinese", plain_categories = {"Wu Chinese"}, language = "zh"}

labels["Wuhan"] = {Wikipedia = "Wuhan dialect", plain_categories = {"Wuhan Mandarin"}, language = "zh"}
aliases["Hankou"] = "Wuhan"
aliases["Hankow"] = "Wuhan"
aliases["Wuhan dialect"] = "Wuhan"

labels["dialectal Wu"] = {display = "dialectal [[w:Wu Chinese|Wu]]", plain_categories = {"Wu Chinese"}, language = "zh"}

labels["Xiamen"] = {Wikipedia = "Amoy dialect", plain_categories = {"Xiamen Hokkien"}, language = "zh"}
aliases["Xiamen dialect"] = "Xiamen"
aliases["Amoy"] = "Xiamen"
aliases["Amoy dialect"] = "Xiamen"

labels["Xiang"] = {Wikipedia = "Xiang Chinese", plain_categories = {"Xiang Chinese"}, language = "zh"}

labels["dialectal Xiang"] = {display = "dialectal [[w:Xiang Chinese|Xiang]]", plain_categories = {"Xiang Chinese"}, language = "zh"}

labels["Zhongshan Min"] = {Wikipedia = true, plain_categories = {"Zhongshan Min Chinese"}, language = "zh"}

labels["Zhangzhou"] = {Wikipedia = "Zhangzhou dialect", plain_categories = {"Zhangzhou Hokkien"}, language = "zh"}
aliases["Zhangzhou dialect"] = "Zhangzhou"
aliases["Changchew"] = "Zhangzhou"
aliases["Changchew dialect"] = "Zhangzhou"
-- zh end

--[[	Adds a "languages" field containing ["<language code>"] = true,
		if there is a "language" field with a non-empty value.		]]
m_functions.handle_languages(labels)

return {["labels"] = labels, ["aliases"] = aliases, ["deprecated"] = deprecated}
