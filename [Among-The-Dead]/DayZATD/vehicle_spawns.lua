

local heliCrashSites = gameplayVariables["helicrashsides"]
local airCrashSites = gameplayVariables["aircrashsides"]

local newCarSpawns = gameplayVariables["newCarSpawns"]
local carSpawns = gameplayVariables["carSpawns"]

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2],veh[3], veh[4],veh[5],veh[6]
		end
	end
end

local tableYashiks ={}
function addLootToTrain()
for i,yash in ipairs(tableYashiks) do
if yash and isElement(yash) then
local parent = getElementData(yash,"parent") or false
if isElement(parent) then
destroyElement(parent)
end
destroyElement(yash)
end
end
tableYashiks={}

for i,data in ipairs(YashikLoot["POSITIONS"]) do

local randomRoot = math.random(0,360)
local yashik = createObject(data[1],data[2],data[3],data[4]-1,0,0,randomRoot,nil,nil,nil)
local col= createColSphere(data[2],data[3],data[4]-1,2) -- ящик

setElementParent(yashik,militaryBoxs)
setElementParent(col,yashik)

table.insert(tableYashiks,yashik)
		setElementData(col,"parent",yashik) --client
		setElementData(yashik,"parent",col) --client
		setElementData(col,"Yashik",true) --client
		setElementData(col,"MAX_Slots",0) --client
		if data[1] == 3016 then
			local gaussMag = math.random(0,10)
			setElementData(col,"Gauss mag",gaussMag)
		else
			for _,items in ipairs(YashikLoot["LOOT"]) do
				local randomNumber = math.random(1,7)
				if randomNumber == 2 then
					setElementData(col,items[1],items[2]) --client
				end
			end
		end
end
setTimer(addLootToTrain,3600000,1) -- 3600000
end	
addLootToTrain()


function svpNewCar(ps,command)
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin"))
if isAdmin then
local ticksOfStartSpawn = getTickCount ()
local vehicleManager = getAccount("vehicleManagerATD","23g2g23g23g23g")		
counter = getAccountData(vehicleManager,"vehicleamount") or false



	for i,veh in ipairs(newCarSpawns) do
		local vehid,x,y,z = veh[1],veh[2],veh[3],veh[4]
		local veh = createVehicle(vehid,x,y,z+0.1)
		local vehCol = createColSphere(x,y,z,4)
		
		setElementParent(veh,vehs)
		setElementParent(vehCol,veh)
		
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh) --client
		setElementData(veh,"parent",vehCol) --client
		setElementData(vehCol,"vehicle",true) --client
		

		local tires,engine,expenFuel,maxFuel,maxSlots = getVehicleAddonInfos (vehid)
		
		setElementData(vehCol,"MAX_Slots",maxSlots) --client
		local tiresRandom=math.random(0,tires)
		setElementData(vehCol,"Pneu_inVehicle",tonumber(tiresRandom)) --client
		setElementData(vehCol,"Motor_inVehicle",math.random(0,engine)) --client
		setElementData(vehCol,"spawn",{vehid,x,y,z})
		setElementData(vehCol,"fuel",5) --client
		setElementData(veh,"maxfuel",tonumber(maxFuel))
		setElementData(veh,"expenFuel",tonumber(expenFuel))
		setElementData(veh,"needtires",tonumber(tires))
		setElementData(veh,"needengines",tonumber(engine))
		triggerEvent ( "setWheelStates", getRootElement(), veh,tonumber(tiresRandom),"-" )
		counter = counter +1
		triggerEvent("SaveVeh",getRootElement(),veh,counter)
	end
	
local ticksOfStopSpawn = getTickCount ()
outputChatBox("Новые транспортные средства были созданы за:"..(ticksOfStopSpawn-ticksOfStartSpawn).."ms")
	end


end
addCommandHandler("svpnew1y8f9guivjiohnwfui",svpNewCar)




