function loadAddons( res )
for resourceKey, resourceValue in ipairs(getResources()) do
local name = getResourceName(resourceValue)
if string.find(name,"epz_") then
	setTimer(startResource,2000,1,resourceValue)
end
end
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), loadAddons )

function unloadAddons ( res )
for resourceKey, resourceValue in ipairs(getResources()) do
local name = getResourceName(resourceValue)
if string.find(name,"epz_") then
	stopResource(resourceValue)
end
end
end
addEventHandler ( "onResourceStop", getResourceRootElement(getThisResource()), unloadAddons )

local elementWeaponBack = {}
local elementWeapon ={}
function rearmPlayerWeapon (weaponName,slot)
takeAllWeapons (source)
--Rearm
if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	

local ammoData,weapID,modelID,ammoAmout = getWeaponAmmoType (weaponName)
if (getElementData(source,ammoData) or 0) <= 0 then triggerClientEvent (source, "displayClientInfo", source,"Arma",shownInfos["nomag"],255,22,0) return end
setElementData(source,"currentweapon_"..slot,weaponName)


	if weapID == 22 then
	local weapG17 = getElementData(source,weaponName) or false
	if weapG17 then
	local progressAttacker = getElementData(source,"progress.attacker") or 0
	if 	weapG17 >=2 then
	if progressAttacker >=2 then
	setPedStat ( source, 69, 999)
else
setPedStat ( source, 69, 998)
end
	else
	setPedStat ( source, 69, 998)
--	outputChatBox(weapG17)
	end
	end
	end

--Old Weapons
local weapon = getElementData(source,"currentweapon_1") or false
if weapon ~= 0 and weapon ~= nil and (getElementData(source,weapon) or 0) >=1 then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(source,weapID,(getElementData(source,ammoData) or 0), true )
end
local weapon = getElementData(source,"currentweapon_2") or false
if weapon ~= 0 and weapon ~= nil and (getElementData(source,weapon) or 0) >=1 then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(source,weapID,(getElementData(source,ammoData) or 0), false )
end
local weapon = getElementData(source,"currentweapon_3") or false
if  weapon ~= 0 and weapon ~= nil and (getElementData(source,weapon) or 0) >=1 then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(source,weapID,(getElementData(source,ammoData) or 0), false )
end
if elementWeaponBack[source] then
	detachElementFromBone(elementWeaponBack[source])
	destroyElement(elementWeaponBack[source])
	elementWeaponBack[source] = false
end	



--setPedSkin(getElementData(source,"skin"))
end
addEvent("onPlayerRearmWeapon",true)
addEventHandler("onPlayerRearmWeapon",getRootElement(),rearmPlayerWeapon)



function getWeaponObjectID (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["Weapons"]) do
		if weaponName == weaponData[1] then
			return weaponData[2]
		end
	end
end	

--attaches
local elementBackpack = {}
function backPackBack (dataName,oldValue)
	if getElementType(source) == "player" and dataName =="MAX_Slots" then
		local newValue = getElementData(source,dataName) or 0
		if elementBackpack[source] then
			detachElementFromBone(elementBackpack[source])
			destroyElement(elementBackpack[source])
			elementBackpack[source] = false
		end
		local x,y,z = getElementPosition(source)
		local rx,ry,rz = getElementRotation(source)
		if newValue == 20 then
			elementBackpack[source] = createObject(3026,x,y,z)
		elseif newValue == 40 then
			elementBackpack[source] = createObject(2405,x,y,z)
		elseif newValue == 60 then
			elementBackpack[source] = createObject(1248,x,y,z)
		elseif newValue == 80 then
			elementBackpack[source] = createObject(1252,x,y,z)
		elseif newValue == 100 then
			elementBackpack[source] = createObject(953,x,y,z)
		elseif newValue == 120 then
			elementBackpack[source] = createObject(2410,x,y,z)
		elseif newValue == 140 then
			elementBackpack[source] = createObject(1641,x,y,z)
		elseif newValue == 160 then
			elementBackpack[source] = createObject(1575,x,y,z)
		elseif newValue == 180 then
			elementBackpack[source] = createObject(1640,x,y,z)
		elseif newValue == 200 then
			elementBackpack[source] = createObject(1602,x,y,z)
		elseif newValue == 10 then
			return
		end
		
		if elementBackpack[source] then
		
			if newValue == 160 then
				attachElementToBone(elementBackpack[source],source,3,0,-0.16,0.05,270,0,180)
			else
				attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0)
			end
			
			setElementParent(elementBackpack[source],playersObjects)
			
			setElementData(source,"backPackFile",elementBackpack[source])
			
			end
		
	end	
end
addEventHandler ( "onElementDataChange", getRootElement(), backPackBack )

function backpackRemoveQuit ()
		if elementBackpack[source] then
			detachElementFromBone(elementBackpack[source])
			destroyElement(elementBackpack[source])
		end
		if elementWeaponBack[source] then
			detachElementFromBone(elementWeaponBack[source])
			destroyElement(elementWeaponBack[source])	
			elementWeaponBack[source] = false
		end	
if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	
end
addEventHandler ( "onPlayerQuit", getRootElement(), backpackRemoveQuit )


function weaponSwitchBack ( previousWeaponID, currentWeaponID )
if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	
local weapon1 = getElementData(source,"currentweapon_1")
local weapon2 = getElementData(source,"currentweapon_2")
local weapon3 = getElementData(source,"currentweapon_3")
--if not weapon1 then return end

local ammoData1,weapID1,modelID1 = getWeaponAmmoType(weapon1)
local ammoData2,weapID2,modelID2 = getWeaponAmmoType(weapon2)
local ammoData3,weapID3,modelID3 = getWeaponAmmoType(weapon3)

local x,y,z = getElementPosition(source)
local rx,ry,rz = getElementRotation(source)
	if previousWeaponID == weapID1 then
		if elementWeaponBack[source] then
			detachElementFromBone(elementWeaponBack[source])
			destroyElement(elementWeaponBack[source])
			elementWeaponBack[source] = false
		end
		

		

		elementWeaponBack[source] = createObject(getWeaponObjectID(weapon1),x,y+5,z+15)
		setElementParent(elementWeaponBack[source],playersObjects)
		
		setObjectScale(elementWeaponBack[source],0.875)
		if elementBackpack[source] then
			attachElementToBone(elementWeaponBack[source],source,3,0.19,-0.31,-0.1,0,270,-90)
		else
			attachElementToBone(elementWeaponBack[source],source,3,0.19,-0.11,-0.1,0,270,10)
		end
	elseif currentWeaponID == weapID1 then
	
	
 
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])
		elementWeaponBack[source] = false
	end
	end
	
	if currentWeaponID == weapID1 then
	setElementData(source,"weaponSwith",weapon1) --client
	
	local x,y,z = getElementPosition(source)
elementWeapon[source] = createObject(modelID1,x,y+5,z+50)

setElementParent(elementWeapon[source],playersObjects)

if weapon1 =="ВСС Vintorez" or weapon1 =="Gauss" then 

attachElementToBone(elementWeapon[source],source,12,0,0,0.05,-3,-92,0) -- я же менял все оружия они были ровные менял -100 на -90

else 
attachElementToBone(elementWeapon[source],source,12,0,0,0.05,-1,-95,0) -- это нахуя заменял? если это остальное другое оружие не всс [хз]
end
	setElementData(source,"weaponSwithModel",elementWeapon[source]) --client
	
	elseif currentWeaponID == weapID2 then
	setElementData(source,"weaponSwith",weapon2) --client
	
	if weapID2 == 22 then
	local weapG17 = getElementData(source,weapon2) or false
	if weapG17 then
	local progressAttacker = getElementData(source,"progress.attacker") or 0
	if	weapG17 >=2 then
	if progressAttacker >=100 then
	setPedStat ( source, 69, 999)
	else
	setPedStat ( source, 69, 998)
	end
