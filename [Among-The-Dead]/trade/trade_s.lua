

function PlayerBuy(row,col,stm,itemList,source,slots,ped,inventoryItems,teri,bloc) 
local SKILL_CARTRADE = getElementData(source,"SKILL_CARTRADE") or 0
    for i, item in ipairs(inventoryItems) do
if (item[1]== stm) then

local isDead = getElementData(source,"isDead")
if not isDead then
local money = getElementData(source,"Деньги") or 0

local enginerSlots = getElementData(source,"progress.enginer") or 0
		local attackerSlots = getElementData(source,"progress.attacker") or 0
		
	if (slots < getElementData(source,"MAX_Slots")+math.floor((enginerSlots+attackerSlots)*0.2)) then
	
	
	
	if (teri == "Торговец: транспорт") then
	local tsBuyTime = getElementData(source,"tsBuyTime") or 0
		if(tsBuyTime>getRealTime().timestamp) then
			outputChatBox("В данный момент вы не можете купить транспорт",source)
			return
		end
	
	
	if (money  < (math.ceil(item[2]-(item[2]/100*(SKILL_CARTRADE*5))))) then
	outputChatBox("Не хватает денег",source)
	return
	end
	setElementData(source,"Деньги",money-(math.ceil(item[2]-(item[2]/100*(SKILL_CARTRADE*5)))))
	setElementData(source,"tsBuyTime",getRealTime().timestamp+600)
	
	else
	if (money  < item[2]) then
	outputChatBox("Не хватает денег",source)
	return
	end

	setElementData(source,"Деньги",money-item[2])
	end





if (teri == "Торговец: патроны") then
local playerItem = getElementData(source,item[1]) or false
if playerItem then
setElementData(source,item[1], playerItem + item[3])
outputChatBox("Вы купили 1 "..item[1],source)
else
outputChatBox("Вы купили 1 "..item[1],source)
setElementData(source,item[1],item[3])
end

elseif (teri == "Торговец: транспорт") then


	if getVehicleType ( item[3] ) == "Helicopter"  then
		car = exports.CarSpawner:CarSpawner ( source, "spawnCar", item[3],655.94763, -565.12958, 22.14782 ) -- работает  
	else
		car = exports.CarSpawner:CarSpawner ( source, "spawnCar", item[3],641.57477, -567.07770, 16.18750 ) --  не работает 
	end

setElementData(car,"owner",getAccountName(getPlayerAccount ( source )))



setTimer( function() warpPedIntoVehicle(source,car) end,100,1)

triggerClientEvent ("closeTradeWin", source, source)
--outputChatBox("Ваша машина появилась на улице!",source)
outputChatBox("Вы купили 1 "..item[1],source)

else
local playerItem = getElementData(source,item[1]) or false
if playerItem then
setElementData(source,item[1],playerItem + 1)
outputChatBox("Вы купили 1 "..item[1],source)
else
setElementData(source,item[1],1)
outputChatBox("Вы купили 1 "..item[1],source)
end
		end
		
		else
outputChatBox("В рюкзаке не хватает места",source)
	end
	

end
end
end 


end



function PlayerSell(row,col,stm,itemList,source,slots,ped,inventoryItems,teri) 
    for i, item in ipairs(inventoryItems) do