function spawnDayZVehicles(ps,command)
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin"))
if isAdmin then
counter = 0
local ticksOfStartSpawn = getTickCount ()
for i,veh in ipairs(carSpawns) do
		local vehid,x,y,z = veh[1],veh[2],veh[3],veh[4]
		local veh = createVehicle(vehid,x,y,z+0.1)
		local vehCol = createColSphere(x,y,z,4)
		
		setElementParent(veh,vehs)
		setElementParent(vehCol,veh)
		
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh) --client
		setElementData(veh,"parent",vehCol) --client
		setElementData(vehCol,"vehicle",true) --client
		

		local tires,engine,expenFuel,maxFuel,maxSlots = getVehicleAddonInfos (vehid)
		
		setElementData(vehCol,"MAX_Slots",maxSlots) --client
		local tiresRandom=math.random(0,tires)
		setElementData(vehCol,"Pneu_inVehicle",tonumber(tiresRandom)) --client
		setElementData(vehCol,"Motor_inVehicle",math.random(0,engine)) --client
		setElementData(vehCol,"spawn",{vehid,x,y,z})
		setElementData(vehCol,"fuel",5) --client
		setElementData(veh,"maxfuel",tonumber(maxFuel))
		setElementData(veh,"expenFuel",tonumber(expenFuel))
		setElementData(veh,"needtires",tonumber(tires))
		setElementData(veh,"needengines",tonumber(engine))
		triggerEvent ( "setWheelStates", getRootElement(), veh,tonumber(tiresRandom),"-" )
		counter = counter +1
		triggerEvent("SaveVeh",getRootElement(),veh,counter)
	end
local ticksOfStopSpawn = getTickCount ()
outputChatBox("Транспортные средства были созданы за:"..(ticksOfStopSpawn-ticksOfStartSpawn).."ms")
end	

end
addCommandHandler("fpgk9305uh829pj32",spawnDayZVehicles)



local hospitalPacks = {

{-2637.0556640625,635.03125,14.453125},
{-1513.888671875,2519.5908203125,56.064819335938},
{2022.1650390625,-1402.6806640625,17.18045425415},
{-316.5478515625,1051.6494140625,20.340259552002},
{-331.5849609375,1046.037109375,26.012474060059},
{1171.490234375,-1310.560546875,13.986573219299},
{1158.5048828125,-1326.333984375,31.503561019897},
{1238.7119140625,328.2431640625,19.7555103302},
{-2204.07421875,-2309.58203125,31.375},
{1601.9443359375,1816.736328125,10.8203125},
{1607.3232421875,1776.7412109375,37.3125},
{2116.12890625,925.7705078125,10.9609375},

}

