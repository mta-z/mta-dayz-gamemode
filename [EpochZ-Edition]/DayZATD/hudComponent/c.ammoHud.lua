local weaponName = ""
local weaponID = getPedWeapon(localPlayer)
local screenWidth,screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
function hud ( )
	weaponID = getPedWeapon(localPlayer)
	weaponName = getElementData(localPlayer,"weaponSwith") or ""
	if weaponID ==0 then return end
	if weaponName =="" then return end

	local  ammo = getPedTotalAmmo ( localPlayer )
	local  clip = getPedAmmoInClip ( localPlayer )
    dxDrawText(""..weaponName,screenWidth-150,screenHeight-screenHeight+15,296.0,301.0,tocolor(255, 255, 255, 255),0.6,"bankgothic","left","top",false,false,false)
    dxDrawText(""..clip.." | "..ammo,screenWidth-150,screenHeight-screenHeight+30,296.0,301.0,tocolor(255, 255, 255, 255),0.6,"bankgothic","left","top",false,false,false)

	end
addEventHandler("onClientRender",getRootElement(),hud)

