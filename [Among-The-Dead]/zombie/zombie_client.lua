
function zomb_Forward (zomb)
	if (isElement(zomb)) then
	
	local speed = getElementData(zomb,"speed") or false
	if speed  then

	setPedControlState( zomb, speed, true )
	end
		
		setPedWalkingStyle ( zomb, 120)
		setTimer(mivi_toP,700,1,zomb)
		triggerEvent("zomb_ogg",zomb,"chase",zomb)
		local bloodSled = math.random(0,3)
		if bloodSled == 1 then
		setPedFootBloodEnabled(zomb, true)
		end
	end
end
addEvent( "zomb_Forward", true )
addEventHandler( "zomb_Forward", getRootElement(), zomb_Forward )

function zomb_ForwardSTOP (zomb)
	if (isElement(zomb)) then
	

		setPedControlState( zomb, "forwards", false )
		setPedWalkingStyle ( zomb, 0)
		triggerEvent("zomb_ogg",zomb,"idle",zomb)
	end
end
addEvent( "zomb_ForwardSTOP", true )
addEventHandler( "zomb_ForwardSTOP", getRootElement(), zomb_ForwardSTOP )

function zomb_STOP (zomb)
	if (isElement(zomb)) then
	

		setPedControlState( zomb, "forwards", false )
		setPedWalkingStyle ( zomb, 0)
		setPedControlState( zomb, "fire", false )
	end
end
addEvent( "zomb_STOP", true )
addEventHandler( "zomb_STOP", getRootElement(), zomb_STOP )




function meleeShoot(zomb)
	if (isElement(zomb)) then
		setPedControlState ( zomb, "forwards", false )
		setPedWalkingStyle ( zomb, 0)
		setPedControlState ( zomb, "fire", false )
		
			local tx,ty,tz = getElementPosition( getElementData(zomb,"owner") )
				local px,py,pz = getElementPosition( zomb )
				
				pdistance = (getDistanceBetweenPoints3D (tx,ty,tz, px, py, pz))
		--setPedAimTarget ( zomb,tx,ty,tz  )
		setTimer ( function ()  if isElement(zomb) then setPedControlState ( zomb, "fire", true) triggerEvent("zomb_ogg",zomb,"attack",zomb) end end, 300, 1, zomb )
		if pdistance<2 then 
		local status  = getElementData(zomb,"status")
		if  status =="dead" then

		else
		setTimer(mivi_toP,600,1,zomb)
		end
		else
			local status  = getElementData(zomb,"status")
		if  status =="dead" then

		else
		setTimer(mivi_toP,600,1,zomb)
		end
		end
		
	end
end
addEvent( "zomb_ForwardFIRE", true )
addEventHandler("zomb_ForwardFIRE", getRootElement(), meleeShoot)
function mivi_toP(zomb)
if not isElement(zomb) then return end
local owner = getElementData(zomb,"owner")
if isPedDead(owner) then
zomb_STOP (zomb)
return
end
	local tx,ty,tz = getElementPosition( owner )
				local px,py,pz = getElementPosition( zomb )
				
				
				pdistance = (getDistanceBetweenPoints3D (tx,ty,tz, px, py, pz))

				local angle = ( 360 - math.deg ( math.atan2 ( ( tx - px ), ( ty - py ) ) ) ) % 360 
				if pdistance>60 then
				if getPedControlState( zomb, "forwards" ) then
				setPedControlState( zomb, "forwards", false )
				setPedWalkingStyle ( zomb, 0)
				 triggerEvent("zomb_ogg",zomb,"idle",zomb)
				setTimer(function() if isElement(zomb) then triggerServerEvent("NewOwner",zomb,zomb); return; end  end,3000,1)
				
		
				else
				return
				end

				elseif  pdistance>2 and pdistance<60 then
				
					if getPedMoveState (owner) == "crouch" and pdistance>10 then 
if isElement(zomb) then triggerEvent("NewOwnerClient",zomb,zomb) end
		
					if getPedControlState(zomb,"forwards") and pdistance>10 then
	triggerEvent("zomb_ForwardSTOP",zomb,zomb)
	if isElement(zomb) then triggerEvent("NewOwnerClient",zomb,zomb) end


	end
	else

	if not getPedControlState(zomb,"forwards")  then 
				setPedControlState(zomb,"forwards", true)
				setPedWalkingStyle ( zomb, 120)

		
				end
		
				
		end	
				
				
				
			
				
					local status  = getElementData(zomb,"status")
		if  status =="dead" then
		else
		setTimer(mivi_toP,600,1,zomb)
		end
		
	
		
				setPedRotation( zomb, angle )
				elseif pdistance<2 then
				triggerEvent("zomb_ForwardSTOP",zomb,zomb)
				triggerEvent("zomb_ForwardFIRE",zomb,zomb)
				end
end
	


function zomb_ogg(act,zomb)
local soundName = false
if act == "chase" then
local randSound = math.random(0,12)
soundName = act.."_"..randSound..".ogg"
elseif act == "idle" then
local randSound = math.random(0,19)
soundName = act.."_"..randSound..".ogg"
elseif act =="attack" then
local randSound = math.random(0,12)
soundName = act.."_"..randSound..".ogg"
end
local zombSound = getElementData(zomb,"sound")
local x,y,z = getElementPosition(zomb)
if not zombSound then

local sound =  playSound3D ( "ogg/"..soundName, x,y,z )	
setElementData(sound,"zomb",zomb)
setElementData(zomb,"sound",true)
setSoundMaxDistance( sound, 40 )
attachElements(sound,zomb)
end
end
addEvent("zomb_ogg",true)		
addEventHandler( "zomb_ogg", getRootElement(), zomb_ogg )

		
function onSoundStopped ( reason )
   local zomb = getElementData(source,"zomb")

   if ( reason == "finished" ) then
   if isElement(zomb) then
   setElementData(zomb,"sound",false)
   end
   destroyElement(source)

   
    end
end
addEventHandler ( "onClientSoundStopped", getRootElement(), onSoundStopped )			
			function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

		function NewOwnerClient(zomb)

local zombCol = getElementData(zomb,"parentCOL11") 
local players = getElementsWithinColShape ( zombCol, "player")
local oldOwner =  getElementData ( zomb, "owner"  )
local tableSize = table.size(players)
if tableSize>0 then
for theKey,thePlayer in ipairs(players) do
if thePlayer ~= oldOwner then


	if getPedMoveState (thePlayer) ~= "crouch" then
	 setElementData ( zomb, "owner", thePlayer  )

	 
	--triggerEvent ( "zomb_Forward", zomb,zomb )
	break
	end
	
	
	end
end
else

newCheck(zomb)
end
end
addEvent("NewOwnerClient",true)		
addEventHandler( "NewOwnerClient", getRootElement(), NewOwnerClient )	
		--	setDevelopmentMode(true)