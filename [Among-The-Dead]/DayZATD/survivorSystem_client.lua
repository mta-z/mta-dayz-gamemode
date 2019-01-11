﻿
local clockShowState = false
 hideRadar = false
function playerStatsClientSite()
if getElementData(localPlayer,"logedin") then
toggleControl ("radar",false) 
if clockShowState then
	if  (getElementData(localPlayer,"Часы") or 0) < 1 then
	removeEventHandler("onClientRender",getRootElement(),renderClock)
	end
end

local radarShowStateByRes =  exports.ATD_RADARMAP:getMinimapState()

	if not hideRadar then

		if (getElementData(localPlayer,"Навигатор") or 0)>= 1  then
				if not radarShowStateByRes  then
					exports.ATD_RADARMAP:setState("show","radar") 
				end
			else
				if radarShowStateByRes  then
					exports.ATD_RADARMAP:setState("hide","radar")
				end
		end

	end
end
end
setTimer(playerStatsClientSite,1000,0)

function setHideRadar(state)
hideRadar = state
end

	function ClockShow()
		if  (getElementData(localPlayer,"Часы") or 0) >= 1 then
			addEventHandler("onClientRender",getRootElement(),renderClock)	
			clockShowState = true
		end
	end
	
	function ClockUnShow()
	removeEventHandler("onClientRender",getRootElement(),renderClock)
	clockShowState = false
	end
	
		bindKey("o","down",  ClockShow)
		bindKey("o","up",  ClockUnShow)





function playerZoom (key,keyState)
local hour, minutes = getTime()	
	if key == "n" then
		if (getElementData(localPlayer,"Прибор Ночного Виденья") or 0) > 0 then
			if nightvision then
				nightvision = false
				setCameraGoggleEffect("normal")
				if gameplayVariables["enablenight"] then
					setClientNight (hour,minutes)
				end
			else 
				nightvision = true
				setCameraGoggleEffect("nightvision")
				setFarClipDistance(1000)
				setFogDistance(100)
			end
		end
	elseif key == "i" then
		if (getElementData(localPlayer,"Инфракрасное Виденье") or 0) > 0 then
			if infaredvision then
				infaredvision = false
				setCameraGoggleEffect("normal")
				if gameplayVariables["enablenight"] then
					setClientNight (hour,minutes)
				end
			else 
				 infaredvision = true
				setCameraGoggleEffect("thermalvision")
				setFarClipDistance(1000)
				setFogDistance(100)
				
			end
		end
	end
end



bindKey("n","down",playerZoom)
bindKey("i","up",playerZoom)

function setClientNight (hour,minutes)
--outputChatBox("client "..hour..":"..minutes)
setTime ( hour, minutes )
if hour >= 22  and hour < 23 then


if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(500-5*minutes)
		setFogDistance(300-3.33333*minutes)
end


elseif hour >= 23 and hour < 24  then

if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(200)
		setFogDistance(100)		
end	
elseif  hour < 5  then

if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(200)
		setFogDistance(100)		
end	

elseif hour >= 5 and hour < 6  then

if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(200+5*minutes)
		setFogDistance(100+6.669*minutes)		
end
	
	elseif hour >= 6 and hour < 22  then


if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(500)
		setFogDistance(300)
			
end
		
end
end


--------------------------------------------------------
--Player Stats										  --
--------------------------------------------------------
function getGroundMaterial(x, y, z)
	local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight(x, y, z, x, y, z-10, true, false, false, true, false, false, false, false, nil)
	return material
end

function isInBuilding(x, y, z)
	local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight(x, y, z, x, y, z+10, true, false, false, true, false, false, false, false, nil)
	if hit then return true end
	return false
end

function isObjectAroundPlayer2 ( thePlayer, distance, height )
material_value = 0
 local x, y, z = getElementPosition( thePlayer )
 for i = math.random(0,360), 360, 1 do
  local nx, ny = getPointFromDistanceRotation( x, y, distance, i )
 local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight ( x, y, z + height, nx, ny, z + height,true,false,false,false,false,false,false,false )
	if material == 0 then
		material_value = material_value+1
	end
	if material_value > 40 then
		return 0,hitX, hitY, hitZ
	end
 end
 return false
end

function isObjectAroundPlayer ( thePlayer, distance, height )
 local x, y, z = getElementPosition( thePlayer )
 for i = math.random(0,360), 360, 1 do
  local nx, ny = getPointFromDistanceRotation( x, y, distance, i )
 local hit, hitX, hitY, hitZ, hitElement, normalX, normalY, normalZ, material = processLineOfSight ( x, y, z + height, nx, ny, z + height)
  if material == 0 then
   return material,hitX, hitY, hitZ
  end
 end
 return false
end

function getPointFromDistanceRotation ( x, y, dist, angle )
    local a = math.rad( 90 - angle )
    local dx = math.cos( a ) * dist
    local dy = math.sin( a ) * dist
    return x + dx, y + dy
end


function zombieSpawning()
if getElementData(localPlayer,"logedin") then
 local x, y, z = getElementPosition(localPlayer)
  local isGreen = getElementData(localPlayer,"InGreenZone") or false
  local inBase = getElementData(localPlayer,"inBase") or false
local material,hitX, hitY, hitZ = isObjectAroundPlayer2 ( localPlayer, 30, 3 )
local number1 = math.random(10,30)
local number2 = math.random(10,20)


local isclear = isLineOfSightClear (x+number1, y+number2, z+.6, x+number1, y+number2, z-50, true, false, false, true, false, false, false)

local groundPosition = getGroundPosition ( x+number1, y+number2, z+50 )
if groundPosition and material == 0 and not isInBuilding(x,y,z) and not isGreen and not inBase  and not isclear  and not isPedInVehicle (localPlayer) then
local zombieZone = getElementData(localPlayer,"zombieZone") or false
local spawnedzombies = getElementData(localPlayer,"spawnedzombies") or 0

if gameplayVariables["playerzombies"] > spawnedzombies then
	if zombieZone then
	triggerServerEvent("createZomieForPlayer",localPlayer,x+number1, y+number2, groundPosition+.6,zombieZone)
	else
	triggerServerEvent("createZomieForPlayer",localPlayer,x+number1, y+number2, groundPosition+.6,false)
	end
end
	
end

end
end
setTimer(zombieSpawning,3000,0)

--ALL ZOMBIES STFU
function stopZombieSound()
local zombies = getElementsByType ( "ped",getRootElement(), true )
for theKey,theZomb in ipairs(zombies) do
	setPedVoice(theZomb, "PED_TYPE_DISABLED")
end
end
setTimer(stopZombieSound,5000,0)



	


function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end




local F5Down = 0
function showDebugMonitor ()
if F5Down==0 then
guiSetVisible(statsWindows,true)
F5Down=1
elseif F5Down==1 then
local showingIcons  = isEventHandlerAdded('onClientRender', getRootElement(), updateIcons)
	if showingIcons then 
	removeEventHandler ( "onClientRender", getRootElement(), updateIcons )
	else
	addEventHandler ( "onClientRender", getRootElement(), updateIcons )
	end
F5Down=2

elseif F5Down==2 then
guiSetVisible(statsWindows,false)
	F5Down=0
end
	
	
end
--bindKey("F5","down",showDebugMonitor)
--addEventHandler ( "onClientRender", getRootElement(), updateIcons )

hideIcons = false
function showIcons(state) 

local showingIcons  = isEventHandlerAdded('onClientRender', getRootElement(), updateIcons)
	if showingIcons and state == false then 
	removeEventHandler ( "onClientRender", getRootElement(), updateIcons )
	hideIcons=true
	end
	if not showingIcons and state == true then
	addEventHandler ( "onClientRender", getRootElement(), updateIcons )
	hideIcons=false
	end

end
addEvent("showDebugMonitor",true)
addEventHandler("showDebugMonitor",getRootElement(),showIcons)





-- WEAPON DAMAGE TABLE IS IN editor_client.lua

function getWeaponDamage (weapon)
	for i,weapon2 in ipairs(damageTable) do

		if weapon2[1] == weapon then
		
			return weapon2[2]
		end
	end
	return false
end

function playRandomHitSound () 
	local number = math.random(1,3)
	local sound = playSound("sounds/bullet_hit_pain_"..number..".ogg")
end

--

function playerDamagedFromBot ( hitElement )
	if not hitElement then return end
	if getElementType(hitElement) =="player" and hitElement == localPlayer then
	--outputChatBox("BOT FIRE")
	
	weapName = getElementData(source,"weaponSwith") or false
	if not weapName then return end
	--outputChatBox(weapName)
	damage	= 100 

	

	if weapName == "MG36" then
	damage=5000
	botWeapon = "#FFFFFF c помощью MG36"
	botName = "#FF0000Бандит(пулеметчик)"
	elseif weapName == "G36C-SD" then
	damage=4000
	botWeapon = "#FFFFFF c помощью G36C-SD"
	botName = "#FF0000Бандит(штурмовик)"
	elseif weapName =="DMR" then
	damage=9000
	botWeapon = "#FFFFFF c помощью DMR"
	botName = "#FF0000Бандит(снайпер)"
	end
	setElementData(localPlayer,"blood",getElementData(localPlayer,"blood")-damage) --server
	showWhiteScreen()
	--outputChatBox("SCREEN FROM playerDamagedFromBot")
		--playRandomHitSound()
	
	--outputChatBox("DEMAGE: "..damage)
	
	if getElementData(localPlayer,"blood") <= 0 then
			if not getElementData(localPlayer,"isDead") == true then
			triggerServerEvent("kilLDayZPlayer",localPlayer,false,false,false,botName,botWeapon)
			setElementData(localPlayer,"isDead",true) --server
			end
			
		end	
		--outputChatBox("Стреляет бот")
	


	end
