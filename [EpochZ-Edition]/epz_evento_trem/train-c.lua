
 
 
function playHorn(hornNumber,train)
local x,y,z = getElementPosition(train)
local sound = playSound3D("horn_"..hornNumber..".wav", x,y,z, false) 
setSoundMaxDistance ( sound, 250  ) 
setSoundMinDistance (sound, 200)
setSoundVolume  (  sound, 100)

end 
 addEvent ( "playHorn", true )
addEventHandler ( "playHorn", getRootElement(), playHorn )
 
 
local stopCubOne = createColCuboid ( -1828.1109619141,-1339.693359375,10, 20, 20, 20 )
local stopCubTwo = createColCuboid ( 2775,2000,0, 20, 20, 20 )

function removeTrainOnEnter ( element, matchingDimension )
if getElementType ( element ) == "vehicle" then
if getElementModel(element) ==  537 or getElementModel(element) ==  569 then

triggerServerEvent ("removeTrain", getLocalPlayer(), element,getLocalPlayer())
end
end
end
addEventHandler ( "onClientColShapeHit", stopCubOne, removeTrainOnEnter )
addEventHandler ( "onClientColShapeHit", stopCubTwo, removeTrainOnEnter )
 
 
 
function sync_train ( train,bool )
if bool == "false" then
setElementStreamable ( train, false )
elseif bool == "true" then
setElementStreamable ( train, true )
end
end

addEvent ( "sync_train", true )
addEventHandler ( "sync_train", getRootElement(), sync_train )
 
function sync_col ( col )
setElementStreamable ( col, false )
end 
 addEvent ( "sync_col", true )
addEventHandler ( "sync_col", getRootElement(), sync_col )
 


function setStaticObj ( obj )
setElementFrozen  (  obj, true)
setObjectBreakable  (  obj, false )
end
 
addEvent ( "setStaticObj", true )
addEventHandler ( "setStaticObj", getRootElement(), setStaticObj )
