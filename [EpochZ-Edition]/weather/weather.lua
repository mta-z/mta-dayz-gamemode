

function setNight (hour,minutes)

setTime ( hour, minutes )
if hour >= 22  and hour < 23 then


if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(500-5*minutes)
		setFogDistance(300-3.33333*minutes)
end


elseif hour >= 23 and hour < 24  then

if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(200)
		setFogDistance(100)		
end	
elseif  hour < 5  then

if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(200)
		setFogDistance(100)		
end	

elseif hour >= 5 and hour < 6  then

if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(200+5*minutes)
		setFogDistance(100+6.669*minutes)		
end
	
	elseif hour >= 6 and hour < 22  then


if getCameraGoggleEffect() ~= "nightvision" and getCameraGoggleEffect() ~= "thermalvision" then
		setFarClipDistance(500)
		setFogDistance(300)
			
end
		
end
end


mh = 12
mn= 00
function testNight()

--setSkyGradient( 60, 100, 196, 136, 170, 212 )
if mn<60 then
mn=mn+1
else
mn =0
if mh<23 then
--mh=mh+1
else
mh =0
end
end
local s1r,s1g,s1b,s2r,s2g,s2b = getSkyGradient  (  )
setTime(mh,mn)
setNight(mh,mn)
--outputChatBox("weather:"..getWeather().." time:"..mh..":"..mn.."------"..s1r..","..s1g..","..s1b..","..s2r..","..s2g..","..s2b)

end
--testNight()
--setTimer(testNight,50,0)


function setNightTime()
if getElementData(getLocalPlayer(),"aimed") then
return
end

local hour, minutes =getTime()
setNight (hour,minutes)
end
setTimer(setNightTime,60000,0)
setNightTime()
addEvent("setNightTime",true)
addEventHandler("setNightTime",getRootElement(),setNightTime)