local patrolPoints = {

{-1603.2197265625,-2712.736328125,48.9453125},
{2465.748046875,-2215.55859375,13.546875},
{2473.439453125,-2215.56640625,13.546875},
{2480.0732421875,-2216.140625,13.546875},
{2487.24609375,-2215.5966796875,13.546875},
{2494.1005859375,-2215.5859375,13.546875},
{-1686.6728515625,408.9970703125,7.3984375},
{-1682.34375,412.9384765625,7.3984375},
{-1680.0263671875,402.3642578125,7.3984375},
{-1675.84375,406.4677734375,7.3984375},
{-1670.5615234375,411.8359375,7.3984375},
{-1666.2392578125,416.2509765625,7.3984375},
{-1672.7939453125,422.81640625,7.3984375},
{-1677.20703125,418.46484375,7.3984375},
{-2410.7021484375,969.9091796875,45.4609375},
{-2410.744140625,975.220703125,45.4609375},
{-2410.837890625,980.5302734375,45.4609375},
{-1329.3046875,2668.5126953125,50.46875},
{-1328.7314453125,2673.90625,50.0625},
{-1327.0185546875,2679.3876953125,50.46875},
{-1327.3798828125,2684.62890625,50.0625},
{1940.7099609375,-1778.5244140625,13.390598297119},
{1940.6552734375,-1774.908203125,13.390598297119},
{1940.630859375,-1771.728515625,13.390598297119},
{1940.7080078125,-1767.3837890625,13.390598297119},
{-1477.921875,1868.138671875,32.639846801758},
{-1466.1552734375,1869.0048828125,32.6328125},
{-1464.5224609375,1861.3828125,32.639846801758},
{-1477.4599609375,1860.5205078125,32.6328125},
{-735.9208984375,2744.0087890625,47.2265625},
{-739.0439453125,2744.2421875,47.165451049805},
{377.6953125,2601.1083984375,16.484375},
{624.5263671875,1676.25390625,6.9921875},
{620.2958984375,1681.2431640625,6.9921875},
{616.248046875,1686.4169921875,7.1875},
{612.783203125,1691.1650390625,7.1875},
{609.2060546875,1696.201171875,7.1875},
{605.8505859375,1700.978515625,7.1875},
{602.27734375,1706.3603515625,7.1875},
{2141.037109375,2742.734375,10.960174560547},
{2142.3115234375,2752.6982421875,10.96019744873},
{2147.9521484375,2752.3203125,10.8203125},
{2152.60546875,2751.953125,10.8203125},
{2152.984375,2743.85546875,10.8203125},
{2147.75,2743.7392578125,10.8203125},
{-97.6298828125,-1175.0283203125,2.4990689754486},
{-90.74609375,-1177.853515625,2.2021217346191},
{-84.75390625,-1163.853515625,2.3359375},
{-91.5771484375,-1160.5732421875,2.4453125},
{-1606.525390625,-2717.2138671875,48.9453125},
{-1609.7109375,-2721.544921875,48.9453125},
{-1599.83203125,-2708.302734375,48.9453125},
{-2246.314453125,-2558.8212890625,32.0703125},
{-2241.3125,-2561.3662109375,32.0703125},
{-1132.2880859375,-135.0986328125,14.14396572113},
{-1153.529296875,-156.373046875,14.1484375},
{-1142.826171875,-145.67578125,14.14396572113},
{655.611328125,-557.9912109375,16.501491546631},
{655.6572265625,-572.1728515625,16.501491546631},
{1601.791015625,2203.90625,11.060997009277},
{1596.806640625,2203.4345703125,10.8203125},
{1590.197265625,2203.4853515625,10.8203125},
{1589.4775390625,2195.43359375,10.8203125},
{1596.125,2194.294921875,10.8203125},
{1601.6591796875,2194.3369140625,10.8203125},
{2206.8466796875,2470.47265625,10.8203125},
{2206.94140625,2474.75,10.8203125},
{2206.9267578125,2478.86328125,10.8203125},
{2198.06640625,2480.6953125,10.8203125},
{2197.541015625,2475.791015625,10.995170593262},
{2197.609375,2471.9169921875,10.995170593262},
{2120.8251953125,915.4833984375,10.8203125},
{2115.1181640625,915.44140625,10.8203125},
{2109.076171875,915.4228515625,10.8203125},
{2109.22265625,924.8779296875,10.9609375},
{2114.9404296875,924.8857421875,10.9609375},
{2119.5126953125,925.2861328125,10.9609375},
{2645.7197265625,1112.7802734375,10.8203125},
{2639.984375,1112.56640625,10.8203125},
{2634.828125,1112.3466796875,10.9609375},
{2634.1826171875,1101.9482421875,10.8203125},
{2639.8884277344,1101.5539550781,10.9609375},
{2645.1611328125,1101.5494384766,10.9609375},

{1005.078125,-901.7490234375,42.216625213623},
{993.025390625,-902.474609375,42.222496032715},
}

local water ={
{786.48419189453,2352.3625488281,12.441215515137},
{-2434.1694335938,-636.17175292969,132.90942382813},
{-205.04200744629,-1509.3043212891,8.403904914856},
{636.47668457031,-607.86260986328,16.3359375},
}

local lootItems = {
["helicrashsides"] = {
{"Garrafa de Água Vazia",2683,1.5,0,2}, 
{"Cofre",1907,1,0,1,-0.350},
--{"Mina",1862,2,0,0.8},
{"Sinal de Fogo",324,1,90,1},
{"Ôculos de Visão Noturna",368,1,90,6},
{"Binóculos",369,1,0,2},
{"Ôculos de Infravermelho",369,1,90,2},
{"Walkie-Talkie",2966,1,0,1},
{"Sacos de Areia",1876,1,0,0.5,0.100},



{"AK-107 PSO",1832,1,90,0.2},

{"ВСС Vintorez",1922,1,90,0.04},
{"M4A1",2785,1,90,01},
{"M4A1 SD",2481,1,90,01},

{"AKS (gold)",1837,1,90,0.1},
{"AKS-74 Kobra",1838,1,90,0.2},
{"AKS-74 PSO",1851,1,90,0.2},
{"AKS-74U",1852,1,90,0.2},
{"FN SCAR",1854,1,90,0.3},

{"G36C-SD",1861,1,90,0.2},
{"G36K",1863,1,90,0.2},
{"M240",1870,1,90,0.001},
{"M249 Saw",1871,1,90,0.001},
{"MG36",1872,1,90,0.001},
{"Mk 48 Mod 0",1873,1,90,0.001},
{"PKM",1874,1,90,0.001},
{"PKP",1877,1,90,0.001},

{"M9 SD",1881,1,90,1},
{"M1014",1905,1,90,1},
{"Saiga 12K",1911,1,90,0.3},
{"AS50",1915,1,90,0.01},
{"KSVK",1919,1,90,0.005},
{"M107",1920,1,90,0.05},
{"M24 (desert)",1924,1,90,0.1},
{"M40A3",1925,1,90,0.1},
{"SVD Camo",1926,1,90,0.1},
{"Mochila de Explorador 100",953,1,0,0.2},
{"Mochila do Colorado 120",2410,1,0,0.1},
{"Mochila Brasileira 140",1641,1,0,0.08},


{"Capacete Militar 50%",2394,1,0,0.1,0.7},
{"Capacete Blindado 70%",2018,1,0,0.1,0.7},
{"Capacete Blindado 80%",2019,1,0,0.05,0.7},
{"Colete 20%",2020,1,90,0.1,0,50},

{"Ração Seca Grande",2778,1,0,0.5},
{"Ração Seca Pequena",1956,1,0,1},
},

["hospital"] = {
{"Kit de Primeiros Socorros",2891,0.7,0},
--{"Pacote de Calor",1576,1,0},
{"Ataduras",1578,0.5,0},
{"Bolsa de Sangue",1580,1,0},
{"Morfina",1579,1,0},
{"Antibiótico",1579,1,0},
{"Bolsa de Sangue",1580,1,0},
{"Kit de Primeiros Socorros",2891,0.7,0},
{"Bolsa de Sangue",1580,1,0},
{"Analgésico",1580,1,0},
},
}


