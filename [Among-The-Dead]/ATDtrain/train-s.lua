local TrainWagons={}
local TrainPeds ={}
local objectsOnWagon = {}
local trainSpeedTimer = false
local TrainCols ={}
local speed = -0.1
local syncPosPlayer = false
local myTrain = false
local timerHorn = false
local myBlip = {}
local myBlip1 = false


TrainLoot = {
{"AK-107",3},
{"AK-107 PSO",3},
{"AK-74",3},
{"AKM",3},
{"AKS",3},
{"AKS (gold)",3},
{"AKS-74 Kobra",3},
{"AKS-74 PSO",3},
{"AKS-74U",3},
{"FN SCAR",3},
{"G36",3},
{"G36C-SD",3},
{"G36K",3},
{"Lee Enfield",3},
{"M240",5},
{"M249 Saw",5},
{"MG36",5},
{"Mk 48 Mod 0",5},
{"PKM",5},
{"PKP",5},
{"M1014",3},
{"Remington 870",3},
{"Remington 870 (Com Lanterna)",3},
{"Saiga 12K",3},
{"AS50",3},
{"CZ550",1},
{"DMR",1},
{"KSVK",3},
{"M107",1},
{"M24",1},
{"M24 (desert)",1},
{"M40A3",1},
{"SVD Camo",1},
{"ВСС Vintorez",3},
{"M4A1",1},
{"Pára-Quedas",4},
{"AK mag",30},
{"AKM mag",30},
{"FN mag",30},
{"G36 mag",30},

{"Lee mag",30},
{"M240 Belt",200},
{"M249 Belt",200},
{"MG36 mag",200},
{"PKM mag",200},





{"M1014 Pellet",50},
{"Saiga mag",50},

{"AS50 mag",30},
{"CZ550 mag",30},
{"DMR mag",30},
{"KSVK mag",30},
{"M107 mag",30},
{"M24 mag",30},
{"M40A3 mag",30},
{"SVD mag",30},
{"ВСС mag",30},
{"M4A1 mag",30},
{"Ração Seca Grande",3},
{"Ração Seca Pequena",5},
{"Ataduras",10},
{"Sinal de Fogo",10},
{"Galão de Combútivel Completo",20},
{"Kit de Primeiros Socorros",5},
{"Pacote de Calor",10},
{"Analgésico",10},
{"Morfina",7},
{"Bolsa de Sangue",6},
{"Arame Farpado",10},
{"Vestuário: Militar",5},
{"Vestuário: Militar 2",5},
{"Vestuário: Militar 3",5},
{"Vestuário: Militar 4",5},
{"Vestuário: Atirador",2},
{"Vestuário: Atirador 2",2},
{"Vestuário: Atirador 3",2},

{"Capacete Militar 50%",3},

{"Boina Militar",10},

{"Capacete Blindado 70%",2},
{"Capacete Blindado 80%",1},
{"Бронежилет 20%",2},
{"Пустая Фляга",10}, 
{"Mochila de ASSALTO 40",5},
{"Mochila de Montanha 60",5},
{"Mochila do Comandante 80",4},
{"Mochila de Explorador 100",3},
{"Mochila do Colorado 120",2},
{"Mochila Brasileira 140",1},
{"Mina",5},
{"Ôculos de Visão Noturna",10},
{"Ôculos de Infravermelho",10},
{"Mapa",10},
{"Caixa de Fósforo",10},

{"Relôgio",10},
{"GPS",10},
{"Caixa de Ferramentas",10},
{"Walkie-Talkie",10},
}

function addLootToTrain(col,object)
		setElementData(col,"parent",object) --client
		setElementData(col,"Yashik",true) --client
		setElementData(col,"MAX_Slots",0) --client
		for _,items in ipairs(TrainLoot) do
			local randomNumber = math.random(1,7)
			if randomNumber == 2 then
				setElementData(col,items[1],items[2]) --client
			end
		end

end




function elementStartSync( newSyncer )
local playersCount = getPlayerCount ( )
if getElementModel(source) == 537 or getElementModel(source) == 120 or getElementModel(source) == 569 then
--if playersCount <4 then return end
for i2, player in ipairs ( getElementsByType ( "player" ) ) do	
triggerClientEvent ( player, "sync_train", player, source,"true" )
end
end
end
addEventHandler ('onElementStartSync', root, elementStartSync)


function elementStaopSync( oldSyncer )
if getElementModel(source) == 537 or getElementModel(source) == 120 or getElementModel(source) == 569 then
for i2, player in ipairs ( getElementsByType ( "player" ) ) do	
triggerClientEvent ( player, "sync_train", player, source,"false" )
end
		
