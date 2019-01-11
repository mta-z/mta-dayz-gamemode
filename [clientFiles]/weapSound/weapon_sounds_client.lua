function onClientPlayerWeaponFire ( pedWeap,ammo,ammoInClip,hitX,hitY,hitZ,hitElement,startX, startY, startZ )

local  weapon = getElementData(source or pedWeap,"weaponSwith")

	
	if weapon == "AS50" then
	sound =	playSound3D ( "sounds/AS50.ogg",startX, startY, startZ, false )
	elseif weapon == "AK-107" then
	sound =	playSound3D ( "sounds/AK107.wav",startX, startY, startZ, false )
	elseif weapon == "AK-107 PSO" then
	sound =	playSound3D ( "sounds/AK107.wav",startX, startY, startZ, false )
	elseif weapon == "AK-74" then
	sound =	playSound3D ( "sounds/AK74.wav",startX, startY, startZ, false )
	elseif weapon == "AKS-74 Kobra" then
	sound =	playSound3D ( "sounds/AK74.wav",startX, startY, startZ, false )
	elseif weapon == "MP5" then
	sound =	playSound3D ( "sounds/MP5.wav",startX, startY, startZ, false )
	elseif weapon == "AKS-74 PSO" then
	sound =	playSound3D ( "sounds/AK74.wav",startX, startY, startZ, false )
	elseif weapon == "AKS-74U" then
	sound =	playSound3D ( "sounds/AK74u.wav",startX, startY, startZ, false )
	elseif weapon == "AKM" then
	sound =	playSound3D ( "sounds/AK107.wav",startX, startY, startZ, false )
	elseif weapon == "AKS" then
	sound =	playSound3D ( "sounds/AK107.wav",startX, startY, startZ, false )
	elseif weapon == "AKS (gold)" then
	sound =	playSound3D ( "sounds/AK107.wav",startX, startY, startZ, false )
	elseif weapon == "FN SCAR" then
	sound =	playSound3D ( "sounds/FNscar.wav",startX, startY, startZ, false )
	elseif weapon == "G36" then
	sound =	playSound3D ( "sounds/G36.wav",startX, startY, startZ, false )
	elseif weapon == "G36C-SD" then
	sound =	playSound3D ( "sounds/G36CSD.wav",startX, startY, startZ, false )
	elseif weapon == "G36K" then
	sound =	playSound3D ( "sounds/G36.wav",startX, startY, startZ, false )
	elseif weapon == "Gauss" then
	sound =	playSound3D ( "sounds/Lee.wav",startX, startY, startZ, false )
	elseif weapon == "M240" then
	sound =	playSound3D ( "sounds/M240.wav",startX, startY, startZ, false )
	elseif weapon == "M249 Saw" then
	sound =	playSound3D ( "sounds/M249.wav",startX, startY, startZ, false )
	elseif weapon == "MG36" then
	sound =	playSound3D ( "sounds/G36.wav",startX, startY, startZ, false )
	elseif weapon == "Mk 48 Mod 0" then
	sound =	playSound3D ( "sounds/MK48.wav",startX, startY, startZ, false )
	elseif weapon == "PKM" then
	sound =	playSound3D ( "sounds/PKP.ogg",startX, startY, startZ, false )
	elseif weapon == "PKP" then
	sound =	playSound3D ( "sounds/PKP.ogg",startX, startY, startZ, false )
	elseif weapon == "G17" then
	sound =	playSound3D ( "sounds/G17.wav",startX, startY, startZ, false )
	elseif weapon == "M1911" then
	sound =	playSound3D ( "sounds/M1911.wav",startX, startY, startZ, false )
	elseif weapon == "M9" then
	sound =	playSound3D ( "sounds/M9.wav",startX, startY, startZ, false )
	elseif weapon == "M9 SD" then
	sound =	playSound3D ( "sounds/M9SD.wav",startX, startY, startZ, false )
	elseif weapon == "Makarov PM" then
	sound =	playSound3D ( "sounds/M9.wav",startX, startY, startZ, false )
	elseif weapon == "Revolver" then
	sound =	playSound3D ( "sounds/REVOLVER.ogg",startX, startY, startZ, false )
	elseif weapon == "M1014" then
	sound =	playSound3D ( "sounds/M1014.wav",startX, startY, startZ, false )
	elseif weapon == "Remington 870" then
	sound =	playSound3D ( "sounds/REMINGTON.ogg",startX, startY, startZ, false )
	elseif weapon == "Remington 870 (flashlight)" then
	sound =	playSound3D ( "sounds/REMINGTON.ogg",startX, startY, startZ, false )
	elseif weapon == "Saiga 12K" then
	sound =	playSound3D ( "sounds/SAIGA.wav",startX, startY, startZ, false )
	elseif weapon == "CZ550" then
	sound =	playSound3D ( "sounds/SVD.ogg",startX, startY, startZ, false )
	elseif weapon == "KSVK" then
	sound =	playSound3D ( "sounds/M24.wav",startX, startY, startZ, false )
	elseif weapon == "M107" then
	sound =	playSound3D ( "sounds/M107.wav",startX, startY, startZ, false )
	elseif weapon == "M24" then
	sound =	playSound3D ( "sounds/M24.wav",startX, startY, startZ, false )
	elseif weapon == "M1014" then
	sound =	playSound3D ( "sounds/M24.wav",startX, startY, startZ, false )
	elseif weapon == "M24 (desert)" then
	sound =	playSound3D ( "sounds/M24.wav",startX, startY, startZ, false )
	elseif weapon == "M40A3" then
	sound =	playSound3D ( "sounds/M24.wav",startX, startY, startZ, false )
	elseif weapon == "SVD Camo" then
	sound =	playSound3D ( "sounds/SVD.ogg",startX, startY, startZ, false )
	elseif weapon == "DMR" then
	sound =	playSound3D ( "sounds/DMR.ogg",startX, startY, startZ, false )
	elseif weapon == "M4A1" then
	local vssrand = math.random(1,2)
	sound =	playSound3D ( "sounds/M4A1_"..vssrand..".wav",startX, startY, startZ, false )
	elseif weapon == "M4A1 SD" then
	
	sound =	playSound3D ( "sounds/M4A1SD.wav",startX, startY, startZ, false )
	
	
	elseif weapon == "ВСС Винторез" then
	local vssrand = math.random(1,2)
	sound =	playSound3D ( "sounds/VSS_"..vssrand..".wav",startX, startY, startZ, false )
	setSoundVolume(sound, 0.1)
	end 
setSoundMaxDistance(sound, 300)
setSoundMinDistance (sound, 60)
setSoundVolume(sound, 0.5)
end

	--setSoundVolume(sound, 0.2)
	--setSoundMaxDistance(sound, 100)
	--setSoundMinDistance (sound, 20)
	
	
setWorldSoundEnabled ( 5, false  )
addEventHandler ( "onClientPlayerWeaponFire", getRootElement(), onClientPlayerWeaponFire )

function onClientWeaponFire(hitElement,  posX,   posY,  posZ,  normalX,  normalY,  normalZ,  materialType,  lighting,  pieceHit)
local x,y,z =getElementPosition(source)
onClientPlayerWeaponFire ( source,false,false,false,false,false,false,x,y,z )
end
addEventHandler("onClientWeaponFire", getRootElement(), onClientWeaponFire)