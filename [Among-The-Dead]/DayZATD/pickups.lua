local h1, h2, h3 = debug.gethook() 
 debug.sethook() 
 
 
-- 1 item 2 object 3 scale 4 xRotation 5 spawnPercent 6 zindexMinus 7 yRotation 
local itemTable = {
----------------------
["farm"] = {
{"Отмычка",1955,0.5,240,5},
{"Пустая Канистра",1650,1.5,0,1},
{"Палатка",1279,2,0,3,0.050},
{"Колесо",1073,2,0,1},
{"Мешки с песком",1876,1,0,0.5,0.100},
{"Металлический ковш 1",2704,0.7,0,3},
{"Металлический ковш 2",2705,1,0,3},
{"G17",346,1,90,3},
{"M1911",1879,1,90,3},
{"M9",1880,1,90,3},
{"Makarov PM",1882,1,90,3},
{"Revolver",1900,1,90,2},
--{"Gauss",1869,1,90,2},
{"M1014",1905,1,90,1},
{"Remington 870",1909,1,90,1},
{"Топор",339,1,90,4},
{"Удочка",1545,1,0,1},
--{"Снасти",1664,1,0,1},
{"Мотошлем 10%",1755,1,0,4,0.8},
{"Relôgio",2710,1,0,2},
--{"Pacote de Calor",1576,1.5,0,0.4},
--{"Arame Farpado",933,0.25,0,0.5},
{"Mapa",1277,0.5,90,3},
{"GPS",2976,0.15,0,2},
{"Стальной лист",3117,0.5,0,4,0.100},
{"Лом",333,1,90,2},

{"Лопата",1906,1,90,0.5},
{"Рюкзак САТУРН 20",3026,1,0,4},
{"Mochila de ASSALTO 40",2405,1,0,3},
{"Mochila de Montanha 60",1248,1,0,2},
{"Mochila do Comandante 80",1252,1,0,1},
{"Mochila de Explorador 100",953,1,0,1},
{"AK-107",1515,1,90,1},
{"AK-74",1833,1,90,1},
{"G36",1856,1,90,1},
{"CZ550",1916,1,90,1},
{"DMR",1918,1,90,0.1},
{"Шланг",1952,1,0,2},
{"Бензопила",341,1,90,2},
{"MP5",353,1,90,1},
},

["residential"] = {
{"Caixa de Fósforo",328,0.4,90,3},
{"Топор",339,1,90,1},
{"Мотошлем 10%",1755,1,0,0.1,0.8},
   
{"Пустая Канистра",1650,1,0,2}, 
{"Стальной лист",3117,0.5,0,3,0.100},
{"Одежда: Снайпер 1",1213,2,0,1},
{"Одежда: Снайпер 2",1213,2,0,1},
{"Одежда: Снайпер 3",1213,2,0,1},
{"Одежда: Снайпер 4",1213,2,0,1},

{"Палатка",1279,2,0,2,0.050},
{"Большая палатка",1279,2,0,2,0.050},
--{"Pacote de Calor",1576,1.5,0,0.4},
--{"Arame Farpado",933,0.25,0,0.5},
{"Колесо",1073,2,0,2},
{"Mapa",1277,0.8,90,3},
{"GPS",2976,0.15,0,2},


{"Лом",333,1,90,2},
--{"Бейсбольная Бита",336,1,90,2},
{"Мачете",337,1,90,1},
{"Лопата",1906,1,90,1},

{"Revolver",1900,1,90,0.5},
--{"Gauss",1869,1,90,0.5},
{"M1014",1905,1,90,0.5},
{"Remington 870",1909,1,90,0.5},
{"Рюкзак САТУРН 20",3026,1,0,4},
{"Mochila de ASSALTO 40",2405,1,0,3},
{"Mochila de Montanha 60",1248,1,0,2},
{"Mochila do Comandante 80",1252,1,0,1},
{"Mochila de Explorador 100",953,1,0,0.03},

{"Граната",342,1,0,0.2},
{"Ôculos de Infravermelho",369,1,90,2},
{"Walkie-Talkie",2966,1,0,1},
{"Saiga 12K",1911,1,90,0.3},
{"M24",1923,1,90,2},
{"AKM",1835,1,90,2},
--{"AKS",1836,1,90,0.2},
{"AK-107",1515,1,90,1},
{"AK-74",1833,1,90,1},
{"G36",1856,1,90,0.2},
{"CZ550",1916,1,90,0.2},
{"DMR",1918,1,90,0.1},
{"Caixa de Ferramentas",2969,2,0,1,0.100},
},
----------------------
["military"] = {
{"GPS маяк",3082,0.25,0,3,0.1,90},
{"Garrafa de Água Vazia",2683,1.5,0,2}, 
{"Сейф",1907,1,0,1,-0.350},
--{"Mina",1862,2,0,0.8},
{"Sinal de Fogo",324,1,90,1},
{"Граната",342,1,0,0.2},
{"Ôculos de Visão Noturna",368,1,90,6},
{"Бинокль",369,1,0,2},
{"Ôculos de Infravermelho",369,1,90,2},
{"Walkie-Talkie",2966,1,0,1},
{"Мешки с песком",1876,1,0,0.5,0.100},
{"Pára-Quedas",371,1,0,1},

{"Одежда: Военный 1",1213,2,0,0.1},
{"Одежда: Военный 2",1213,2,0,0.1},
{"Одежда: Военный 3",1213,2,0,0.1},
{"Одежда: Военный 4",1213,2,0,0.1},
{"Одежда: Военный 5",1213,2,0,0.1},
{"Одежда: Военный 6",1213,2,0,0.1},
{"Одежда: Военный 7",1213,2,0,0.1},
{"Одежда: Военный 8",1213,2,0,0.1},

--{"AK-107 PSO",1832,1,90,0.2},

--{"ВСС Vintorez",1922,1,90,0.04},
{"MP5",353,1,90,2},
{"M4A1",2785,1,90,3},
{"M4A1 SD",2481,1,90,2},

{"AKS (gold)",1837,1,90,3},
--{"AKS-74 Kobra",1838,1,90,0.2},
--{"AKS-74 PSO",1851,1,90,0.2},
{"AKS-74U",1852,1,90,3},
{"FN SCAR",1854,1,90,2},

{"G36C-SD",1861,1,90,0.2},
--{"G36K",1863,1,90,0.2},
{"M240",1870,1,90,0.001},
--{"M249 Saw",1871,1,90,0.001},
--{"MG36",1872,1,90,0.001},
--{"Mk 48 Mod 0",1873,1,90,0.001},
{"PKM",1874,1,90,0.001},
--{"PKP",1877,1,90,0.001},

{"M9 SD",1881,1,90,1},
{"M1014",1905,1,90,1},
{"Saiga 12K",1911,1,90,0.3},
{"AS50",1915,1,90,1},
{"KSVK",1919,1,90,1},
{"M107",1920,1,90,2},
--{"M24 (desert)",1924,1,90,0.1},
{"M40A3",1925,1,90,3},
{"SVD Camo",1926,1,90,2},
{"Mochila de Explorador 100",953,1,0,1},
{"Mochila do Colorado 120",2410,1,0,1},
{"Mochila Brasileira 140",1641,1,0,0.08},


{"Capacete Militar 50%",2394,1,0,2,0.7},
{"Capacete Blindado 70%",2018,1,0,1,0.7},
{"Capacete Blindado 80%",2019,1,0,1,0.7},
{"Colete 20%",2020,1,90,1,0,50},

{"Большой сухой паёк",2778,1,0,2},
{"Маленький сухой паёк",1956,1,0,3},
},
----------------------
["industrial"] = {
{"Мотор",929,2,0,5},
{"Caixa de Fósforo",328,0.4,90,3},
{"Топор",339,1,90,1},
  {"Garrafa de Água Vazia",2683,1.5,0,2}, 
{"Мотошлем 10%",1755,1,0,2,0.8},

   
{"Одежда: Выживший 1",1213,2,0,0.1},
{"Одежда: Выживший 2",1213,2,0,0.1},
{"Одежда: Выживший 3",1213,2,0,0.1},
{"Одежда: Выживший 4",1213,2,0,0.1},
{"Одежда: Выживший 5",1213,2,0,0.1},
{"Одежда: Выживший 6",1213,2,0,0.1},
{"Одежда: Выживший 7",1213,2,0,0.1},
{"Стальной лист",3117,0.5,0,2,0.100},
{"Палатка",1279,2,0,3,0.050},
--{"Pacote de Calor",1576,1.5,0,0.4},
--{"Arame Farpado",933,0.25,0,0.5},
{"Колесо",1073,2,0,0.5},
{"Mapa",1277,0.8,90,3},
{"GPS",2976,0.15,0,2},


{"Лом",333,1,90,2},
--{"Бейсбольная Бита",336,1,90,2},

{"Лопата",1906,1,90,0.5},

{"Revolver",1900,1,90,0.5},
--{"Gauss",1869,1,90,0.5},
{"M1014",1905,1,90,0.5},
{"Remington 870",1909,1,90,4},
{"Рюкзак САТУРН 20",3026,1,0,4},
{"Mochila de ASSALTO 40",2405,1,0,3},
{"Mochila de Montanha 60",1248,1,0,3},
{"Mochila do Comandante 80",1252,1,0,3},
{"Mochila de Explorador 100",953,1,0,0.03},

{"Граната",342,1,0,0.2},
{"Ôculos de Infravermelho",369,1,90,2},
{"Walkie-Talkie",2966,1,0,1},
{"Saiga 12K",1911,1,90,0.3},
{"M24",1923,1,90,2},
{"AKM",1835,1,90,1},
--{"AKS",1836,1,90,0.2},

},
----------------------
["supermarket"] = {
{"Шланг",1952,1,0,2},
{"Сырое Мясо",2804,1.5,90,0.005},
{"Caixa de Fósforo ",328,0.4,90,2},
{"Топор",339,1,90,1.1},
--{"Пицца",1582,1,0,4},
{"Газированная Вода",2647,1,0,3},
{"Кола",2856,1.5,0,3},
{"Банка Макарон",2770,2,0,2},
{"Банка Бобов",2601,2,0,2},
--{"Бургер",2768,1,0,4},
{"Analgésico",2709,3,0,4,0.100},
{"Relôgio",2710,1,0,1.5},
--{"Pacote de Calor",1576,1.5,0,3},
--{"Arame Farpado",933,0.25,0,1},
{"Колесо",1073,2,0,0.5},
{"Morfina",1579,1,0,1},
{"Antibiótico",1579,1,0,1},
{"Mapa",1277,0.8,90,6},
{"GPS",2976,0.15,0,4},
{"Walkie-Talkie",2966,1,0,0.2},
{"Лом",333,1,90,1.9},
--{"Бейсбольная Бита",336,1,90,1.4},
{"Деньги",1908,1,0,0.1,0.150},


{"Мотошлем 10%",1755,1,0,2,0.8},

{"AK-107",1515,1,90,2},
{"AK-74",1833,1,90,2},
{"G36",1856,1,90,2},
{"CZ550",1916,1,90,2},
{"DMR",1918,1,90,2},

{"Рюкзак САТУРН 20",3026,1,0,5},
{"Mochila de ASSALTO 40",2405,1,0,4},
{"Mochila de Montanha 60",1248,1,0,4},
{"Mochila do Comandante 80",1252,1,0,3},
{"Caixa de Ferramentas",2969,2,0,3,0.100},

},
["other"] = {

-- 1 item 2 object 3 scale 4 xRotation 5 spawnPercent 6 zindexMinus 7 yRotation 
{"Pára-Quedas",371,1,0,0},
{"Удочка",1545,1,0,0},
--{"Снасти",1664,1,0,0},
--{"Наживка",1668,1,0,0},
{"Жареная рыба",1517,1,0,0},
{"Сырая рыба",1512,1,0,0},
{"Шланг",1952,1,0,0},
{"Большой сухой паёк",2778,1,0,0.1},
{"Маленький сухой паёк",1956,1,0,0.1},
{"Металлический ковш 1",2704,0.7,0,1},
{"Металлический ковш 2",2705,1,0,1},
{"Мешок с частями зомби",1548,1,0,0.1},
{"Отмычка",1955,0.5,240,0.1},
--{"Mina",1862,2,0,0.8},
{"Мешки с песком",1876,1,0,0.5,0.100},
{"Стальной лист",3117,0.5,0,0.5,0.100},
{"GPS маяк",3082,0.25,0,90,0.1,90},
{"Сырое Мясо",2804,1.5,0},
{"Жареное Мясо",2806,1.5,0},
{"Galão de Combútivel Completo",1650,1.5,0},
{"Garrafa de Água Vazia",2683,1.5,0},
-- ,1213,2,0 одежда 

{"Одежда: Военный 1",1213,2,0},
{"Одежда: Военный 2",1213,2,0},
{"Одежда: Военный 3",1213,2,0},
{"Одежда: Военный 4",1213,2,0},
{"Одежда: Военный 5",1213,2,0},
{"Одежда: Военный 6",1213,2,0},
{"Одежда: Военный 7",1213,2,0},
{"Одежда: Военный 8",1213,2,0},
{"Одежда: Акваланг",1213,2,0},
{"Одежда: Выживший 1",1213,2,0},
{"Одежда: Выживший 2",1213,2,0},
{"Одежда: Выживший 3",1213,2,0},
{"Одежда: Выживший 4",1213,2,0},
{"Одежда: Выживший 5",1213,2,0},
{"Одежда: Выживший 6",1213,2,0},
{"Одежда: Выживший 7",1213,2,0},
{"Одежда: Снайпер 1",1213,2,0},
{"Одежда: Снайпер 2",1213,2,0},
{"Одежда: Снайпер 3",1213,2,0},
{"Одежда: Снайпер 4",1213,2,0},


{"Ôculos de Visão Noturna",368,1,90},
{"Ôculos de Infravermelho",369,1,90},
{"Caixa de Fósforo",328,0.4,90,5},
{"Дрова",1463,2,0,5},
{"Топор",339,1,90,1.8},
--{"Пицца",1582,1,0,7},
{"Газированная Вода",2647,1,0,7},
{"Пустая Канистра",1650,1.5,0,5},
{"Sinal de Fogo",324,1,90,6},
{"Кола",2856,1.5,0,5},
{"Analgésico",2709,3,0,7,0.100},
{"Relôgio",2710,1,0,3},
--{"Pacote de Calor",1576,1.5,0,6},
--{"Arame Farpado",933,0.25,0,1},
{"M14 EP1",357,1,90,1.5},
{"Колесо",1073,2,0,1},
{"Morfina",1579,1,0,2},
{"Antibiótico",1579,1,0,1},
{"Mapa",1277,0.3,0,4,0.1},
{"Caixa de Ferramentas",2969,2,0,3,0.100},
{"Мотор",929,2,0,3.5},
{"Сейф",1907,1,0,1.5,-0.350},
{"Полная Фляга",2683,1.5,0,4},
{"Слезоточивый газ",343,1,0,0.5},
{"Граната",342,1,0,0.5},
{"Бинокль",369,1,0,4},
{"Ataduras",1578,1.5,0,4},
{"Банка Макарон",2770,2,0,5},
{"Банка Бобов",2601,2,0,6},
--{"Бургер",2768,1,0,2},
{"Палатка",1279,2,0,0.5,0.050},
{"Большая палатка",1279,2,0,0.5,0.050},
{"GPS",2976,0.15,0,1},
{"Kit de Primeiros Socorros",2891,2.2,0},
{"Bolsa de Sangue",1580,1.5,0.50},
{"Walkie-Talkie",2966,0.5,0,5},
{"Лом",333,1,90,1.9},
{"Бейсбольная Бита",336,1,90,1.4},
{"Мачете",337,1,90,1},
{"Деньги",1908,1,0,0.3,0.150},
{"Лопата",1906,1,90,0.5},

{"Рюкзак САТУРН 20",3026,1,0,6},
{"Mochila de ASSALTO 40",2405,1,0,1.5},
{"Mochila de Montanha 60",1248,1,0,1.1},
{"Mochila do Comandante 80",1252,1,0,0.7},
{"Mochila de Explorador 100",953,1,0,0.3},
{"Mochila do Colorado 120",2410,1,0,0.2},
{"Mochila Brasileira 140",1641,1,0,0.2},
{"Рюкзак САМУРАЙ 160",1575,1,0,0.2},
{"Рюкзак ВОЕННЫЙ 180",1640,1,0,0.1},
{"Рюкзак ФАРАОН 200",1602,1,0,0.1},



{"Мотошлем 10%",1755,1,0,0,0.8},
{"Сварочная маска 10%",2015,1,0,0,0.8},
{"Шахтерская каска 5%",2016,1,0,0,0.8},

{"Capacete Militar 50%",2394,1,0,0,0.7},
{"Capacete Blindado 70%",2018,1,0,0,0.7},
{"Capacete Blindado 80%",2019,1,0,0,0.7},
{"Colete 20%",2020,1,90,0,0,50},

{"Colete 30%",936,1,90,0,0,50},
{"Colete 10%",2396,1,90,0,0,50},

{"AK-107",1515,1,90,0},
{"M4A1",2785,1,90,0},
{"M4A1 SD",2481,1,90,0},
{"ВСС Vintorez",1922,1,90,0},
{"MP5",353,1,90,0},
--{"AK-107 PSO",1832,1,90,0},
{"AK-74",1833,1,90,0},
{"AKM",1835,1,90,0},
--{"AKS",1836,1,90,0},
{"AKS (gold)",1837,1,90,0},
--{"AKS-74 Kobra",1838,1,90,0},
--{"AKS-74 PSO",1851,1,90,0},
{"AKS-74U",1852,1,90,0},
{"FN SCAR",1854,1,90,0},
{"G36",1856,1,90,0},
{"G36C-SD",1861,1,90,0},
--{"G36K",1863,1,90,0},
{"Gauss",1869,1,90,0,0.05},
{"M240",1870,1,90,0},
{"M249 Saw",1871,1,90,0},
{"MG36",1872,1,90,0},
{"Mk 48 Mod 0",1873,1,90,0},
{"PKM",1874,1,90,0},
--{"PKP",1877,1,90,0},
{"G17",346,1,90,0},
{"M1911",1879,1,90,0},
{"M9",1880,1,90,0},
{"M9 SD",1881,1,90,0},
{"Makarov PM",1882,1,90,0},
{"Revolver",1900,1,90,0},
{"M1014",1905,1,90,0},
{"Remington 870",1909,1,90,0},
--{"Remington 870 (Com Lanterna)",1910,1,90,0},
{"Saiga 12K",1911,1,90,0},
{"AS50",1915,1,90,0},
{"CZ550",1916,1,90,0},
{"DMR",1918,1,90,0},
{"KSVK",1919,1,90,0},
{"M107",1920,1,90,0},
{"M24",1923,1,90,0},
--{"M24 (desert)",1924,1,90,0},
{"M40A3",1925,1,90,0},
{"SVD Camo",1926,1,90,0},
{"Бензопила",341,1,90,0},

{"AK mag",1271,2,0},
{"AKM mag",1271,2,0},
{"FN mag",1271,2,0},
{"G36 mag",1271,2,0},
{"ВСС mag",1271,2,0},
{"M4A1 mag",1271,2,0},
{"MP5 mag",1271,2,0},
{"Gauss mag",1921,2,0},
{"M240 Belt",1271,2,0},
{"M249 Belt",1271,2,0},
{"MG36 mag",1271,2,0},
{"PKM mag",1271,2,0},
{"G17 mag",3013,2,0},
{"M1911 mag",3013,2,0},
{"M9 mag",3013,2,0},
{"Makarov mag",3013,2,0},
{".45 ACP",3013,2,0},
{"M1014 Pellet",2358,2,0},
{"Saiga mag",2358,2,0},
{"AS50 mag",1921,2,0},
{"CZ550 mag",1921,2,0},
{"DMR mag",1921,2,0},
{"KSVK mag",1921,2,0},
{"M107 mag",1921,2,0},
{"M24 mag",1921,2,0},
{"M40A3 mag",1921,2,0},
{"SVD mag",1921,2,0},

},
["eda"] = {
--{"Бургер",2768,1,0,2},
{"Банка Макарон",2770,2,0,5},
{"Банка Бобов",2601,2,0,6},
--{"Пицца",1582,1,0,7},
{"Газированная Вода",2647,1,0,7},
{"Сырое Мясо",2804,1.5,90},
{"Жареное Мясо",2806,1.5,90},
{"Полная Фляга",2683,1.5,0,4},
{"Кола",2856,1.5,0,7},
},
}


