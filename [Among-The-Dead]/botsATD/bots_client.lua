function createBotWeapon(bot)
local weaponName = getElementData(bot,"weaponName")
--outputChatBox(weaponName)
local x,y,z=getElementPosition(bot)
local weapon = createWeapon(weaponName, x, y, z)
	  setWeaponClipAmmo(weapon, 99999)
	  


if weaponName=="sniper" then
setWeaponFiringRate ( weapon, 1000)
setElementData(weapon,"weaponSwith","DMR",false)
elseif weaponName=="ak-47" then
setElementData(weapon,"weaponSwith","G36C-SD",false)
elseif weaponName=="m4" then
setElementData(weapon,"weaponSwith","MG36",false)
setWeaponFiringRate ( weapon, 90)
end
	  
	  
	  

		setElementData(bot,"weapon",weapon,false)
		return weapon
end


function botCreated()
	createBotWeapon(source)
	triggerServerEvent("checkCol",source)	
end
addEvent( "botCreated", true )
addEventHandler( "botCreated", getRootElement(), botCreated )







function botStart(player,ped)

local weapon =getElementData(source or ped,"weapon")
if not weapon then
weapon = createBotWeapon(source or ped)  
end
    --outputChatBox("botStart: игрок: "..getPlayerName(player).." Вошел в Coca-Colaпс бота: "..tostring(source or ped))
	
	setElementData(source or ped,"attackPlayer",player)
--setElementFrozen ( source or ped,true)
	setTimer ( checkClear, 100, 1, source or ped, weapon,player,"игрок в Coca-Colaпсе бота" )
	setElementData(source or ped,"checked",true,false)

end
addEvent( "botStart", true )
addEventHandler( "botStart", getRootElement(), botStart )






function botFire(player,ped)
local playerAtt = getElementData(ped,"attackPlayer")
if player~=playerAtt then return end
local weapon =getElementData(source or ped,"weapon")
   -- outputChatBox("botFire: бот стреляет в игрока "..getPlayerName(player))
    setWeaponState(weapon, "firing")
	
		local randFire = math.random(0,3)
	if randFire==3 then
	local tx,ty,tz = getElementPosition(player)
	setWeaponTarget ( weapon, tx,ty,tz+.7 )
	else
	setWeaponTarget ( weapon, player,4 )
	end
	
	if getPedControlState( ped, "forwards") then
	setPedControlState( ped, "forwards", false )
	setElementData(ped,"patroled",false,false)
	setElementData(ped,"sprinted",false,false)
	setPedControlState( ped, "sprint", false )
	end
	
	setElementData(source or ped,"firing",true,false)
	setPedControlState (source or ped, "aim_weapon", true)
	
	--setTimer ( checkClear, 100, 1, source or ped, weapon,player,0 )
	triggerServerEvent("giveBotWeapon",source or ped)
	setElementFrozen ( source or ped,true)

end
addEvent( "botFire", true )
addEventHandler( "botFire", getRootElement(), botFire )



function botStopFire(ped,checkedStop,leavleColshape,patrol )
setPedControlState (source or ped, "aim_weapon", false)
local weapon =getElementData(source or ped,"weapon") or false
if weapon then
setWeaponState(weapon, "ready")
end
setElementData(source or ped,"firing",false,false)

if checkedStop then 
setElementData(source or ped,"checked",false,false)
end

setElementFrozen ( source or ped,true)
	
if leavleColshape then
setElementData(source or ped,"attackPlayer",false)
end


if patrol then
setElementData(source or ped,"patroled",true,false)
patrolBot(source or ped)
end


triggerServerEvent("BotTakeAllWeapon",source or ped)
end
addEvent( "botStopFire", true )
addEventHandler( "botStopFire", getRootElement(), botStopFire )


function patrolBot(bot)

	local patroled = getElementData(bot,"patroled") or false
	local patrol = getElementData(bot,"patrol") or false
	if patroled and patrol then
		local nx,ny,nz = sNewStopPos(bot)
		if nx then
		local bx,by,bz = getElementPosition(bot)
		local angle = ( 360 - math.deg ( math.atan2 ( ( nx - bx ), ( ny - by ) ) ) ) % 360
			setPedRotation( bot, angle )
			--setPedControlState( bot, "walk", true )
			setPedControlState( bot, "forwards", true )
			setPedControlState( bot, "sprint", false )
			setPedControlState( bot, "walk", true )
			setElementFrozen ( bot,false)
	setTimer ( patrolBot, 10000, 1, bot )
	end
	end
end

function sNewStopPos(ped)
	local px,py,pz = getElementPosition( ped )	
	local randNewPatromPos = math.random(1,4)
	local isclear1 = isLineOfSightClear (px,py,pz, px,py+50,pz, true, false, false, true, false, false, false )
	local isclear2 = isLineOfSightClear (px,py,pz, px,py-50,pz, true, false, false, true, false, false, false )
	local isclear3 = isLineOfSightClear (px,py,pz, px+50,py,pz, true, false, false, true, false, false, false )
	local isclear4 = isLineOfSightClear (px,py,pz, px-50,py,pz, true, false, false, true, false, false, false )
	
	if isclear1 and randNewPatromPos == 1 then
	local z= getGroundPosition ( px,py+50,pz )
	if z-pz >=-5 then
	return px,py+50,z
	end
	end
	
	if isclear2 and randNewPatromPos == 2 then
	local z= getGroundPosition ( px,py-50,pz )
	if z-pz >=-5 then
	return px,py-50,z
	end
	end
	
	if isclear3 and randNewPatromPos == 3 then
	local z= getGroundPosition ( px+50,py,pz )
	if z-pz >=-5 then
	return px+50,py,z
	end
	end
	
	if isclear4 and randNewPatromPos == 4 then
	local z= getGroundPosition ( px-50,py,pz )
	if z-pz >=-5 then
	return px-50,py,z
	end
	end
	return false,false,false