end
end
addEventHandler ('onElementStopSync', root, elementStaopSync)






function makeTrain(playerSource,comma,param)

local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Admin"))
if not isAdmin then
return
end

if param then 
speed = param
end
-- -1419.4497070313,-1509.4792480469,21.32881622314 -- сф 
-- 861.70440673828,2713.4541015625,19.522244262695 -- лв
local startTrainPosX,startTrainPosY,startTrainPosZ =0,0,0
local startTrainPos = math.random(1,2)
if startTrainPos == 1 then
 startTrainPosX,startTrainPosY,startTrainPosZ =-1419.4497070313,-1509.4792480469,21.32881622314 -- -1419.4497070313,-1509.4792480469,21.32881622314 -- сф
elseif startTrainPos == 2  then
 startTrainPosX,startTrainPosY,startTrainPosZ =861.70440673828,2713.4541015625,19.522244262695 -- лв

end


myTrain = createVehicle(537,startTrainPosX,startTrainPosY,startTrainPosZ)
--getNewSyncPlayer() 
--local hornRand = math.random(1,2)
--timerHorn = setTimer(function()
--triggerClientEvent ( "playHorn", getRootElement(),hornRand, myTrain )

 --end,15000,0)

setElementData(myTrain,"train",true,false)
setVehicleDamageProof(myTrain,true)
 myBlip1 = createBlipAttachedTo ( myTrain, 56 )
if not  playerSource then
myPed = createPed ( 120, 0,0,0)
end

for i2, player in ipairs ( getElementsByType ( "player" ) ) do
		if playerSource then
triggerClientEvent ( player, "sync_train", player, playerSource,"false" )
else
triggerClientEvent ( player, "sync_train", player, myPed,"false" )
end
		triggerClientEvent ( player, "sync_train", player, myTrain,"false" )
		end

if playerSource then
warpPedIntoVehicle ( playerSource,myTrain )
else
warpPedIntoVehicle ( myPed,myTrain )
end



setTrainDerailable(myTrain, false)
setTrainDirection  (  myTrain, true )
mathpos = math.random(1,3)
for i=1,mathpos do 


--if i>1 and TrainWagons[i-1] then

TrainWagons[i] = createVehicle(569,0,0,0)
setElementData(TrainWagons[i],"train",true,false)
setVehicleDamageProof(TrainWagons[i],true)
 myBlip[i] = createBlipAttachedTo ( TrainWagons[i], 0 )
if i==1 then
attachTrailerToVehicle ( myTrain, TrainWagons[i] )
else
attachTrailerToVehicle ( TrainWagons[i-1], TrainWagons[i] )
end


		for i2, player in ipairs ( getElementsByType ( "player" ) ) do

		triggerClientEvent ( player, "sync_train", player, TrainWagons[i],"false" )
		
	
		
            
        end

mathpos = math.random(1,2)

if  mathpos == 1 then
 pos1 = 1
 pos2 = 0.9
elseif mathpos == 2 then
 pos1 = -1
 pos2 = -0.9

end
objectsOnWagon[i] ={}
TrainCols[i] ={}

objectsOnWagon[i][1] = createObject(1558,0,0,0,nil,nil,nil) -- ящик
TrainCols[i][1]  = createColSphere(0,0,0,2) -- ящик

objectsOnWagon[i][2] = createObject(1558,0,0,0,nil,nil,nil) -- ящик
TrainCols[i][2]  = createColSphere(0,0,0,2) -- ящик


attachElements ( TrainCols[i][1] , objectsOnWagon[i][1], 0,0,0,0,0,0 ) -- ящик
attachElements ( TrainCols[i][2] , objectsOnWagon[i][2], 0,0,0,0,0,0 ) -- ящик


addLootToTrain(TrainCols[i][1] ,objectsOnWagon[i][1] )
addLootToTrain(TrainCols[i][2] ,objectsOnWagon[i][2] )


attachElements ( objectsOnWagon[i][1], TrainWagons[i], 1,-7.4,-0.5,0,0,0 ) -- ящик
attachElements ( objectsOnWagon[i][2], TrainWagons[i], -1,-7.4,-0.5,0,0,0 ) -- ящик


objectsOnWagon[i][3] = createObject(3787,0,0,0,nil,nil,nil) -- ящик ракеты
objectsOnWagon[i][4] = createObject(3787,0,0,0,nil,nil,nil) -- ящик ракеты
attachElements ( objectsOnWagon[i][3], TrainWagons[i], pos1,1,-0.5,0,0,90 ) -- ящик ракеты
attachElements ( objectsOnWagon[i][4], TrainWagons[i], pos1,-3,-0.5,0,0,90 ) -- ящик ракеты