function getItemTablePosition (itema)
	for id, item in ipairs(itemTable[tostring("other")]) do
		if itema == item[1] then
			return id,"other"
		end
	end

	return item,itemString
end





-- {"Gauss",1869,1,90,0},
function createItemPickup(item,x,y,z,tableStringName,plus,colSize)

	if item and x and y and z then
		local zZsize = itemTable[tostring(tableStringName)][item][6] or 0
		local rRy = itemTable[tostring(tableStringName)][item][7] or 0
		local object = createObject(itemTable[tostring(tableStringName)][item][2],x,y,z-0.875-zZsize ,itemTable[tostring(tableStringName)][item][4],rRy,math.random(0,360))
		local col = createColSphere(x,y,z,colSize or 0.75)
		
		setElementParent(object,lootsInGround)
		setElementParent(col,object)
	
		setObjectScale(object,itemTable[tostring(tableStringName)][item][3])
		setElementCollisionsEnabled(object, false)
		setElementFrozen (object,true)
		
		setElementData(col,"item",itemTable[tostring(tableStringName)][item][1]) --client
		setElementData(col,"plus",plus)
		setElementData(col,"parent",object) --client
		setTimer(function()
			if isElement(col) then
				destroyElement(col)
				destroyElement(object)
			end	
		end,900000,1)
		return object
	end