for i,water in ipairs(water) do
	local x,y,z = water[1],water[2],water[3]
	waterCol = createColSphere(x,y,z,3)
	setElementParent(waterCol,waterBoxs)
	setElementData(waterCol,"water",true) --client
end
local cargobob
local cargoCol
function createHeliCrashSite()
	if cargoCol then
		destroyElement(getElementData(cargoCol,"parent"))
		destroyElement(cargoCol)
	end
	local item_id = math.random(table.size(heliCrashSites))
	local x,y,z = heliCrashSites[item_id][2],heliCrashSites[item_id][3],heliCrashSites[item_id][4]
	 cargobob = createObject ( 14540, x,y,z-0.5 ) 
	 cargoCol = createColSphere(x,y,z,4)
	
	setElementParent(cargobob,heliCrashs)
	setElementParent(cargoCol,cargobob)
	
	setElementData(cargoCol,"parent",cargobob) --client
	setElementData(cargoCol,"helicrash",true)  --client
	setElementData(cargoCol,"MAX_Slots",0) --client
	for i, item in ipairs(lootItems["helicrashsides"]) do
		local value =  math.percentChance (item[5]*30)
		if value > 0 then
			setElementData(cargoCol,item[1],value) --client
		end
		--weapon Ammo
		local ammoData,weapID = getWeaponAmmoType (item[1],true)
		if ammoData and value > 0 then
			setElementData(cargoCol,ammoData,math.random(100,200)) --client
		end
	end
	outputChatBox("В квадрате "..heliCrashSites[item_id][1].." разбился военный вертолет", getRootElement(), 255, 0, 0)
	setTimer(createHeliCrashSite,3600000,1)
end
createHeliCrashSite()

local air 
local airCol
function createCrashAirSite()
	if airCol then
		destroyElement(getElementData(airCol,"parent"))
		destroyElement(airCol)
	end
	local item_id = math.random(table.size(airCrashSites))
	local x,y,z = airCrashSites[item_id][2],airCrashSites[item_id][3],airCrashSites[item_id][4]
	 air = createObject ( 2480, x,y,z-1 ) 
	 airCol = createColSphere(x,y,z,4)
	
	setElementParent(air,heliCrashs)
	setElementParent(airCol,air)
	
	setElementData(airCol,"parent",air) --client
	setElementData(airCol,"aircrash",true)  --client
	setElementData(airCol,"MAX_Slots",0) --client
	for i, item in ipairs(lootItems["helicrashsides"]) do
		local value =  math.percentChance (item[5]*50)
		if value > 0 then 
		setElementData(airCol,item[1],value) --client
		end
		--weapon Ammo
		local ammoData,weapID = getWeaponAmmoType (item[1],true)
		if ammoData and value > 0 then
			setElementData(airCol,ammoData,math.random(100,200)) --client
		end
	end
	outputChatBox("В квадрате "..airCrashSites[item_id][1].." разбился военный самолет", getRootElement(), 255, 0, 0)
	setTimer(createCrashAirSite,7200000,1)
end
createCrashAirSite()