end
addEventHandler ( "onClientWeaponFire", root, playerDamagedFromBot )

function playerDamagedFromZombie( attacker, weapon, bodypart, loss )

cancelEvent()
	weapName = false
	headshot = false

	if getElementData(localPlayer,"InGreenZone") or getElementData(localPlayer,"inBase") then
		return
	end
	
if attacker then
	if getElementData(attacker,"zombie") then
	
			setElementData(localPlayer,"blood",getElementData(localPlayer,"blood")-math.random(1000,3000)) -- server Damage output - Default: 400,900
			showWhiteScreen()
			--outputChatBox("SCREEN FROM playerDamagedFromZombie")
			local infRand = math.random(0,100)
			if infRand <=5  then
				setInfection(true)
				drawingAlphaText(localPlayer,"Инфекция",200,10,0,"up",false,true)
			end
			
			if getElementData(localPlayer,"blood") <= 0 then
				if not getElementData(localPlayer,"isDead") == true then
					triggerServerEvent("kilLDayZPlayer",localPlayer,false,false,false)
					setElementData(localPlayer,"isDead",true) --server
				end
				
			end
	end
end

end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer (), playerDamagedFromZombie )

function playerDamagedFromWorld(attacker, weapon, bodypart, loss)

cancelEvent()
	weapName = false
	headshot = false

	if getElementData(source,"InGreenZone") or getElementData(source,"inBase") then
		return
	end
	
	if not attacker and loss < 35 and loss>=10 then
		if not getElementData(source,"brokenbone")  then
					drawingAlphaText(source,"Перелом",200,200,0,"up",false,true)
					setElementData(source,"brokenbone",true)
		end
	end
if not attacker and loss >= 35 then
			if not getElementData(source,"isDead") == true then
				triggerServerEvent("kilLDayZPlayer",source,false,headshot,weapName)
				setElementData(source,"isDead",true) --server
				return
			end		
		end
		
		if weapon == 63 or weapon == 51 or weapon == 19 then
			if not getElementData(source,"isDead") == true then
				triggerServerEvent("kilLDayZPlayer",source,false,headshot,weapName)
				setElementData(source,"isDead",true) --server
				return
			end
		end

end

addEventHandler ( "onClientPlayerDamage", getLocalPlayer (), playerDamagedFromWorld )

--[[

HIT POS: 7.9506797790527 -- глова верх
7.7678747177124 -- голова низ 
размер головы .18
HIT Elem POS: 7.2015218734741

HIT POS: 6.9523577690125 -- ноги
6.3871536254883 -- ноги низ
размер ног .55
HIT Elem POS: 7.2015218734741

СИДИТ 

PLAYER FIRE: 30
userdata: 0000E7BB
HIT POS: 6.4168586730957
HIT Elem POS: 7.271773815155
LEGS

]]
function getBodypart(hitZ,playerZ,hitElement)
if isPedDucked ( hitElement) then
playerZ=playerZ-0.61
end
local hitPositionZ= playerZ-hitZ
if hitPositionZ>0.2 then
return "LEGS"
end
if hitPositionZ<-0.56 then
return "HEAD"
end
return "BODY"
end
function playerGetDamageDayZ (weapon,ammo,ammoInClip,hitX,hitY,hitZ,hitElement,startX,startY,startZ )
local attacker = source
if hitElement and getElementType(hitElement) =="player" and hitElement == localPlayer then

if getElementData(hitElement,"InGreenZone") or getElementData(hitElement,"inBase") then
				return
			end	
			if attacker then
				if getElementData(attacker,"inBase") then
					return
				end
			end
			
			if not getElementData(hitElement,"inArena") then
				local playerGang = getElementData(hitElement,"group") or false
				local attackerGang = getElementData(attacker,"group") or false
				if attackerGang and playerGang  and playerGang == attackerGang then
					return
				end
			end
			
showWhiteScreen()
--outputChatBox("SCREEN FROM playerGetDamageDayZ")

	local number = math.random(1,7)
		if number == 2 then
			
			if not getElementData(hitElement,"pain")  then
				drawingAlphaText(hitElement,"Боль",200,200,0,"up",false,true)
				setElementData(hitElement,"pain",true)
			end
			
		--	setElementData(source,"pain",true) --server
			
		end
		
		if bodypart == "LEGS" then

		if not getElementData(hitElement,"brokenbone")  then
				drawingAlphaText(hitElement,"Перелом",200,200,0,"up",false,true)
				setElementData(hitElement,"brokenbone",true)
			end

		end
		
		local number = math.random(0,100)
		if  number <= 15 then
		
			if getElementData(hitElement,"bleeding") == 0  then
				drawingAlphaText(hitElement,"Кровотечение",200,10,0,"up",false,true)
				setElementData(hitElement,"bleeding",getElementData(hitElement,"bleeding") +math.random(50,600)) 
			end
		
		end
end

	if attacker == localPlayer then
		if hitElement and getElementType(hitElement) =="player" then
		
			if getElementData(hitElement,"InGreenZone") or getElementData(hitElement,"inBase") then
				return
			end	
			if attacker then
				if getElementData(attacker,"inBase") then
					return
				end
			end
			
			if not getElementData(hitElement,"inArena") then
				local playerGang = getElementData(hitElement,"group") or false
				local attackerGang = getElementData(attacker,"group") or false
				if attackerGang and playerGang  and playerGang == attackerGang then
					return
				end
			end
			

			
			local hx,hy,hz = getElementPosition(hitElement)
			local bodypart = getBodypart(hitZ,hz,hitElement)
			
			
			if bodypart=="HEAD" then
			headshot = true
			end
			
			local x, y, z = getElementPosition (hitElement)
			local zoneName = exports.atd_radarmap:getSquareFromMapPosition(x, y)
			if zoneName ~="" then
			zoneName = "в квадрате: #FFFF00"..zoneName
			end
			
			
			local weapName = getElementData(attacker,"weaponSwith") or false
			local damage = getWeaponDamage (weapName) or 1000
			
			
			local antirelogStarted = getElementData(hitElement,"antirelogStarted") or false
			
			if not antirelogStarted then
				setElementData(hitElement,"antirelogStarted",true)
				triggerServerEvent( 'server_OnPlayerDamage', hitElement,hitElement,attacker );
			end
			
			
			if weapName == "Gauss" or weapName == "KSVK"  then
				if not getElementData(hitElement,"isDead") == true then
					triggerServerEvent("kilLDayZPlayer",hitElement,attacker,headshot,weapName,false,false,zoneName)
					setElementData(hitElement,"isDead",true) --server
					return
				end
			end
			
			local type1Profit = getElementData(hitElement,"clotProfit_1") or false
		local type2Profit = getElementData(hitElement,"clotProfit_2") or false
		if not type1Profit and bodypart == "HEAD"  then 
		
		if not getElementData(hitElement,"isDead") == true then
				triggerServerEvent("kilLDayZPlayer",hitElement,attacker,true,weapName,false,false,zoneName)
				setElementData(hitElement,"isDead",true) --server
				return
					end
		
		end
		
			
		
	
	
		
			attackerPlusDemage = getElementData(attacker,"progress.attacker") or 0 
			sniperPlusDemage = getElementData(attacker,"progress.sniper") or 0 
			djagernautMinusDemage = getElementData(hitElement,"progress.djagernaut") or 0 
			djagernautPlusDemage = getElementData(attacker,"progress.djagernaut") or 0 
			boecPlusDemage = getElementData(attacker,"progress.boec") or 0 
			
			if weapon == 31 or weapon == 30 then
				if weapName =="M240" or weapName =="M249 Saw" or weapName =="MG36" or weapName =="Mk 48 Mod 0" or weapName =="PKM" or weapName =="PKP" then
				damage = damage+(djagernautPlusDemage*20)
				else
				damage = damage+(attackerPlusDemage*30)
				end
			elseif weapon == 34 then
			damage = damage+(sniperPlusDemage*30)
			elseif  weapon == 0 or weapon ==8 or weapon ==5 or weapon ==6 or weapon ==2 then
				damage = damage+(boecPlusDemage*30)
			end
		
		
			if type1Profit and type1Profit>1 and bodypart == "HEAD"  then
				damage = damage-damage/100*type1Profit
			end
			if type2Profit and type2Profit>1 and  bodypart == "BODY"  then
				damage = damage-damage/100*type2Profit
			end
			
			damage = damage-damage/100*(djagernautMinusDemage*0.2)
			
			
			
			setElementData(hitElement,"blood",getElementData(hitElement,"blood")-damage) --server
			outputConsole ( "Урон по игроку: "..getPlayerName(hitElement).." с учетом навыков/брони = "..damage..". Остаток: "..getElementData(hitElement,"blood") )
			
			
			
			
			if getElementData(hitElement,"blood") <= 0 then
				
				if not getElementData(hitElement,"isDead") == true then
					triggerServerEvent("kilLDayZPlayer",hitElement,attacker,headshot,weapName,false,false,zoneName)
					setElementData(hitElement,"isDead",true) --server
				end
			
			end


		
			
		end

	end

