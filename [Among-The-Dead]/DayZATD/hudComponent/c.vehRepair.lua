local carName = ""
local RepaidCar = false
local screenWidth,screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
function dxRepairVeh()
local carHealth = getElementHealth(RepaidCar) or 0
--outputChatBox(carHealth)
local carHealth = 100/1000*carHealth
if carHealth>100 then
carHealth=100
end
dxDrawLine ( (screenWidth/2)-200, screenHeight*0.9,(screenWidth/2)+200 ,screenHeight*0.9, tocolor ( 0,0,0,150 ), 30, false )
local startLine = (screenWidth/2)-195
local stopLine = startLine+380/100*carHealth
dxDrawLine ( startLine, screenHeight*0.9,stopLine ,screenHeight*0.9, tocolor ( 175,25,25,200 ), 20, false )

dxDrawText ( "Descanso: "..carName, (screenWidth/2)-200, screenHeight*0.85,(screenWidth/2)+200,screenHeight*0.85 ,tocolor ( 255,255,255 ),1, "default-bold","center","center" )
dxDrawText ( carHealth.."%", (screenWidth/2)-200, screenHeight*0.9,(screenWidth/2)+200,screenHeight*0.9 ,tocolor ( 255,255,255 ),1, "default-bold","center","center" )

end


function showRapairHud(show,rapVeh)
--outputChatBox("showRapairHud "..tostring(show))
local event = isEventHandlerAdded('onClientRender', root,dxRepairVeh)
	if show == "show" then
	--outputChatBox(tostring(bool))
		RepaidCar = rapVeh
		carName = GetRealVehicleName(rapVeh)
		if not event then
		addEventHandler( "onClientRender", root,dxRepairVeh)
		end
		
	else
		if  event then
		removeEventHandler("onClientRender", root, dxRepairVeh)
		end
	end
end
addEvent("showRapairHud",true)
addEventHandler("showRapairHud",localPlayer,showRapairHud)