end

function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

function math.percentChance (percent,loot)
	local hits = 0
	local number = math.random(0,100) or 0
		if number <= percent then
		--outputChatBox(..": "..number.."<="..percent)
			hits = hits+1
		end

	return hits
end


function createGaussSecret()
local x,y,z = 2122.64453125,-2446.5,-19.837703704834
	local item,itemString = getItemTablePosition("Gauss")
	local itemPickup = createItemPickup(item,x,y,z,itemString,false,1.5)
end
createGaussSecret()
setTimer(createGaussSecret,18000000,1)



function createItemLoot (lootPlace,x,y,z,id)
		if type(lootPlace) ~="string" then
		local itemLoot = lootPlace
		 lootPlace = getElementData(lootPlace,"parent")
		destroyElement(itemLoot)
		end
		

	local col = createColSphere(x,y,z,1.25)
	setElementParent ( col, itemsLoot )  
	--createBlip ( x,y,z)
	setElementData(col,"itemloot",true) --client
	setElementData(col,"parent",lootPlace) --client
	setElementData(col,"MAX_Slots",12) --client
	--Items
	for i, item in ipairs(itemTable[lootPlace]) do
	
		local value =  math.percentChance (item[5],item[1])
		if value>0 then
		setElementData(col,item[1],value) --client
		end