local hospitalCol = {}
function updateHospitals ()
	for i,box in pairs(hospitalCol) do
		for _,items in ipairs(lootItems["hospital"]) do
			setElementData(hospitalCol[i],items[1],math.random(1,2)) --client
		end
	end
	setTimer(updateHospitals,3600000,1)
end


function createHospitalPacks()
	number1 = 0
	for i,box in ipairs(hospitalPacks) do
		number1 = number1+1
		local x,y,z = box[1],box[2],box[3]
		local object = createObject(1558,x,y,z,nil,nil,nil)
		hospitalCol[i] = createColSphere(x,y,z,2)
		
		setElementParent(object,hospitalBoxs)
		setElementParent(hospitalCol[i],object)
		
		setElementData(hospitalCol[i],"parent",object) --client
		setElementData(hospitalCol[i],"hospitalbox",true) --client
		setElementData(hospitalCol[i],"MAX_Slots",20) --client
		for _,items in ipairs(lootItems["hospital"]) do
			local randomNumber = math.random(1,10)
			if randomNumber >= 2 then
				setElementData(hospitalCol[i],items[1],math.random(1,5)) --client
			end
		end	
	end
	setTimer(updateHospitals,3600000,1)
end
createHospitalPacks()


--[[
for i,tree in ipairs(pickupPositions["tree"]) do
	local x,y,z = tree[1],tree[2],tree[3]
	patrolCol = createColSphere(x,y,z+1,2)
	setElementData(patrolCol,"treepos",true) --client
	setElementData(patrolCol,"x",tree[1],false) --client
	setElementData(patrolCol,"y",tree[2],false) --client
	setElementData(patrolCol,"z",tree[3],false) --client
	setElementData(patrolCol,"woods",2,false) --client
end
]]

for i,patrol in ipairs(patrolPoints) do
	local x,y,z = patrol[1],patrol[2],patrol[3]
	local patrolCol = createColSphere(x,y,z,3)
	
	setElementParent(patrolCol,patrolStantions)

	setElementData(patrolCol,"patrolstation",true) --client
end





function notifyAboutExplosion()
	local col = getElementData(source,"parent")
	local x1,y1,z1 = getElementPosition(source)
    setTimer(respawnDayZVehicle,1800000,1,source)
	setElementData(col,"deadVehicle",true) --client
	setElementData(source,"isExploded",true)
	setElementData(source,"removeTimer",false)
	createExplosion (x1+4,y1+1,z1,4)
	createExplosion (x1+2,y1-4,z1,4)
	createExplosion (x1-1,y1+5,z1,4)
	createExplosion (x1-4,y1,z1-2,4)
	
	--triggerEvent("saveVehOnExit",source,false,0,0,source) нельзя сохранять при взрыве, потому что сейчас на большинстве машин записан isExploded
	--- !!! ИСПРАВИТЬ ПРИ ВАЙПЕ ТС
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion)

function respawnVehiclesInWater (vehiclesInWater)
	for i,veh in ipairs(vehiclesInWater) do
		respawnDayZVehicle(veh)
	end
end
addEvent("respawnVehiclesInWater",true)
addEventHandler("respawnVehiclesInWater",getRootElement(),respawnVehiclesInWater)

function checkVehicleInWater ()
	local randomPlayer = getRandomPlayer()
	if randomPlayer then
		triggerClientEvent(randomPlayer,"checkVehicleInWaterClient",randomPlayer)
	end
end
setTimer(checkVehicleInWater,1800000,0)
--1800000

function respawnDayZVehicle(veh)
if not veh then return end
if not isElement(veh) then return end

if getElementData(veh,"kowh") then
local kowh = getElementData(veh,"kowh") or false
detachElements(kowh,veh)
destroyElement(kowh)
 setElementData(veh,"kowh",false)
end
local col = getElementData(veh,"parent")
if  not getElementData(col,"NOCARSPAWN") then

		local counterVeh = getElementData(veh,"counterV") or false
		