objectsOnWagon[i][5] = createObject(964,0,0,0,nil,nil,nil) -- арму ящик
TrainCols[i][3] = createColSphere(0,0,0,2) -- ящик
addLootToTrain(TrainCols[i][3] ,objectsOnWagon[i][5] )

attachElements ( TrainCols[i][3] , objectsOnWagon[i][5], 0,0,0,0,0,0 ) -- ящик


attachElements ( objectsOnWagon[i][5], TrainWagons[i], pos2,7.2,-1.1,0,0,90 ) -- арму ящик



objectsOnWagon[i][6] = createObject(1217,0,0,0,nil,nil,nil) -- бочка
objectsOnWagon[i][7] = createObject(1225,0,0,0,nil,nil,nil) -- бочка
objectsOnWagon[i][8] = createObject(1218,0,0,0,nil,nil,nil) -- бочка
attachElements ( objectsOnWagon[i][6], TrainWagons[i], 1,5.5,-0.6,0,0,90 ) -- бочка
attachElements ( objectsOnWagon[i][7], TrainWagons[i], 1,4.5,-0.6,0,0,90 ) -- бочка 
attachElements ( objectsOnWagon[i][8], TrainWagons[i], 1,-5.5,-0.5,0,0,90 ) -- бочка 


		for i2, object in ipairs ( objectsOnWagon[i] ) do
		for i2, player in ipairs ( getElementsByType ( "player" ) ) do

		triggerClientEvent ( player, "setStaticObj", player, object )
		end
        end
		

--TrainPeds[i] = createPed ( 120, 0,0,0)
--warpPedIntoVehicle ( TrainPeds[i],TrainWagons[i] )

end


       setTrainSpeed(myTrain, speed) -- Set the train speed to 1 - 100mph, 160kmh
		

		
 trainSpeedTimer =	setTimer(setSpeedTra,10000,0)


		
		end
addCommandHandler("EventoTrem", makeTrain)

speedplus = -0.03
--speed=speed+speedplus
function setSpeedNew(source,comma,param)
speed=param
end
--addCommandHandler("trainspeed", setSpeedNew)
speedplus = -0.03
--speed=speed+speedplus
function setSpeedTra()


setTrainSpeed(myTrain, speed)

end



function startTrain() 
 playersCount = getPlayerCount ( )
if playersCount >=4 then
if not myTrain then
makeTrain()
else
removeTrain()
end

	end
end
--setTimer(startTrain,21600000,1)
--startTrain()

function removeTrain()
if myTrain then
killTimer(trainSpeedTimer)
destroyElement(myTrain)
destroyElement(myBlip1)
--killTimer(timerHorn)
destroyElement(myPed)
	for i2, wagon in ipairs ( TrainWagons ) do

		destroyElement(wagon)
		         
        end
		
			for i2, blimp in ipairs ( myBlip ) do

		destroyElement(blimp)
        end
		
	for i2, tableObj in ipairs ( objectsOnWagon ) do
	
		for i2, obj in ipairs ( tableObj ) do
		destroyElement(obj)        
        end
	         
        end
		
		for i2, tableCol in ipairs ( TrainCols ) do
	
		for i2, col in ipairs ( tableCol ) do
		destroyElement(col)        
        end
	         
        end	
		
		end
		myTrain =false
		setTimer(startTrain,21600000,1)
		end
addEvent ( "removeTrain", true )
addEventHandler ( "removeTrain", getRootElement(), removeTrain )





addEventHandler("onPlayerLogin", root,
  function()
  if myTrain  then
 triggerClientEvent ( source, "sync_train", source, myPed,"false" )
		triggerClientEvent ( source, "sync_train", source, myTrain,"false" )
 
 for i2, wagon in ipairs ( TrainWagons ) do

		triggerClientEvent ( source, "sync_train", source, wagon,"false" )
		         
        end
		
		
		
			for i2, tableObj in ipairs ( objectsOnWagon ) do
	
		for i2, obj in ipairs ( tableObj ) do
		triggerClientEvent ( source, "setStaticObj", source, obj )   
        end
	         
        end

 
  end
  end)
  
  
  
  function quitPlayer ( quitType )
  if myTrain  then
local playersCount = getPlayerCount ( )
if playersCount <=0 then
removeTrain()
end
end
end
addEventHandler ( "onPlayerQuit", getRootElement(), quitPlayer )