if (item[1] == "Деньги" and value > 1 ) then
setElementData(col,item[1],math.random(0,100)) --client
end
		--weapon Ammo
	
		if value > 0  then
			local ammoData,weapID,modelID,AmmoKol = getWeaponAmmoType (item[1])
			if AmmoKol then
				setElementData(col,ammoData,math.random(AmmoKol,AmmoKol*2)) --client
			end
		end
	end
	--itemLoot
	refreshItemLoot (col,lootPlace)
	
	return col
end


function refreshItemLoot (col,place)
	local objects = getElementData(col,"objectsINloot")
	if objects then
		if objects[1] ~= nil then
			destroyElement(objects[1])
		end
		if objects[2] ~= nil then
			destroyElement(objects[2])
		end
		if objects[3] ~= nil then
			destroyElement(objects[3])
		end
	end
	--setting objects
	local counter = 0
	local obejctItem = {}
	--Tables
	for i, item in ipairs(itemTable["other"]) do
		if getElementData(col,item[1]) and getElementData(col,item[1]) > 0 then
			if counter == 3 then
				break
			end	
			counter = counter + 1
			local x,y,z = getElementPosition(col)
			local zZsize = item[6] or 0
			obejctItem[counter] = createObject(item[2],x+math.random(-1,1),y+math.random(-1,1),z-0.875-zZsize,item[4])
			setObjectScale(obejctItem[counter],item[3])
			setElementCollisionsEnabled(obejctItem[counter], false)
			setElementFrozen (obejctItem[counter],true)
			
			setElementParent ( obejctItem[counter], col )
		end
	end
	
	setElementData(col,"objectsINloot",{obejctItem[1], obejctItem[2], obejctItem[3]},false)
