function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end
function NewOwner(zomb)

if zomb then
 zombCol = getElementData(zomb,"parentCOL11") or false
 players = getElementsWithinColShape ( zombCol, "player")
 oldOwner =  getElementData ( zomb, "owner"  )
local tableSize = table.size(players)
if tableSize>0 then
for theKey,thePlayer in ipairs(players) do
if thePlayer ~= oldOwner then
	 setElementData ( zomb, "owner", thePlayer  )
	triggerClientEvent ( "zomb_Forward", zomb,zomb )
	break
	end
end
else
newCheck(zomb)
end

end
end
addEvent("NewOwner",true)		
addEventHandler( "NewOwner", getRootElement(), NewOwner )

function newCheck(zomb)

if  isElement(zomb) then 
local zombCol = getElementData(zomb,"parentCOL11") 
local players = getElementsWithinColShape ( zombCol, "player")
local tableSize = table.size(players)

if tableSize<=0 then

zomb_Destroy(zomb,true)
end
end
end


function pathHit ( hitElement, matchingDimension )
if getElementData(source,"zombie") then
	if getElementType (hitElement) == "player" then
		local owner = getElementData(getElementData(source,"parentCOL11"),"owner")
		local ownerInCol = isElementWithinColShape(owner,source) or false
		if ownerInCol  then
		if isPedDead(owner) then
			local zomb = getElementData(source,"parentCOL11")
		setElementData ( zomb, "owner", hitElement  )
		triggerClientEvent ( "zomb_Forward", zomb,zomb )
		else
		local zomb = getElementData(source,"parentCOL11")
		triggerClientEvent ( "zomb_Forward", zomb,zomb )
		end
		else
		local zomb = getElementData(source,"parentCOL11")
		setElementData ( zomb, "owner", hitElement  )
		triggerClientEvent ( "zomb_Forward", zomb,zomb )
		
		end
	end
	end
	
end
addEventHandler ( "onColShapeHit", getRootElement(), pathHit )

function playerdeath( ammo, attacker, weapon, bodypart )

	local peds = getElementsByType ( "ped" )
	for theKey,thePed in ipairs(peds) do
		if (getElementData (thePed, "zombie") == true) then
			if (getElementData ( thePed, "owner" ) ==  source ) then
			
			
		setTimer(triggerEvent,1000,1,"zomb_STOP",thePed,thePed)
		setTimer(triggerEvent,3000,1,"NewOwner",thePed,thePed)
		
			end

		end
	end
end
addEventHandler("onPlayerWasted", getRootElement(), playerdeath)


function peddeath(ammo, attacker, weapon, bodypart)
	if (getElementData (source, "zombie") == true) then
		setElementData ( source, "status", "dead" )
	--	setElementData(source,"deadzombie",true)
	--	zomb_Destroy(source,all)

	end	
end
addEventHandler("onPedWasted", getRootElement(), peddeath)




function zomb_Destroy(zomb,all)
if not isElement(zomb) then return end
local owner = getElementData(zomb,"REALowner") or false
if owner then
if isElement(owner) then
local spawnedzombies = getElementData(owner,"spawnedzombies") or false
		if spawnedzombies-1 >= 0 then
				setElementData(owner,"spawnedzombies",getElementData(owner,"spawnedzombies")-1)
	
	end	
	end
end

 col = getElementData(zomb,"parentCOL11")
 if col then
destroyElement(col)
end
if all then
loot = getElementData(zomb,"playerLoot") or false
if loot then
destroyElement(loot)
end
destroyElement(zomb)
end
end
addEvent("zomb_Destroy",true)		
addEventHandler( "zomb_Destroy", getRootElement(), zomb_Destroy )
--EXPORTED FUNCTIONS!!!!!!!!!!!!!!
function createZombie ( x, y, z, skin,owner )

		if not x then return false end
		if not y then return false end
		if not z then return false end

		local zomb = createPed (skin,tonumber(x),tonumber(y),tonumber(z))--spawns the ped

		if (zomb ~= false) then
		local nx,ny,nz = getElementPosition(zomb)			
			local newnodecol = createColSphere ( nx,ny,nz, 60 )
			attachElements(newnodecol,zomb)
			setElementData(newnodecol,"parentCOL11",zomb)
			setElementData(zomb,"parentCOL11",newnodecol)
			setElementData(zomb,"pedName","Зомби")
			--setElementData(zomb,"playername","Zombie")
			setElementData(newnodecol,"zombie",true)
			--setElementData(newnodecol,"playername","Zombie")
		setTimer ( setElementInterior, 100, 1, zomb, tonumber(0)) --sets interior
		setTimer ( setElementDimension, 100, 1, zomb, tonumber(0)) --sets dimension
		setPedWalkingStyle ( zomb, 120)
-- 68 вояка
-- 22 док
-- 70 полицай
-- 97 вояка без каски
			setElementData ( zomb, "zombie", true)
			
			if tonumber(skin) == 68 or tonumber(skin) == 22 or tonumber(skin) == 97 or tonumber(skin) == 70 then 
			setElementData ( zomb, "speed", "sprint")
			else
			setElementData ( zomb, "speed", "forwards")
			end
			
			
			if  owner then
			setElementData ( zomb, "owner", owner  )
			setElementData ( zomb, "REALowner", owner  )
			end
			triggerClientEvent ( "zomb_Forward", zomb,zomb )
			return zomb 
		else
			return false 
		end

end



function createZombiePlayer ( x, y, z, rx, ry, rz, skin,loot,owner )

		if not x then return false end
		if not y then return false end
		if not z then return false end

--outputChatBox(":JGF!")
		


		zomb = createPed(skin,x, y, z,rz)
		if zomb then
		local nx,ny,nz = getElementPosition(zomb)			
			 newnodecol = createColSphere ( nx,ny,nz, 60 )
			attachElements(newnodecol,zomb)
			setElementData(newnodecol,"parentCOL11",zomb)
			setElementData(zomb,"parentCOL11",newnodecol)
			setElementData(newnodecol,"zombie",true)
			setElementData(zomb,"pedName",getPlayerName(owner).."(Зомби)" )
			setElementData(newnodecol,"zombiePlayer",true)

		setPedWalkingStyle ( zomb, 120)

			setElementData ( zomb, "zombie", true)
			setElementData ( zomb, "speed", "sprint")
			setElementData ( zomb, "zombiePlayer", true)
			
			if  loot then
			setElementData ( zomb, "playerLoot", loot  )
			setElementData ( loot, "playerLoot", zomb  )
			attachElements(loot,zomb)
			setElementData(loot,"playername"," "..getPlayerName(owner).."(Зомби)") --client
			end
			
			
	setTimer(function()setPedAnimation(zomb,"WUZI","CS_Dead_Guy",-1,false,false,false,true) 

end,100,1)			
			
			setTimer(function()
			if isElement(zomb) and not isPedDead(zomb) then
setPedAnimation (zomb,"ped","getup_front",-1,false,false,false,false)
triggerEvent ( "NewOwner", zomb,zomb )
end
end,10000,1)
			
			return zomb 
		else
			return false 
	end	

end