--	outputChatBox(weapG17)
	else
	setPedStat ( source, 69, 998)
	--outputChatBox(weapG17)
	end
	end
	end
	
if modelID2 and weapID2 ~=22 then
	local x,y,z = getElementPosition(source)
	elementWeapon[source] = createObject(modelID2,x,y+5,z+50)
	setElementParent(elementWeapon[source],playersObjects)
	
attachElementToBone(elementWeapon[source],source,12,0,0,0.05,-5,-100,0)
end

	elseif currentWeaponID == weapID3 then
	setElementData(source,"weaponSwith",weapon3) --client
	
	end

	
end
addEventHandler ( "onPlayerWeaponSwitch", getRootElement(), weaponSwitchBack )

function removeBackWeaponOnDrop ()
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
end
addEvent("removeBackWeaponOnDrop",true)
addEventHandler("removeBackWeaponOnDrop",getRootElement(),removeBackWeaponOnDrop)

function removeAttachedOnDeath ()
		if elementBackpack[source] then
			detachElementFromBone(elementBackpack[source])
			destroyElement(elementBackpack[source])
		end
		if elementWeaponBack[source] then
			detachElementFromBone(elementWeaponBack[source])
			destroyElement(elementWeaponBack[source])	
			elementWeaponBack[source] = false
		end	
		if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),removeAttachedOnDeath)


function weaponDelete(dataName,oldValue)
	if getElementType(source) == "player" then -- check if the element is a player
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		if dataName == weapon1 or dataName == weapon2 or dataName == weapon3 then
			if (getElementData (source,dataName) or 0) <= 0 then

				local ammoData,weapID,modelID = getWeaponAmmoType(dataName)
				takeWeapon (source,weapID)
	if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end			
end
		end
		end	
end
addEventHandler("onElementDataChange",getRootElement(),weaponDelete)


--[[
function weaponDelete(dataName,oldValue)
	if getElementType(source) == "player" then -- check if the element is a player
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		if dataName == weapon1 or dataName == weapon2 or dataName == weapon3 then
			if getElementData (source,dataName) <= 0 then

				local ammoData,weapID,modelID = getWeaponAmmoType(dataName)
				takeWeapon (source,weapID)
						if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	
			end
		end
			local weapon1 = getElementData(source,"currentweapon_1")
			local weapon2 = getElementData(source,"currentweapon_2")
			local weapon3 = getElementData(source,"currentweapon_3")
			local ammoData1,weapID1,modelID1 = getWeaponAmmoType(weapon1)
			local ammoData2,weapID2,modelID2 = getWeaponAmmoType(weapon2)
			local ammoData3,weapID3,modelID3 = getWeaponAmmoType(weapon3)
		if dataName == ammoData1 then
		local newammo = oldValue - getElementData (source,dataName)
		if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID1,newammo) 
				if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	
				if elementWeaponBack[source] then
					detachElementFromBone(elementWeaponBack[source])
					destroyElement(elementWeaponBack[source])	
					elementWeaponBack[source] = false
				end	
			elseif getElementData (source,dataName) > oldValue and getElementData(source,weapon1) >= 1 then
	local x,y,z = getElementPosition(source)
 elementWeapon[source] = createObject(modelID1,x,y,z)
attachElementToBone(elementWeapon[source],source,12,0,0,0.05,-5,-100,0)
				giveWeapon(source,weapID1,getElementData (source,dataName)-oldValue,true)
				
			end
		end	
		if dataName == ammoData2 then
		local newammo = oldValue - getElementData (source,dataName)
		if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID2,newammo) 
				if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	
			elseif getElementData (source,dataName) > oldValue and getElementData(source,weapon2) >= 1 then
				local x,y,z = getElementPosition(source)
 elementWeapon[source] = createObject(modelID2,x,y,z)
attachElementToBone(elementWeapon[source],source,12,0,0,0.05,-5,-100,0)
				giveWeapon(source,weapID2,getElementData (source,dataName)-oldValue,false)
			end
		end	
		if dataName == ammoData3 then
		local newammo = oldValue - getElementData (source,dataName)
		if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID3,newammo) 
			elseif getElementData (source,dataName) > oldValue and getElementData(source,weapon3) >= 1 then
				giveWeapon(source,weapID3,getElementData (source,dataName)-oldValue,false)
			end	
		end
	end
end
addEventHandler("onElementDataChange",getRootElement(),weaponDelete)
]]
function addPlayerStats (player,data,value)
	if data == "food" then
		local current = getElementData(player,data)
			if current + value > 100 then
				setElementData(player,data,100) --client
			elseif 	current + value < 1 then
				setElementData(player,data,0) --client
				setElementData(player,"blood",getElementData(player,"blood")-math.random(300,500)) --client
			else
				setElementData(player,data,current+value) --client
			end
	elseif data == "thirst" then
		local current = getElementData(player,data)
			if current + value > 100 then
				setElementData(player,data,100) --client
			elseif 	current + value < 1 then
				setElementData(player,data,0) --client
				setElementData(player,"blood",getElementData(player,"blood")-math.random(300,500)) --client
			else
				setElementData(player,data,current+value) --client
			end

	elseif data == "blood" then
	local progressMedik = getElementData(player,"progress.medik") or 0 
	local progressBoec = getElementData(player,"progress.boec") or 0
		local current = getElementData(player,data)
			if current + value > 12000+((progressMedik*60)+(progressBoec*20)) then
				setElementData(player,data,12000+((progressMedik*60)+(progressBoec*20))) --client
			elseif 	current + value < 1 then
				setElementData(player,data,0) --client
			else
				setElementData(player,data,current+value) --client
			end
	--[[		
	elseif data == "temperature" then
		local current = getElementData(player,data)
			if current + value > 41 then
				setElementData(player,data,41) --client
			elseif 	current + value <= 31 then
				setElementData(player,data,31) --client
			else
				setElementData(player,data,current+value) --client
			end
	]]
	elseif data == "humanity" then
		local current = getElementData(player,data)
			if current + value > 5000 then 
				setElementData(player,data,5000) --client
			else
				setElementData(player,data,current+value) --client
			end		
	end
end

addEvent("addPlayerStats11",true)
addEventHandler("addPlayerStats11",getRootElement(),addPlayerStats)

function onPlayerRequestChangingStats(itemName,itemInfo,data)
if data == "food" then
	if itemName == "Hambúrguer" then
		blood = 300
	elseif itemName == "Pizza" then
		blood = 300	
	elseif itemName == "Carne Grelhada" then
		blood = 800	
	elseif itemName == "Peixe Frito" then
		blood = 3000	
	elseif itemName == "Lata de Feijão" then
		blood = 200	
	elseif itemName == "Lata de Macarrão" then
		blood = 200
		

	end
		 setPedAnimation (source,"FOOD","EAT_Burger",-1,false,false,false,false)
		
	setElementData(source,itemName,(getElementData(source,itemName) or 0)-1) --client
	
		local realBlood = getElementData(source,"blood") or 0 
		local progressMedik = getElementData(source,"progress.medik") or 0 
		local progressBoec = getElementData(source,"progress.boec") or 0
		if realBlood+blood>12000+((progressMedik*60)+(progressBoec*20)) then
		 blood = 12000+((progressMedik*60)+(progressBoec*20))-realBlood
		 else
		 blood = blood
		end
	
	triggerClientEvent (source, "drawingAlphaText",source,source,"Sangue: +"..(blood or 0).."",200,0,0,"down",false,true)
	addPlayerStats (source,"blood",blood)
	
	local  restorefood = gameplayVariables["foodrestore"]
	 -- Restores a random amount between 40-100 (hunger) - default: 100
	local chinpockemon=source
	setTimer(function()
	
	local realFood = getElementData(chinpockemon,"food") or 0 
		if realFood+restorefood>100 then
		 restorefood = 100- realFood
		 else
		 restorefood = restorefood
		end
		
	triggerClientEvent ( chinpockemon,"drawingAlphaText",chinpockemon,chinpockemon,"Fome: -"..math.floor(restorefood).."%",0,200,0,"down",false,true)
	addPlayerStats (chinpockemon,data,restorefood)
	
	end,3000,1)
	
	elseif data == "thirst" then


	setElementData(source,itemName,(getElementData(source,itemName) or 0)-1) --client
	local thirstrestore = gameplayVariables["thirstrestore"]
	local realthirst = getElementData(source,"thirst") or 0 
		if realthirst+thirstrestore>100 then
		 thirstrestore = 100- realthirst
		 else
		 thirstrestore = thirstrestore
		end
		
	
	triggerClientEvent ( source,"drawingAlphaText",source,source,"Sede: -"..math.floor(thirstrestore).."%",0,200,0,"down",false,true)
	addPlayerStats (source,data,thirstrestore) -- Restores a random amount between 40-100 (thirst) default: 100
	
	setPedAnimation (source,"VENDING","VEND_Drink2_P",-1,false,false,false,false) 
	if itemName == "Garrafa de Água Completo" then
		setElementData(source,"Garrafa de Água Vazia",(getElementData(source,"Garrafa de Água Vazia") or 0)+1) --client
	end