end
addEvent( "refreshItemLoot", true )
addEventHandler( "refreshItemLoot", getRootElement(), refreshItemLoot )



function createPickupsOnServerStart()



	iPickup = 0
	for i,pos in ipairs(pickupPositions["residential"]) do
		iPickup = iPickup + 1
		createItemLoot("residential",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart2,5000,1)
end

function createPickupsOnServerStart2()
	for i,pos in ipairs(pickupPositions["industrial"]) do
		iPickup = iPickup + 1
		createItemLoot("industrial",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart3,5000,1)
end

function createPickupsOnServerStart3()
	for i,pos in ipairs(pickupPositions["farm"]) do
		iPickup = iPickup + 1
		createItemLoot("farm",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart4,5000,1)
end

function createPickupsOnServerStart4()
	for i,pos in ipairs(pickupPositions["supermarket"]) do
		iPickup = iPickup + 1
		createItemLoot("supermarket",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart5,5000,1)
end

function createPickupsOnServerStart5()
	for i,pos in ipairs(pickupPositions["military"]) do
		iPickup = iPickup + 1
		createItemLoot("military",pos[1],pos[2],pos[3],iPickup)
	end
	
	
	setServerPassword(nil)
setGameType ("DayZ:Among the dead")

		outputChatBox("#ffaa00Внимание! #ffffff - Респаун лута окончен!",getRootElement(),255,255,255,true)
	