end
addEventHandler ( "onClientPlayerWeaponFire", root, playerGetDamageDayZ )



function playerGetDamageDayZ ( attacker, weapon, bodypart, loss )

	cancelEvent()
if weapon == 0 or weapon ==8 or weapon ==5 or weapon ==6 or weapon ==2 or weapon ==9 then
	weapName = false
	headshot = false
	
	if getElementData(source,"InGreenZone") or getElementData(source,"inBase") then
		return
	end
	
	
	if attacker then
		if getElementData(attacker,"inBase") then
			return
		end
	end

	if not getElementData(source,"inArena") then
				local playerGang = getElementData(source,"group") or false
				local attackerGang = getElementData(attacker,"group") or false
				if attackerGang and playerGang  and playerGang == attackerGang then
					return
				end
	end
		
if source == localPlayer then
showWhiteScreen()
end


		



		
		
	if attacker  == localPlayer then
		
		if getElementType(attacker) == "player" then
		
		
		local x, y, z = getElementPosition (localPlayer)
			local zoneName = exports.atd_radarmap:getSquareFromMapPosition(x, y)
			if zoneName ~="" then
			zoneName = "в квадрате: #FFFF00"..zoneName
			end
			if weapon == 0 then
				weapName = "Рук"
				damage = 100
			else
				weapName = getElementData(attacker,"weaponSwith") or false
				damage = getWeaponDamage (weapName) or 1000
			end
		
			if not getElementData(source,"inArena") then
			local playerGang = getElementData(source,"group") or false
			local attackerGang = getElementData(attacker,"group") or false
				if attackerGang and playerGang  and playerGang == attackerGang then
					return
				end
			end
		
		
		
		
		local type1Profit = getElementData(source,"clotProfit_1") or false
		local type2Profit = getElementData(source,"clotProfit_2") or false

		
			local antirelogStarted = getElementData(source,"antirelogStarted") or false
			
			if not antirelogStarted then
				setElementData(source,"antirelogStarted",true)
				triggerServerEvent( 'server_OnPlayerDamage', source,source,attacker );
			end
		
	
	
		
			djagernautMinusDemage = getElementData(source,"progress.djagernaut") or 0 
			boecPlusDemage = getElementData(attacker,"progress.boec") or 0 
			
	
			
			if  weapon == 0 or weapon ==8 or weapon ==5 or weapon ==6 or weapon ==2 or weapon ==9 then
				damage = damage+(boecPlusDemage*30)
			
			end
		
		
			if type1Profit and type1Profit>1 and bodypart == 9  then
				damage = damage-damage/100*type1Profit
			end
			if type2Profit and type2Profit>1 and  bodypart == 3  then
				damage = damage-damage/100*type2Profit
			end
			
			damage = damage-damage/100*(djagernautMinusDemage*0.2)
			
			--outputChatBox("DEMAGE: "..tostring(damage).." WEAPON: "..tostring(weapName) )
			
			
			
			setElementData(source,"blood",getElementData(source,"blood")-damage) --server
			
			outputConsole ( "Урон по игроку: "..getPlayerName(source).." с учетом навыков/брони = "..damage..". Остаток: "..getElementData(source,"blood") )
			--playRandomHitSound()
			


			if getElementData(source,"blood") <= 0 then
			
				if not getElementData(source,"isDead") == true then
					triggerServerEvent("kilLDayZPlayer",source,attacker,headshot,weapName,false,false,zoneName)
					setElementData(source,"isDead",true) --server
				end
			
			end		
		
		
		
		


		
			
	
		end
	end
	
	
	
	local number = math.random(1,7)
		if number == 2 then
			
			if not getElementData(source,"pain") and source == localPlayer then
				drawingAlphaText(source,"Боль",200,200,0,"up",false,true)
				setElementData(source,"pain",true)
			end
			
		--	setElementData(source,"pain",true) --server
			
		end
		
		local number = math.random(0,100)
		if  number <= 15 then
		
			if getElementData(source,"bleeding") == 0 and source == localPlayer then
				drawingAlphaText(source,"Кровотечение",200,10,0,"up",false,true)
				setElementData(source,"bleeding",getElementData(source,"bleeding") +math.random(50,600)) 
			end
			
		--	setElementData(source,"bleeding",getElementData(source,"bleeding") +math.random(50,600)) --server
			
			
		end
	
	end
end	
addEventHandler ( "onClientPlayerDamage", root, playerGetDamageDayZ )





function pedGetDamageDayZ ( attacker, weapon, bodypart, loss )
cancelEvent()
if getElementData(source,"zombie") then
if attacker then
if getElementType(attacker) == "vehicle" then
speedx, speedy, speedz = getElementVelocity ( attacker )
actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
kmh = actualspeed * 180
if kmh >= 20 then
local vehkiller = getVehicleOccupant ( attacker )
		setElementData(source,"blood",0) --server
		if getElementData(source,"blood") <= 0 and not getElementData(source,"isDeadZombie") then
		setElementData(source,"isDeadZombie",true)
			triggerServerEvent("onZombieGetsKilled",source,false)
		end

end
end
end



if attacker and attacker == localPlayer then
	damage = 100
	if weapon == 37 then
		return
	end
	if weapon == 63 or weapon == 51 or weapon == 19 then
		setElementData(source,"blood",0) --server
		if getElementData(source,"blood") <= 0 and not getElementData(source,"isDeadZombie") then
		setElementData(source,"isDeadZombie",true)
			triggerServerEvent("onZombieGetsKilled",source,attacker)
		--	drawingAlphaText(localPlayer,"Опыт: +30",200,200,200,"up",false,true)
		--	triggerServerEvent("Zomb_delete", getRootElement(), source)
		end
	elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
	 if weapon == 0 then
	damage = 100
 else
	weapName = getElementData(attacker,"weaponSwith") or false
	damage = getWeaponDamage (weapName)
	end 

if weapName == "Топор" or  weapName == "Бейсбольная Бита" or  weapName == "Мачете"  or  weapName == "Лом" or weapon == 0 then
local zombkilledRuk = math.random(1,3)
if zombkilledRuk == 1 then
bodypart = 9 

end
end
	local skin = getElementModel(source)
	if skin ~= 68 then
		if bodypart == 9 then
			setElementData(source,"blood",0)
			headshot = true
			else
			headshot = false
		end
	end
				if not headshot then
	--	drawingAlphaText(source,"Кровь: -"..damage,200,0,0,"down",10)
		end
		setElementData(source,"blood",getElementData(source,"blood")-damage) --server
		

		if getElementData(source,"blood") <= 0 and not getElementData(source,"isDeadZombie") then
			setElementData(source,"isDeadZombie",true)
			triggerServerEvent("onZombieGetsKilled",source,attacker,headshot)
			local zombieExpAdd = 30
		
		local playerExp = getElementData(localPlayer,"playerexp") or 1
		
		local killerGroup = getElementData(localPlayer,"group",false) or false
		if killerGroup then
			
				local profit = getElementData(localPlayer,"groupProfit",false) or false
				if profit then
				
					local groupExpAdd = (zombieExpAdd/100*50)
					zombieExpAdd = zombieExpAdd - groupExpAdd
				
					local SKILL_EXP = getElementData(localPlayer,"SKILL_EXP") or false
					if SKILL_EXP and SKILL_EXP>=1 then
						
						groupExpAdd = groupExpAdd+math.floor(groupExpAdd/100*(SKILL_EXP*3))
					end
					setElementData(localPlayer,"groupProfit",profit+groupExpAdd)
				
					drawingAlphaText(localPlayer,"Опыт группы: +"..groupExpAdd,200,200,200,"down",false,true)
				end
			
		end
		
		setElementData(localPlayer,"playerexp",playerExp+zombieExpAdd) --client
		
			drawingAlphaText(localPlayer,"Опыт: +"..zombieExpAdd,200,200,200,"up",false,true)
			
		--	triggerServerEvent("Zomb_delete", getRootElement(), source)
		end
	end
end	
end

if getElementData(source,"bot") then

