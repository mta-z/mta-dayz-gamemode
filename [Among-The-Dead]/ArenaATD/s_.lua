
root = getRootElement()
 local globalUsersTable = {
}
 local arenaSpawnPositions = {
 ["1"]={
{1234.4423828125,-2185.8898925781,-78.459716796875},
{1234.8078613281,-2160.0095214844,-80.361846923828},
{1199.0270996094,-2112.1455078125,-78.458908081055}, 
{1174.0754394531,-2064.3518066406,-80.361846923828},
{1174.0754394531,-2064.3518066406,-80.361846923828},
{1188.013671875,-2014.1303710938,-78.63232421875},
{1240.3706054688,-2025.7404785156,-80.055519104004},
{1239.1447753906,-2067.8166503906,-78.463409423828},
{1211.8884277344,-2089.9699707031,-78.340744018555},
{1206.7813720703,-2089.7644042969,-78.340744018555},
{1164.3082275391,-2117.0869140625,-80.361846923828},
},
["2"]={
{-245.85765075684,949.12426757813,-61.334373474121},
{-252.55044555664,1002.5944824219,-61.334373474121},
{-248.08711242676,1030.5112304688,-61.334373474121},
{-137.91270446777,1042.4208984375,-61.334373474121},
{-191.6833190918,994.68005371094,-60.481121063232},
{-161.83561706543,1031.5899658203,-61.334373474121},
{-166.88415527344,954.28302001953,-61.334373474121},
{-231.14080810547,988.4951171875,-61.115623474121}

}
}
local deadTime =0

function table.size(tab)

    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
	
end

local arenaMarker = false
function arenaMarkerF(source) 
  triggerClientEvent ("PlayerInArenaGUI", source, source)
  triggerClientEvent ("refreshUserTable", source, globalUsersTable)
end
local playersItems = {
{"PKM",1},
{"PKM mag",200},
{"Ôculos de Visão Infravermelho",1},
{"Kit de Primeiros Socorros",1},
{"Bandagem",2},

}
spawnArea = createColTube ( 625.78576660156,-606.81744384766,0, 100, 30)

function jailZoneLeave ( thePlayer )
   if getElementType ( thePlayer ) == "player" then 
	   if getElementData(thePlayer,"partyArena") then
		  outputChatBox ( "Retornar ao organizador de batalha antes que a batalha comece, ou sua inscrição será automaticamente cancelada!", thePlayer )
	   end
   end
end

addEventHandler ( "onColShapeLeave", spawnArea, jailZoneLeave )


arena1 = createColTube ( 1217.0478515625,-2084.6628417969,-83.544631958008, 150, 30) 
arena2 = createColCuboid ( -265.21368408203,946.97210693359,-65, 150, 100, 20 )
local GLOBALMONEY =0

function startArenaGame(arena)
	local arenaSpawnPointsTableSize = table.size(arenaSpawnPositions[""..arena..""])
	local playersRegistrated = table.size(globalUsersTable)
	if playersRegistrated<=0 then return end
	for i, user in ipairs(globalUsersTable) do	
	local partyArena = getElementData(user[1],"partyArena") or false
	if partyArena then
	local playerInBlueZone = isElementWithinColShape ( user[1], spawnArea )
	if playerInBlueZone  then
		for i, iiitten in ipairs(playersItems) do
			setElementData(user[1],iiitten[1],iiitten[2])
		end
			--outputChatBox("playerSPAWN TO ARENA")		
		local spawnpos = math.random(1,arenaSpawnPointsTableSize)
		setElementData(user[1],"inArena",true)
		setElementData(user[1],"partyArena",false)
		triggerEvent("server_OnPlayerDamage",user[1],user[1])
		setElementData(user[1],"InGreenZone",false)
		spawnPlayer ( user[1], arenaSpawnPositions[""..arena..""][spawnpos][1], arenaSpawnPositions[""..arena..""][spawnpos][2], arenaSpawnPositions[""..arena..""][spawnpos][3], 0, getElementModel(user[1]) or 170 )
		triggerEvent("server_OnPlayerDamage",user[1],user[1])
		GLOBALMONEY=GLOBALMONEY+user[2]	
		else
		triggerEvent("removePlayerInTable",user[1] )
	end
	end
	end
	if arena == 1 then
	setTimer(arenaCheck,15000,1,arena1)
	else
	setTimer(arenaCheck,15000,1,arena2)
	end	
	globalUsersTable={}
	refreshArenaUsers(true)
	deadTime = getRealTime().timestamp+1200
end