triggerClientEvent ( "onClientBind", getRootElement(), "bind" )	
end



createPickupsOnServerStart() --!!!

------------------------------------------------------------------------------
--OTHER ITEM STUFF



function onPlayerTakeItemFromGround (itemName,col,itemPlus)
for i,weaponData in ipairs(weaponAmmoTable["Weapons"]) do
		if itemName == weaponData[1] then
			removeBackWeaponOnDrop ()
			break
	end
end	
for i,weaponData in ipairs(weaponAmmoTable["others"]) do
if weaponData[3] then
		if itemName == weaponData[1] then
			removeBackWeaponOnDrop ()
			break
	end
	end
end	
if col then 
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)
if isElement(col) then
setElementData(source,itemName,(getElementData(source,itemName) or 0)+itemPlus or 0) --client
local source = source

	destroyElement(getElementData(col,"parent"))
	--destroyElement(col) ЭТО РЕБЕНОК

end
end
	
	end
addEvent( "onPlayerTakeItemFromGround", true )
addEventHandler( "onPlayerTakeItemFromGround", getRootElement(), onPlayerTakeItemFromGround )

function onPlayerChangeLoot(loot)
local players = getElementsWithinColShape (loot,"player")
	for theKey,player in ipairs(players) do 
		triggerClientEvent(player,"refreshLootManual",player,loot)
	end	
