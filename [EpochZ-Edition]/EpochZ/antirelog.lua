


local antirelogTimer = {}

function removeAntirelog(player)

	if antirelogTimer[player] then
		antirelogTimer[player] = nil
		
		--triggerClientEvent("stopAntirelog",player,player)
		
		setElementData(player,"antirelogStarted",false)
		
	local inArena = getElementData(player,"inArena") or false
	if inArena then
	createAntirelog(player)
	end
		
	end
end
addEvent( 'removeAntirelog', true );
addEventHandler( 'removeAntirelog', root, removeAntirelog );


function createAntirelog(player,attacker)
local attackerNick=false
	local logined = getElementData(player,"logedin") or false
	if logined then
		local playerinGreenZ = getElementData(player,"InGreenZone") or false
		if  not playerinGreenZ  then

			if not antirelogTimer[player] then
			antirelogTimer[player]=true
		if attacker then
		 attackerNick=getPlayerName(attacker)
		end
				triggerClientEvent(player,"showAntirelog",player,player,attackerNick or "Besta")
			end

		end

	end

end
addEvent( 'server_OnPlayerDamage', true );
addEventHandler( 'server_OnPlayerDamage', root, createAntirelog );


addEventHandler( 'onPlayerQuit', root,
 function( qType )
  if qType == 'Quit' or qType == 'Timed out' then	  
 if antirelogTimer[ source ]  then
     antirelogTimer[ source ] =nil;
	  
	  local veh = getPedOccupiedVehicle ( source )
	 if veh then return end 
	  
	  if lastKillPlayer and lastKillPlayer==source then
	local realTick = getTickCount ()
	if lastKillPlayerTime then
	local ticks = realTick-lastKillPlayerTime
	if ticks<60000 then -- 1 the moment passed and the last victim = same person = cancel
	outputDebugString("ANTIRELOG: abortar kill do jogador "..getPlayerName(source).." esquerda: "..ticks.."ms")
	return
	end
	end
	end
	  
	  
        local x, y, z = getElementPosition( source );
        local rotX, rotY, rotZ = getElementRotation( source );
        local skin = getElementModel( source );
        local ped = createPed( skin, x, y, z, rotZ );
        local pedCol = createColSphere( x, y, z, 1.5 );
		
		 setElementParent(ped,deadPlayers)
		 setElementParent(ped,pedCol)
		 
        killPed( ped );
        setTimer( destroyDeadPlayer, 3600000*0.75, 1, ped, pedCol );	
        attachElements( pedCol, ped, 0, 0, 0 )
        setElementData( pedCol, "parent", ped );
        setElementData( pedCol, "playername", getPlayerName( source ) );
        setElementData( pedCol, "deadman", true )
        setElementData( pedCol, "MAX_Slots", getElementData( source, "MAX_Slots" ) );
        local time = getRealTime();
        local hours = time.hour;
        local minutes = time.minute;
        setElementData( pedCol, "deadreason", getPlayerName(source).."  Ele está morto. Causa da morte: Antirelog. Hora da morte: "..hours..":"..minutes.." hours." );
        
      for i,data in ipairs(lootData) do
			local plusData = getElementData(source,data[1]) or 0
			if plusData >0 then
				setElementData(pedCol,data[1],plusData)
			end
		end
        
		
		local account = getPlayerAccount( source );
        if not isGuestAccount( account ) then
          setAccountData( account, 'isDead', true );
        end
		
        local skinID = getElementData(source,"skin")
        local skin = getSkinNameFromID(skinID)
        setElementData(pedCol,skin,1)   
    end
	antirelogTimer[source] = nil
  end
  

end, true, 'high+500' );





function destroyDeadPlayer( ped, pedCol )
  destroyElement( ped );
  destroyElement( pedCol );
end

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
}

function getSkinNameFromID(id)
	for i,skin in ipairs(skinTable) do
		if id == skin[2] then
			return skin[1]
		end
	end
end