if attacker and attacker == localPlayer then
	damage = 100
	if weapon == 37 then
		return
	end
	if weapon == 63 or weapon == 51 or weapon == 19 then
		setElementData(source,"blood",0) --server
		if getElementData(source,"blood") <= 0 and not getElementData(source,"isDeadBot") then
		setElementData(source,"isDeadBot",true)
			triggerServerEvent("botDead",source,source)  -- заменить на вызов функции о том что бот убит

		end
	elseif weapon and weapon > 1 and attacker and getElementType(attacker) == "player" then
	 if weapon == 0 then
	damage = 100
 else
	weapName = getElementData(attacker,"weaponSwith") or false
	damage = getWeaponDamage (weapName)
	end 


	local skin = getElementModel(source)
	if skin ~= 68 then
		if bodypart == 9 then
			setElementData(source,"blood",0)
			headshot = true
			else
			headshot = false
		end
	end

		setElementData(source,"blood",getElementData(source,"blood")-damage) --server
		

		if getElementData(source,"blood") <= 0 and not getElementData(source,"isDeadBot") then
			setElementData(source,"isDeadBot",true)
			triggerServerEvent("botDead",source,source) 
			
					local botExpAdd = 50
		
		local playerExp = getElementData(localPlayer,"playerexp") or 1
		
		local killerGroup = getElementData(localPlayer,"group",false) or false
		if killerGroup then
			
				local profit = getElementData(localPlayer,"groupProfit",false) or false
				if profit then
				
					local groupExpAdd = (botExpAdd/100*50)
					botExpAdd = botExpAdd - groupExpAdd
				
					local SKILL_EXP = getElementData(localPlayer,"SKILL_EXP") or false
					if SKILL_EXP and SKILL_EXP>=1 then
						
						groupExpAdd = groupExpAdd+math.floor(groupExpAdd/100*(SKILL_EXP*3))
					end
					setElementData(localPlayer,"groupProfit",profit+groupExpAdd)
				
					drawingAlphaText(localPlayer,"Опыт группы: +"..groupExpAdd,200,200,200,"down",false,true)
				end
			
		end
		
		setElementData(localPlayer,"playerexp",playerExp+botExpAdd) --client
		
			drawingAlphaText(localPlayer,"Опыт: +"..botExpAdd,200,200,200,"up",false,true)
		end
	end
end	


end
end
addEventHandler ( "onClientPedDamage", getRootElement(), pedGetDamageDayZ )

function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

function handleVehicleDamage(attacker, weapon, loss, x, y, z, tyre)

    if attacker and weapon then
	if getElementType(attacker)=="player" then
	local occupants = getVehicleOccupants ( source )
	local playesSize = table.size(occupants)
	if playesSize>=1 then
	for seat, occupant in pairs(occupants) do
	if getElementType(occupant) == "player" then
	triggerServerEvent( 'server_OnPlayerDamage', occupant,occupant,attacker );
	end
	
	end
	end
end
    end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)


function checkStats()
if getElementData(localPlayer,"logedin") then
	if getElementData(localPlayer,"bleeding") > 20 then
		setElementData(localPlayer,"blood",getElementData(localPlayer,"blood")-getElementData(localPlayer,"bleeding")) --server
	else
		setElementData(localPlayer,"bleeding",0) --server
	end
	if getElementData(localPlayer,"blood") < 0 then
				if not getElementData(localPlayer,"isDead") then
			triggerServerEvent("kilLDayZPlayer",localPlayer,false,false)
			setElementData(localPlayer,"isDead",true) --server
		end
	end
end	
end
setTimer(checkStats,3000,0)

function createBloodForBleedingPlayers ()
if getElementData(localPlayer,"logedin") then
local x,y,z = getElementPosition(localPlayer)
	for i,player in ipairs(getElementsByType("player",getRootElement(),true)) do
		local bleeding = getElementData(player,"bleeding") or 0
		if bleeding > 0 then
			local px,py,pz = getPedBonePosition (player,3)
			local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
			if bleeding > 600 then
				number = 5
			elseif bleeding > 300 then
				number = 3
			elseif bleeding > 100 then
				number = 1
			else
				number = 0
			end
			if pdistance <= 120 then
				fxAddBlood ( px,py,pz,0,0,0,number, 1 )
			end
		end	
	end
end	
end
setTimer(createBloodForBleedingPlayers,300,0)

function checkBrokenbone()
if getElementData(localPlayer,"logedin") then
	if getElementData(localPlayer,"brokenbone") then
		if not isPedDucked(localPlayer) then
			--setControlState ("walk",false)
			--setControlState ("crouch",true)
		end
		toggleControl ( "jump", false )
		toggleControl ( "sprint", false )
	else
		toggleControl ( "jump", true )
		toggleControl ( "sprint", true )
	end
end	
end
setTimer(checkBrokenbone,1400,0)

function setPain()
if getElementData(localPlayer,"logedin") then
	if getElementData(localPlayer,"pain") then
		local x,y,z = getElementPosition(localPlayer)
		createExplosion (x,y,z+16,12,false,0.8,false)
		local x, y, z, lx, ly, lz = getCameraMatrix() -- Get the current location and lookat of camera
		x, lx = x + 1, lx + 1 -- What will be the new x and x lookat values

	end
end	
end
setTimer(setPain,1000,0)
--[[
function checkCold()
if getElementData(localPlayer,"logedin") then
	if getElementData(localPlayer,"temperature") <= 31 then
		setElementData(localPlayer,"cold",true) --server
	end
end	
end

setTimer(checkCold,3000,0)



function setCold()
if getElementData(localPlayer,"logedin") then
if getElementData(localPlayer,"cold") then
	local x,y,z = getElementPosition(localPlayer)
	createExplosion (x,y,z+16,12,false,0.5,false)
	local x, y, z, lx, ly, lz = getCameraMatrix() -- Get the current location and lookat of camera
			setCameraMatrix(x,y,z,lx,ly,lz) -- Set camera to new position
		setCameraTarget (localPlayer)
end	
end	
end
setTimer(setCold,1500,0)
]]
value =0

function debugJump()
if getPedControlState("jump") then
	setElementData(localPlayer,"jumping",true,false) 
	setTimer(debugJump2,650,1)
end
end
setTimer(debugJump,100,0)

function debugJump2()
	setElementData(localPlayer,"jumping",false,false)
end




--[[
function checkZombies()
zombiesalive = 0
zombiestotal = 0
for i,ped in ipairs(getElementsByType("ped")) do
	if getElementData(ped,"zombie") and not isPedDead(ped) then
		zombiesalive = zombiesalive + 1

	end
	if getElementData(ped,"deadzombie") and isPedDead(ped) then
		zombiestotal = zombiestotal + 1
	end
end
setElementData(getRootElement(),"zombiesalive",zombiesalive) --server
setElementData(getRootElement(),"zombiestotal",zombiestotal+zombiesalive) --server
end
setTimer(checkZombies,5000,0)
]]


local visab=0
local screenWidth,screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
function updateNameTags ()
if not getElementData(localPlayer,"logedin") then return end
if getElementData(localPlayer,"isDead") then return end

	

	--Nametags
	local x,y,z = getElementPosition(localPlayer)
	for i,player in ipairs(getElementsByType("player",getRootElement(),true)) do

		if player ~= localPlayer then
		local vehicle = getPedOccupiedVehicle(player)
		if not  vehicle then 
		
		
                local px,py,pz = getPedBonePosition ( player, 6 )
				
                local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
                if pdistance <= 2 then
                    --Get screenposition
					
					 local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.4, 0.06 )
					if sx and sy then
						text = "Уровень: "..getElementData(player,"playerlvl")
						
						local w = dxGetTextWidth(text,1.02,"default-bold")
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 255,255,255 ), 1.02, "default-bold" )
					end
					
					
                    local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.3, 0.06 )
					if sx and sy then
					--Draw Name
					if getElementData(player,"bandit") then
						text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' )
						
						local w = dxGetTextWidth(text,1.02,"default-bold")
					local localPlayerGang = getElementData(localPlayer,"group") or false
					local playerGang = getElementData(player,"group") or false
					if localPlayerGang and playerGang  and localPlayerGang == playerGang then
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 255, 255, 0 ), 1.02, "default-bold" )
					else
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 170, 0, 0 ), 1.02, "default-bold" )
					end
					else
						text = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' )
						
						local w = dxGetTextWidth(text,1.02,"default-bold")
					local localPlayerGang = getElementData(localPlayer,"group") or false
					local playerGang = getElementData(player,"group") or false
					if  playerGang and  localPlayerGang  and localPlayerGang == playerGang then
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 255,255,0 ), 1.02, "default-bold" )
					else
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 255,255,255 ), 1.02, "default-bold" )
					end
					
					end
					
					end
				end
				end
		end		
	end

	local x,y,z = getElementPosition(localPlayer)
	for i,ped in ipairs(getElementsByType("ped",getRootElement(),true)) do
	if getElementData(ped,"trader") then
	
	local px,py,pz = getPedBonePosition ( ped, 6 )
				
                local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
                if pdistance <= 5 then
				local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.3, 0.06 )
					if sx and sy then
					local text = getElementData(ped,"pedName")
					local w = dxGetTextWidth(text,1.02,"default-bold")
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 200, 200, 200 ), 1.02, "default-bold" )
					end
				
				
				end
	
	end
	
	end
	
	if visab >=0 then
dxDrawImage ( 0 , 0, screenWidth, screenHeight, "images/screen.png",0,0,0,tocolor(255,0,0,(visab/1000*255)))
visab=visab-1
	end
	

end
addEventHandler ( "onClientRender", getRootElement(), updateNameTags )
	


--OnClientPlayerHit
whiteWindow = guiCreateStaticImage(0,0,1,1,"images/white.png",true)
guiSetVisible(whiteWindow,false)


function showPlayerDamageScreen (visibly2,stateControle2)
	guiSetVisible(whiteWindow,true)
	visibly = visibly2 or visibly
	stateControle = stateControle2 or stateControle
	if visibly >= 6*0.025 and stateControle == "up" then
		stateControle = "down"
	end
	if visibly < 0 then
		guiSetVisible(whiteWindow,false)
		return
	end
	if stateControle == "up" then
		visibly = visibly + 0.025
	elseif stateControle == "down" then
		visibly = visibly - 0.025
	end
	guiSetAlpha(whiteWindow,visibly)
	setTimer(showPlayerDamageScreen,50,1)