end
addEvent( "onPlayerChangeLoot", true )
addEventHandler( "onPlayerChangeLoot", getRootElement(), onPlayerChangeLoot )

function playerDropAItem(itemName,plus)
	local x,y,z = getElementPosition(source)
	local item,itemString = getItemTablePosition(itemName)
	local itemPickup = createItemPickup(item,x+math.random(-1.25,1.25),y+math.random(-1.25,1.25),z,itemString,plus)
	end
addEvent( "playerDropAItem", true )
addEventHandler( "playerDropAItem", getRootElement(), playerDropAItem )

local rLootTimer=false

function refreshItemLoots ()

setServerPassword("kawfjawhfai1y2631yhgwfgawfgagwfagwfagwfgawf")
setGameType ("Респаун лута")
		for i, player in ipairs(getElementsByType("player")) do
			kickPlayer(player,"Респаун лута")
		end
	outputChatBox("#ffaa00Внимание! #ffffff - Начался респаун лута!",getRootElement(),255,255,255,true)
	for i, loots in ipairs(getElementsByType("colshape")) do
		local itemloot = getElementData(loots,"itemloot")
		if itemloot then
		local objects = getElementData(loots,"objectsINloot")
		if objects then
			if objects[1] ~= nil then
				destroyElement(objects[1])
			end
			if objects[2] ~= nil then
				destroyElement(objects[2])
			end
			if objects[3] ~= nil then
				destroyElement(objects[3])
			end
		end
			destroyElement(loots)
		end	
	end
	createPickupsOnServerStart()
	
