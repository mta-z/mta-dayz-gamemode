function handleVehicleDamage(attacker, weapon, loss, x, y, z, tyre)
local CarInBase = getElementData(source,"CarInBase") or false
if CarInBase  then
cancelEvent()
end
end
addEventHandler("onClientVehicleDamage", root, handleVehicleDamage)



function onClientColShapeHit( hitPlayer, matchingDimension )
	if hitPlayer == localPlayer then
	local baseCarDebug = getElementData(hitPlayer,"baseCarDebug") or false
	
		if baseCarDebug then
			local gangOK = getElementData(source,"gangOK") or false
			if gangOK and gangOK~="false" then
				local gang = getElementData(hitPlayer, "group") or "none"
					--outputChatBox("ON BASE")

				if  gang ~=gangOK  then
					setElementFrozen(hitPlayer,true)
					--outputChatBox("FROZEN AND BAN")
					triggerServerEvent("baseEnterDebug",localPlayer,localPlayer,"baseBan")
				end
				setElementData(hitPlayer,"baseCarDebug",false,false)
			end
		end
	end
end
addEventHandler("onClientColShapeHit",root,onClientColShapeHit)


function vehicleStartEnterBaseDebugStart(player)
	if player == localPlayer then
		--outputChatBox("baseCarDebug set to true")
		setElementData(player,"baseCarDebug",true,false)
	end
end
addEventHandler("onClientVehicleStartEnter",root,vehicleStartEnterBaseDebugStart)

function vehicleStartEnterBaseDebugStop(player)
	if player == localPlayer then
		local baseCarDebug = getElementData(player,"baseCarDebug") or false
		if baseCarDebug then
		setElementData(player,"baseCarDebug",false,false)
		--outputChatBox("baseCarDebug set to false")
		end
	end
end
addEventHandler("onClientVehicleEnter",root,vehicleStartEnterBaseDebugStop)