end
triggerClientEvent (source, "displayClientInfo", source,"Comida",shownInfos["youconsumed"].." "..itemName,22,255,0)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerRequestChangingStats",true)
addEventHandler("onPlayerRequestChangingStats",getRootElement(),onPlayerRequestChangingStats)

function onPlayerUseMedicObject(itemName)
local playersource = source
if (getElementData(playersource,itemName) or 0)<=0 then
return
end
setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)
setElementData(playersource,itemName,getElementData(playersource,itemName)-1) --client
		
setTimer( function ()
	if itemName == "Ataduras" then
	
		setElementData(playersource,"bleeding",0) --client
		setElementData(playersource,itemName,(getElementData(playersource,itemName) or 0)-1) --client
	elseif itemName == "Kit de Primeiros Socorros" then

		
				local realBlood = getElementData(playersource,"blood") or 0 
		local progressMedik = getElementData(playersource,"progress.medik") or 0 
		local progressBoec = getElementData(playersource,"progress.boec") or 0
		if realBlood+7000>12000+((progressMedik*60)+(progressBoec*20)) then
		 bloodplus = 12000+((progressMedik*60)+(progressBoec*20))-realBlood
		 else
		 bloodplus = 7000
		end
		triggerClientEvent ( playersource,"drawingAlphaText",playersource,playersource,"Sangue: +"..(bloodplus or 7000).."",200,0,0,"down",false,true)
	addPlayerStats (playersource,"blood",7000)
	setElementData(playersource,"brokenbone",false) --client
	setElementData(playersource,"pain",false) --client
		setElementData(playersource,"bleeding",0) --client
		
	--elseif itemName == "Pacote de Calor" then

	--setElementData(playersource,"cold",false) --client
	--	setElementData(playersource,"temperature",37) --client
	--	setElementData(playersource,itemName,getElementData(playersource,itemName)-1) --client
	elseif itemName == "Analgésico" then

		setElementData(playersource,"pain",false) --client
	elseif itemName == "Morfina" then

		setElementData(playersource,"brokenbone",false) --client
		elseif itemName == "Antibiótico" then

		setElementData(playersource,"infection",false) --client
	elseif itemName == "Bolsa de Sangue" then

		
		local realBlood = getElementData(playersource,"blood") or 0 
		local progressMedik = getElementData(playersource,"progress.medik") or 0 
		local progressBoec = getElementData(playersource,"progress.boec") or 0
		if realBlood+12000>12000+((progressMedik*60)+(progressBoec*20)) then
		 bloodplus = 12000+((progressMedik*60)+(progressBoec*20))-realBlood	 
		 else
		 bloodplus = 12000
		end
		triggerClientEvent (playersource, "drawingAlphaText",playersource,playersource,"Sangue: +"..(bloodplus or 12000).."",200,0,0,"down",false,true)
		addPlayerStats (playersource,"blood",12000)
	end
end,1500,1)	
	triggerClientEvent(playersource,"refreshInventoryManual",playersource)
end
addEvent("onPlayerUseMedicObject",true)
addEventHandler("onPlayerUseMedicObject",getRootElement(),onPlayerUseMedicObject)

function onPlayerGiveMedicObject(itemName,player)
local playersource = source
setPedAnimation (playersource,"BOMBER","BOM_Plant",-1,false,false,false,false)

setTimer( function ()
	if itemName == "bandage" then
	if (getElementData(playersource,"Ataduras") or 0) >= 1 then
		setElementData(player,"bleeding",0) --client
		setElementData(playersource,"Ataduras",getElementData(playersource,"Ataduras")-1) --client
		triggerClientEvent(player,"PlaySoundDayZ",player,"Bandage",0,3)
		triggerClientEvent (playersource, "drawingAlphaText",playersource,playersource,"Karma: +40",0,200,0,"down",false,true)
		addPlayerStats (playersource,"humanity",40)
	end
	elseif itemName == "giveblood" then
	if (getElementData(playersource,"Bolsa de Sangue") or 0) >= 1 then
		addPlayerStats (player,"blood",12000)
		setElementData(playersource,"Bolsa de Sangue",getElementData(playersource,"Bolsa de Sangue")-1) --client
		triggerClientEvent(player,"PlaySoundDayZ",player,"Bloodbag",0,0)
		triggerClientEvent (playersource, "drawingAlphaText",playersource,playersource,"Karma: +250",0,200,0,"down",false,true)
		addPlayerStats (playersource,"humanity",250)
end
	elseif itemName == "givemorph" then
		if (getElementData(playersource,"Morfina") or 0) >= 1 then
		setElementData(player,"brokenbone",false) --client
		setElementData(playersource,"Morfina",getElementData(playersource,"Morfina")-1) --client
		triggerClientEvent(player,"PlaySoundDayZ",player,"Morphine",0,0)	
		addPlayerStats (playersource,"humanity",250)
		triggerClientEvent (playersource, "drawingAlphaText",playersource,playersource,"Karma: +250",0,200,0,"down",false,true)
end
		elseif itemName == "giveobezb" then
		if (getElementData(playersource,"Analgésico") or 0) >= 1 then
		setElementData(player,"pain",false) --client
		setElementData(playersource,"Analgésico",getElementData(playersource,"Analgésico")-1) --client
		triggerClientEvent(player,"PlaySoundDayZ",player,"Painkiller",0,3)
		addPlayerStats (playersource,"humanity",250)
		triggerClientEvent (playersource, "drawingAlphaText",playersource,playersource,"Karma: +250",0,200,0,"down",false,true)
end
	end
end,1500,1)	
end
addEvent("onPlayerGiveMedicObject",true)
addEventHandler("onPlayerGiveMedicObject",getRootElement(),onPlayerGiveMedicObject)



-- 13,22,56,67,68,69,70,92,97,105,107,108,126,127,128,152,162,167,188,195,206,209,212,229,230,258,264,277,280 
local skinTable = {
{"Vestuário: Militar 1",288},
{"Vestuário: Militar 2",286},
{"Vestuário: Militar 3",285},
{"Vestuário: Militar 4",284},
{"Vestuário: Militar 5",283},
{"Vestuário: Militar 6",282},
{"Vestuário: Militar 7",281},
{"Vestuário: Militar 8",276},
{"Vestuário: Mergulho",280},
{"Vestuário: Sobrevivente 1",279},
{"Vestuário: Sobrevivente 2",278},
{"Vestuário: Sobrevivente 3",277},
{"Vestuário: Sobrevivente 4",287},
{"Vestuário: Sobrevivente 5",259},
{"Vestuário: Sobrevivente 6",258},
{"Vestuário: Sobrevivente 7",255},
{"Vestuário: Atirador 1",249},
{"Vestuário: Atirador 2",250},
{"Vestuário: Atirador 3",252},
{"Vestuário: Atirador 4",253},
{"Vestuário: Bandido 1 nível",275},
{"Vestuário: Bandido nível 2",274},
{"Vestuário: Bandido nível 3",264},
{"Vestuário: Bandido nível 4",262},
{"Vestuário: Bandido nível 5",261},
{"Vestuário: Hero",260},

}

