


gameplayVariables = {}

--gameplayVariables["temperaturesprint"] = 0.005 -- Amount of temperature to be gained when sprinting - DEFAULT: 0.005
gameplayVariables["sprintthirst"] = -1 -- Amount of losing thirst when sprinting - DEFAULT: -0.2
--gameplayVariables["temperaturewater"] = -0.01 -- Amount of temperature to be lost when in water - DEFAULT: -0.01
gameplayVariables["loseHunger"] = -0.7 -- Amount of losing hunger per minute - DEFAULT: -1.5
gameplayVariables["loseThirst"] = -0.8 -- Amount of losing thirst per minute - DEFAULT: -1.5

gameplayVariables["checkBTNFLOOD"] = getElementData(getRootElement(),"checkBTNFLOOD",false) 
gameplayVariables["checkBTNtimer"] = 500 
-- PING CHECK	

	gameplayVariables["pingMAX"] = getElementData(getRootElement(),"pingMAX",false)  -- Checks if ping is over the set amount. DEFAULT: 600
	gameplayVariables["MAXmessagesInResendBuffer"] = getElementData(getRootElement(),"MAXmessagesInResendBuffer",false)  -- Checks if ping is over the set amount. DEFAULT: 600
	gameplayVariables["MAXpacketlossLastSecond"] = getElementData(getRootElement(),"MAXpacketlossLastSecond",false)  -- Checks if ping is over the set amount. DEFAULT: 600
	

-- SCREEN SIZE ---
gameplayVariables["screenSize"] = {guiGetScreenSize()}
-- ZOMBIE DAMAGE
--	gameplayVariables["zombiedamage"] = math.random(1000,3000) -- Damage done by zombies - DEFAULT: math.random(400,900), for consistent damage, remove math.random(400,900) and insert value (EXAMPLE: 1000)
	gameplayVariables["zombieblood"] = 50000
	
	gameplayVariables["playerzombies"] = 3 
	gameplayVariables["enablenight"] = true -- Whether or not the night should be darker - DEFAULT: true - SET TO false to disable - remember you need to set it in editor_server.lua too.

if gameplayVariables["screenSize"][1]<800 then

triggerServerEvent("kickPlayerOnHighPing",localPlayer,localPlayer,"Увеличьте разрешение экрана") 

end

--- GLOBAL FUNCTIONS --- 
function centerWindow (center_window)
    local screenW, screenH = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end

function getWeaponAmmoType (weaponName,notOthers)
if not notOthers then
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[1] then
			return weaponData[1],weaponData[2]
		end
	end
end	

	for i,weaponData in ipairs(weaponAmmoTable["Weapons"]) do
		if weaponName == weaponData[1] then
			return weaponData[3],weaponData[4],weaponData[2]
		end
	end

end
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
 
	return false
end


function nametagShowing()
	for i,player in ipairs(getElementsByType("player",getRootElement(),true)) do
		setPlayerNametagShowing ( player, false )
	end
end
setTimer(nametagShowing,1000,0)


-- WEAPON DAMAGE
damageTable = {
{"AK-107",3040}, 
--{"AK-107 PSO",3040}, 
{"AK-74",3500}, 
{"AKM",4000}, 
--{"AKS",3500}, 
{"AKS (gold)",4500}, 
--{"AKS-74 Kobra",3500}, 
--{"AKS-74 PSO",3500}, 
{"AKS-74U",3200}, 
{"FN SCAR",5599}, 
{"G36",3555}, 
{"G36C-SD",3355}, 
--{"G36K",3555}, 
{"Gauss",50000}, 
{"ВСС Vintorez",5700}, 
{"M4A1",5800}, 
{"M4A1 SD",5600}, 

{"M240",3999}, 
{"M249 Saw",3892}, 
{"MG36",3900}, 
{"Mk 48 Mod 0",4001}, 
{"PKM",4600}, 
--{"PKP",4700}, 

{"G17",912}, 
{"M1911",1389}, 
{"M9",1243}, 
{"M9 SD",889}, 
{"Makarov PM",889}, 
{"Revolver",1492}, 
{"M1014",4300}, 
{"Remington 870",4000}, 
--{"Remington 870 (Com Lanterna)",4500}, 
{"Saiga 12K",7500}, 
{"AS50",15000}, 
{"CZ550",7000}, 
{"DMR",8200}, 
{"KSVK",15000}, 
{"M107",15000}, 
{"M24",8002}, 
--{"M24 (desert)",8002}, 
{"SVD Camo",9000}, 
{"M40A3",8000}, 
{"Machado",4500}, 
{"Gás Lacrimogêneo",20}, 
{"Granada",12000}, 
{"Taco de beisebol",1500}, 
{"Machete",4500}, 
{"Pé-de-Cabra",2000}, 
{"Motosserra",500}, 
{"MP5",2300},
}



