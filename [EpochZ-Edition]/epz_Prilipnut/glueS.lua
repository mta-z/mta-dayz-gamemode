	
function gluePlayer(slot, vehicle, x, y, z, rotX, rotY, rotZ)
	attachElements(source, vehicle, x, y, z, rotX, rotY, rotZ)
	setPedWeaponSlot(source, slot)
	setElementData(source,"glue",true)
end
addEvent("gluePlayer",true)
addEventHandler("gluePlayer",getRootElement(),gluePlayer)

function ungluePlayer()
	detachElements(source)
	setElementData(source,"glue",false)
end
addEvent("ungluePlayer",true)
addEventHandler("ungluePlayer",getRootElement(),ungluePlayer)

function checkGlue(enteringPlayer)
local isGlue = getElementData(enteringPlayer,"glue") or false
if isGlue then
cancelEvent()
end
end
addEventHandler ( "onVehicleStartEnter", getRootElement(), checkGlue )