function getSkinIDFromName(name)
	for i,skin in ipairs(skinTable) do
		if name == skin[1] then
			return skin[2]
		end
	end
end

function getSkinNameFromID(id)
	for i,skin in ipairs(skinTable) do
		if id == skin[2] then
			return skin[1]
		end
	end
end

function addPlayerSkin (skin,itemData)
	local current = getElementData(source,"skin")
	local name = getSkinNameFromID(current)
	removeAllClotElements(source,"all")
	if name then
	local currentSS = getElementData(source,name) or false
	if currentSS then
	setElementData(source,name,getElementData(source,name)+1) --client
	end
	end
	
	setElementData(source,skin,getElementData(source,skin)-1) --client
	
	setElementData(source,"skin",itemData) --client

	setPedSkin(source,itemData)

	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSkin",true)
addEventHandler("onPlayerChangeSkin",getRootElement(),addPlayerSkin)


function onPlayerRefillWaterBottle (itemName)
	if isElementInWater(source) then
		setElementData(source,"Garrafa de Água Completo",getElementData(source,"Garrafa de Água Completo")+1) --client
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
		triggerClientEvent(source,"refreshInventoryManual",source)
		triggerClientEvent (source, "displayClientInfo", source,"Garrafa de Água Completo",shownInfos["filledup"],22,255,0)
		triggerClientEvent(source,"PlaySoundDayZ",source,"RefillWaterBottle",0,0)
	else
		triggerClientEvent (source, "displayClientInfo", source,"Garrafa de Água Completo",shownInfos["needwatersource"],255,22,0)
	end	
end
addEvent("onPlayerRefillWaterBottle",true)
addEventHandler("onPlayerRefillWaterBottle",getRootElement(),onPlayerRefillWaterBottle)

function getPointFromDistanceRotation(x, y, dist, angle)
 
    local a = math.rad(90 - angle);
 
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
 
    return x+dx, y+dy;
 
end

function onPlayerPitchATent (itemName)
if getPedOccupiedVehicle(source) then
return
end
if not getElementData(source,"InGreenZone") then
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

local source = source
setTimer( function ()		
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 2 * math.cos(offsetRot)
		local vy = py + 2 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+180
		local tent = createObject(3243,vx,vy,z-1,0,0,vrot)
		local tentCol = createColSphere(x,y,z,4)
		
		setElementParent(tent,tents)
		setElementParent(tentCol,tent)
		
		--setObjectScale(tent,1.3)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent) --client
		setElementData(tent,"parent",tentCol) --client
		setElementData(tentCol,"tent",true) --client
		setElementData(tentCol,"vehicle",true) --client
		setElementData(tentCol,"PlayerNick",getPlayerName(source)) 
		setElementData(tentCol,"PlayerSerial",getPlayerSerial(source)) 
		setElementData(tentCol,"MAX_Slots",100) --client
		triggerClientEvent(source,"refreshInventoryManual",source)
end,1500,1)		
else
outputChatBox("Você está na zona verde!",source)
end	
end

addEvent("onPlayerPitchATent",true)
addEventHandler("onPlayerPitchATent",getRootElement(),onPlayerPitchATent)


function onPlayerPitchABigTent (itemName)
if getPedOccupiedVehicle(source) then
return
end
if not getElementData(source,"InGreenZone") then
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

local source = source
setTimer( function ()		
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 3 * math.cos(offsetRot)
		local vy = py + 3 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+180
		local tent = createObject(14785,vx,vy,z-1,0,0,vrot)
		local tentCol = createColSphere(x,y,z,4)
		
		setElementParent(tent,tents)
		setElementParent(tentCol,tent)
		
		--setObjectScale(tent,1.3)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent) --client
		setElementData(tent,"parent",tentCol) --client
		setElementData(tentCol,"tent",true) --client
		setElementData(tentCol,"vehicle",true) --client
		setElementData(tentCol,"PlayerNick",getPlayerName(source)) 
		setElementData(tentCol,"PlayerSerial",getPlayerSerial(source)) 
		setElementData(tentCol,"MAX_Slots",200) --client
		setElementData(tentCol,"bigTent",true)
		triggerClientEvent(source,"refreshInventoryManual",source)
end,1500,1)		
else
outputChatBox("Você está na zona verde!",source)
end	
end

addEvent("onPlayerPitchABigTent",true)
addEventHandler("onPlayerPitchABigTent",getRootElement(),onPlayerPitchABigTent)


function onPlayerPitchADMINTent (itemName)
if getPedOccupiedVehicle(source) then
return
end
if not getElementData(source,"InGreenZone") then
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

local source = source
setTimer( function ()		
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 3 * math.cos(offsetRot)
		local vy = py + 3 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+180
		local tent = createObject(2991,vx,vy,z-.5,0,0,vrot)
		local tentCol = createColSphere(x,y,z,4)
		
		setElementParent(tent,tents)
		setElementParent(tentCol,tent)
		
		--setObjectScale(tent,.5)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent) --client
		setElementData(tent,"parent",tentCol) --client
		setElementData(tentCol,"tent",true) --client
		setElementData(tentCol,"vehicle",true) --client
		setElementData(tentCol,"PlayerNick",getPlayerName(source)) 
		setElementData(tentCol,"PlayerSerial",getPlayerSerial(source)) 
		setElementData(tentCol,"MAX_Slots",981289189298) --client
		setElementData(tentCol,"ADMINTent",true)
		triggerClientEvent(source,"refreshInventoryManual",source)
end,1500,1)		
else
outputChatBox("Você está na zona verde!",source)
end	
end

addEvent("onPlayerPitchADMINTent",true)
addEventHandler("onPlayerPitchADMINTent",getRootElement(),onPlayerPitchADMINTent)



function onPlayerPitchASave (itemName,pass)
if getPedOccupiedVehicle(source) then
return
end
if not getElementData(source,"InGreenZone") then
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

local source = source
setTimer( function ()		
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 1 * math.cos(offsetRot)
		local vy = py + 1 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot
		local tent = createObject(1907,vx,vy,z-0.5,0,0,vrot)
		
		local tentCol = createColSphere(x,y,z,4)
		
		setElementParent(tent,tents)
		setElementParent(tentCol,tent)
		
		--setObjectScale(tent,1.3)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent) --client
		setElementData(tent,"parent",tentCol) --client
		setElementData(tentCol,"tent",true) --client
		setElementData(tentCol,"vehicle",true) --client
		setElementData(tentCol,"save",true) --client
		setElementData(tentCol,"PlayerNick",getPlayerName(source)) 
		setElementData(tentCol,"PlayerSerial",getPlayerSerial(source)) 
		setElementData(tentCol,"MAX_Slots",150) --client
		setElementData(tentCol,"pass",pass) --client
		outputChatBox("Cofre instalado com senha: "..pass,source)
		triggerClientEvent(source,"refreshInventoryManual",source)
end,1500,1)		
else
outputChatBox("Você está na zona verde!",source)
end	
end

addEvent("onPlayerPitchASave",true)
addEventHandler("onPlayerPitchASave",getRootElement(),onPlayerPitchASave)

function onPlayerBuildAWireFence (itemName)
if getPedOccupiedVehicle(source) then
return
end
if not getElementData(source,"InGreenZone") then
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

