local lodDistance = 30
local items = {
-- model, txd,dff,col,distance 
{343,"gas.txd","gas.dff",false,lodDistance},
{1277,"map.txd","map.dff",false,lodDistance},
{1213,"sniper_clothes.txd","sniper_clothes.dff",false,lodDistance},
{2601,"beans_can.txd","beans_can.dff",false,lodDistance},
{2891,"first_aid_kit.txd","first_aid_kit.dff",false,lodDistance},
{1576,"heat_pack.txd","heat_pack.dff",false,lodDistance},
{2709,"pain_killers.txd","pain_killers.dff",false,lodDistance},
{2770,"pasta_can.txd","pasta_can.dff",false,lodDistance},
{3013,"pistol_ammo.txd","pistol_ammo.dff",false,lodDistance},
{2358,"shotgun_ammo.txd","shotgun_ammo.dff",false,lodDistance},
{3026,"backpack_small.txd","backpack_small.dff",false,lodDistance}, -- сатурн 20 
{1921,"sniper_ammo.txd","sniper_ammo.dff",false,lodDistance},
{2647,"soda_can.txd","soda_can.dff",false,lodDistance},
{2683,"water_bottle.txd","water_bottle.dff",false,lodDistance},
{14785,"BT.txd","BT.dff","BT.col",lodDistance},
{1271,"assault_ammo.txd","assault_ammo.dff",false,lodDistance},
{1248,"backpack_alice.txd","backpack_alice.dff",false,lodDistance}, -- абрис 60
{1252,"backpack_coyote.txd","backpack_coyote.dff",false,lodDistance}, -- коммандер 80
{2405,"backpack_survival.txd","backpack_survival.dff",false,lodDistance}, -- штурмовой 40
{1640,"backpack_vega.txd","backpack_vega.dff",false,lodDistance}, -- ВОЕННЫЙ 180
{1641,"backpack_army.txd","backpack_army.dff",false,lodDistance},
{2410,"backpack_br.txd","backpack_br.dff",false,lodDistance}, -- КОЛОРАДО 120
{953,"backpack.txd","backpack.dff",false,lodDistance},  -- СЛЕДОПЫТ 100
{1602,"backpack_mega.txd","backpack_mega.dff",false,lodDistance}, -- ФАРАОН 200
{1575,"backpack_czech.txd","backpack_czech.dff",false,lodDistance}, -- САМУРАЙ 160
{3243,"tent.txd","tent.dff","tent.col",lodDistance},
{983,"wirefence.txd","wirefence.dff",false,lodDistance},
{2710,"watch.txd","watch.dff",false,lodDistance},
{2969,"Toolbox.txd","Toolbox.dff",false,lodDistance},
{368,"NVGoggles.txd","NVGoggles.dff",false,lodDistance},
{2806,"CookedMeat.txd","CookedMeat.dff",false,lodDistance},
{2804,"RawMeat.txd","RawMeat.dff",false,lodDistance},
{2856,"Soda_coke.txd","Soda_coke.dff",false,lodDistance},
{1578,"bandage.txd","bandage.dff",false,lodDistance},
{1580,"blood_bag.txd","blood_bag.dff",false,lodDistance},
{1579,"morphine.txd","morphine.dff",false,lodDistance},
{1463,"Wood_Pile.txd","Wood_Pile.dff",false,lodDistance},
{1279,"Camping_Tent.txd","Camping_Tent.dff",false,lodDistance}, -- Tenda
{1073,"Tire.txd","Tire.dff",false,lodDistance},
{929,"Engine.txd","Engine.dff",false,lodDistance},
{1650,"Jerry_Can.txd","Jerry_Can.dff",false,lodDistance},
{1908,"money.txd","money.dff",false,lodDistance},
{1906,"shovel.txd","shovel.dff",false,lodDistance},
{1862,"mine.txd","mine.dff","mine.col",lodDistance},
{1876,"sandbags.txd","sandbags_pol.dff",false,lodDistance},
{1875,"sandbags.txd","sandbags.dff","sandbags.col",lodDistance},
{1907,"save.txd","save.dff","save.col",lodDistance},
{1548,"1548.txd","1548.dff",false,lodDistance}, -- Saco de Peças de Zumbi
{1956,"1956.txd","1956.dff",false,lodDistance}, -- Ração Seca Pequena
{2778,"1956.txd","3437.dff",false,lodDistance}, -- Ração Seca Grande
{1952,"1952.txd","1952.dff",false,lodDistance}, -- Mangueira
{1485,"1485.txd","1485.dff",false,lodDistance},
{1545,"1485.txd","1545.dff",false,lodDistance}, -- Vara de Pesca
{1512,"1512.txd","1512.dff",false,lodDistance}, -- Peixe Cru
{1517,"1512.txd","1517.dff",false,lodDistance}, -- Peixe Frito
{2392,"2392.txd","2392.dff","2392.col",lodDistance}, -- 
{2704,"2704.txd","2704.dff","2704.col",lodDistance}, -- Placa de Metal 1
{2705,"2705.txd","2705.dff","2705.col",lodDistance}, -- Placa de Metal 2
{2394,"2394.txd","2394.dff",false,70}, -- Capacete Militar 50%
{2396,"2396.txd","2396.dff",false,70}, -- Colete 10%
{936,"936.txd","936.dff",false,70}, -- Colete 30%
{1755,"1755.txd","1755.dff",false,70}, -- Capacete de Motocicleta 10%
{2015,"2015.txd","2015.dff",false,70}, -- Máscara de Soldador 10%
{2016,"2016.txd","2016.dff",false,70}, -- Capacete de Mineiro 5%
{2018,"2018.txd","2018.dff",false,70},  -- Capacete Blindado 70%
{2019,"2019.txd","2019.dff",false,70}, -- Capacete Blindado 80%
{2020,"2020.txd","2020.dff",false,70} -- Colete 20%
}