if (item[1]== stm) then

	
local isDead = getElementData(source,"isDead")
if not isDead then
local money = getElementData(source,"Деньги") or 0
local economist = getElementData(source,"progress.economist") or 0
local MyItems = getElementData(source,stm) or 0

	if MyItems>0  then
	


	
	
	if (teri == "Торговец: патроны") then 
	local patr = getElementData(source,item[1]) or 0
	if patr  >= item[3] then

	
		setElementData(source,stm,MyItems-item[3])
		setElementData(source,"Деньги",money+math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)))
		outputChatBox("Вы продали 1 "..stm.." и получили за это "..math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)).." денег" ,source)
		
		else
		outputChatBox("У вас нет этого предмета или обойма не полная" ,source)
	end
	elseif (itemList == "Рюкзаки") then 

	if getElementData(source,"backPackUsed") == item[1] then
	if getElementData(source,item[1]) <= 1 then
	outputChatBox("Нельзя продать используемый рюкзак!" ,source)
	else
			setElementData(source,stm,MyItems-1)
		setElementData(source,"Деньги",money+math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)))
		outputChatBox("Вы продали 1 "..stm.." и получили за это "..math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)).." денег" ,source)
	end
	

		else

		setElementData(source,stm,MyItems-1)
		setElementData(source,"Деньги",money+math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)))
		outputChatBox("Вы продали 1 "..stm.." и получили за это "..math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)).." денег" ,source)
	
	end
	elseif teri == "Барыга" then
	setElementData(source,stm,MyItems-1)
		setElementData(source,"Деньги",money+math.ceil (math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100))/2))
		outputChatBox("Вы продали 1 "..stm.." и получили за это "..math.ceil ((math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100))/2)).." денег" ,source)
	
	else
		setElementData(source,stm,MyItems-1)
		setElementData(source,"Деньги",money+math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)))
		outputChatBox("Вы продали 1 "..stm.." и получили за это "..math.ceil (item[2]/2+((item[2]/2)*(economist*0.5)/100)).." денег" ,source)
	end
	
	else
		outputChatBox("У вас нет этого предмета",source)
	
	end
end

	end
	
end

end





addEvent( "PlayerSell", true )
addEventHandler( "PlayerSell", getRootElement(), PlayerSell )
addEvent( "PlayerBuy", true )
addEventHandler( "PlayerBuy", getRootElement(), PlayerBuy )




























 









vorotaBlackTrader = createColCuboid (2022.4272460938,2768.6569824219,-4, 7, 15, 13 ) -- blackTraderBase

local gateSP1 = createObject(2885,2025.8000488281,2773.1000976563,10.39999961853,0,0,60.000030517578)--Создаем белые ворота


function enterBlackTrader(theCol)
if theCol ==vorotaBlackTrader  and getElementType ( source ) == "player" then 
moveObject (gateSP1,1000,2025.8000488281,2773.1000976563,4.5)-- Поднять белые ворота
setTimer(function() 
moveObject (gateSP1,1000,2025.8000488281,2773.1000976563,10.39999961853)-- Опустить белые ворота
end,3000,1)
end
end
addEventHandler( "onElementColShapeHit", getRootElement() , enterBlackTrader )



local blachTraderHomeEnter1 = createMarker ( 1628.6870117188,-1903.3282470703,13, "corona", 1.5, 0, 0, 0, 170 )
function blachTraderHomeEnter1f(hitElement ) 
if getElementType(hitElement) =="player" then
spawnPlayer (hitElement , 1600.8243408203,-1908.7171630859,7.4387121200562, math.random(0,360), getElementModel(hitElement), 0, 0)	
end
end
addEventHandler( "onMarkerHit", blachTraderHomeEnter1, blachTraderHomeEnter1f ) 

local blachTraderHomeExit1 = createMarker ( 1621.2927246094,-1912.8045654297,6.5, "cylinder", 1.5, 255, 0, 0, 170 )
function blachTraderHomeExit1f(hitElement ) 
if getElementType(hitElement) =="player" then
spawnPlayer (hitElement , 1630,-1906.3282470703,13, math.random(0,360), getElementModel(hitElement), 0, 0)
end
end
addEventHandler( "onMarkerHit", blachTraderHomeExit1, blachTraderHomeExit1f ) 



local blachTraderHomeEnter2 = createMarker ( -2050.3972167969,883.52154541016,63.174354553223, "corona", 1.5, 0, 0, 0, 170 )
function blachTraderHomeEnter2f(hitElement ) 
if getElementType(hitElement) =="player" then
spawnPlayer (hitElement , -2051.4633789063,894.49102783203,61.56010055542, math.random(0,360), getElementModel(hitElement), 0, 0)	
end
end
addEventHandler( "onMarkerHit", blachTraderHomeEnter2, blachTraderHomeEnter2f ) 