end

function showWhiteScreen ( attacker, weapon, bodypart )
	--if weapon then
		showPlayerDamageScreen (0,"up")
		visab=1000
	--end
end






function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function roundTime(value)
	if value then
local hours = math.floor(value/60) -- Получаем количество полных часов
local minutes = value - (hours*60) -- Получаем оставшиеся минуты	
	if minutes <= 9 then 
	minutes = "0"..minutes
	end
		value = hours..":"..minutes
		return value
	end
	return false
end




--Vehicles In Water
function checkVehicleInWaterClient ()
vehiclesInWater = {}
	for i,veh in ipairs(getElementsByType("vehicle")) do
	
	if getElementModel(veh) ~= 453 then
	
	
	local health =getElementHealth(veh) or 0
	if health <=0 then
	table.insert(vehiclesInWater,veh)
	end
		if isElementInWater(veh) then
				table.insert(vehiclesInWater,veh)
		end
		
	if not isElementInWater(veh) then
		local x,y,z= getElementPosition(veh)
		local inWatherCar = testLineAgainstWater ( x,y,z, x,y,z+1500 )
		if inWatherCar then
		table.insert(vehiclesInWater,veh)
		end
	end
	
	end
	end
	triggerServerEvent("respawnVehiclesInWater",localPlayer,vehiclesInWater)
end
addEvent("checkVehicleInWaterClient",true)
addEventHandler("checkVehicleInWaterClient",getRootElement(),checkVehicleInWaterClient)


function updatePlayTime()
			if getElementData(localPlayer,"logedin") then
			if getElementData(localPlayer,"isDead") then
return
end
				local playtime = getElementData(localPlayer,"alivetime")
				setElementData(localPlayer,"alivetime",playtime+1)	 --server
				
end
end
setTimer(updatePlayTime, 60000, 0)



function updatePlayerLvl()
	if getElementData(localPlayer,"logedin") then
		
		local playerexp = getElementData(localPlayer,"playerexp") or 0
		local playerlvl = getElementData(localPlayer,"playerlvl") or 0
			
			
			
		local lvl = math.floor(playerexp/1200)
	
		if playerlvl < lvl then
			local clicks=getElementData(localPlayer,"progress.clicks") or 0
			setElementData(localPlayer,"progress.clicks",clicks+(lvl-playerlvl)) 
			outputChatBox("Вы получили +"..(lvl-playerlvl).." очков навыков! Нажмите F3 чтобы использовать их")
		end
			
		setElementData(localPlayer,"playerlvl",lvl) --server
		
	end
end
setTimer(updatePlayerLvl, 5000, 0)


local serial = getPlayerSerial (localPlayer)
local serialLength = string.len (serial)
local serial = string.sub (serial, serialLength-5)
--serverName = getElementData(getRootElement(),"serverName") or "Among The Dead"
--local serverLength = string.len (serverName)
--local serverName = string.sub (serverName, serverLength-0)

local dayzVersion2 = getRealTime().monthday.."&"..serial.."&"..screenWidth.."x"..screenHeight



local versionLabel2  = guiCreateLabel(0,screenHeight-15,200,15,dayzVersion2,false)

guiSetAlpha(versionLabel2,0.5)



function outputLoss(loss)
if getElementData(source,"parent") ~= false  then
if getElementData(getElementData(source,"parent"),"mine") then
triggerServerEvent("MineDestroy",localPlayer,source)
end
end
end
--addEventHandler("onClientObjectDamage", root, outputLoss)





function checkBuggedAccount()
		if getElementData(localPlayer,"logedin") then
			if getElementModel(localPlayer) == 0  then
			--triggerServerEvent("spawnATDPlayer",localPlayer,localPlayer)
				outputChatBox(getPlayerName(localPlayer).." Ошибка создания игрока. Сообщите администратору сервера")
			end
		end
	end	

setTimer(checkBuggedAccount,10000,0)



--[[
function checkTemperature()

if getElementData(localPlayer,"logedin") then
value = 0
	if getWeather == 7 then
		value = -0.1
	elseif getWeather == 12 then
		value = 0
	elseif getWeather == 16 then
		value = -0.4
	elseif getWeather == 4 then
		value = -0.1
	end
	local hour, minutes = getTime()
	if hour >= 21 and hour <= 8 then
		value = value-0.05
	end
	triggerServerEvent("addPlayerStats11",localPlayer,localPlayer,"temperature",value)
end		
end
setTimer(checkTemperature,60000,0)

function checkTemperature2()
if getElementData(localPlayer,"logedin") then
value = 0
	if isElementInWater(localPlayer) then
		value = gameplayVariables["temperaturewater"] -- Changed value as it tends to drain temperature fairly quickly when in water (SHOULD BE EDITABLE BY SERVER OWNERS) - default: -0.01
	end	
	if getControlState ("sprint") then
		value = value+gameplayVariables["temperaturesprint"]
	end
		triggerServerEvent("addPlayerStats11",localPlayer,localPlayer,"temperature",value)
end	
end
setTimer(checkTemperature2,10000,0)
]]

function setHunger()

if getElementData(localPlayer,"logedin") then
value = gameplayVariables["loseHunger"] 
	triggerServerEvent("addPlayerStats11",localPlayer,localPlayer,"food",value)
end	
end
setTimer(setHunger,60000,0)

function setThirsty()

if getElementData(localPlayer,"logedin") then
value = gameplayVariables["loseThirst"] 
	triggerServerEvent("addPlayerStats11",localPlayer,localPlayer,"thirst",value)
end
end
setTimer(setThirsty,60000,0)









function checkHumanity()

if getElementData(localPlayer,"logedin")  and getElementData(localPlayer,"bandit") then
		if getElementData(localPlayer,"humanity") > 2000 then
			setElementData(localPlayer,"bandit",false) --server
		end

end	

end
setTimer(checkHumanity,60000,0)



banditSkins = {
--{210,1,5000},
{275,1,-5000,-9999,"Одежда: Бандит 1ур"},
{274,2,-10000,-14999,"Одежда: Бандит 2ур"},
{264,3,-15000,-19999,"Одежда: Бандит 3ур"},
{262,4,-20000,-24999,"Одежда: Бандит 4ур"},
{261,5,-25000,-29999,"Одежда: Бандит 5ур"},
}

function checkBandit ()
if getElementData(localPlayer,"logedin") then
local humanity = getElementData(localPlayer,"humanity") or 0
local hero = getElementData(localPlayer,"Одежда: Герой") or 0
local curSkin = getElementData(localPlayer,"skin") or 0
if humanity >= 5000  and hero<=0 and curSkin~= 210 then
	triggerServerEvent("setBandit",localPlayer,localPlayer,210,false,"Одежда: Герой")
	setElementData(localPlayer,"Одежда: Герой",1)
	else
	for i,skin in ipairs(banditSkins) do
	local bandit = getElementData(localPlayer,skin[5]) or 0
	if humanity <= skin[3] and humanity >= skin[4]  and bandit<=0 and curSkin~= skin[1] then 
	triggerServerEvent("setBandit",localPlayer,localPlayer,skin[1],skin[2],skin[5])
	setElementData(localPlayer,skin[5],1)
	end
	end
	
	end
end
end
setTimer(checkBandit,20000,0)

function setInfection(set)
if set then
setElementData(localPlayer,"infection",true)
setElementData(localPlayer,"bleeding",200)
end
local bleeding = getElementData(localPlayer,"bleeding") or 0
local infection = getElementData(localPlayer,"infection") or false
if infection and bleeding == 0 then
setElementData(localPlayer,"bleeding",200)
end
end
setTimer(setInfection,60000,0)


local killTimer = true
function killPlayerRR(playerSource,commandName)
if killTimer then
if not getElementData(localPlayer,"isDead") == true then
triggerServerEvent("kilLDayZPlayer",localPlayer)
setElementData(localPlayer,"isDead",true) --server
killTimer = false
end


setTimer(function()
killTimer = true
end,60000,1)

end
end

addCommandHandler ( "kill", killPlayerRR)

local AutoPatrilStantions = {
{2192.7307128906,2468.4741210938,8,19,15,7,2196.9074707031,2468.3801269531,10.995170593262,-170.0},
{2632.9006347656,1096.8129882813,8,15,20,7,2633.2436523438,1100.9278564453,10.9609375,90},
{2107.7236328125,910.62133789063,8,15,20,7,2119.24609375,925.58325195313,10.9609375,0},
{1588.5568847656,2189.4460449219,8,15,20,7,1591.7263183594,2204.5615234375,11.060997009277,180},
{650.73571777344,-575.94281005859,14,10,20,7,655.65118408203,-572.32769775391,16.501491546631,180},
{2140.2124023438,2737.5532226563,8,15,20,7,2140.9345703125,2753.3239746094,10.96019744873,90},
{-1479.296875,1858.0513916016,30,15,15,7,-1463.7030029297,1860.5711669922,32.833393096924,-90},
{1937.0733642578,-1782.310546875,11,10,15,7,1941.6317138672,-1780.8175048828,13.640625,180},
{-1333.6101074219,2668.3498535156,48,9,18,7,-1328.7801513672,2685.7438964844,50.46875,180},
{-2416.1020507813,965.51782226563,43,9,18,7,-2410.9694824219,964.18286132813,45.4609375,180},
{-1691.8791503906,409.00692749023,5,9,18,7,-1686.7944335938,408.85916137695,7.3984375,140},
} 


