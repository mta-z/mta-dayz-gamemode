local myMarker = createMarker(2279.7998046875, -2470.3994140625, -4.4000000953674, 'ring', 2, 255, 0, 0,0) -- create myMarker
 
function MarkerHit(thePlayer) 

local id = getElementModel ( thePlayer )
	spawnPlayer (thePlayer, 2264.4055175781,-2473.599609375,0.46000003814697, math.random(0,360), id, 0, 0)
	fadeCamera (thePlayer, true)
	setCameraTarget (thePlayer, thePlayer)

end
addEventHandler( "onMarkerHit", myMarker, MarkerHit ) 


 

local myMarker1 = createMarker(2236.8000488281, -2423.3999023438, -19.60000038147, 'cylinder', 1, 255, 0, 0,0) -- create myMarker
 
function MarkerHit1(thePlayer) 
local id = getElementModel ( thePlayer )
	spawnPlayer (thePlayer, 2208.1787109375,-2398.5993652344,13.546875, math.random(0,360), id, 0, 0)
	fadeCamera (thePlayer, true)
	setCameraTarget (thePlayer, thePlayer)

end
addEventHandler( "onMarkerHit", myMarker1, MarkerHit1 ) 