local blachTraderHomeExit2 = createMarker ( -2055.1088867188,891.61608886719,60.5, "cylinder", 1.5, 255, 0, 0, 170 )
function blachTraderHomeExit2f(hitElement ) 
if getElementType(hitElement) =="player" then
spawnPlayer (hitElement , -2050.3972167969,881.52154541016,63.174354553223, math.random(0,360), getElementModel(hitElement), 0, 0)
end
end
addEventHandler( "onMarkerHit", blachTraderHomeExit2, blachTraderHomeExit2f ) 




local blachTraderHomeEnter3 = createMarker ( -124.15731811523,2862.4689941406,62.70890045166, "corona", 1.5, 0, 0, 0, 170 )
function blachTraderHomeEnter3f(hitElement ) 
if getElementType(hitElement) =="player" then
spawnPlayer (hitElement , -123.76085662842,2839.5988769531,63.21480178833, math.random(0,360), getElementModel(hitElement), 0, 0)	
end
end
addEventHandler( "onMarkerHit", blachTraderHomeEnter3, blachTraderHomeEnter3f ) 

local blachTraderHomeExit3 = createMarker ( -123.98506164551,2848.2817382813,62, "cylinder", 1.5, 255, 0, 0, 170 )
function blachTraderHomeExit3f(hitElement ) 
if getElementType(hitElement) =="player" then
spawnPlayer (hitElement , -124.59474182129,2866.8115234375,60.841781616211, math.random(0,360), getElementModel(hitElement), 0, 0)
end
end
addEventHandler( "onMarkerHit", blachTraderHomeExit3, blachTraderHomeExit3f ) 

blackLocations ={
{1606.6610107422,-1918.4982910156,7.4387121200562},
{2001.4200439453,2812.8,-0.39218747615814},
{-2050.3801269531,886.71032714844,61.56010055542},
{-112.40675354004,2842.4377441406,63.21480178833},
}

function createBlackTrader()
local location = math.random(1,4)
--arenaBlip = createBlip ( blackLocations[location][1],blackLocations[location][2],blackLocations[location][3], 4, 2, 255, 0, 0,255)
	 pedTrader11 = createPed ( 262,blackLocations[location][1],blackLocations[location][2],blackLocations[location][3],-0.0,false) 
	setElementFrozen  ( pedTrader11, true )
--setPedAnimation (pedTrader11,"ped","SEAT_idle",nil,true,false,false,false)
  setElementData(pedTrader11,"pedName","Торговец: черный рынок")
  setElementData(pedTrader11,"traderLoc",location)
      local myMarker11 = createMarker ( blackLocations[location][1],blackLocations[location][2],blackLocations[location][3]+0.5, "corona", 1.5, 0, 0, 0, 170 )
--outputChatBox("ЧР: "..blackLocations[location][1]..","..blackLocations[location][2]..","..blackLocations[location][3])
function MarkerHitf11(source) 
if getElementType(source) =="player" then
 triggerClientEvent ("PlayerInMarker", source,source,pedTrader,"Торговец: черный рынок",getElementData(pedTrader11,"traderLoc"))  
end
end
addEventHandler( "onMarkerHit", myMarker11, MarkerHitf11 )

function MarkerRemove(myMarker11,pedTrader11) 
destroyElement(myMarker11)
destroyElement(pedTrader11)
--destroyElement(arenaBlip)

createBlackTrader()
end

setTimer(MarkerRemove,7200000,1,myMarker11,pedTrader11)
end
createBlackTrader()



traderOFFLocations ={
{785.6650390625,2343.5063476563,12.189624786377,90}, -- лв
{-2423.6394042969,-651.21228027344,133.07102966309,90}, --сф
{-196.30665588379,-1534.5557861328,6.9451465606689,40},-- лс

}