for i1,col in ipairs(AutoPatrilStantions) do
local stantion = createColCuboid(col[1],col[2],col[3],col[4],col[5],col[6])
setElementData(stantion,"isAutoPatrilStantion",true,false)

end
	


function autoPatrolstantion(theElement)

if theElement == localPlayer and  getPedOccupiedVehicle(localPlayer) and getElementData(source,"isAutoPatrilStantion") then
setElementData(localPlayer,"inAutoPatrilStantion",true)
triggerEvent("showClientMenuItem",localPlayer,"autoPatrolStantion",getPedOccupiedVehicle(localPlayer))


end
end
addEventHandler("onClientColShapeHit",getRootElement(),autoPatrolstantion)
addEventHandler("onClientColShapeLeave",getRootElement(),function() 
if getElementData(source,"isAutoPatrilStantion") then 
setElementData(localPlayer,"inAutoPatrilStantion",nil) 
end
 end)






targetElement = false
targetElementType = false
function targetingActivated ( target )


	if  target and getPedControlState ("aim_weapon")  then
	
	
	if target and getElementType(target) =="ped" or  getElementType(target) =="player" or getElementType(target) == "vehicle"  then
	if not getElementData(target,"isExploded") then
	if not getElementData(target,"isDead") then
		targetElement = target
		if getElementType(target) =="ped" then
		targetElementType = "ped"
		end
		if getElementType(target) =="player" then
		targetElementType = "player"
		end
		if getElementType(target) =="vehicle" then
		targetElementType = "veh"
		end
		end
		end
	end	
	
	
	else
		targetElement = false
		targetElementType = false
		
		end
	end

addEventHandler ( "onClientPlayerTarget", getRootElement(), targetingActivated )




	local screenWidth,screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
	function DrawPlayerHEaderInfo()
	if getElementData(localPlayer,"logedin") then
if not getElementData(localPlayer,"isDead") then
	
	if not targetElement then return end

if targetElement ~= localPlayer then
if not getPedControlState ("aim_weapon") then
return
end	
	if targetElementType == "ped" then
	nick = getElementData(targetElement,"pedName",false) or "NPC"
	elseif targetElementType == "player"  then
	nick = getPlayerName(targetElement)
	elseif targetElementType == "veh"  then
	nick = GetRealVehicleName (targetElement) or "Транспортное средство"
	
	end
	
	
	local w = dxGetTextWidth(nick,1.02,"default-bold")
	local h = dxGetFontHeight ( 1.02,"default-bold" )
	
	
	if targetElementType == "ped" then
		 blood = getElementData(targetElement,"blood") or 50000
		 local isBot = getElementData(targetElement,"bot") or false
		 if isBot then
		 
		 polosa = 100-blood*100/12000
		ObjectHP = blood.."/12000"
		
		 else
		 
		 
		 polosa = 100-blood*100/gameplayVariables["zombieblood"] or false
		ObjectHP = blood.."/"..gameplayVariables["zombieblood"] or false
		end
		
	elseif targetElementType == "player"  then
	
			local progressMedik = getElementData(targetElement,"progress.medik") or 0 
			local progressBoec = getElementData(targetElement,"progress.boec") or 0
			local maxBlood = 12000+((progressMedik*60)+(progressBoec*20))
	
		 blood = getElementData(targetElement,"blood") or false
		 polosa = 100-blood*100/maxBlood
		ObjectHP = blood.."/"..maxBlood or "-"
		

	elseif targetElementType == "veh"  then
	
		 blood = math.floor(getElementHealth ( targetElement )) or false
		 polosa = 100-blood*100/1000
		ObjectHP = blood.."/1000"
	
	end
	
	if not blood or not polosa then
	return
end
		if polosa >100 then
	return
end
	
	
	local w2 = dxGetTextWidth(ObjectHP,1.02,"default-small-bold")
	local h2 = dxGetFontHeight ( 1.02,"default-small-bold" )
	
	if w >w2 then
	bigText =w
	else
	bigText =w2
	end
	
	dxDrawLine ( screenWidth/2, 0, screenWidth/2 ,30, tocolor ( 0,0,0,100 ), bigText+10, false )
	
	local playerGang=  getElementData(localPlayer,"group") or false
	local targetGang=  getElementData(targetElement,"group") or false
	if targetGang and  playerGang and targetGang == playerGang  then
	dxDrawText ( nick, (screenWidth/2)-(w/2), 10, w, 30, tocolor ( 255,255, 0 ), 1.02, "default-bold" )
	else
	dxDrawText ( nick, (screenWidth/2)-(w/2), 10, w, 30, tocolor ( 255,255,255 ), 1.02, "default-bold" )
	end
	
	
	
	dxDrawLine ( screenWidth/2, 30, screenWidth/2 ,60, tocolor ( 0,0,0,100 ), 220, false )
	
	

	
	dxDrawLine ( screenWidth/2-100, 34, screenWidth/2+100 ,34, tocolor ( 255,255,255,150 ) )
	
	dxDrawLine ( screenWidth/2-101, 34, screenWidth/2-101 ,56, tocolor ( 255,255,255,150 ) )
	dxDrawLine ( screenWidth/2+101, 34, screenWidth/2+101 ,56, tocolor ( 255,255,255,150 ) )
	
	dxDrawLine ( screenWidth/2-100, 56, screenWidth/2+100 ,56, tocolor ( 255,255,255,150 ) )
	
	
	
	
	
	
	dxDrawLine ( screenWidth/2-100, 45, screenWidth/2+100-polosa*2 ,45, tocolor ( 255,255,255,150 ),20,false )
	
	dxDrawText ( ObjectHP, screenWidth/2-w2/2, 38, bigText, 30, tocolor ( 255,255,255 ), 1.02, "default-small-bold" )
	
	if targetElementType =="veh" then
	local steelList = getElementData(targetElement,"steelList") or 0
	if steelList>=1 then
	local seat0 = getVehicleOccupant ( targetElement )
	local armorTS = false
	if seat0 then
	armorTS= getElementData(seat0,"SKILL_ARMORTS") or false
	end
	if armorTS and armorTS>=1 then
	dxDrawLine ( screenWidth/2-100, 45, screenWidth/2+100-(100-(steelList*100/1000))*2 ,45, tocolor ( 255,255,0 ),2,false )
	else
	dxDrawLine ( screenWidth/2-100, 45, screenWidth/2+100-(100-(steelList*100/1000))*2 ,45, tocolor ( 255,0,0 ),2,false )
	end
	end
	end
	
	--else
	
	
	--end
	
	end
	end
	end
	end
	addEventHandler ( "onClientRender", getRootElement(), DrawPlayerHEaderInfo )









local fishinZone1 = createColCuboid(349.29272460938,-2089.4416503906,6,2,45,7)
createRadarArea (329.29272460938,-2099.4416503906,100,80, 0, 0,  255, 150 )
local fishinZone2 = createColCuboid(349.29272460938,-2089.4416503906,6,60,2,7)
local fishinZone3 = createColCuboid(408.16735839844,-2087.3166503906,6,2,41,7)
local fishinZone4 = createColCuboid(147.25836181641,-1967.7170410156,2,15,2,7)
createRadarArea (127.25836181641,-1987.7170410156,60,60, 0, 0,  255, 150 )
local fishinZone5 = createColCuboid(1376.6440429688,-283.68801879883,0,55,3,7)
createRadarArea (1376.6440429688,-243.68801879883,80,-80, 0, 0,  255, 150 )
local fishinZone6 = createColCuboid(2099.9685058594,-107,1,5,5,7)
createRadarArea (2089.9685058594,-117,80,80, 0, 0,  255, 150 )
local fishinZone7 = createColCuboid(2287.3283691406,521.39538574219,1,15,2,7)
local fishinZone8 = createColCuboid(2347.8413085938,521.20257568359,1,25,2,7)
createRadarArea (2347.8413085938,521.20257568359,80,80, 0, 0, 255, 150 )
local fishinZone9 = createColCuboid(1621.5374755859,574.47821044922,1,15,2,7)
createRadarArea (1621.5374755859,574.47821044922,80,80, 0, 0,  255, 150 )
local fishinZone10 = createColCuboid(-2257.6059570313,1365.6142578125,0,155,3,7)
createRadarArea (-2257.6059570313,1365.6142578125,155,50, 0, 0,  255, 150 )
local fishinZone11 = createColCuboid(-2575.6804199219,1411.8311767578,0,225,3,7)
createRadarArea (-2575.6804199219,1411.8311767578,225,50, 0, 0,  255, 150 )
local fishinZone12 = createColCuboid(-481.35696411133,2177.6535644531,40,2,17,7)
createRadarArea (-481.35696411133,2177.6535644531,80,80, 0, 0,  255, 150 )
setElementData(fishinZone1,"fishinZone",true,false)
setElementData(fishinZone2,"fishinZone",true,false)
setElementData(fishinZone3,"fishinZone",true,false)
setElementData(fishinZone4,"fishinZone",true,false)
setElementData(fishinZone5,"fishinZone",true,false)
setElementData(fishinZone6,"fishinZone",true,false)
setElementData(fishinZone7,"fishinZone",true,false)
setElementData(fishinZone8,"fishinZone",true,false)
setElementData(fishinZone9,"fishinZone",true,false)
setElementData(fishinZone10,"fishinZone",true,false)
setElementData(fishinZone11,"fishinZone",true,false)
setElementData(fishinZone12,"fishinZone",true,false)
--[[
local baitZone1 = createColCuboid(-984.927734375,2733.94995117193,44,80,25,7)
createRadarArea (-984.927734375,2733.94995117193,80,25, 0, 0, 0, 150 )
setElementData(baitZone1,"baitZone",true,false)
local baitZone2 = createColCuboid(-562.6748046875,-1389.7611083984,14,180,100,30)
createRadarArea (-562.6748046875,-1389.7611083984,180,100, 0, 0, 0, 150 )
setElementData(baitZone2,"baitZone",true,false)
local baitZone3 = createColCuboid(-327.38781738281,-1432.8607177734,4,150,120,30)
createRadarArea (-327.38781738281,-1432.8607177734,150,120, 0, 0, 0, 150 )
setElementData(baitZone3,"baitZone",true,false)
local baitZone4 = createColCuboid(-234.54531860352,-85.517883300781,0,100,170,30)
createRadarArea (-234.54531860352,-85.517883300781,100,170, 0, 0, 0, 150 )
setElementData(baitZone4,"baitZone",true,false)
createRadarArea (-3334.5756835938,-3117.8540039063,500,950, 255, 0, 0, 150 )
createRadarArea (2284.5141601563,-800.31402587891,150,150, 255, 0, 0, 150 )
createRadarArea (2190.2219238281,-2553.3310546875,150,150, 255, 0, 0, 150 )
]]