if not counterVeh then return end

		
		local id,x,y,z  = getElementData(col,"spawn")[1],getElementData(col,"spawn")[2],getElementData(col,"spawn")[3],getElementData(col,"spawn")[4]
		local needtires,needengines,expenFuel,maxfuel,maxSlots = getVehicleAddonInfos (id)
		
		--local needtires = getElementData(veh,"needtires")
		--local needengines= getElementData(veh,"needengines")
		--local expenFuel = getElementData(veh,"expenFuel") 
		--local maxfuel =	getElementData(veh,"maxfuel")
		--local maxSlots = getElementData(col,"MAX_Slots")
		
		
		
		destroyElement(veh)
		destroyElement(col)
		local veh = createVehicle(id,x,y,z+0.1)
		local vehCol = createColSphere(x,y,z,4)
		
		setElementParent ( veh, vehs )  
		setElementParent ( vehCol, veh ) 
			
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh) --client
		setElementData(veh,"parent",vehCol) --client
		setElementData(veh,"counterV",counterVeh) --client
			if id == 584 then 
			setElementData(vehCol,"patrolstation",true) --client
			else
			setElementData(vehCol,"vehicle",true) --client
			end
		setElementData(vehCol,"MAX_Slots",maxSlots) --client
		
		local randomTires = math.random(0,tonumber(needtires))
		setElementData(vehCol,"Pneu_inVehicle",tonumber(randomTires)) --client
		
		setElementData(vehCol,"Motor_inVehicle",math.random(0,needengines)) --client
		setElementData(veh,"maxfuel",tonumber(maxfuel))
		setElementData(veh,"expenFuel",tonumber(expenFuel))
		setElementData(veh,"needtires",tonumber(needtires))
		setElementData(veh,"needengines",tonumber(needengines))
		setElementData(vehCol,"spawn",{id,x,y,z},false)
		
		
			if id == 601 or id == 490 or id == 528 or id == 470 then
			setElementData(veh,"steelList",math.random(500,1000))
			end
			
		
		triggerEvent ( "setWheelStates", getRootElement(), veh,tonumber(randomTires),"-" )
		--others
		setElementData(vehCol,"fuel",math.random(5,maxfuel)) --client
		

	else
	destroyElement(veh)
		destroyElement(col)
end
		
end
addEvent("respawnDayZVehicle",true)
addEventHandler("respawnDayZVehicle",getRootElement(),respawnDayZVehicle)



function onPlayerEnterDayzVehicle(veh,seat)
	local col = getElementData(veh,"parent")
	 
	local id = getElementModel(veh)
	if not seat == 1 then return end


		local needtires = getElementData(veh,"needtires")
		local needengines= getElementData(veh,"needengines")
		
	
	setVehicleEngineState ( veh, false )
	if ((getElementData(col,"Pneu_inVehicle") or 0) < tonumber(needtires)) then
		setVehicleEngineState ( veh, false )
		
		return	
	end
	if ((getElementData(col,"Motor_inVehicle") or 0) < tonumber(needengines)) then
		setVehicleEngineState ( veh, false )
		
		return
	end
	if (getElementData(col,"fuel") or 0) <= 1 then
	local vehType = getVehicleType ( veh )
	if vehType ~="BMX" then
	triggerClientEvent (source, "displayClientInfo", source,"Veículo","В этом транспортном средстве нет бензина!",22,255,0)
	setVehicleEngineState ( veh, false )
	else
	setVehicleEngineState ( veh, true )
	
	end
			
		
			return

		else
		local vehType = getVehicleType ( veh )
	if vehType =="BMX" then
	setVehicleEngineState ( veh, true )
	end
		setVehicleEngineState ( veh, true )
	end
setElementFrozen(veh,false)
	
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), onPlayerEnterDayzVehicle )

function onPlayerExitDayzVehicle(veh,seat)
	if seat == 0 then
		setVehicleEngineState ( veh, false )
		--unbindKey(source,"k","down",setEngineStateByPlayer)
		if isVehicleOnGround ( veh ) and getVehicleType ( veh ) == "Automobile" then
		setElementFrozen(veh,true)
		end
		
	end	
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), onPlayerExitDayzVehicle )



function setVehiclesFuelPerMinute ()
	for i,veh in ipairs(getElementsByType("vehicle")) do
if getElementModel(veh) == 537 or getElementModel(veh) == 569 then
return
end	
		if getVehicleEngineState(veh) == true then
		if not getVehicleOccupant ( veh,0 ) then
		setVehicleEngineState ( veh, false )
		end
		local fuel = getElementData(getElementData(veh,"parent"),"fuel")
			if fuel >= 0 then
			local expenFuel = getElementData(veh,"expenFuel") 

			
				setElementData(getElementData(veh,"parent"),"fuel", fuel  - expenFuel) --client
			else
				setVehicleEngineState ( veh, false )
			end
		end
	end
end
setTimer(setVehiclesFuelPerMinute,20000,0)