local source = source
setTimer( function ()				
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 1 * math.cos(offsetRot)
		local vy = py + 1 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+90
		--local x,y = getPointFromDistanceRotation(x,y,5,0)
		local tent = createObject(983,vx,vy,pz,xr,yr,vrot)
		setObjectScale(tent,1)
		local tentCol = createColSphere(x,y,z,2)
		
		setElementParent(tent,playerMapObjects)
		setElementParent(tentCol,tent)
		
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent) --client
		setElementData(tent,"parent",tentCol) --client
		setElementData(tentCol,"PlayerNick",getPlayerName(source)) 
		setElementData(tentCol,"PlayerSerial",getPlayerSerial(source)) 
		setElementData(tentCol,"wirefence",true) --client
		triggerClientEvent(source,"refreshInventoryManual",source)
end,1500,1)		
else
outputChatBox("Você está na zona verde!",source)
end	
end
addEvent("onPlayerBuildAWireFence",true)
addEventHandler("onPlayerBuildAWireFence",getRootElement(),onPlayerBuildAWireFence)

function removeWirefence (object)
	local x,y,z = getElementPosition(source)
	
	local item,itemString = getItemTablePosition("Arame Farpado")
	local itemPickup = createItemPickup(item,x,y,z-0.05,itemString)
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
end
addEvent("removeWirefence",true)
addEventHandler("removeWirefence",getRootElement(),removeWirefence)


function onPlayerBuildAMine (itemName)
if getPedOccupiedVehicle(source) then
return
end
if not getElementData(source,"InGreenZone") then
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

local source = source
setTimer( function ()				
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 1 * math.cos(offsetRot)
		local vy = py + 1 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+90
		--local x,y = getPointFromDistanceRotation(x,y,5,0)
		local tent = createObject(1862,vx,vy,pz-0.950,xr,yr,vrot)
		setObjectScale(tent,2)
		local tentCol = createColSphere(x,y,z,2)
		tentColmine =  createColSphere ( x,y,z, 10 )
		
		setElementParent(tent,playerMapObjects)
		setElementParent(tentCol,tent)
		setElementParent(tentColmine,tentCol)
		
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent) --client
		setElementData(tentCol,"parentCol",tentColmine) --client
		setElementData(tent,"parent",tentCol) --client
		setElementData(tentCol,"mine",true) --client
		triggerClientEvent(source,"refreshInventoryManual",source)

end,1500,1)
else
outputChatBox("Você está na zona verde!",source)
	end		
end
addEvent("onPlayerBuildAMine",true)
addEventHandler("onPlayerBuildAMine",getRootElement(),onPlayerBuildAMine) 





function InMine(hitElement)
if getElementData(hitElement,"mine") then
local  tableObJ = getElementsWithinColShape ( getElementData(hitElement,"parentCol"), "object" )
local  tablePlayer = getElementsWithinColShape ( getElementData(hitElement,"parentCol"), "player" )



	for i,obj in ipairs(tableObJ) do
		if getElementData(getElementData(obj,"parent"),"mine")  then
		
local x,y,z = getElementPosition(obj)
local col = getElementData(obj,"parent")
local colC = getElementData(col,"parentCol") 
destroyElement(colC)
destroyElement(col)
destroyElement(obj)
createExplosion ( x,y,z, 0)


		end
	end

	for i,obj in ipairs(tablePlayer) do
		if not getElementData(obj,"isDead") == true then
triggerEvent("kilLDayZPlayer",obj)
	setElementData(obj,"isDead",true) --server
end	
	end
	
	
end

end
 		addEventHandler ( "onElementColShapeHit", root, InMine )
	
function InMine2(hitElement)
if getElementData(getElementData(hitElement,"parent"),"mine") then

local colCol= getElementData(getElementData(hitElement,"parent"),"parentCol")

local  tableObJ = getElementsWithinColShape ( colCol, "object" )
local  tablePlayer = getElementsWithinColShape ( colCol, "player" )



	for i,obj in ipairs(tableObJ) do
local col = getElementData(obj,"parent")
		if getElementData(col,"mine")  then
		
local x,y,z = getElementPosition(obj)
local col = getElementData(obj,"parent")
local colC = getElementData(col,"parentCol") 
destroyElement(colC)
destroyElement(col)
destroyElement(obj)
createExplosion ( x,y,z, 0)


		end
	end

	for i,obj in ipairs(tablePlayer) do
	if not getElementData(obj,"isDead") == true then
triggerEvent("kilLDayZPlayer",obj)
setElementData(obj,"isDead",true) --server
end
	end
	
	
end

end
	
addEvent("MineDestroy",true)
addEventHandler("MineDestroy",getRootElement(),InMine2)




function onPlayerBuildASandBags (itemName)
if getPedOccupiedVehicle(source) then
return
end

if getElementData(source,"Pá") >=1 then
		setElementData(source,itemName,getElementData(source,itemName)-1) --client
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

local source = source
setTimer( function ()				
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 1 * math.cos(offsetRot)
		local vy = py + 1 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+90
		--local x,y = getPointFromDistanceRotation(x,y,5,0)
		local tent = createObject(1875,vx,vy,pz-0.5,xr,yr,vrot)
		setObjectScale(tent,1)
		local tentCol = createColSphere(x,y,z,2)
		
		setElementParent(tent,playerMapObjects)
		setElementParent(tentCol,tent)
		
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent) --client
		setElementData(tent,"parent",tentCol) --client
		setElementData(tentCol,"sandbags",true) --client
		setElementData(tentCol,"PlayerNick",getPlayerName(source))
		setElementData(tentCol,"PlayerSerial",getPlayerSerial(source))
		triggerClientEvent(source,"refreshInventoryManual",source)
end,1500,1)		
else
outputChatBox("Você não tem uma pá!",source)
end	
end
addEvent("onPlayerBuildASandBags",true)
addEventHandler("onPlayerBuildASandBags",getRootElement(),onPlayerBuildASandBags)

function removeSandBags (object)
	local x,y,z = getElementPosition(source)
	local item,itemString = getItemTablePosition("Sacos de Areia")
	local itemPickup = createItemPickup(item,x,y,z,itemString)
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
end
addEvent("removeSandBags",true)
addEventHandler("removeSandBags",getRootElement(),removeSandBags)









function removeTent (object,name)
	local x,y,z = getElementPosition(source)
	
	if name then
	local item,itemString = getItemTablePosition(name)
	local itemPickup = createItemPickup(item,x,y,z,itemString)
	end
	
	local counter = getElementData(getElementData(object,"parent"),"counterT")
	if counter then 
	tentData = getAccount("EpochZtent_number_"..counter,"hgij2o3hg23")
	if tentData then
	setAccountData(tentData,"removed",true)
	removeAccount(tentData)
	end
	end
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
end
addEvent("removeTent",true)
addEventHandler("removeTent",getRootElement(),removeTent)





function removeSave (object)
if (getElementData(source,"Pá") or 0) >= 1  then
if (getElementData(source,"Caixa de Ferramentas") or 0) >= 1 then


	local counter = getElementData(getElementData(object,"parent"),"counterT")
	if counter then 
	tentData = getAccount("EpochZtent_number_"..counter,"hgij2o3hg23")
	if tentData then
	setAccountData(tentData,"removed",true)
	removeAccount(tentData)
	end
	end
	
	local x,y,z = getElementPosition(source)
	local item,itemString = getItemTablePosition("Cofre")
	local itemPickup = createItemPickup(item,x,y,z-0.3,itemString)
	
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
	else
	outputChatBox("Você não tem ferramentas!",source)
end
else
outputChatBox("Você não tem uma pá!",source)
end
end
addEvent("removeSave",true)
addEventHandler("removeSave",getRootElement(),removeSave)

function addPlayerCookMeat (player,act)
	setPedAnimation (player,"BOMBER","BOM_Plant",-1,false,false,false,false)