weaponAmmoTable = {

["Weapons"] = {
-- Название, id модели, Название патронов, id заменяемого оружия, кл-во патрон в обойме
{"AK-107",1515,"AK mag",30,30},
{"AK-107 PSO",1832,"AK mag",30,30},
{"AK-74",1833,"AK mag",30,30},
{"AKM",1835,"AKM mag",30,30},
{"AKS",1836,"AKM mag",30,30},
{"AKS (gold)",1837,"AKM mag",30,30},
{"AKS-74 Kobra",1838,"AKM mag",30,30},
{"AKS-74 PSO",1851,"AKM mag",30,30},
{"AKS-74U",1852,"AKM mag",30,30},
{"FN SCAR",1854,"FN mag",30,30},
{"G36",1856,"G36 mag",30,30},
{"G36C-SD",1861,"G36 mag",30,30},
{"G36K",1863,"G36 mag",30,30},
{"Gauss",1869,"Gauss mag",33,10},
{"M240",1870,"M240 Belt",31,100},
{"M249 Saw",1871,"M249 Belt",31,100},
{"MG36",1872,"MG36 mag",31,100},
{"Mk 48 Mod 0",1873,"M240 Belt",31,100},
{"PKM",1874,"PKM mag",31,100},
{"PKP",1877,"PKM mag",31,100},
{"G17",346,"G17 mag",22,10},
{"M1911",1879,"M1911 mag",23,10},
{"M9",1880,"M9 mag",23,10},
{"M9 SD",1881,"M9 mag",23,10},
{"Makarov PM",1882,"Makarov mag",23,10},
{"Revolver",1900,".45 ACP",24,6},
{"M1014",1905,"M1014 Pellet",27,8},
{"Remington 870",1909,"M1014 Pellet",25,8},
{"Remington 870 (Com Lanterna)",1910,"M1014 Pellet",25,8},
{"Saiga 12K",1911,"Saiga mag",27,8}, --
{"AS50",1915,"AS50 mag",34,5}, --
{"CZ550",1916,"CZ550 mag",34,5},
{"DMR",1918,"DMR mag",34,5},
{"KSVK",1919,"KSVK mag",34,5},
{"M107",1920,"M107 mag",34,5},
{"M24",1923,"M24 mag",34,5},
{"M24 (desert)",1924,"M24 mag",34,5},
{"M40A3",1925,"M40A3 mag",34,5},
{"SVD Camo",1926,"SVD mag",34,5},
{"ВСС Vintorez",1922,"ВСС mag",30,30},
{"M4A1",2785,"M4A1 mag",30,30},
{"M4A1 SD",2481,"M4A1 mag",30,30},
},


["others"] = {
{"Pára-Quedas",46},
{"MP5",false,"MP5 mag",29,25},
{"Satchel",39},
{"Gás Lacrimogêneo",17},
{"Granada",16},
{"Faca de Caça",4},
{"Machado",8},
{"Binóculos",43},
{"Taco de beisebol",5},
{"Machete",6},
{"Pé-de-Cabra",2},
{"Motosserra",9},
--{"Walkie-Talkie",1},

},
}

 lootData = {
{"Lenha"},
{"Ataduras"},
{"Garrafa de Água Completo"},
{"Lata de Macarrão"},
{"Lata de Feijão"},
{"Hambúrguer"},
{"Caixa de Fósforo"},
{"Faca de Caça"},
{"Machado"},
{"Pizza"},
{"Morfina"},
{"Antibiótico"},
{"Garrafa de Água Com Gás Completo"},
{"Galão de Combútivel Vazio"},
{"Galão de Combútivel Completo"},
{"Mangueira"},
{"Sinal de Fogo"},
{"Coca-Cola"},
{"Gás Lacrimogêneo"},
{"Granada"},
{"Relôgio"},
{"Kit de Primeiros Socorros"},
--{"Pacote de Calor"},
{"Bolsa de Sangue"},
{"GPS"},
{"Mapa"},
{"Caixa de Ferramentas"},
{"Arame Farpado"},
{"Pneu"},
{"Motor"},
{"Ôculos de Infravermelho"},
{"Ôculos de Visão Noturna"},
{"Tenda"},
{"Tenda Grande"},
{"Carne Crua"},
{"Carne Grelhada"},
{"Analgésico"},
{"Binóculos"},
{"Garrafa de Água Vazia"},
{"Garrafa de Água Vaziaа"},
{"Hambúrguer não Comestível"},
{"Walkie-Talkie"},
{"Taco de beisebol"},
{"Machete"},
{"Dinheiro"},
{"Pé-de-Cabra"},
{"Pára-Quedas"},
{"Pá"},
{"Cofre"},
{"Sacos de Areia"},
{"Chapa de Aço"},
{"GPS"},
--{"Mina"},
{"Gazua"},
{"Vara de Pesca"},
{"Снасти"},
{"Наживка"},
{"Peixe Frito"},
{"Peixe Cru"},
--{"Colete"},
--{"Capacete Militar"},
--{"Противогаз"},
{"Placa de Metal 1"},
{"Placa de Metal 2"},
{"Ração Seca Grande"},
{"Ração Seca Pequena"},
{"AK-107"},
{"AK-107 PSO"},
{"AK-74"},
{"AKM"},
{"AKS"},
{"AKS (gold)"},
{"AKS-74 Kobra"},
{"AKS-74 PSO"},
{"AKS-74U"},
{"FN SCAR"},
{"G36"},
{"G36C-SD"},
{"G36K"},
{"Gauss"}, 
{"M240"},
{"M249 Saw"},
{"MG36"},
{"Mk 48 Mod 0"},
{"PKM"},
{"PKP"},
{"G17"},
{"M1911"},
{"M9"},
{"M9 SD"},
{"Makarov PM"},
{"ВСС Vintorez"},
{"MP5"},
{"M4A1"},
{"M4A1 SD"},
{"Revolver"},
{"M1014"},
{"Remington 870"},
{"Remington 870 (Com Lanterna)"},
{"Saiga 12K"},
{"AS50"},
{"CZ550"},
{"DMR"},
{"KSVK"},
{"M107"},
{"M24"},
{"M24 (desert)"},
{"M40A3"},
{"SVD Camo"},
{"M4A1 mag"},
{"AK mag"},
{"AKM mag"},
{"FN mag"},
{"G36 mag"},
{"ВСС mag"},
{"Gauss mag"},
{"M240 Belt"},
{"M249 Belt"},
{"MG36 mag"},
{"PKM mag"},
{"G17 mag"},
{"M1911 mag"},
{"M9 mag"},
{"Makarov mag"},
{".45 ACP"},
{"M1014 Pellet"},
{"Saiga mag"},
{"AS50 mag"},
{"CZ550 mag"},
{"DMR mag"},
{"KSVK mag"},
{"M107 mag"},
{"M24 mag"},
{"M40A3 mag"},
{"SVD mag"},
{"MP5 mag"},
{"Mochila de SATURNO 20",},
{"Mochila de ASSALTO 40"},
{"Mochila de Montanha 60"},
{"Mochila do Comandante 80"},
{"Mochila de Explorador 100"},
{"Mochila do Colorado 120"},
{"Mochila Brasileira 140"},
{"Mochila de Samurai 160"},
--{"Рюкзак ВОЕННЫЙ 180"},
--{"Рюкзак ФАРАОН 200"},
{"Saco de Peças de Zumbi"},
{"Vestuário: Militar 1"},
{"Vestuário: Militar 2"},
{"Vestuário: Militar 3"},
{"Vestuário: Militar 4"},
{"Vestuário: Militar 5"},
{"Vestuário: Militar 6"},
{"Vestuário: Militar 7"},
{"Vestuário: Militar 8"},
{"Vestuário: Mergulho"},
{"Vestuário: Sobrevivente 1"},
{"Vestuário: Sobrevivente 2"},
{"Vestuário: Sobrevivente 3"},
{"Vestuário: Sobrevivente 4"},
{"Vestuário: Sobrevivente 5"},
{"Vestuário: Sobrevivente 6"},
{"Vestuário: Sobrevivente 7"},
{"Vestuário: Atirador 1"},
{"Vestuário: Atirador 2"},
{"Vestuário: Atirador 3"},
{"Vestuário: Atirador 4"},
{"Capacete Militar 50%"},
{"Capacete de Motocicleta 10%"},
{"Máscara de Soldador 10%"},
{"Capacete de Mineiro 5%"},
{"Capacete Blindado 70%"},
{"Capacete Blindado 80%"},
{"Colete 20%"},
{"Colete 30%"},
{"Colete 10%"},
{"Motosserra"},
}
 playerDataTable = {

{"alivetime"},
{"skin"},
{"MAX_Slots"},
{"bandit"},
{"blood"},
{"food"},
{"thirst"},
--{"temperature"},
{"clotType_1"},
{"clotType_2"},
{"clotProfit_1"},
{"clotProfit_2"},


--{"temperature"},
{"currentweapon_1"},
{"currentweapon_2"},
{"currentweapon_3"},
{"bleeding"},
{"brokenbone"},
{"pain"},
--{"cold"},
{"infection"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},
{"playerexp"},
{"playerlvl"},

}

 vehicleDataTable = {
{"MAX_Slots"},
{"Pneu_inVehicle"},
{"Motor_inVehicle"},
{"fuel"},

}

 tentDataTable ={
{"MAX_Slots"},
}