addEventHandler("onClientColShapeHit",getRootElement(),function(hitElement)

if getElementData(source,"fishinZone") and hitElement == localPlayer then
setElementData(hitElement,"fishing",true,false)
triggerEvent("showClientMenuItem",localPlayer,"startFishing")
end

--[[
if getElementData(source,"baitZone") and hitElement == localPlayer and getElementData(localPlayer,"Лопата") >=1 then
setElementData(hitElement,"inbaitZone",true,false)
triggerEvent("showClientMenuItem",localPlayer,"baiting")

end
]]

end)

addEventHandler("onClientColShapeLeave",getRootElement(),function(hitElement)

if getElementData(source,"fishinZone") and hitElement == localPlayer  then
setElementData(hitElement,"fishing",false,false)
end

--[[
if getElementData(source,"baitZone") and hitElement == localPlayer then
setElementData(hitElement,"inbaitZone",false,false)
end
]]
end)

function regenerationMedick ()
local progressMedik = getElementData(localPlayer,"progress.medik") or 0
local progressBoec = getElementData(localPlayer,"progress.boec") or 0
if progressMedik>0 and getElementData(localPlayer,"logedin") and getElementData(localPlayer,"blood") <12000+((progressMedik*60)+(progressBoec*20)) then
triggerServerEvent("addPlayerStats11",localPlayer,localPlayer,"blood",progressMedik*3)
end
end
setTimer(regenerationMedick,60000,0)

local screenWidth, screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
 closeConnectBtn = guiCreateButton(0, 0, screenWidth, screenWidth, "ПИНГ ВЫШЕ НОРМЫ", false)
guiSetVisible ( closeConnectBtn, false )
pingLost = 0
function kickOnPacketLost()
if getElementData(localPlayer,"logedin") then
if getElementData(getRootElement(),"checkPing") then

if getPlayerPing(localPlayer)  > gameplayVariables["pingMAX"] then
pingLost = pingLost+1
outputConsole ("Пинг больше нормы:"..pingLost.."/"..5)

setTimer(function() 
pingLost = 0
end,15000,1)

	if pingLost >= 5 then
	guiSetVisible ( closeConnectBtn, true )
	showCursor(true)
	triggerServerEvent("kickPlayerOnHighPing",localPlayer,localPlayer,"PING :"..getPlayerPing(localPlayer).." > "..gameplayVariables["pingMAX"])
	end

end 

end
if getElementData(getRootElement(),"checkPacketlossLastSecond") then

if getNetworkStats().packetlossLastSecond > gameplayVariables["MAXpacketlossLastSecond"] then
guiSetVisible ( closeConnectBtn, true )
	showCursor(true)
triggerServerEvent("kickPlayerOnHighPing",localPlayer,localPlayer,"PING: PLLS:"..(getNetworkStats().packetlossLastSecond).." > "..gameplayVariables["MAXpacketlossLastSecond"])
end 
end


if getElementData(getRootElement(),"checkMessagesInResendBuffer") then

if getNetworkStats().messagesInResendBuffer > gameplayVariables["MAXmessagesInResendBuffer"] then
guiSetVisible ( closeConnectBtn, true )
	showCursor(true)
triggerServerEvent("kickPlayerOnHighPing",localPlayer,localPlayer,"PING: MIRB")
end 
end

end
end
setTimer(kickOnPacketLost,2000,0)


function drawingAlphaText(ped,text,r,b,g,drawStyle,lowDistance,textDance)
local alphaSPEED= 0.01
local alpha = 0
local funcDraw=nil
local textalpha =255
local textpos = math.random(-5,5)
if textpos == 1 then textpos=0.1 elseif textpos == 2 then  textpos=0.2  elseif textpos == 3 then textpos=0.3 elseif textpos == 4 then textpos=0.4 elseif textpos == -1 then textpos=-0.1 elseif textpos == -2 then  textpos=-0.2  elseif textpos == -3 then textpos=-0.3 elseif textpos == -4 then textpos=-0.4 else textpos=0 end
	
	local x,y,z = getElementPosition(localPlayer)
	local px,py,pz = getElementPosition (ped)
	local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
	
	if lowDistance then
	if pdistance>lowDistance then
	return
	end
	end
	

 funcDraw = function() 
	local x,y,z = getElementPosition(localPlayer)
	local px,py,pz = getElementPosition (ped)
	local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
	

		


alpha = alpha+alphaSPEED


if drawStyle then
if drawStyle =="up" then
pz = (pz+0.5)+alpha
if textDance then
textpos=0
end
elseif drawStyle =="down" then 
pz = (pz+0.5)-alpha
if textDance then
textpos=0
end
end
else
pz = (pz+0.5)+alpha
end

                    local sx,sy = getScreenFromWorldPosition ( px+textpos, py+textpos, pz+textpos)
					
					if sx and sy then
				if pdistance<=1 then
				textscale = 1.3	
				elseif pdistance<=1.5 then
				textscale = 1.3
				elseif pdistance<=2 then
				textscale = 1.4
				elseif pdistance>2 and pdistance<10 then
				textscale = 1.5
				elseif pdistance>=10 and pdistance<20 then
				textscale = 1.4
				elseif pdistance>=20 and pdistance<30 then
				textscale = 1.3
				elseif pdistance>=30 and pdistance<45 then
				textscale = 1.2
				elseif pdistance>=45 and pdistance<55  then
				textscale = 1
				elseif pdistance>=55 and pdistance<60  then
				textscale = 0.8
				elseif pdistance>=60 then
				textscale = 0.6
					else
					textscale = 1
					end
				
if alpha>=0.8 then
textalpha=textalpha*12.7
end				

					local w = dxGetTextWidth(text,textscale,"default-bold")
					dxDrawText ( text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( r,b,g,textalpha ), textscale, "default-bold" )	
					end
					
if alpha>=1 then
removeEventHandler ( "onClientRender", getRootElement(), funcDraw )
alpha=0
end					
end 
addEventHandler ( "onClientRender", getRootElement(), funcDraw )

end

addEvent("drawingAlphaText",true)
addEventHandler("drawingAlphaText",getRootElement(),drawingAlphaText)

function enterZombieZone(theElement)
if theElement ~=localPlayer then
return
end
local typeZ= getElementData(source,"typeZ",false) or false
setElementData(theElement,"zombieZone",typeZ,false)
end

function extZombieZone(theElement)
if theElement ~=localPlayer then
return
end
local typeZ =getElementData(theElement,"zombieZone")
setElementData(theElement,"zombieZone",false,false)
end

local zombieHospital ={
{-404.66842651367,1003.9675292969,10.915664672852,160, 100, 100},
{ 1558.4342041016,1704.3082275391,7.8203125,140, 200, 100 },
{1170.5589599609,272.89129638672,15.979869842529,140, 130, 100},
{1946.3801269531,-1475.5480957031,9.546875,180, 160, 100},
{-2261.4545898438,-2365.1936035156,25.713357925415,120, 110, 100},
{-1548.109375,2477.6884765625,51.352981567383,100, 100, 100}
}
	for i,pos in ipairs(zombieHospital) do
	local zoneZ= createColCuboid (pos[1],pos[2],pos[3],pos[4], pos[5], pos[6] )
	setElementData(zoneZ,"typeZ","zombieHospital",false)
	addEventHandler("onClientColShapeHit",zoneZ,enterZombieZone)
	addEventHandler("onClientColShapeLeave",zoneZ,extZombieZone)
	end
	