end










function checkClear(ped,weapon,player,at)
if not ped then return end
if not player then return end
local playerAtt = getElementData(ped,"attackPlayer")
if player~=playerAtt then return end
--outputDebugString(at)
local isDeadBot= getElementData(ped,"isDeadBot") or false
if isDeadBot then
return 
end

local isFiring= getElementData(ped,"firing") or false
local isChecked= getElementData(ped,"checked") or false
if not isChecked then
return 
end
--outputDebugString("Проверка: "..at)

--outputChatBox(tostring(getPedControlState( ped, "forwards" )))


	local tx,ty,tz = getElementPosition( player )
	local px,py,pz = getElementPosition( ped )	
	local isclear = isLineOfSightClear (tx,ty,tz+1, px,py,pz +1, true, false, false, true, false, false, false ) 
--dxDrawLine3D ( tx,ty,tz+.2, px,py,pz+.2)
if isclear then

if not isFiring then
local isclear2 = isLineOfSightClear (tx,ty,tz, px,py,pz, true, false, false, true, false, false, false ) 
--dxDrawLine3D ( tx,ty,tz, px,py,pz)
--outputChatBox("isclear2 = "..tostring(isclear2))
if not isclear2 then


local botType = getElementData(ped,"type",false)
if botType ~= "sniper1" and botType ~= "sniper2" then 

goBotToPlayer(ped,player)
end


else


botFire(player,ped)
--outputDebugString("все чисто")
end
end
resetWeaponPosition(ped,weapon,player)
--if getPedControlState( ped, "forwards") then
--setPedControlState( ped, "forwards", false )
--end
----outputChatBox("чисто - вызов изменения ротации")
else

if  isFiring then
botStopFire(ped,false,false,false)
end


setTimer ( checkClear, 1000, 1, ped, weapon,player,"игрок за препядствием" )
end

end

function goBotToPlayer(bot,player)
local patrol = getElementData(bot,"patrol") or false
if not patrol then return end
local playerAtt = getElementData(bot,"attackPlayer")
if player~=playerAtt then return end
outputDebugString("бот бежит на игрока")
setElementFrozen ( bot,false)
		

local bx,by,bz = getElementPosition(bot)
local px,py,pz = getElementPosition(player)
local angle = ( 360 - math.deg ( math.atan2 ( ( px - bx ), ( py - by ) ) ) ) % 360
		setPedRotation( bot, angle )
		--setPedControlState( bot, "walk", true )
		setPedControlState( bot, "forwards", true )
		setPedControlState( bot, "sprint", true )
		setElementData(bot,"sprinted",true,false)
		setTimer ( reRotationBot, 100, 1, bot,player )
end

function reRotationBot(bot,player)
local sprinted = getElementData(bot,"sprinted",false)
if not sprinted then return end
local bx,by,bz = getElementPosition(bot)
local px,py,pz = getElementPosition(player)
local angle = ( 360 - math.deg ( math.atan2 ( ( px - bx ), ( py - by ) ) ) ) % 360
		setPedRotation( bot, angle )

setTimer ( reRotationBot, 100, 1, bot,player )
end






function resetWeaponPosition(ped,weapon,player)
local isDeadBot= getElementData(ped,"isDeadBot") or false
if isDeadBot then
return 
end
	local tx,ty,tz = getElementPosition( player )
	local px,py,pz = getElementPosition( ped )
	local angle = ( 360 - math.deg ( math.atan2 ( ( tx - px ), ( ty - py ) ) ) ) % 360
				
setPedRotation( ped, angle )
local x,y,z=getPedWeaponMuzzlePosition ( ped )

if isPedDucked(player) then
setPedAimTarget ( ped, tx,ty,tz-1 )
else
setPedAimTarget ( ped, tx,ty,tz-.5 )
end
if x then
setElementPosition(weapon,x,y,z+.1)
end
setTimer ( checkClear, 100, 1, ped, weapon,player,"изменение ротации и прицеливание" )
local botType = getElementData(ped,"type")
local car = getPedOccupiedVehicle(player) 

	if car  then
	
		local carType = getVehicleType (car)
		if carType =="Automobile" or  carType =="Plane" or  carType =="Helicopter" or  carType =="Monster Truck" then 
			setWeaponTarget ( weapon, car )
			
		end
		
	else
		if botType == "sniper1" then
			setWeaponTarget ( weapon, tx,ty,tz+.7 )
		else
			local randFire = math.random(0,3)
			if randFire==3 then
				setWeaponTarget ( weapon, tx,ty,tz+.7 )
			else
				setWeaponTarget ( weapon, player,4 )
			end
		end
	end

end



function botDeadClient(bot)
local isFiring=getElementData(bot,"firing")
if isFiring then 
botStopFire(bot,true,true)
end
local weapon=getElementData(bot,"weapon") or false
if weapon then
destroyElement(weapon)
--outputChatBox("weaponDestroy")
end

end
addEvent( "botDeadClient", true )
addEventHandler( "botDeadClient", getRootElement(), botDeadClient )