function createTRADEROFFTrader()
local location = math.random(1,3)

	 pedTRADEROFF = createPed ( 262,traderOFFLocations[location][1],traderOFFLocations[location][2],traderOFFLocations[location][3],traderOFFLocations[location][4],false) 
	setElementFrozen  ( pedTRADEROFF, true )
--setPedAnimation (pedTrader11,"ped","SEAT_idle",nil,true,false,false,false)
  setElementData(pedTRADEROFF,"pedName","Барыга")
  setElementData(pedTRADEROFF,"traderLoc",location)
      local myTRADEROFF = createMarker ( traderOFFLocations[location][1],traderOFFLocations[location][2],traderOFFLocations[location][3]+0.5, "corona", 1.5, 0, 0, 0, 170 )
--outputChatBox("Барыга: "..traderOFFLocations[location][1]..","..traderOFFLocations[location][2]..","..traderOFFLocations[location][3])
function MarkerHitfTRADEROFF(source) 
if getElementType(source) =="player" then
 triggerClientEvent ("PlayerInMarker", source,source,pedTrader,"Барыга",getElementData(pedTRADEROFF,"traderLoc"))  
end
end
addEventHandler( "onMarkerHit", myTRADEROFF, MarkerHitfTRADEROFF )

function MarkerRemove(myTRADEROFF,pedTRADEROFF) 
destroyElement(myTRADEROFF)
destroyElement(pedTRADEROFF)
--destroyElement(arenaBlip)

createTRADEROFFTrader()
end

setTimer(MarkerRemove,7200000,1,myTRADEROFF,pedTRADEROFF)
end
createTRADEROFFTrader()





addEventHandler("onPlayerLogin", root,
  function()
  if getElementData(source,"isDead") then
setElementData(source,"isDead",false)
end
  end
)


function Car_hitZZ (  hitElement,  matchingDimension )
if getElementType(hitElement) == "vehicle" then
setElementData(hitElement,"CarInZZ",true)
end
end



function Car_leavZZ (  hitElement,  matchingDimension )
if getElementType(hitElement) == "vehicle" then
setElementData(hitElement,"CarInZZ",false)
end
end




local bigLS = createColCuboid (591.00091552734,-680,10.218955993652,300,270,30 ) -- BigLS
addEventHandler ( "onColShapeHit", bigLS, Car_hitZZ )
addEventHandler ( "onColShapeLeave", bigLS, Car_leavZZ )

local smallLS = createColCuboid (-260.85906982422,-1582.1025390625,0, 130, 150, 11 ) -- SmallLS
addEventHandler ( "onColShapeHit", smallLS, Car_hitZZ )
addEventHandler ( "onColShapeLeave", smallLS, Car_leavZZ )

local smallLV = createColCuboid (744.81085205078,2297.7470703125,0, 80, 100, 140 ) -- SmallLV
addEventHandler ( "onColShapeHit", smallLV, Car_hitZZ )
addEventHandler ( "onColShapeLeave", smallLV, Car_leavZZ )

local smallSF = createColCuboid (-2486.0737304688,-710.16931152344,120, 100, 130, 140 ) -- SmallSF
addEventHandler ( "onColShapeHit", smallSF, Car_hitZZ )
addEventHandler ( "onColShapeLeave", smallSF, Car_leavZZ )



local bigLV = createColCuboid (1573.7313232422,1467.6999511719,0, 140, 170, 140 ) -- BigLV
addEventHandler ( "onColShapeHit", bigLV, Car_hitZZ )
addEventHandler ( "onColShapeLeave", bigLV, Car_leavZZ )


local bigSF = createColCuboid (-1587.5122070313,-471.70648193359,0, 160, 170, 140 ) -- BigSF

addEventHandler ( "onColShapeHit", bigSF, Car_hitZZ )
addEventHandler ( "onColShapeLeave", bigSF, Car_leavZZ )