if act ==1 then
	setTimer(function()
	local smeat = getElementData(player,"Carne Crua") or 0 
			setElementData(player,"Carne Crua",smeat-1) --client
	local zmeat = getElementData(player,"Carne Grelhada") or 0
			setElementData(player,"Carne Grelhada",zmeat+1) --client
			triggerClientEvent (player, "displayClientInfo", player,"Fogueira","Você cozinhou 1 Carne Crua.",22,255,0)
	end,5000,1)
	elseif act ==2 then
	setTimer(function()
	local srib = getElementData(player,"Peixe Cru") or 0 
			setElementData(player,"Peixe Cru",srib-1) --client
	local zrib = getElementData(player,"Peixe Frito") or 0
			setElementData(player,"Peixe Frito",zrib+1) --client
			triggerClientEvent (player, "displayClientInfo", player,"Fogueira","Você cozinhou 1 Peixe Cru.",22,255,0)
	end,5000,1)
end
end
addEvent("addPlayerCookMeat",true)
addEventHandler("addPlayerCookMeat",getRootElement(),addPlayerCookMeat)












function onPlayerMakeAFire (itemName)
if (getElementData(source,"Lenha") or 0) <= 0 then
kickPlayer (source)
return
end 
local source = source
setPedAnimation (source,"BOMBER","BOM_Plant",-1,false,false,false,false)

setTimer( function()

		setElementData(source,"Lenha",getElementData(source,"Lenha")-1) --client
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 1 * math.cos(offsetRot)
		local vy = py + 1 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+90
		--local x,y = getPointFromDistanceRotation(x,y,5,0)
		local wood = createObject(1463,vx,vy,pz-0.875,xr,yr,vrot)
		setObjectScale(wood,2)
		setElementCollisionsEnabled(wood, false)
		setElementFrozen (wood,true)
		local fire = createObject(3525,vx,vy,pz-0.75,xr,yr,vrot)
		setObjectScale(fire,0)
		local fireCol = createColSphere(x,y,z,2)
		
		
		setElementParent(wood,playerMapObjects)
		setElementParent(fire,wood)
		setElementParent(fireCol,wood)
		
		setElementData(fireCol,"parent",wood) --client
		setElementData("Lenha","parent",fireCol) --client
		setElementData(fireCol,"fireplace",true) --client
		triggerClientEvent(source,"refreshInventoryManual",source)
		setTimer(function()
			destroyElement(fireCol)
			destroyElement(fire)
			destroyElement(wood)
		end,120000,1)
 end, 1500,1)

end
addEvent("onPlayerMakeAFire",true)
addEventHandler("onPlayerMakeAFire",getRootElement(),onPlayerMakeAFire)

function onPlayerPlaceRoadflare (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1) --client
	local x,y,z = getElementPosition(source)
	local object = createObject(354,x,y,z-0.6)
	
	setElementParent(object,playerMapObjects)
	
		
	setTimer(destroyElement,300000,1,object)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerPlaceRoadflare",true)
addEventHandler("onPlayerPlaceRoadflare",getRootElement(),onPlayerPlaceRoadflare)

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

--------------------------------------------------------
--Chat Systeme					 					  --
--------------------------------------------------------

function isAdmin(accName)
return isObjectInACLGroup ( "user." .. accName, aclGetGroup ( "Admin" ) )
end
function indexOfTable(table1,element)

for index, nearbyPlayer in ipairs( table1 ) do
if nearbyPlayer == element then
return true
end
end
return false
end
local chatRadius = 15
local chatEadioRadius = 250
 
function sendMessageToNearbyPlayers( message, messageType )
cancelEvent()
    if (messageType == 0) then
		local posX, posY, posZ = getElementPosition( source )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
		

		
		
		
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
            outputChatBox("#D3D3D3[LOCAL]#FF0000"..string.gsub(getPlayerName(source), '#%x%x%x%x%x%x', '')..": #D3D3D3"..message,nearbyPlayer, 211,211,211,true ) -- Color changed from 60,200,40 to 211,211,211
        end
		
		for k,player in ipairs(getElementsByType ( "player" )) do 
 
			if isAdmin(getAccountName (getPlayerAccount(player))) then
				if source ~= player then 
				if not indexOfTable(nearbyPlayers,player) then
					 outputChatBox("#D3D3D3(ADMIN_LOCAL)#FF0000"..string.gsub(getPlayerName(source), '#%x%x%x%x%x%x', '')..": #D3D3D3"..message,player, 211,211,211,true )
				end
				end
			end
   
		end
		
	end	
end
addEventHandler( "onPlayerChat", getRootElement(), sendMessageToNearbyPlayers )


function showAllChatForAdminChatMessage(mess,typemess)
if typemess ==2 then 
local sourceGroup = getElementData(source,"group") or false
if sourceGroup then

for k,player in ipairs(getElementsByType ( "player" )) do 
 
     if isAdmin(getAccountName (getPlayerAccount(player))) then
		if source ~= player then 
		local adminGroup = getElementData(player,"group") or "n"
		if adminGroup~=sourceGroup then
			 outputChatBox("#FFFF00(ADMIN_GROUP)#FF0000"..string.gsub(getPlayerName(source), '#%x%x%x%x%x%x', '')..": #FFFF00"..mess,player, 211,211,211,true )
		end
		end
    end
   
end



end
end
end

addEventHandler( "onPlayerChat", getRootElement(), showAllChatForAdminChatMessage )


function playerRadioChat(playersource,cmd,...)
	if cmd == "radiochat" then
		local msg2 = table.concat({...}, " ")
		if (getElementData(playersource,"Walkie-Talkie") or 0) <= 0 then outputChatBox(shownInfos["noradio"],playersource) return end
        local posX, posY, posZ = getElementPosition( playersource )
        local chatSphere = createColSphere( posX, posY, posZ, chatEadioRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
		
		
		
		
		
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
			if (getElementData(nearbyPlayer,"Walkie-Talkie") or 0) > 0 then
				outputChatBox("[RADIO]"..string.gsub((getPlayerName(playersource).." : "..msg2), '#%x%x%x%x%x%x', ''),nearbyPlayer, 238,238,0,true ) -- Color changed from 60,200,40 to 238,238,0
			end
        end
	end
end
--addCommandHandler( "radiochat", playerRadioChat )
 
function blockChatMessage(m,mt)
    if mt == 1 then
		cancelEvent()
	end
end
addEventHandler( "onPlayerChat", getRootElement(), blockChatMessage )








--player Wildcard
function getPlayerWildcard(namePart)
	namePart = string.lower(namePart)
	
	local bestaccuracy = 0
	local foundPlayer, b, e
	for _,player in ipairs(getElementsByType("player")) do
		b,e = string.find(string.lower(string.gsub(getPlayerName(player), "#%x%x%x%x%x%x", "")), namePart)
		if b and e then
			if e-b > bestaccuracy then
				bestaccuracy = e-b
				foundPlayer = player
			end
		end
	end
	
	if (foundPlayer) then
		return foundPlayer
	else
		return false
	end
end





	


--Weapon Property
setWeaponProperty (29,"pro","maximum_clip_ammo",25)
setWeaponProperty (30,"pro","maximum_clip_ammo",30)
setWeaponProperty (33,"pro","maximum_clip_ammo",1)
setWeaponProperty (31,"pro","maximum_clip_ammo",100)
setWeaponProperty (23,"pro","maximum_clip_ammo",10)
setWeaponProperty (22,"pro","maximum_clip_ammo",10)
setWeaponProperty (24,"pro","maximum_clip_ammo",6)
setWeaponProperty (27,"pro","maximum_clip_ammo",8)
setWeaponProperty (25,"pro","maximum_clip_ammo",8) 
setWeaponProperty (34,"pro","maximum_clip_ammo",5)

setWeaponProperty (29,"pro", "weapon_range", 300)
setWeaponProperty (29,"pro", "target_range", 300)
setWeaponProperty (30,"pro", "weapon_range", 300)
setWeaponProperty (30,"pro", "target_range", 300)
setWeaponProperty (31,"pro", "weapon_range", 300)
setWeaponProperty (31,"pro", "target_range", 300)
setWeaponProperty (33,"pro", "weapon_range", 300)
setWeaponProperty (33,"pro", "target_range", 300)
setWeaponProperty (23,"pro", "weapon_range", 300)
setWeaponProperty (23,"pro", "target_range", 300)
setWeaponProperty (22,"pro", "weapon_range", 300)
setWeaponProperty (22,"pro", "target_range", 300)

setWeaponProperty (34,"pro", "accuracy", 1.5) -- default: 1.25
setWeaponProperty (22,"pro", "accuracy", 1) -- default: 1.25
setWeaponProperty (23,"pro", "accuracy", 1) -- default: 1.5
setWeaponProperty (33,"pro", "accuracy", 1.5) -- default: 1
setWeaponProperty (31,"pro", "accuracy", 0.5) -- default: 0.8
setWeaponProperty (30,"pro", "accuracy", 1.5) -- default: 0.6
setWeaponProperty (29,"pro", "accuracy", 0.5) -- default: 1.2


--Pingkick

function kickPlayerOnHighPing (player,reason)
--local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)),aclGetGroup("Admin"))
--if isAdmin then
--outputChatBox(reason,player)
--return
--end
	kickPlayer(player,reason)
