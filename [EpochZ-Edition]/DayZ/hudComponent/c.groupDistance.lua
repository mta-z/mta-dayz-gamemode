

local textSize = 1
local textFont = "default"

function groupDistanceWorld ()
if getElementData(localPlayer,"isDead") then return end

	local localPlayerGroup = getElementData(localPlayer,"group") or ""	
	local lx,ly,lz = getElementPosition(localPlayer)

	for _, player in ipairs(getElementsByType('player')) do
		
	local playerGroup = getElementData(player,"group") or false
		
	if playerGroup then
	
		if playerGroup == localPlayerGroup then
			local isDeadPlayer = getElementData(player,"isDead") or false
			if not isDeadPlayer then
				local playerName  = getPlayerName ( player )
				
				local px,py,pz = getElementPosition(player)
				
				local dist = getDistanceBetweenPoints3D ( lx,ly,lz, px,py,pz)
				if dist >20 then
					local textDist = playerName.."("..math.floor(dist).."m)"
					
					local screenPos = {getScreenFromWorldPosition (  px,py,pz )}
					if screenPos[1] and screenPos[2] then
						--outputChatBox(tostring( screenPos[2]))
						dxDrawText ( textDist  , screenPos[1], screenPos[2], screenPos[1], screenPos[2], tocolor ( 255,255,0,200 ), textSize, textFont,"center","center",false,false,false,true )
					end
				end
			end
		end
		
	end
		
			
	end
end				


function setGroupDistance(swith)

	local isEventAdded = isEventHandlerAdded('onClientRender', getRootElement(), groupDistanceWorld)
	
	if swith and not isEventAdded then
		addEventHandler ( "onClientRender", getRootElement(), groupDistanceWorld )
	else
		removeEventHandler ( "onClientRender", getRootElement(), groupDistanceWorld )
	end

end