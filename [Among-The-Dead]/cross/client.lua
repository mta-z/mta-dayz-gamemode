-- Author: __Vector__ 

local textures = {}; 
local cross = false
local weapModel = false
local clot1 = false
local clot2 = false
local backpack = false
local screenw, screenh = guiGetScreenSize (); 
local s = screenw * 0.5; 
local u,v = (screenw - s)*0.5, (screenh - s)*0.5;
local black = tocolor (0, 0, 0, 255);
	
function render_crosshair ()
--outputChatBox(tostring(getControlState ( "aim_weapon" )))
local WEAPONID = getPedWeapon (localPlayer)


if WEAPONID ~= 34  and WEAPONID ~= 43 then removeCross() return end

if getPedControlState ( "aim_weapon" ) then 

	
	cross = getElementData(getLocalPlayer(),"weaponSwith")
	weapModel = getElementData(getLocalPlayer(),"weaponSwithModel") or false
	--outputChatBox(tostring(weapModel))
	if isElement(weapModel)  and weapModel ~=nil  then
		if getElementAlpha(weapModel) == 255 then
			setElementAlpha(weapModel,0)
		end
	end
	clot1 = getElementData(getLocalPlayer(),"clotFile_1") or false
	
	if clot1 and getElementAlpha(clot1) == 255 then
	setElementAlpha(clot1,0)
	end
	clot2 = getElementData(getLocalPlayer(),"clotFile_2") or false
	
	if clot2 and getElementAlpha(clot2) == 255 then
	setElementAlpha(clot2,0)
	end
	
	backpack = getElementData(getLocalPlayer(),"backPackFile") or false
	
	if backpack and getElementAlpha(backpack) == 255 then
	setElementAlpha(backpack,0)
	end
	if cross ~= "Binóculos" then
	dxDrawRectangle (0, 0, screenw, v, black);
	dxDrawRectangle (0, 0, u, screenh, black);
	dxDrawRectangle (0, screenh, screenw, -v, black);
	dxDrawRectangle (screenw, screenh, -u, -screenh, black);
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["crosshair_background"]);
	end
	if cross == "AS50" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_bcc"]);
	elseif cross == "CZ550" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_cz"]);
	elseif cross == "DMR" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_m24"]);
	elseif cross == "KSVK" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_ksvk"]);
	elseif cross == "M107" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_svd"]);
	elseif cross == "M24" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_m24"]);
	elseif cross == "M24 (desert)" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_m24"]);
	elseif cross == "M40A3" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_m24"]);
	elseif cross == "SVD Camo" then
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["cross_svd"]);
	elseif cross == "Binóculos" then
	dxDrawImage (0,0, screenw, screenh, textures ["cross_binoculars"]);
	end
end
end;




 function on_weapon_aimed (key, state,errorCross)

 
 
if getElementData(getLocalPlayer(),"aimedOff",false) then

return 
end
cross = getElementData(getLocalPlayer(),"weaponSwith")
	--outputChatBox("on_weapon_aimed "..state.." WEAPON: "..getPedWeapon (getLocalPlayer ()).." "..tostring(cross)) 
	local weapon_sniper_rifle = 34; 
	local progressSniper = getElementData(getLocalPlayer(),"progress.sniper") or 0 
	if getPedWeapon (getLocalPlayer ()) == weapon_sniper_rifle or  getPedWeapon (getLocalPlayer ()) == 43 then 
		if state == "down" then 
		addEventHandler ("onClientHUDRender", getRootElement (), render_crosshair);
		setPlayerHudComponentVisible ("crosshair", false);
		setElementData(getLocalPlayer(),"aimed",true,false)
		setFarClipDistance(getFarClipDistance()+(progressSniper*5))
		
			
		else 
		removeCross()
			
		end;
	end;
end; 


function removeCross()

removeEventHandler ("onClientHUDRender", getRootElement (), render_crosshair); 
		setElementData(getLocalPlayer(),"aimed",false,false)
		triggerEvent("setNightTime",getLocalPlayer())
		cross = false
		if isElement(weapModel) then
		setElementAlpha(weapModel,255)
		end
		if clot1 then
		setElementAlpha(clot1,255)
		end
		if clot2 then
		setElementAlpha(clot2,255)
		end
		if backpack then
		setElementAlpha(backpack,255)
		end
end

local TimerAim = false
function setReloadedSniper()
if not TimerAim then

setElementData(getLocalPlayer(),"aimedOff",true,false)
setElementData(getLocalPlayer(),"aimed",false,false)
triggerEvent("setNightTime",getLocalPlayer())
if weapModel then
setElementAlpha(weapModel,255)
end
if clot1 then
setElementAlpha(clot1,255)
end
if clot2 then
setElementAlpha(clot2,255)
end
if backpack then
setElementAlpha(backpack,255)
end
removeEventHandler ("onClientHUDRender", getRootElement (), render_crosshair); 
			
TimerAim = setTimer(function() 
TimerAim = false
setElementData(getLocalPlayer(),"aimedOff",false,false)
if getPedControlState("aim_weapon")  then
	local weapon_sniper_rifle = 34; 
	local progressSniper = getElementData(getLocalPlayer(),"progress.sniper") or 0 
	if getPedWeapon (getLocalPlayer ()) == weapon_sniper_rifle then 
	
		
		setElementData(getLocalPlayer(),"aimed",true,false)
		setFarClipDistance(getFarClipDistance()+(progressSniper*5))
		
			setPlayerHudComponentVisible ("crosshair", false);
			addEventHandler ("onClientHUDRender", getRootElement (), render_crosshair);
	end
end
end,1200,1)
end
end

addEvent( "setReloadedSniper", true )
addEventHandler( "setReloadedSniper", getRootElement(), setReloadedSniper )


addEventHandler ("onClientResourceStart", getResourceRootElement (getThisResource ()),
	function () 
	textures ["crosshair_background"] = dxCreateTexture ("images/crossBackground.png", "argb", true, "wrap")
	
	textures ["cross_cz"] = dxCreateTexture ("images/aim_cz550.png", "argb", true, "wrap"); 

	textures ["cross_ksvk"] = dxCreateTexture ("images/aim_ksvk.png", "argb", true, "wrap"); 

	textures ["cross_m24"] = dxCreateTexture ("images/aim_m24.png", "argb", true, "wrap"); 
	
	textures ["cross_svd"] = dxCreateTexture ("images/aim_svdcamo.png", "argb", true, "wrap"); 
	
	textures ["cross_bcc"] = dxCreateTexture ("images/aim_bcc.png", "argb", true, "wrap"); 
	textures ["cross_binoculars"] = dxCreateTexture ("images/binoculars.png", "argb", true, "wrap"); 
	

		bindKey ("aim_weapon", "both", on_weapon_aimed);
		addEventHandler ("onClientPlayerWeaponSwitch", getRootElement (),
			function (previousWeaponSlot)
				local weaponslot_type_sniper = 6; 
				if previousWeaponSlot == 6 or previousWeaponSlot == 9  then 
					if not isPlayerHudComponentVisible ("crosshair") then 
						setPlayerHudComponentVisible ("crosshair", true);
					end;
				end; 
			end);
	end); 
	
addEventHandler ("onClientResourceStop", getResourceRootElement (getThisResource ()),
	function ()
		unbindKey ("aim_weapon", "both", on_weapon_aimed); 
		if not isPlayerHudComponentVisible ("crosshair") then
			setPlayerHudComponentVisible ("crosshair", true);
		end;
	end);
	
	
	
	
	
	