end
addEvent("kickPlayerOnHighPing",true)
addEventHandler("kickPlayerOnHighPing", getRootElement(),kickPlayerOnHighPing)

local handsUp = false
local siting = false
local lying = false





 
function  PlayerActions(player,act)
if act=="greeting" then
if isPedInVehicle (player) then return end
setPedAnimation (player,"ped","endchat_03",-1,false,false,false,false)

elseif act=="funcBindHandsup" then
	if handsUp then
		setPedAnimation (player,false)
		handsUp = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"BEACH","ParkSit_M_loop",-1,true,false,false,false)
		handsUp = true
	end
	elseif act=="funcBindSit" then
	if siting then
		setPedAnimation (player,false)
		siting = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"SHOP","SHP_Rob_HandsUp",-1,true,false,false,false)
		siting = true
	end	
end
end
addEvent("PlayerActions",true)
addEventHandler("PlayerActions", getRootElement(),PlayerActions)




function takeALLweap(sourcse,weap)
takeWeapon(source,sourcse)
if elementWeapon[source] then
	detachElementFromBone(elementWeapon[source])
	destroyElement(elementWeapon[source])
	elementWeapon[source] = false
end	
end
addEvent("takeALLweap",true)
addEventHandler("takeALLweap", getRootElement(),takeALLweap)


local weathers = {2,4,7,11,12,13,14,15,20}
function setWeather2(start)
local number = math.random(1,#weathers)
setWeatherBlended ( weathers[number] )

if start then
setWeather(12)
end
end
setTimer(setWeather2,3600000,0)
setWeather2(true)

function checkSetTime()
    local realtime = getRealTime()
    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)
end
checkSetTime()
setTimer(checkSetTime,60000,0)



function closeMyVH (veh)
setVehicleLocked  (  veh, true )
end
addEvent("closeMyVH",true)
addEventHandler("closeMyVH", getRootElement(),closeMyVH)

function openMyVH (veh)
setVehicleLocked  (  veh, false )
end
addEvent("openMyVH",true)
addEventHandler("openMyVH", getRootElement(),openMyVH)






function enterVehicle(enteringPlayer,  seat, jacked,  door) 
local id = getElementModel(source) 
local vehType = getVehicleType ( id )
	if vehType =="BMX" or vehType =="Bike" then
if isVehicleLocked ( source )  then
outputChatBox("Este veículo está fechado",enteringPlayer)
cancelEvent ()
end
end
end

addEventHandler ( "onVehicleStartEnter", getRootElement(), enterVehicle )

function PlusSlots()
local enginerSlots = getElementData(source,"progress.enginer") or 0
local attackerSlots = getElementData(source,"progress.attacker") or 0
return math.floor((enginerSlots+attackerSlots)*0.2)
end

function firewood (player,col)
local colwoods = getElementData(col,"woods") or 0 
local x = getElementData(col,"x") or 0 
local y = getElementData(col,"y") or 0 
local z = getElementData(col,"z") or 0 
if colwoods >=1 then
local curslots = getElementData(source,"current_SLOTS") or false
local maxslots = getElementData(source,"MAX_Slots") or false
if curslots >= maxslots+PlusSlots() then
triggerClientEvent (player,"displayClientInfo",player,"Lenha","Não há espaço suficiente na mochila!",255,0,0)
return
end
setElementData(col,"woods",colwoods-1,false) 
setElementRotation ( source, x, y, z )
setTimer( function ()
local woods = getElementData(player,"Lenha") or 0
setElementData(player,"Lenha",woods+1) --client 
triggerClientEvent (player,"displayClientInfo",player,"Lenha","Você cortou lenha!",22,255,0)
end,1500,1)	

else
triggerClientEvent (player,"displayClientInfo",player,"Lenha","Esta árvore não é mais adequada para cortar lenha!",255,0,0)
end
end
addEvent("firewood",true)
addEventHandler("firewood", getRootElement(),firewood)


function setBandit(player,model,lvl,skin)

if lvl then
triggerClientEvent ("onRollMessageStart", player, "#FF0000"..getPlayerName(player).." #FFFFFFEvoluiu para o Nível "..lvl,0,255,255, "Login")
else
triggerClientEvent ("onRollMessageStart", player, "#FF0000"..getPlayerName(player).." #FFFFFFEvoluiu o herói",0,255,0, "Login")
end

end
addEvent("setBandit",true)
addEventHandler("setBandit", getRootElement(),setBandit)

function zombiewR(www,www2)

if (getElementData(www,"Machado") or 0) >=1  then

destroyElement(getElementData(www2,"parent"))
destroyElement(www2)
			
local curslots = getElementData(www,"current_SLOTS") or false
local maxslots = getElementData(www,"MAX_Slots") or false
if curslots+3 >= maxslots+PlusSlots() then
triggerClientEvent (www,"displayClientInfo",www,"Lenha","Não há espaço suficiente na mochila!",255,0,0)
return
end			
				setElementData(www,"Saco de Peças de Zumbi",(getElementData(www,"Saco de Peças de Zumbi") or 0)+1) --client
				
else
triggerClientEvent (www,"displayClientInfo",www,"Lenha","Para esta ação Necessário Machado!",255,0,0)
return

				end
end
addEvent("zombieR",true)
addEventHandler("zombieR", getRootElement(),zombiewR)




local elementUdochka ={}
function startFishing(player,act)
if act =="start" then
setElementData(player,"fishing",true)
 local x,y,z = getElementPosition(player)
 elementUdochka[player] = createObject(1485,x,y,z)
 
 setElementParent(elementUdochka[player],player)
 
 setObjectScale ( elementUdochka[player], 0.7 )
attachElementToBone(elementUdochka[player],player,12,0,0.05,0,50,-180,90)

setPedAnimation(player,false)
setPedAnimation (player,"MUSCULAR","MuscleIdle_Csaw",-1,true,false,false,false)
--local anim = setPedAnimation (player,"MUSCULAR","MuscleIdle_Csaw",nil,true,false,false,false)


elseif act =="check" then
--setPedAnimation (player,"ped","BIKE_elbowL",-1,false,false,false,false)
setPedAnimation (player,"ped","BIKE_elbowL",-1,false,false,false,false)
setTimer(function() 
destroyElement(elementUdochka[player])
triggerClientEvent(player,"showClientMenuItem",player,"startFishing")

end,1000,1)
elseif act =="stop" then
destroyElement(elementUdochka[player])
setPedAnimation(player,false)
elseif act =="baiting" then
local curslots = getElementData(player,"current_SLOTS") or false
local maxslots = getElementData(player,"MAX_Slots") or false
if curslots+1 >= maxslots+PlusSlots() then
triggerClientEvent (player,"displayClientInfo",player,"Наживка","Não há espaço suficiente na mochila!",255,0,0)
return
end	

setPedAnimation (player,"BOMBER","BOM_Plant",-1,false,false,false,false)