-- ID,Колеса,Motor,расход топлива,MAX fuel,slots
vehicleAddonsInfo = {
{403,6,1,0.50,100,150}, -- грузовик
{584,0,0,0,0,0}, -- бенз прицеп грузовика
{591,0,0,0,0,500}, -- простой прицеп грузовика
{400,4,1,0.20,100,80}, -- Landstalker
{401,4,1,0.20,100,50}, -- Bravura
{402,4,1,0.20,100,50}, -- Buffalo
{404,4,1,0.20,100,60}, -- Perenniel
{405,4,1,0.20,100,50}, -- Sentinel
{406,4,1,1,100,200}, -- Dumper
{407,4,1,0.20,100,100}, -- Firetruck
{408,4,1,0.20,100,200}, -- Trashmaster
{409,4,1,0.20,100,90}, -- Stretch
{410,4,1,0.20,100,40}, -- Manana
{411,4,1,0.20,100,40}, -- Infernus
{412,4,1,0.20,100,40}, -- Voodoo
{413,4,1,0.20,100,120}, -- Pony
{414,4,1,0.20,100,140}, -- Mule
{415,4,1,0.20,100,50}, -- Cheetah
{416,4,1,0.20,100,110}, -- Ambulance
{417,0,1,0.90,100,200}, -- Leviathan
{418,4,1,0.20,100,100}, -- Moonbeam
{419,4,1,0.20,100,40}, -- Esperanto
{420,4,1,0.20,100,50}, -- Taxi
{421,4,1,0.20,100,50}, -- Washington
{422,4,1,0.20,100,60}, -- Bobcat
{423,4,1,0.20,100,90}, -- Mr Whoopee
{424,4,1,0.20,100,30}, -- BF Injection
{425,0,1,0.50,100,20}, -- Hunter
{426,4,1,0.20,100,50}, -- Premier
{427,4,1,0.30,100,100}, -- Enforcer
{428,4,1,0.30,100,100}, -- Securicar
{429,4,1,0.20,100,40}, -- Banshee
{430,0,1,0.30,100,70}, -- Predator
{431,6,1,0.50,100,180}, -- Bus
{432,6,3,0.70,100,90}, -- Rhino
{433,6,1,0.50,100,150}, -- Barracks
{434,4,1,0.25,100,40}, -- Hotknife
{437,6,1,0.30,100,100}, -- Coach
{438,4,1,0.20,100,50}, -- Cabbie
{439,4,1,0.20,100,40}, -- Stallion
{440,4,1,0.30,100,90}, -- Rumpo
{442,4,1,0.25,100,80}, -- Romero
{443,4,1,0.50,100,90}, -- Packer
{444,4,1,0.40,100,90}, -- Monster
{445,4,1,0.20,100,50}, -- Admiral
{446,0,1,0.30,100,60}, -- Squallo
{447,0,1,0.30,100,70}, -- Seasparrow
{448,2,1,0.15,100,8}, -- Pizzaboy
{451,4,1,0.25,100,40}, -- Turismo
{452,0,1,0.35,100,50}, -- Speeder
{453,0,1,0.45,100,60}, -- Reefer
{454,0,1,0.45,100,100}, -- Tropic
{455,6,1,0.35,100,150}, -- Flatbed
{456,4,1,0.35,100,160}, -- Yankee
{457,4,1,0.15,100,10}, -- Caddy
{458,4,1,0.20,100,60}, -- Solair
{459,4,1,0.30,100,90}, -- Topfun Van (Berkley's RC)
{460,0,1,0.40,100,30}, -- Skimmer
{461,2,1,0.20,100,15}, -- PCJ-600
{462,2,1,0.15,100,8}, -- Faggio
{463,2,1,0.20,100,15}, -- Freeway
{466,4,1,0.20,100,60}, -- Glendale
{467,4,1,0.20,100,60}, -- Oceanic
{468,2,1,0.25,100,8}, -- Sanchez
{469,0,1,0.30,100,40}, -- Sparrow
{470,4,1,0.30,100,80}, -- Patriot
{471,4,1,0.15,100,20}, -- Quad
{472,0,1,0.30,100,60}, -- Coastguard
{473,0,1,0.30,100,60}, -- Dinghy
{474,4,1,0.20,100,40}, -- Hermes
{475,4,1,0.20,100,50}, -- Sabre
{476,0,1,0.30,100,10}, -- Rustler
{477,4,1,0.20,100,30}, -- ZR-350
{478,4,1,0.20,100,70}, -- Walton
{479,4,1,0.20,100,80}, -- Regina
{480,4,1,0.20,100,50}, -- Comet
{481,2,0,0,4}, -- BMX
{482,4,1,0.30,100,90}, -- Burrito
{483,4,1,0.30,100,80}, -- Camper
{484,0,1,0.30,100,90}, -- Marquis
{485,4,1,0.30,100,10}, -- Baggage
{486,4,2,0.50,100,10}, -- Dozer
{487,0,1,0.20,100,40}, -- Maverick
{488,0,1,0.20,100,40}, -- SAN News Maverick
{489,4,1,0.25,100,80}, -- Rancher
{490,4,1,0.25,100,80}, -- FBI Rancher
{491,4,1,0.25,100,40}, -- Virgo
{492,4,1,0.25,100,50}, -- Greenwood
{493,4,1,0.25,100,40}, -- Jetmax
{494,4,1,0.25,100,30}, -- Hotring Racer
{495,4,1,0.25,100,70}, -- Sandking
{496,4,1,0.25,100,40}, -- Blista Compact
{497,0,1,0.35,100,60}, -- Police Maverick
{498,4,1,0.35,100,110}, -- Boxville
{499,4,1,0.25,100,90}, -- Benson
{500,4,1,0.25,100,60}, -- Mesa
{502,4,1,0.25,100,30}, -- Hotring Racer
{503,4,1,0.25,100,30}, -- Hotring Racer 2
{504,4,1,0.25,100,30}, -- Bloodring Banger
{505,4,1,0.25,100,70}, -- Rancher
{506,4,1,0.25,100,30}, -- Super GT
{507,4,1,0.25,100,40}, -- Elegant
{508,4,1,0.25,100,90}, -- Journey
{509,0,0,0,0,4}, -- Bike
{510,0,0,0,0,4}, -- Mountain Bike
{511,0,1,0.25,100,70}, -- Beagle
{512,0,1,0.25,100,40}, -- Cropduster
{513,0,1,0.25,100,30}, -- Stuntplane
{514,6,1,0.50,100,50}, -- Tanker
{515,6,1,0.50,100,60}, -- Roadtrain
{516,4,1,0.25,100,50}, -- Nebula
{517,4,1,0.25,100,50}, -- Majestic
{518,4,1,0.25,100,50}, -- Buccaneer
{519,0,1,0.25,100,40}, -- Shamal
{520,0,1,0.50,100,20}, -- Hydra
{521,2,1,0.50,100,15}, -- FCR-900
{522,2,1,0.50,100,15}, -- NRG-500
{523,2,1,0.50,100,30}, -- HPV1000
{524,6,1,0.25,100,100}, -- Cement Truck
{525,4,1,0.25,100,40}, -- Towtruck
{526,4,1,0.25,100,40}, -- Fortune
{527,4,1,0.25,100,40}, -- Cadrona
{528,4,1,0.25,100,60}, -- FBI Truck
{529,4,1,0.25,100,50}, -- Willard
{530,4,1,0.25,100,15}, -- Forklift
{531,4,1,0.25,100,20}, -- Tractor
{532,4,1,0.25,100,20}, -- Combine Harvester
{533,4,1,0.25,100,40}, -- Feltzer
{534,4,1,0.25,100,50}, -- Remington
{535,4,1,0.25,100,60}, -- Slamvan
{536,4,1,0.25,100,50}, -- Blade
{539,4,1,0.25,100,30}, -- Vortex
{540,4,1,0.25,100,60}, -- Vincent
{541,4,1,0.25,100,40}, -- Bullet
{542,4,1,0.25,100,50}, -- Clover
{543,4,1,0.25,100,60}, -- Sadler
{544,4,1,0.25,100,100}, -- Firetruck LA
{545,4,1,0.25,100,40}, -- Hustler
{546,4,1,0.25,100,50}, -- Intruder
{547,4,1,0.25,100,50}, -- Primo
{548,0,1,0.50,100,150}, -- Cargobob
{549,4,1,0.25,100,50}, -- Tampa
{550,4,1,0.25,100,50}, -- Sunrise
{551,4,1,0.25,100,50}, -- Merit
{552,4,1,0.25,100,70}, -- Utility Van
{553,4,1,0.25,100,90}, -- Nevada
{554,4,1,0.25,100,90}, -- Yosemite
{555,4,1,0.25,100,50}, -- Windsor
{556,4,1,0.25,100,60}, -- Monster "A"
{557,4,1,0.25,100,50}, -- Monster "B"
{558,4,1,0.25,100,50}, -- Uranus
{559,4,1,0.25,100,50}, -- Uranus
{560,4,1,0.25,100,50}, -- Sultan
{561,4,1,0.25,100,60}, -- Stratum
{562,4,1,0.25,100,50}, -- Elegy
{563,0,1,0.25,100,70}, -- Raindance
{565,4,1,0.25,100,60}, -- Flash
{566,4,1,0.25,100,50}, -- Tahoma
{567,4,1,0.25,100,50}, -- Savanna
{568,4,1,0.25,100,40}, -- Bandito
{571,4,1,0.25,100,10}, -- Kart
{572,4,1,0.25,100,10}, -- Mower
{573,4,1,0.25,100,100}, -- Dune
{574,4,1,0.25,100,10}, -- Sweeper
{575,4,1,0.25,100,50}, -- Broadway
{576,4,1,0.25,100,50}, -- Tornado
{577,0,1,0.50,100,300}, -- AT400
{578,4,1,0.25,100,150}, -- DFT-30
{579,4,1,0.25,100,70}, -- Huntley
{580,4,1,0.25,100,50}, -- Stafford
{581,2,1,0.25,100,15}, -- BF-400
{582,4,1,0.25,100,90}, -- Newsvan
{583,4,1,0.25,100,20}, -- Tug
{585,4,1,0.25,100,40}, -- Emperor
{586,4,1,0.25,100,30}, -- Wayfarer
{587,4,1,0.25,100,50}, -- Euros
{588,4,1,0.25,100,70}, -- Hotdog
{588,4,1,0.25,100,50}, -- Club
{592,4,1,0.25,100,200}, -- Andromada
{593,0,1,0.25,100,40}, -- Dodo
{595,4,1,0.25,100,50}, -- Launch
{596,4,1,0.25,100,50}, -- Police Car (LSPD)
{597,4,1,0.25,100,50}, -- Police Car (SFPD)
{598,4,1,0.25,100,50}, -- Police Car (LVPD)
{599,4,1,0.25,100,80}, -- Police Ranger
{600,4,1,0.25,100,70}, -- Picador
{601,4,1,0.25,100,90}, -- S.W.A.T.
{602,4,1,0.25,100,50}, -- Alpha
{603,4,1,0.25,100,30}, -- Phoenix
{604,4,1,0.25,100,50}, -- Glendale Shit
{605,4,1,0.25,100,50}, -- Sadler Shit
{609,4,1,0.25,100,100} -- Boxville
}

function GetRealVehicleName (theElement)
local id =0;
if isElement(theElement) then
id = getElementModel  ( theElement )
else
id = theElement
end
if id == 417 then
return "UH-60 Black Hawk"
elseif id == 488 then
return "Helicóptero turístico"
elseif id == 490 then
return "Chevrolet Suburban FBI"
elseif id == 463 then
return "Zombie chopper"
elseif id == 422 then
return "Lada Niva 4x4"
elseif id == 470 then
return "Hummer H1"
elseif id == 542 then
return "Dodge Challenger 1971"
elseif id == 433 then
return "AM General М-939A2"
elseif id == 487 then
return "Robinson R44 Raven II NC"
elseif id == 497 then
return "Police Maverick"
elseif id == 424 then
return "Ford Mustang Sandroadster"
elseif id == 528 then
return "Oshkosh Sand Cat GNB"
elseif id == 402 then
return "Chevrolet Camaro IROC-Z 1990" -- новая
elseif id == 519 then
return "Shamal"
elseif id == 541 then
return "Vapid Bullet"
elseif id == 602 then
return "Chevrolet Camaro SS 1968"
elseif id == 603 then
return "Phoenix"
elseif id == 453 then
return "Reefer"
elseif id == 516 then
return "Mitsubishi Lancer Evolution IX"
elseif id == 584 then
return "Combustível"
elseif id == 591 then
return "Прицеп"
elseif id == 403 then
return "Kenworth W 900L"

elseif id == 461 then
return "Bati MIX"
elseif id == 504 then
return "Honda Civic Si 2012"
elseif id == 416 then
return "Ambulance"
elseif id == 601 then
return "БРДМ 2"
elseif id == 536 then
return "Pontiac Firebird Trans Am 1980"
elseif id == 468 then
return "Kawasaki 150 SE"
elseif id == 471 then
return "ATV 50"
elseif id == 500 then
return "Jeep Wrangler 1986"
elseif id == 469 then
return "MBB Bo-105"
elseif id == 447 then
return "Robinson R44 Clipper"
elseif id == 563 then
return "MH-X Silenthawk"
elseif id == 428 then
return "Frontline"
elseif id == 596 then
return "Annis Elegy Police"
elseif id == 481 then
return "BMX"
elseif id == 509 then
return "Bike"
elseif id == 510 then
return "Mountain Bike"
elseif id == 411 then
return "Nissan GTR R35"
elseif id == 560 then
return "Mitsubishi Lancer Evolution"
elseif id == 434 then
return "Ford Mustang 1967"

elseif id == 569 then
return "Военный поезд"
elseif id == 537 then
return "Военный поезд"




else
return false
end
end