local guns = {
{360,"heatseek.txd","heatseek.dff",false,70},
{339,"katana.txd","katana.dff",false,70},
{335,"knife.txd","knife.dff",false,70},
{333,"golfclub.txd","golfclub.dff",false,70},
{336,"bat.txd","bat.dff",false,70},
{337,"shovel.txd","shovel.dff",false,70},
{342,"grenade.txd","grenade.dff",false,70},
{367,"camera.txd","camera.dff",false,70}
}

function replaceModel() 

-- 1247
-- 1577
-- 2041



	for i,item in ipairs(items) do

		local txd = engineLoadTXD ( "items/"..item[2] )
		engineImportTXD ( txd, item[1] )
				
		local dff = engineLoadDFF ( "items/"..item[3], item[1] )
		engineReplaceModel ( dff, item[1] )
		
		if item[4] then
			local col = engineLoadCOL ( "items/"..item[4] )
			engineReplaceCOL ( col, item[1] )
		end
		
		if item[5] then
			engineSetModelLODDistance(item[1], item[5]) 
		end
	end

		for i,item in ipairs(guns) do

		local txd = engineLoadTXD ( "guns/"..item[2] )
		engineImportTXD ( txd, item[1] )
				
		local dff = engineLoadDFF ( "guns/"..item[3], item[1] )
		engineReplaceModel ( dff, item[1] )
		
		if item[4] then
			local col = engineLoadCOL ( "guns/"..item[4] )
			engineReplaceCOL ( col, item[1] )
		end
		
		if item[5] then
			engineSetModelLODDistance(item[1], item[5]) 
		end
	end




	
		end
		addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)
		
		
function testlod(command, params)

for i,item in ipairs(items) do


			engineSetModelLODDistance(item[1], params) 
	end
	
	
outputChatBox(params)
end

addCommandHandler ( "testlod", testlod )


