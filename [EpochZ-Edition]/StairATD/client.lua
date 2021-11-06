setElementFrozen(localPlayer,false)
local stairsTable ={
{-2671.2846679688,1305.6523193359,7.0267066955566,17.45,0,0,-90},
{-2539.9477539063,616.98575439453,14.453125,12.85,0,0,-90},
{-2734.8054199219,581.2,15.815433502197,8.55,0,0,-90},
{-2771.3488769531,364,4.4952735900879,4.55,0,0,-90},
{-2468.5859375,-200.2668548584,31.135494232178,14.55,0,0,-90},
{-2310.6672363281,-19.344653701782,35.3203125,10.75,0,0,-90},
{-2301.57421875,-60.237363433838,35.3203125,0.70,0,0,-90},
{-2316.1108398438,-39.2,35.3203125,10.75,0,0,-90},
{-2017.7781982422,-40.630641937256,35.323303222656,6,0,0,-90},
{-2130.6787109375,-38.8,35.328094482422,10.80,0,0,-90},
{-2151.9086914063,-204.26093444824,35.3203125,21.5,0,0,-90},
{-2467.3791503906,-92.40984954834,25.696403503418,11,0,0,-90},
{-2445.9431152344,9.3926448822021,25.6171875,8.5,0,0,-90},
{-2609.0979003906,167.72299499512,4.328125,10.5,0,0,-90},
{-2594.0063476563,399.74577026367,11.917642593384,16,0,0,-90},
{-2593.2927246094,419.4,22.8828125,16.5,0,0,-90},
{-2460.8803710938,501.84863891602,30.074504852295,23.2,0,0,-90},
{-2455.9865722656,507.82186889648,34.169013977051,16,0,0,-90},
{-2280.1169433594,583.63830566406,35.1640625,14,0,0,-90},
{-2280.8488769531,591.76480712891,48.461639404297,16.7,0,0,-90},
{-1867.8723144531,-172.8,9.1325569152832,14.8,0,0,-90},
{-1826.2819824219,-226.3096862793,18.375,14.9,0,0,-90},
{-1477.1500244141,-385.7,7.0750675201416,18.7,0,0,-90},
{-1598.1469726563,318,7.1875,11.8,0,0,-90},
{-1740.15234375,-26.7,3.5546875,14.8,0,0,-90},
{-2217.9104003906,-60.425917053223,35.3203125,3.8,0,0,-90},
{-2203.1030273438,-23.9,54.945953369141,18.6,0,0,-90},
{-2240.0910644531,118.2,35.3203125,4.8,0,0,-90},
{-2239.8681640625,165.3,35.3203125,3.8,0,0,-90},
{-2158.6684570313,218.5,35.3203125,10.5,0,0,-90},
{-2182.3842773438,369.47528076172,35.3203125,2.6,0,0,-90},
{927.40869140625,1662.851171875,8.8515625,20.5,0,0,-90},
{1554.2208251953,923.68493652344,10.8203125,16,0,0,-90},
{1589.8956298828,955.62640380859,10.738121986389,20.5,0,0,-90},
{1589.9183349609,1003.5,10.746829986572,20.7,0,0,-90},
{1709.2496337891,988.77862548828,10.8203125,20.7,0,0,-90},
{1708.5861816406,934.4,10.8203125,20.7,0,0,-90},
{1626.8988037109,890.77122802734,10.705018997192,20.2,0,0,-90},
{1844.2562255859,925.95651855469,10.8203125,21.6,0,0,-90},
{2015.6491699219,911.81518554688,10.8203125,21.6,0,0,-90},
{2272.8479003906,943.859375,10.8203125,21.6,0,0,-90},
{2580.6057128906,1150.7592529297,10.8203125,16.5,0,0,-90},
{2503.2993164063,2350.6882324219,10.8203125,16.5,0,0,-90},
{2540.2741699219,2803.3,10.8203125,10.3,0,0,-90},
{2678.6840820313,2730.3,10.8203125,19.1,0,0,-90},
{2714.0568847656,2806.3,10.8203125,1.9,0,0,-90},
{2235.0727539063,2524.5627441406,10.8203125,18.5,0,0,-90},
{1094.6060791016,2076.2,10.8203125,18.2,0,0,-90},
{925.44610595703,2052.7712402344,10.8203125,16.6,0,0,-90},
{2512.8735351563,1388.9321289063,10.90625,16.6,0,0,-90},
{2589.5104980469,1399.7401123047,11.066600799561,17,0,0,-90},
{2344.140625,2248.638671875,10.8203125,10.7,0,0,-90},
{2087.2746582031,2348.7336425781,11.234476089478,10.7,0,0,-90},
{872.93597412109,-1280.9,14.378648757935,21.7,0,0,-90},
{857.92071533203,-1267.2952880859,14.746156692505,17.7,0,0,-90},
{964.20452880859,-1250.8,16.977645874023,17,0,0,-90},
{1549.5705566406,-1714.4564453125,13.546875,12.5,0,0,-90},
{1804.9991455078,-2230.5,13.544971466064,17.3,0,0,-90},
{1779.1030273438,-2368.1853027344,13.546875,17.3,0,0,-90},
{2017.3100585938,-2404.0583496094,13.546875,18.3,0,0,-90},
{2502.4719238281,-1922.1872558594,13.546875,15.4,0,0,-90},
{2560.6499023438,-1365.3692626953,33.16926574707,5.2,0,0,-90},
{2777.1730957031,-1593.1966308594,13.470042228699,11.4,0,0,-90},
{2759.9338378906,-1561.3765869141,21.97286605835,12.9,0,0,-90},
{2178.408203125,-1337.9,23.984375,22.6,0,0,-90},
{1807.0231933594,-1419.1081542969,13.578266143799,11.7,0,0,-90},
{1106.4357910156,-1310.4287109375,13.651542663574,19.5,0,0,-90}

}