local bait = getElementData(player,"Наживка") or 0
setTimer(function()
triggerClientEvent(player,"showClientMenuItem",player,"baiting")
setElementData(player,"Наживка",bait+1)
outputChatBox("Você tem +1 isca",player)
end,5000,1)
end

end
addEvent("startFishing",true)
addEventHandler("startFishing", getRootElement(),startFishing)

function deadbury(player,deadplayer)
if (getElementData(player,"Pá") or 0) <= 0 then
outputChatBox("Você não tem uma pá!",player)
return
end
local x,y,z = getElementPosition(deadplayer)
local player2 = getElementData(deadplayer,"parent")
local crest = createObject(2392,x,y,z-0.9)

		local cols = createColSphere(x,y,z,2)
		
		setElementParent(crest,playerMapObjects)
		setElementParent(cols,crest)
		
		setElementData(cols,"deadbury",true) --client
		if  getElementData(deadplayer,"playername") == "Zumbi" then
		setElementData(cols,"deadtext","Parece que há um zombie enterrado aqui...")
		else
		setElementData(cols,"deadtext","Parece que há um Jogador enterrado aqui....")
		end
		
		
destroyElement(deadplayer)
destroyElement(player2)
setTimer(function() 
destroyElement(crest)
destroyElement(cols)
end,1000000,1)
end
addEvent("deadbury",true)
addEventHandler("deadbury", getRootElement(),deadbury)

-- не забудь удалить из JoinKick
function AntiCarRemodel(oldModel, newModel)
   if ( getElementType(source) == "vehicle" ) then
           local occ = getVehicleOccupants ( source )
		    local occ1 = getVehicleOccupant ( source )
		if occ1 then
		local occSerial = getPlayerSerial(occ1)
		addBan(nil,nil,occSerial,nil,"Console:cheat")
		
		elseif occ then
			for i,seat in ipairs(occ) do
			local occSerial = getPlayerSerial(seat)
		addBan(nil,nil,occSerial,nil,"Console:cheat")
			end

		end
destroyElement(source)
destroyElement(getElementData(source,"parent"))
    
	end
end
addEventHandler("onElementModelChange", getRootElement(), AntiCarRemodel) -- Bind the event to every element






function VehDetals(car,col,model,size,xPosOffset,yPosOffset,zPosOffset, xRotOffset,  yRotOffset,  zRotOffset,name)
if not getElementData(car,"kowh") then
local x,y,z = getElementPosition(car)
kowh = createObject ( model, x,y,z)

setElementParent(kowh,car)

setObjectScale ( kowh, size )
 attachElements ( kowh, car, xPosOffset,yPosOffset,zPosOffset, xRotOffset,  yRotOffset,  zRotOffset)
 setElementData(car,"kowh",kowh)
 setElementData(car,"kowhName",name)
 end
end
addEvent("VehDetals",true)
addEventHandler("VehDetals", getRootElement(),VehDetals)


function VehDetalsDestr(car,kowh)
if  getElementData(car,"kowh") then
detachElements(kowh,car)
destroyElement(kowh)
 setElementData(car,"kowh",false)
 
 local name = getElementData(car,"kowhName")
 if name then 

 local kwsa= getElementData(source,name) or false
 setElementData(source,name,kwsa+1)
  setElementData(car,name,false)
 end
 end
end
addEvent("VehDetalsDestr",true)
addEventHandler("VehDetalsDestr", getRootElement(),VehDetalsDestr)



function clotElement (showingClot,clotType,clotProfit,name,bone,model,xPosOffset,yPosOffset,zPosOffset, xRotOffset,  yRotOffset,  zRotOffset,size)

 if clotType then 

 local clotTypeS = getElementData(source,"clotFile_"..clotType)
 if clotTypeS and clotTypeS ~= 0 then
destroyElement(clotTypeS)
 end
 if showingClot then
 local x,y,z = getElementPosition(source)
 local clotObj = createObject(model,x,y,z)
 
 setElementParent(clotObj,source)

		
 setElementCollisionsEnabled ( clotObj,false)
setObjectScale ( clotObj, size )
attachElementToBone(clotObj,source,bone,xPosOffset,yPosOffset,zPosOffset, xRotOffset,yRotOffset,zRotOffset)
setElementData(source,"clotFile_"..clotType,clotObj)
end
setElementData(source,"clotType_"..clotType,name)
setElementData(source,"clotProfit_"..clotType,clotProfit)
end

end

addEvent("clotElement",true)
addEventHandler("clotElement",getRootElement(),clotElement)





function removeAllClotElements(player,removeType)


 local clotTypeS1 = getElementData(player,"clotType_1") or false
 local clotTypeS2 = getElementData(player,"clotType_2") or false
 if removeType=="all" then
 if clotTypeS1  then
setElementData(player,"clotProfit_1",false)
setElementData(player,"clotType_1",false)
local clotFileS1 = getElementData(player,"clotFile_1") or false
if clotFileS1 then destroyElement(clotFileS1) end
setElementData(player,"clotFile_1",false)
 end
 if clotTypeS2  then
setElementData(player,"clotProfit_2",false)
setElementData(player,"clotType_2",false)
local clotFileS2 = getElementData(player,"clotFile_2") or false
if clotFileS2 then destroyElement(clotFileS2) end
setElementData(player,"clotFile_2",false)
 end
 elseif removeType=="quit" then 
 
 if clotTypeS1  then
 local clotFileS1 = getElementData(player,"clotFile_1") or false
 if clotFileS1 then destroyElement(clotFileS1) end 
 setElementData(player,"clotFile_1",false)
 end
 if clotTypeS2  then
 local clotFileS2 = getElementData(player,"clotFile_2") or false
 if clotFileS2 then destroyElement(clotFileS2) end 
 setElementData(player,"clotFile_2",false)
 end
 end
end
addEventHandler ( "onPlayerQuit", getRootElement(), function() 
removeAllClotElements(source,"quit")
end )
addEventHandler ( "onPlayerWasted", getRootElement(), function() 
removeAllClotElements(source,"all")
end )

function removeClotElements2(clotType)

 local clotFileS1 = getElementData(source,"clotType_"..clotType)
 if clotFileS1 then
setElementData(source,"clotProfit_"..clotType,false)
setElementData(source,"clotType_"..clotType,false)
local clotFileS1 = getElementData(source,"clotFile_"..clotType) or false
if clotFileS1 then destroyElement(clotFileS1) end 
setElementData(source,"clotFile_"..clotType,false)
 end

end
addEvent("clotElementDel",true)
addEventHandler("clotElementDel",getRootElement(),removeClotElements2)





local nearbyPlayers = {}
 
addEventHandler( 'onPlayerVoiceStart', root,
    function()
	local ration = getElementData(source,"Walkie-Talkie") or 0 
	if ration <=0 then 
	outputChatBox("Você não tem Walkie-Talkie!",source)
	cancelEvent()
	end

    end)
		
	
	
	
	
	
	
	
	reloadWeaponFromFireS = function( ) 
setControlState ( source, "aim_weapon", false)
setPedAnimation ( source, "BUDDY", "buddy_reload", -1, false,false,false,false)
end 

addEvent("reloadWeaponFromFire", true) 
addEventHandler("reloadWeaponFromFire", getRootElement(), reloadWeaponFromFireS)
	
	
	
	function sellCar(car)
	 if getElementData(car,"kowh") then
local kowh = getElementData(car,"kowh") or false
detachElements(kowh,car)
destroyElement(kowh)
 setElementData(car,"kowh",false)
end
local col = getElementData(car,"parent")
	destroyElement(car)
		destroyElement(col)
	end
	
	addEvent("sellCar",true)
addEventHandler("sellCar",getRootElement(),sellCar)
	
	addEventHandler("onPlayerLogin", root,
  function()
    toggleControl ( source, "vehicle_secondary_fire", false )
	toggleControl ( source, "vehicle_fire", false )
  end
)
	
	