end


--Refresh items
function refreshItemLootPoints ()

	outputChatBox("#ff2200Внимание! #ffffff - Через 60 секунд начнется респаун лута(все игроки будут кикнуты с сервера)!",getRootElement(),255,255,255,true)
	triggerClientEvent ( "onClientUnBind", getRootElement(), "unbind" )
	setTimer(refreshItemLoots,60000,1)
	
end





function TESTSERVRELOOT(player, command, params)
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin"))
if isAdmin then

outputChatBox("Точек лута:"..#getElementChildren(itemLootTable))

	end
end

addCommandHandler ( "checkLoot", TESTSERVRELOOT )



local lootReloot=1
function setRelootTimerRand()
local ticksOfStartSpawn = getTickCount ()
	local time = getRealTime()

	
	
	local loots = getElementChildren(itemsLoot)
	local startlootReloot = lootReloot
	
		for i=lootReloot, #loots do
		
		if lootReloot<=(startlootReloot+5) then
		
		lootReloot=lootReloot+1
		--outputChatBox(startlootReloot.." - "..lootReloot)
		if loots[i] and loots[i] ~= nil then
			itemLoot = loots[i]
		local players = getElementsWithinColShape (itemLoot,"player")
		
		
		if table.size(players) <=0 then
		
		local isItemLoot = getElementData(itemLoot,"itemloot") or false
		if isItemLoot then
			local objects = getElementData(itemLoot,"objectsINloot")
		if objects then
			if objects[1] ~= nil then
				destroyElement(objects[1])
			end
			if objects[2] ~= nil then
				destroyElement(objects[2])
			end
			if objects[3] ~= nil then
				destroyElement(objects[3])
			end
		end
		local x,y,z = getElementPosition(itemLoot)
			createItemLoot(itemLoot,x,y,z)
		
		
		end
		
		end
		end
		
		end
		
		
		if lootReloot>=#loots then
		lootReloot=1
		end
		end
		
local ticksOfStopSpawn = getTickCount ()
--outputDebugString("Loot pickups ("..tostring(startlootReloot).." - "..tostring((startlootReloot+5))..")(ALL: "..tostring(#loots)..") created in:"..tostring((ticksOfStopSpawn-ticksOfStartSpawn)).."ms")

end
setTimer(setRelootTimerRand,24000,0)

addCommandHandler ( "testRandRespawn172836", setRelootTimerRand )

function getPlayerPos(ps,cmd)
local x,y,z = getElementPosition(ps)
outputConsole (x..","..y..","..z,ps)
end

addCommandHandler ( "gp", getPlayerPos )



 debug.sethook( _, h1, h2, h3 )
  debug.sethook()