function createStairs()
engineSetModelLODDistance ( 16154, 300 )

for theKey,thePlayer in ipairs(stairsTable) do


local lest = createObject(16154,thePlayer[1],thePlayer[2],thePlayer[3]-thePlayer[4],thePlayer[5],thePlayer[6],thePlayer[7])





local lx,ly,lz = getElementPosition(lest)

local StairCub1 = createColCuboid ( lx-0.5,ly-1,lz+thePlayer[4]-1, 1, 1, 1.5 )


local StairCub2 = createColCuboid ( lx-0.5,ly-1,lz+25.5, 1, 1, 1 )

setElementData(StairCub1,"stair1",true)
setElementData(StairCub2,"stair2",true)
setElementData(StairCub1,"lestObj",lest)
setElementData(StairCub2,"lestObj",lest)

end

end
 createStairs()

 local KEYW = false
 local KEYS = false
 
 setElementData(localPlayer,"onStair",false,false)
 setElementData(localPlayer,"onStairKey",false,false)
 
 
 
 function playerKillOnStair ( killer, weapon, bodypart )
 local onStair = getElementData(source,"onStair",false)
	if onStair then
	triggerServerEvent("setStairAnima",getLocalPlayer(),2,getLocalPlayer())
setElementData(localPlayer,"onStair",false,false)

removeEventHandler("onClientKey", root, playerPressedKey)
setElementData(localPlayer,"onStairKey",false,false)
 	if   isTimer(KEYW) then
	killTimer(KEYW)
	end
	if   isTimer(KEYS) then
	killTimer(KEYS)
	end
end
	end

addEventHandler ( "onClientPlayerWasted", getLocalPlayer(), playerKillOnStair )


function HitStair( theElement, matchingDimension )
if theElement == getLocalPlayer() then
if getPedOccupiedVehicle(theElement) then
return
end

local isStair1 = getElementData(source,"stair1",false)
local isStair2 = getElementData(source,"stair2",false)

if isStair1 then
local onStair = getElementData(localPlayer,"onStair",false)
if not onStair then
--outputChatBox("вошел в лестницу снизу")
setElementFrozen(localPlayer,true)
--setPedAnimation ( localPlayer, "ped", "FIGHTIDLE", -1, true, true, false, false )
triggerServerEvent("setStairAnima",getLocalPlayer(),1,getLocalPlayer())
local px,py,pz = getElementPosition(localPlayer)
local cx,cy,cz = getElementPosition(source)
setElementPosition(localPlayer,cx+0.5,cy+0.25,pz+0.7,false)
setElementData(localPlayer,"onStair",true,false)

local px,py,pz = getElementPosition(localPlayer)
local cx,cy,cz = getElementPosition(getElementData(source,"lestObj",false))

local angle = ( 360 - math.deg ( math.atan2 ( ( cx - px ), ( cy - py ) ) ) ) % 360 
setElementRotation( localPlayer,0,0, angle,"default",true)
--outputChatBox(angle)

local onStairKey = getElementData(localPlayer,"onStairKey",false)
if not onStairKey then
addEventHandler("onClientKey", root, playerPressedKey)
setElementData(localPlayer,"onStairKey",true,false)
end

else
--outputChatBox("вышел с лестницы снизу")
setElementFrozen(localPlayer,false)
--setPedAnimation ( localPlayer )
triggerServerEvent("setStairAnima",getLocalPlayer(),2,getLocalPlayer())
setElementData(localPlayer,"onStair",false,false)