local repairTimer = {}
function repairVehicle (veh)
setPedAnimation (source)
	if repairTimer[veh] then triggerClientEvent (source, "displayClientInfo", source,"Veículo","Т/С в настоящий момент восстанавливается!",255,22,0) return end
	local health = math.floor(getElementHealth(veh))
	local progressEnginer = getElementData(source,"progress.enginer") or 0
	progressEnginer = progressEnginer*500
	local timeRep = (1000-health)*120-progressEnginer
		if timeRep < 1000 then
	timeRep = 1000 
	end

	repairTimer[veh] = setTimer(fixVehicleDayZ,timeRep,1,veh,source)
	setElementFrozen (veh,true)
	setVehicleDamageProof(veh,true)
	setElementData(veh,"repairer",source,false)
	setElementData(source,"repairingvehicle",veh,false)
	
	setPedAnimation (source,"SCRATCHING","sclng_r",-1,true,false)
	triggerClientEvent (source,"rapireVH",source)
	triggerClientEvent (source, "displayClientInfo", source,"Veículo","Вы начали чинить Т/С",22,255,0)
end
addEvent("repairVehicle",true)
addEventHandler("repairVehicle",getRootElement(),repairVehicle)

function fixVehicleDayZ(veh,player)
	setElementHealth(veh,1000)
	fixVehicle (veh)
	setPedAnimation(player,false)
	setElementFrozen (veh,false)
	setVehicleDamageProof(veh,false)
	repairTimer[veh] = nil
	setElementData(veh,"repairer",nil,false)
	setElementData(player,"repairingvehicle",nil,false)
	triggerClientEvent (player,"rapireStopVH",player,player)
	triggerClientEvent (player, "displayClientInfo", player,"Veículo","Вы починили Т/С",22,255,0)
	local wheels= getElementData(getElementData(veh,"parent"),"Pneu_inVehicle") or false
	if wheels then
	triggerEvent ( "setWheelStates2", getRootElement(), veh,wheels,"-" )
	end
end

function stopFixxingWhileMoving(player)
if player then
	local veh = getElementData(player,"repairingvehicle")
	if veh then
	setPedAnimation(player)
	setElementFrozen (veh,false)
	setVehicleDamageProof(veh,false)
	triggerEvent ( "setWheelStates2", getRootElement(), veh,4,"-" )
	setElementData(veh,"repairer",nil,false)
	setElementData(player,"repairingvehicle",nil,false)
	triggerClientEvent (player,"rapireStopVH",player,player)
	triggerClientEvent (player, "displayClientInfo", player,"Veículo","Вы прекратили чинить Т/C",255,22,0)
	killTimer(repairTimer[veh])
	repairTimer[veh] = nil
	end
	end
end
addEvent("onClientMovesWhileAnimation",true)
addEventHandler("onClientMovesWhileAnimation",getRootElement(),stopFixxingWhileMoving)

function debugFixxing()
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if getElementData(veh,"repairer") == source then
			outputDebugString("Vehicle repairer disconnected - destroyed tables")
			killTimer(repairTimer[veh])
			setElementFrozen (veh,false)
			setVehicleDamageProof(veh,false)
			triggerEvent ( "setWheelStates2", getRootElement(), veh,4,"-" )
			repairTimer[veh] = nil
			setElementData(veh,"repairer",nil,false)
		end	
	end
end
addEventHandler("onPlayerQuit",getRootElement(),debugFixxing)


function CancelFixing ( attacker, weapon, bodypart, loss )
if getElementData(source,"repairingvehicle") then
stopFixxingWhileMoving(source)
end
end
addEventHandler ( "onPlayerDamage", getRootElement(), CancelFixing )
addEventHandler ( "onPlayerWasted", getRootElement(), CancelFixing )





function setEngineStateByPlayer (playersource)
	local veh = getPedOccupiedVehicle (playersource)
	setVehicleEngineState (veh, not getVehicleEngineState(veh))
	if getElementData(getElementData(veh,"parent"),"fuel") <= 0 then return end
	if getVehicleEngineState(veh) == true then
		triggerClientEvent (playersource, "displayClientInfo", playersource,"Veículo","Motor заведен!",22,255,0)
	else
		triggerClientEvent (playersource, "displayClientInfo", playersource,"Veículo","Motor заглушен!",255,22,0)
	end
end



















local vehTimers ={}
function setWheelStates (veh,wheel,status)

if isTimer(vehTimers[veh]) then
killTimer(vehTimers[veh])
vehTimers[veh]=nil
vehTimers[veh] = setTimer(setWheelStates2,10000,1,veh,wheel,status)
else
vehTimers[veh] = setTimer(setWheelStates2,10000,1,veh,wheel,status)
end
end
addEvent("setWheelStates",true)
addEventHandler("setWheelStates",getRootElement(),setWheelStates)

