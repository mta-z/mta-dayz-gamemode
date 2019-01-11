
 -- сасай кароч если ты это присвоил себе))0) 
local W,H = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
if W<=1024 and H<=768 then
outputChatBox("Маленькое разрешение экрана! Для комфортной игры попробуйте изменить его в: Меню игры>Settings>Video>Resolution")
end

 fading = 0 
fading2 = "up"

 function InVH()
         local theVehicle = getPedOccupiedVehicle ( localPlayer )
        if ( theVehicle ) then
        local spx, spy, spz = getElementVelocity( theVehicle )  
		local idVH = getElementModel(theVehicle)
        local kphSpeed = ( spx^2 + spy^2 + spz^2 ) ^ 0.5 * 1.61 * 100
        local mphSpeed = ( spx^2 + spy^2 + spz^2 ) ^ 0.5 * 100
		local posinWorldX,posinWorldY,posinWorldZ = getElementPosition(theVehicle)
		local maxfuel = getElementData(theVehicle,"maxfuel")
		local fuel = getElementData(getElementData(theVehicle,"parent"),"fuel")
		local needengine = getElementData(theVehicle,"needengines")
		local needtires = getElementData(theVehicle,"needtires")
		local engine = getElementData(getElementData(theVehicle,"parent"),"Мотор_inVehicle") or 0
		local tires = getElementData(getElementData(theVehicle,"parent"),"Колесо_inVehicle") or 0
		local steelList= getElementData(theVehicle,"steelList") or 0
		local VH = ( getElementHealth( theVehicle ) )
           
	if fading >= 0 and fading2 == "up" then
		fading = fading + 5
	elseif fading <= 255 and fading2 == "down" then
		fading = fading - 5
	end
	if fading == 0 then
		fading2 = "up"
	elseif fading == 255 then
		fading2 = "down"
	end
	 
 dxDrawImage ( 10, 200, 15, 150, "images/vehHud/hudFuell1.png", 0,0,0, tocolor(255,255,255) )

if fuel >= maxfuel/1.1 then
		r,g,b = 91,170,48
	elseif fuel >= maxfuel/1.25 then
		r,g,b = 130,170,48
	elseif fuel >= maxfuel/1.42 then
		r,g,b = 170,170,0
	elseif fuel >= maxfuel/1.65 then 
		r,g,b = 170,150,0
	elseif fuel >= maxfuel/2 then
		r,g,b = 170,100,0
	elseif fuel >= maxfuel/2.5 then
		r,g,b = 170,60,0
	elseif fuel >= maxfuel/3.3 then
		r,g,b = 200,40,0
	elseif fuel <= maxfuel/5 then
		r,g,b = 200,0,0
	elseif fuel <= maxfuel/10 then
			r,g,b = 255,0,0
			
end


local seat0 = getVehicleOccupant ( theVehicle )
local armorTS= getElementData(seat0,"SKILL_ARMORTS") or false

if steelList >=1 then
local yellow= 0
if armorTS and armorTS>=1 then
yellow= 255
else
yellow=0
end
dxDrawImage ( 25, 220+128-steelList*128/1000, 2, steelList*128/1000, "images/vehHud/hudFuellPolosa.png", 0,0,0, tocolor(255,yellow,0) )
end



if fuel>0 then
if fuel <= maxfuel/10 then		
  dxDrawImage ( 12.5, 220+128-fuel*128/maxfuel, 10, fuel*128/maxfuel, "images/vehHud/hudFuellPolosa.png", 0,0,0, tocolor(r,g,b,fading) )
 else
  dxDrawImage ( 12.5, 220+128-fuel*128/maxfuel, 10, fuel*128/maxfuel, "images/vehHud/hudFuellPolosa.png", 0,0,0, tocolor(r,g,b) )
 end
 end
 
 if engine==needengine then
  dxDrawImage ( 30, 210, 40, 20, "images/vehHud/hudWin1.png", 0,0,0, tocolor(91,170,48) )
 else
dxDrawImage ( 30, 210, 40, 20, "images/vehHud/hudWin1.png", 0,0,0, tocolor(255,0,0,fading) )
 end
 
		 if tires ==needtires then
		r,g,b = 91,170,48
			elseif tires == 0  then
			r,g,b = 255,0,0
			elseif tires <needtires/2 then
		r,g,b = 200,20,0	
			elseif tires <= needtires/2 then
		r,g,b = 200,60,0
	elseif tires < needtires/1.3  then
		r,g,b = 170,120,0


end

  if tires< needtires then
 dxDrawImage ( 30, 235, 40, 20, "images/vehHud/hudWin2.png", 0,0,0, tocolor(r,g,b,fading) )
 else
 dxDrawImage ( 30, 235, 40, 20, "images/vehHud/hudWin2.png", 0,0,0, tocolor(r,g,b) )
 end
 
 if VH >= 900 then
		r,g,b = 91,170,48
	elseif VH >=850 then
		r,g,b = 130,170,48
	elseif VH >=750 then
		r,g,b = 170,170,0
	elseif VH >= 650 then 
		r,g,b = 170,150,0
	elseif VH >= 550 then
		r,g,b = 170,100,0
	elseif VH >= 450 then
		r,g,b = 170,60,0
	elseif VH >= 350 then
		r,g,b = 200,40,0
	elseif VH >= 250 then
		r,g,b = 200,0,0
	elseif VH >= 150 then
			r,g,b = 255,0,0
end

 
 if VH<= 400 then
 dxDrawImage ( 30, 260, 40, 20, "images/vehHud/hudWin3.png", 0,0,0, tocolor(r,g,b,fading) )
 else
 dxDrawImage ( 30, 260, 40, 20, "images/vehHud/hudWin3.png", 0,0,0, tocolor(r,g,b) )
 end
 
 dxDrawText ( "SPD: "..math.floor(kphSpeed), 32, 285 ,0,0,tocolor ( 91,170,48 ),1.02, "default-bold" )
	 if idVH == 417 or idVH ==425 or idVH ==447 or idVH ==460 or idVH ==469 or idVH ==476 or idVH ==487 or idVH ==488 or idVH ==497 or idVH ==511 or idVH ==512 or idVH ==513 or idVH ==519 or idVH ==520 or idVH ==548 or idVH ==553 or idVH ==563 or idVH ==577 or idVH ==592 or idVH ==593 then
	 dxDrawText ( "ALT: "..math.floor(posinWorldZ), 32, 300 ,0,0,tocolor ( 91,170,48 ),1.02, "default-bold" )
	 end
	 
	 
	 
   end
 
 end


 
addEventHandler( "onClientRender", getRootElement(),InVH)