function spawnLastHIRO(player)
local xl,xy,xz=629.93194580078,-603.71264648438,16.3359375
local money = getElementData(player,"Dinheiro")
local myStavka = getElementData(player,"mustavka")
setElementData(player,"Dinheiro",money+(GLOBALMONEY-myStavka))
setElementData(player,"partyArena",false)
setElementData(player,"inArena",false)
outputChatBox("Parabéns!!",player)
outputChatBox(getPlayerName(player).." ganhou batalhas na arena e levou o banco na quantidade de: "..(GLOBALMONEY-myStavka))
GLOBALMONEY=0
spawnPlayer ( player, xl,xy,xz, 0, getElementModel(player) or 170 )
end

function arenaCheck(arena)

	local tablePlayersInArena = getElementsWithinColShape ( arena, "player" )
	local tablePlayersSize = table.size(tablePlayersInArena)
	
	for i, player in ipairs(tablePlayersInArena) do
		if player and isElement(player) then
		local inArena  = getElementData(player,"inArena") or false
		local partyArena = getElementData(player,"partyArena") or false
		if partyArena then setElementData(player,"partyArena",false) end
		if getRealTime().timestamp >= deadTime then triggerEvent("kilLDayZPlayer",player) end
		if not inArena then
			triggerEvent("kilLDayZPlayer",player)
			else
			if tablePlayersSize==1 then spawnLastHIRO(player) end
		end
		end
	end
	if tablePlayersSize<=1 then  return end
	setTimer(arenaCheck,30000,1,arena)
end


function removeArena(arenaBlip,pedArena,arenaMarker)

	removeEventHandler( "onMarkerHit", arenaMarker, arenaMarkerF )
	destroyElement(pedArena)
	destroyElement(arenaBlip)
	destroyElement(arenaMarker)
	local arena = math.random(1,2)
	startArenaGame(arena)
	setTimer(createArena,1200000,1)
	
end

function preStartMessages(mess)
for i, user in ipairs(globalUsersTable) do	
	local partyArena = getElementData(user[1],"partyArena") or false
	if partyArena then
	outputChatBox(mess,user[1],255,255,255,true)
	end
end
end


function createArena()

	--1123.1901855469,-2037.1455078125,69.887756347656
	local pedArena = createPed (261, 625.78576660156,-606.81744384766,16.795509338379,-60.0,false)
	setElementData(pedArena,"trader",true)
	setElementData(pedArena,"pedName","Arena Organizador de Batalhas.")
	
	setElementFrozen  ( pedArena, true )
	local arenaBlip = createBlip ( 625.78576660156,-606.81744384766,16.795509338379, 20, 2, 255, 0, 0,255)
	local arenaMarker = createMarker ( 625.78576660156,-606.81744384766,16.795509338379, "cylinder", 1.5, 0, 0, 0, 0 )
	addEventHandler( "onMarkerHit", arenaMarker, arenaMarkerF )
	setTimer(preStartMessages,300000,1,"#ffaa00 Atenção! #ffffff -A batalha começará em 5 minutos!")
	setTimer(removeArena,600000,1,arenaBlip,pedArena,arenaMarker)

end
createArena()



function addPlayerInTable(player,stavka)
 if not getElementData(player,"partyArena") then
	table.insert(globalUsersTable,{player,stavka})
	setElementData(player,"partyArena",true)
	local money = getElementData(player,"Dinheiro")
	setElementData(player,"Dinheiro",money-stavka)
	setElementData(player,"myStavka",stavka)
	triggerClientEvent ("refreshUserTable", source, globalUsersTable)
	refreshArenaUsers()
	end
end
addEvent( "addPlayerInTable", true )
addEventHandler( "addPlayerInTable",getRootElement(), addPlayerInTable )

function refreshArenaUsers(win)
local players = getElementsByType("player")
for i, player in ipairs(players) do
if win then
triggerClientEvent (player,"closeWinAll", player)
else
triggerClientEvent (player,"refreshUserTable", player, globalUsersTable)
end
end
end

function  removePlayerInTable( quitType )

	if getElementData(source,"partyArena") then
		for i, user in ipairs(globalUsersTable) do
			if user[1] == source then
			
				table.remove (globalUsersTable, i)
				setElementData(user[1],"partyArena",false)
				
				local money = getElementData(user[1],"Dinheiro")
				setElementData(user[1],"Dinheiro",money+user[2])
				

				break

			end
		end
		refreshArenaUsers()
	end

end
addEventHandler ( "onPlayerQuit", getRootElement(), removePlayerInTable )
addEvent( "removePlayerInTable", true )
addEventHandler( "removePlayerInTable",getRootElement(), removePlayerInTable )