function setWheelStates2 (veh,wheel,status)
vehTimers[veh]=nil
if not wheel then return end
if veh and getElementType ( veh ) == "vehicle" then

local ped = nil

local id = getElementModel(veh)
local col = getElementData(veh,"parent")

local tires = getElementData(veh,"needtires")

local index = tires-wheel


if status =="-" then
 ped = createPed ( 73, 0, 0, 0 )
warpPedIntoVehicle  (  ped,veh,1 )
setElementAlpha ( ped, 0 )

if index ==0 then
setVehicleWheelStates ( veh, 0,0,0,0) 
setElementFrozen  ( veh, false )
end
if index ==1 then
setVehicleWheelStates ( veh, 2,0,0,0) 
setElementFrozen  ( veh, false )
setTimer(function()
 setElementFrozen  ( veh, true ) end,600,1)
end
if index ==2 then
setVehicleWheelStates ( veh, 2,2,0,0) 
setElementFrozen  ( veh, false )
setTimer(function()
 setElementFrozen  ( veh, true ) end,600,1)
end
if index ==3 then
setVehicleWheelStates ( veh, 2,2,2,0) 
setElementFrozen  ( veh, false )
setTimer(function()
 setElementFrozen  ( veh, true ) end,600,1)
end
if index ==4 then
setVehicleWheelStates ( veh, 2,2,2,2) 
setElementFrozen  ( veh, false )
setTimer(function()
 setElementFrozen  ( veh, true ) end,600,1)
end

end


setTimer(function() destroyElement(ped) end,50,1)
end
end
addEvent("setWheelStates2",true)
addEventHandler("setWheelStates2",getRootElement(),setWheelStates2)



function setVehicleDemaged(veh)
if getVehicleType (veh) ~="Automobile" then 
return
end

for i = 0, 6 do
local nots = math.random(2,3)
 setVehiclePanelState ( veh, i, 2 )
end
for i = 0, 5 do
 setVehicleDoorState ( veh, i, 2 )
end
-- setVehiclePanelState ( veh, 3, 3 )
--setVehicleDoorState ( getPedOccupiedVehicle(source), 0, 2 )

end
addEvent("setVehicleDemaged",true)
addEventHandler("setVehicleDemaged",getRootElement(),setVehicleDemaged)




function removeVehOnTimer()
	local vehs = getElementsByType ( "vehicle" ) 
	local rTime = getRealTime()
	
	for i,veh in ipairs(vehs) do
		local removeTimer = getElementData(veh,"removeTimer") or false
		if removeTimer then
			local lostSeconds =  (removeTimer-rTime.timestamp)
			if lostSeconds<=0 then
			respawnDayZVehicle(veh)
			end
		end
	end
end
setTimer(removeVehOnTimer,60000,0)

function stopRemoveTimer ( thePlayer, seat, jacked )
	local removeTimer = getElementData(source,"removeTimer") or false
	if removeTimer and seat == 0 then
		setElementData(source,"removeTimer",false)
	end
end
addEventHandler ( "onVehicleEnter", getRootElement(), stopRemoveTimer )

function startRemoveTimer ( exitingPlayer, seat, jacked, door,veh )
if veh then 
source = veh
end

	local carOwner = 	getElementData(source,"owner") or false 
	local rRime  = getRealTime()
	if carOwner and seat == 0 then
	
	   local carInZZ = 	getElementData(source,"CarInZZ") or false
	   
	   if carInZZ then
		setElementData(source,"removeTimer",rRime.timestamp+1800) --- 1800 ПОЛ ЧАСА В ЗЗ
	   else
		   local CarInBase = 	getElementData(source,"CarInBase") or false
		   
		   if not CarInBase then
		   setElementData(source,"removeTimer",rRime.timestamp+259200) --- 259200 ТРИ ДНЯ НЕ В ЗЗ
		   end
	   
	   end
	   
	   
   end
   
end
addEventHandler ( "onVehicleStartExit", getRootElement(), startRemoveTimer )

function startTimerOnQuit ( quitType )

local veh =  getPedOccupiedVehicle ( source )
	if veh then
		local seat = getPedOccupiedVehicleSeat ( source )
		
		if seat == 0 then
			startRemoveTimer ( source, seat, false,false,veh )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), startTimerOnQuit )