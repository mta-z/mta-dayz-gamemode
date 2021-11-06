
local debugLable= false
statsWindows =false
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
    function ( startedRes )
        local screenWidth, screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
statsWindows = guiCreateStaticImage(0,0,screenWidth,15,"images/headerScore.png",false)

debugLable = guiCreateLabel(0,0,screenWidth,15,"Pilhagem: 0/0 | Morto por zumbis: 0/0 | Carma: -0 | Sangue: 0 | Comida: 0% | Água: 0%",false,statsWindows)

guiSetVisible(statsWindows,false)
    end
,false);


function closeDebugMonitor ()
	guiSetVisible(statsWindows,false)
end
addEvent("closeDebugMonitor",true)
addEventHandler("closeDebugMonitor",localPlayer,closeDebugMonitor)
function openDebugMonitor ()
	guiSetVisible(statsWindows,true)
end
addEvent("openDebugMonitor",true)
addEventHandler("openDebugMonitor",localPlayer,openDebugMonitor)

function refreshDebugMonitor()
if getElementData(localPlayer,"logedin") then

local mvalue = getElementData(localPlayer,"murders",false) or 0
local mvalueMax = getElementData(localPlayer,"stat.murders",false) or 0
local zvalue = getElementData(localPlayer,"zombieskilled") or 0
local zvalueMax = getElementData(localPlayer,"stat.zombieskilled") or 0 
local hvalue = getElementData(localPlayer,"humanity",false) or 0
local bvalue = getElementData(localPlayer,"blood",false) or 0
local progressMedik = getElementData(localPlayer,"progress.medik") or 0 
local progressBoec = getElementData(localPlayer,"progress.boec") or 0
local bvalueMax = (12000+((progressMedik*60)+(progressBoec*20)))
local fvalue = getElementData(localPlayer,"food",false) or 0
local tvalue = getElementData(localPlayer,"thirst",false) or 0

guiSetText(debugLable,"Pilhagem: "..math.floor(mvalue).."/"..math.floor(mvalueMax).." | zumbis Mortos : "..math.floor(zvalue).."/"..math.floor(zvalueMax).." | Carma: "..math.floor(hvalue).." | Sangue: "..math.floor(bvalue).."/"..math.floor(bvalueMax).." | Comida: "..math.floor(fvalue).."% | Água: "..math.floor(tvalue).."%" ) 			
			
end			
end
setTimer(refreshDebugMonitor,2000,0)