local zombiePolice={
{-1731.26171875,593.15600585938,-13.876373291016,160, 170, 100},
{2212.3132324219,2402.3955078125,7.2421875,160,130,100},
{1523.9715576172,-1741.6793212891,-9.546875,100,140,100},
--{591.00091552734,-628.97009277344,10.218955993652,70,100,100} -- zz
}
for i,pos in ipairs(zombiePolice) do
	local zoneZ= createColCuboid (pos[1],pos[2],pos[3],pos[4], pos[5], pos[6] )
	setElementData(zoneZ,"typeZ","zombiePolice",false)
	addEventHandler("onClientColShapeHit",zoneZ,enterZombieZone)
	addEventHandler("onClientColShapeLeave",zoneZ,extZombieZone)
	end
	
local zombieMilitary = {
--{-1473.0106201172,-1607.5150146484,95.3984375,200,200,100},
--{909.37823486328,-2341.7429199219,-0.47800004482269,150,280,100},
--{1861.4560546875,626.00219726563,5.8203125,140,150,100},
{-2140.8542480469,-78.114791870117,30.3203125,100,100,100},
--{785.78704833984,1608.2705078125,0.3704595565796,40,100,100},
{-69.978904724121,1641.8350830078,-10.632883071899,500,500,100},
--{58.47709274292,1030.9769287109,9.924690246582,100,100,100},
--{-985.66351318359,-549.61791992188,20.769662857056,90,90,100},
{2319.9897460938,-800.2626953125,93.867027282715,110,170,100}
}
for i,pos in ipairs(zombieMilitary) do
	local zoneZ= createColCuboid (pos[1],pos[2],pos[3],pos[4], pos[5], pos[6] )
	createRadarArea (pos[1],pos[2],pos[4],pos[5], 255, 0, 0, 150 )
	setElementData(zoneZ,"typeZ","zombieMilitary",false)
	addEventHandler("onClientColShapeHit",zoneZ,enterZombieZone)
	addEventHandler("onClientColShapeLeave",zoneZ,extZombieZone)
	end
	
	function roundTimeSec(value)
	if value then
local muns = math.floor(value/60) 
local sec = value-60*muns
if sec <10 then
sec = "0"..sec
end
		value = (muns or 0)..":"..(sec or 0)
		return value
	end
	return false
end
	



	
function handleVehicleDamage(attacker, weapon, loss, x, y, z, tyre)


local steelList = getElementData(source,"steelList") or 0


if weapon == 33 then
	if steelList>=1 then
		setElementData(source,"steelList",0)
		cancelEvent()
		return
	end
	
	local health = getElementHealth(source) 
	if(health>0) then
	setElementHealth(source, health - 500)
	end
	return
	
end

--outputChatBox(loss)
local seat0 = getVehicleOccupant ( source )
local armorTS = false
if seat0 then
armorTS= getElementData(seat0,"SKILL_ARMORTS") or false
end



if steelList>=1  then
cancelEvent()
if steelList-loss >=0 then
if armorTS and  armorTS>=1 then
loss = loss-(loss/100*(math.floor(armorTS*2.5)))
end
setElementData(source,"steelList",steelList-loss)
else
setElementData(source,"steelList",0)
end

else

if armorTS and  armorTS>=1 then
cancelEvent()
setElementHealth(source, getElementHealth(source) - (loss-(loss/100*(math.floor(armorTS*2.5)))))
end

end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)	
	
	
	
	
	
	
	
	
	--[[
	addEventHandler( "onClientElementStreamIn", resourceRoot,
    function ( )
        if getElementType( source ) == "ped"   then
		
		local x,y,z = getElementPosition(source) 
		local gz = getGroundPosition ( x,y,z )
		if z ~=gz and isPedDead(source) then
	--	setElementPosition(source,x,y,gz)
		end
         --   local myPosTab = { getElementPosition( getLocalPlayer( ) ) };
         --   local markerPosTab = { getElementPosition( source ) };
         --   local distance = getDistanceBetweenPoints3D( unpack( myPosTab ), unpack( markerPosTab ) );
            outputChatBox("IN "..tostring(getElementType( source )).." z: "..z.."gz: "..gz );
			
			
        end
    end
);

addEventHandler( "onClientElementStreamOut", resourceRoot,
    function ( )
      outputChatBox("OUT "..tostring(getElementType( source )) );
    end
);
]]




--[[

function weaponSwitchBackClient ( previousWeaponID, currentWeaponID )

local weapon1 = getElementData(source,"currentweapon_1")
local weapon2 = getElementData(source,"currentweapon_2")
local weapon3 = getElementData(source,"currentweapon_3")
--if not weapon1 then return end

local ammoData1,weapID1,modelID1 = getWeaponAmmoType(weapon1)
local ammoData2,weapID2,modelID2 = getWeaponAmmoType(weapon2)
local ammoData3,weapID3,modelID3 = getWeaponAmmoType(weapon3)

	
	if currentWeaponID == weapID1 then
	setElementData(source,"weaponSwith",weapon1,false) --client

	elseif currentWeaponID == weapID2 then
	setElementData(source,"weaponSwith",weapon2,false) --client
	


	elseif currentWeaponID == weapID3 then
	setElementData(source,"weaponSwith",weapon3,false) --client
	
	end

	
end

addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), weaponSwitchBackClient )
]]

--[[-- ВЫСТРЕЛ ИЗ ГАУССА НА КЛИЕНТЕ

function scaleGaussBall(obj)
local scale = getObjectScale( obj )
if scale >=100 then
destroyElement(obj)
return
end


setObjectScale ( obj, scale+3  )
setTimer(scaleGaussBall,50,1,obj)
end
]]

function GAUSS_FIRE(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
    if (weapon == 33) then -- If the player shoots with a shotgun
        createExplosion(hitX, hitY, hitZ, 12, false, 0.5, false) -- Creates a tiny explosion where the bullet hit.
		--local BALLOBJ = createObject ( 1974, hitX, hitY, hitZ)
		--scaleGaussBall(BALLOBJ)
     --createProjectile  ( localPlayer , 1,hitX, hitY, hitZ,0)
	 --createEffect ( "explosion_tiny", hitX, hitY, hitZ )
	end
end
-- Add this as a handler so that the function will be triggered every time a player fires.
addEventHandler("onClientPlayerWeaponFire", root, GAUSS_FIRE)

----- ОТКРЫТЬ ЗАКРЫТЬ ТС
function openCloseVeh()
	local veh = getPedOccupiedVehicle(localPlayer)

	if veh then
		local carOwner = getElementData(veh,"owner") 
		local userAcc =  getElementData(localPlayer,"userAccount")
		
		if carOwner and carOwner == userAcc then
			if isVehicleLocked(veh) then
				triggerServerEvent("openMyVH",localPlayer,veh)
				outputChatBox("Вы открыли #FFFF00"..GetRealVehicleName(veh),255,255,255,true)
				else
				triggerServerEvent("closeMyVH",localPlayer,veh)
				outputChatBox("Вы закрыли #FFFF00"..GetRealVehicleName(veh),255,255,255,true)
			end
		end
	end
end

bindKey ( "l", "down", openCloseVeh )

function enterVeh(thePlayer, seat)
	
        if thePlayer == localPlayer and seat == 0 then
			local carOwner = getElementData(source,"owner") 
			local userAcc =  getElementData(localPlayer,"userAccount")
			if carOwner and carOwner == userAcc then
            outputChatBox("Нажмите #FF0000L #FFFFFFчтобы открыть/закрыть #FFFF00"..GetRealVehicleName(source),255,255,255,true)
			end
		end
	end

addEventHandler("onClientVehicleEnter", root,enterVeh) 





----- ОТРИСОВКА ТАЙМЕРА УДАЛЕНИЯ ТС

function roundTimeVeh(value)
if value<=0 then 
return "0:00"
end
	if value then
local hours = math.floor(value/3600) -- Получаем количество полных часов
local minutes = value - (hours*3600) -- Получаем оставшиеся минуты	
 minutes = math.floor(minutes/60) -- Получаем оставшиеся минуты	
	if minutes <= 9 then 
	minutes = "0"..minutes
	end
		value = hours..":"..minutes
		return value
	end
	return false
end

function renderVehRemoveTimer()
local vehs = getElementsByType ( "vehicle",root,true ) 
	for i,veh in ipairs(vehs) do
		local removeTimer = getElementData(veh,"removeTimer",false) or false
		if removeTimer then
		local rTime = getRealTime( )
		
		local vx,vy,vz = getElementPosition(veh)			
		local px,py,pz = getElementPosition(localPlayer)
		 local pdistance = getDistanceBetweenPoints3D ( vx,vy,vz,px,py,pz )
                if pdistance <= 4 then
				
				
					local sx,sy = getScreenFromWorldPosition ( vx, vy, vz+1, 0.06 )
					if sx and sy then
					local text = roundTimeVeh(removeTimer-rTime.timestamp)
					local w = dxGetTextWidth(text,2,"default-bold")
					dxDrawText (text, sx-(w/2), sy, sx-(w/2), sy, tocolor ( 255, 0, 0 ), 2, "default-bold" )
				
					end
				end
		end
	end
end
addEventHandler ( "onClientRender", getRootElement(), renderVehRemoveTimer )