removeEventHandler("onClientKey", root, playerPressedKey)
setElementData(localPlayer,"onStairKey",false,false)
 	if   isTimer(KEYW) then
	killTimer(KEYW)
	end
	if   isTimer(KEYS) then
	killTimer(KEYS)
	end
end


elseif isStair2 then 
local onStair = getElementData(localPlayer,"onStair",false)
if not onStair then
--outputChatBox("вошел в лестницу снизу")
setElementFrozen(localPlayer,true)
--setPedAnimation ( localPlayer, "ped", "FIGHTIDLE", -1, true, true, false, false )
triggerServerEvent("setStairAnima",getLocalPlayer(),1,getLocalPlayer())
local px,py,pz = getElementPosition(localPlayer)
local cx,cy,cz = getElementPosition(source)
setElementPosition(localPlayer,cx+0.5,cy+0.25,pz-0.7,false)
setElementData(localPlayer,"onStair",true,false)
local px,py,pz = getElementPosition(localPlayer)
local cx,cy,cz = getElementPosition(getElementData(source,"lestObj",false))

local angle = ( 360 - math.deg ( math.atan2 ( ( cx - px ), ( cy - py ) ) ) ) % 360 
setElementRotation( localPlayer,0,0, angle,"default",true)
--outputChatBox(angle)

local onStairKey = getElementData(localPlayer,"onStairKey",false)
if not onStairKey then
addEventHandler("onClientKey", root, playerPressedKey)
setElementData(localPlayer,"onStairKey",true,false)
end


end


end




end
end

addEventHandler("onClientColShapeHit",getRootElement(),HitStair)






function LeaveStair( theElement, matchingDimension )
if theElement == getLocalPlayer() then
local isStair2 = getElementData(source,"stair2",false)
if isStair2 then
if getKeyState("w") then
setElementData(localPlayer,"onStair",false,false)

removeEventHandler("onClientKey", root, playerPressedKey)
setElementData(localPlayer,"onStairKey",false,false)
 	if   isTimer(KEYW) then
	killTimer(KEYW)
	end
	if   isTimer(KEYS) then
	killTimer(KEYS)
	end

	
	setPedAnimation ( localPlayer, "ped", "CLIMB_Stand", -1, false, false, false, false )
	setTimer(function()
	setElementFrozen(localPlayer,false)
	triggerServerEvent("setStairAnima",getLocalPlayer(),2,getLocalPlayer())
	local px,py,pz = getElementPosition(localPlayer)
setElementPosition(localPlayer,px,py+1,pz+0.5,false)
	end,1000,1)
end
end 

end
end

addEventHandler("onClientColShapeLeave",getRootElement(),LeaveStair)

-- ped>CLIMB_Pull
--ped>CLIMB_Pull
--CLIMB_Stand
--CLIMB_jump_B

--up>FightSh_FWD
--down>FightSh_BWD
--FightShF
--FIGHTIDLE





KEYWfunc = function() 
local px,py,pz = getElementPosition(localPlayer)
      if getKeyState("lshift") then 
setElementPosition(localPlayer,px,py,pz+0.15,false)
else
setElementPosition(localPlayer,px,py,pz+0.1,false)
end

end
KEYSfunc = function() 
local px,py,pz = getElementPosition(localPlayer)
      if getKeyState("lshift") then 
setElementPosition(localPlayer,px,py,pz-0.15,false)
else
setElementPosition(localPlayer,px,py,pz-0.1,false)
end
end

function playerPressedKey(button, press)

local onStair = getElementData(localPlayer,"onStair",false)
if onStair then
    if button =="w" and press then 
        
	if  not isTimer(KEYW) then
	setPedAnimation ( localPlayer, "ped", "FightShF", -1, true, true, false, false )
	KEYW = setTimer(KEYWfunc,50,0)

	end
		
	elseif button =="w" and not press then 

       	if   isTimer(KEYW) then
		setPedAnimation ( localPlayer, "ped", "FIGHTIDLE", -1, true, true, false, false )
	killTimer(KEYW)

	end
	elseif button =="s" and press then 
        
	if  not isTimer(KEYS) then
	setPedAnimation ( localPlayer, "ped", "FightShF", -1, true, true, false, false )
	KEYS = setTimer(KEYSfunc,50,0)

	end
		
	elseif button =="s" and not press then 
       	if   isTimer(KEYS) then
		setPedAnimation ( localPlayer, "ped", "FIGHTIDLE", -1, true, true, false, false )
	killTimer(KEYS)

	end

	else
	cancelEvent()
    
    end
	
	    
	end
end
