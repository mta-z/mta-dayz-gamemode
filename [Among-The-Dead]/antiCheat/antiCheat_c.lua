function checkCheat()
--outputChatBox("checkCheats")
if getElementData(getLocalPlayer(),"logedin") then
local colEnabl = getElementCollisionsEnabled (getLocalPlayer())
local gravlvl = getGravity ()
if gravlvl>0.009 or not colEnabl then
--outputChatBox(tostring(gravlvl))
--outputChatBox(tostring(colEnabl))
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"grav>0.009 or not colEnabl",0)
end

local curSLOTS= getElementData(getLocalPlayer(),"current_SLOTS",false) or false
local MAXSlots=getElementData(getLocalPlayer(),"MAX_Slots",false) or false 
if curSLOTS and curSLOTS>=1000 then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"curSLOTS>1000",1)
end
if MAXSlots and MAXSlots>=1000 then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"MAXSlots>1000",2)
end
local blood= getElementData(getLocalPlayer(),"blood",false) or false
if blood and blood>=25000 then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"blood>=25000",3)
end
if blood and blood<-125000 then
local isDead = getElementData(getLocalPlayer(),"isDead") or false
if isDead then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"blood<-125000",3)
end
end
local Grenade= getElementData(getLocalPlayer(),"Grenade",false) or false
if Grenade and Grenade>=1 then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"Grenade>=1",4)
end
local GPS= getElementData(getLocalPlayer(),"GPS",false) or false
if GPS and GPS>=1 then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"GPS>=1",5)
end

if (isWorldSpecialPropertyEnabled( "extrajump" ) or isWorldSpecialPropertyEnabled( "hovercars" ) or isWorldSpecialPropertyEnabled( "aircars" ) or isWorldSpecialPropertyEnabled( "extrabunny" )) then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"SpecialPropertyEnabled",6)
end

 local blips = getElementsByType("blip")
    for index, blip in ipairs(blips) do
       local r,g,b = getBlipColor ( blip )
	   if r==255 and g ==20 and b==20 then
	   triggerServerEvent ( "cheaterBan", getLocalPlayer(),"blip rgb==255,20,20",7)
	   end
	   local bIcon = getBlipIcon (blip)
	   --outputChatBox(bIcon)
	   if bIcon==55 or bIcon==48 or bIcon == 7 then
	   triggerServerEvent ( "cheaterBan", getLocalPlayer(),"blip icon == 55 or 48 or 7",8)
	   end
    end
	
end
end
setTimer(checkCheat,1000,0)


function commandBan(command,agr1,agr2,agr3,agr4,agr5)
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"find command",9)
end

addCommandHandler("pojazd", commandBan)
addCommandHandler("Teleport Na Polnoc", commandBan)
addCommandHandler("Teleport Na Zachod", commandBan)
addCommandHandler("Teleport Na Wschod", commandBan)
addCommandHandler("Teleport Na Poludnie", commandBan)
addCommandHandler("Teleport W Gore", commandBan)
addCommandHandler("Teleport W Dol", commandBan)
addCommandHandler("Napraw Pojazd", commandBan)


function checkTimeCheat(hour,min)
local hourPlayer, minPlayer = getTime() -- playerTime
--outputChatBox("playerTime:"..hourPlayer..":"..minPlayer)
--outputChatBox("serverTime:"..hour..":"..min)
if minPlayer~=59 and minPlayer~=58 then
if hourPlayer~=hour then
triggerServerEvent ( "cheaterBan", getLocalPlayer(),"playerTime:"..hourPlayer..":"..minPlayer.." serverTime:"..hour..":"..min,10) 
end
end
end
addEvent( "checkTimeCheat", true )
addEventHandler( "checkTimeCheat", resourceRoot, checkTimeCheat )


