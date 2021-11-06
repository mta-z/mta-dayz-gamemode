
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
    function ( startedRes )
local g,v = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
local pointW,pointH = 1/4,0.5

 spawnerBG = guiCreateStaticImage(0,0,1,1,"hudComponent/spawner/img/pixel.png", true)
 guiCreateStaticImage(0.5-0.1,0.05,0.2,0.2,"hudComponent/spawner/img/DeadText.png", true,spawnerBG)
pointsBg = guiCreateStaticImage(0,1-0.4,1,0.4,"hudComponent/spawner/img/b50.png", true,spawnerBG)

local LS = guiCreateStaticImage(0.05,0.22,pointW,pointH,"hudComponent/spawner/img/LS.png", true,pointsBg)
guiSetAlpha ( LS, 0.5 )




----- LS POINT -----
local LSpoint  = guiCreateStaticImage(0.05+pointW/2-0.1,0.05,0.2,0.15,"hudComponent/spawner/img/LSpoint.png", true,pointsBg)
guiSetAlpha ( LSpoint, 0.5 )
addEventHandler( "onClientMouseEnter", LSpoint, function()
guiStaticImageLoadImage  (  LS, "hudComponent/spawner/img/LS.png" ) 
guiSetAlpha ( LS, 1 )
guiSetAlpha ( LSpoint, 1 )
 end,false)
 
 
addEventHandler(  "onClientMouseLeave", LSpoint, function() 
guiSetAlpha ( LS, 0.5 )
guiSetAlpha ( LSpoint, 0.5 )
 end,false)
 
 addEventHandler( "onClientGUIClick", LSpoint, function() 
hideSpawner()
triggerServerEvent("spawnEpochZPlayer",getLocalPlayer(),getLocalPlayer(),1,false)
 end,false)
 
----- LS POINT -----

 
-------LS T POINT ------
local LStpoint  = guiCreateStaticImage(0.05+pointW/2-0.1,0.8,0.2,0.15,"hudComponent/spawner/img/Tpoint.png", true,pointsBg)
guiSetAlpha ( LStpoint, 0.5 )
addEventHandler( "onClientMouseEnter", LStpoint, function()
guiStaticImageLoadImage  (  LS, "hudComponent/spawner/img/LSt.png" ) 
guiSetAlpha ( LS, 1 )
guiSetAlpha ( LStpoint, 1 )
 end,false)
 
 
addEventHandler(  "onClientMouseLeave", LStpoint, function() 
guiStaticImageLoadImage  (  LS, "hudComponent/spawner/img/LS.png" ) 
guiSetAlpha ( LS, 0.5 )
guiSetAlpha ( LStpoint, 0.5 )
 end,false)

addEventHandler( "onClientGUIClick", LStpoint, function() 
hideSpawner()
triggerServerEvent("spawnEpochZPlayer",getLocalPlayer(),getLocalPlayer(),2,false)
 end,false)
 -------LS T POINT ------
 



local SF = guiCreateStaticImage(0.5-pointW/2,0.22,pointW,pointH,"hudComponent/spawner/img/SF.png", true,pointsBg)
guiSetAlpha ( SF, 0.5 )
 -------SF POINT ------

local SFpoint  = guiCreateStaticImage(0.5-0.1,0.05,0.2,0.15,"hudComponent/spawner/img/SFpoint.png", true,pointsBg)
guiSetAlpha ( SFpoint, 0.5 )
addEventHandler( "onClientMouseEnter", SFpoint, function()
guiStaticImageLoadImage  (  SF, "hudComponent/spawner/img/SF.png" ) 
guiSetAlpha ( SF, 1 )
guiSetAlpha ( SFpoint, 1 )
 end,false)
 
 
addEventHandler(  "onClientMouseLeave", SFpoint, function() 
guiStaticImageLoadImage  (  SF, "hudComponent/spawner/img/SF.png" ) 
guiSetAlpha ( SF, 0.5 )
guiSetAlpha ( SFpoint, 0.5 )
 end,false)
 
addEventHandler( "onClientGUIClick", SFpoint, function() 
hideSpawner()
triggerServerEvent("spawnEpochZPlayer",getLocalPlayer(),getLocalPlayer(),5,false)
 end,false)
  -------SF POINT ------
  
  
   -------SF T POINT ------
local SFtpoint  = guiCreateStaticImage(0.5-0.1,0.8,0.2,0.15,"hudComponent/spawner/img/Tpoint.png", true,pointsBg)
guiSetAlpha ( SFtpoint, 0.5 )
addEventHandler( "onClientMouseEnter", SFtpoint, function()
guiStaticImageLoadImage  (  SF, "hudComponent/spawner/img/SFt.png" ) 
guiSetAlpha ( SF, 1 )
guiSetAlpha ( SFtpoint, 1 )
 end,false)
 
 
addEventHandler(  "onClientMouseLeave", SFtpoint, function() 
guiStaticImageLoadImage  (  SF, "hudComponent/spawner/img/SF.png" ) 
guiSetAlpha ( SF, 0.5 )
guiSetAlpha ( SFtpoint, 0.5 )
 end,false)
 
addEventHandler( "onClientGUIClick", SFtpoint, function() 
hideSpawner()
triggerServerEvent("spawnEpochZPlayer",getLocalPlayer(),getLocalPlayer(),6,false)
 end,false)
  -------SF T POINT ------



local LV = guiCreateStaticImage(0.95-pointW,0.22,pointW,pointH,"hudComponent/spawner/img/LV.png", true,pointsBg)
guiSetAlpha ( LV, 0.5 )

  -------LV POINT ------
local LVpoint  = guiCreateStaticImage(0.95-pointW+(pointW/2-0.1),0.05,0.2,0.15,"hudComponent/spawner/img/LVpoint.png", true,pointsBg)
guiSetAlpha ( LVpoint, 0.5 )
addEventHandler( "onClientMouseEnter", LVpoint, function()
guiStaticImageLoadImage  (  LV, "hudComponent/spawner/img/LV.png" ) 
guiSetAlpha ( LV, 1 )
guiSetAlpha ( LVpoint, 1 )
 end,false)
 
 
addEventHandler(  "onClientMouseLeave", LVpoint, function() 
guiStaticImageLoadImage  (  LV, "hudComponent/spawner/img/LV.png" ) 
guiSetAlpha ( LV, 0.5 )
guiSetAlpha ( LVpoint, 0.5 )
 end,false)
 
addEventHandler( "onClientGUIClick", LVpoint, function() 
hideSpawner()
triggerServerEvent("spawnEpochZPlayer",getLocalPlayer(),getLocalPlayer(),3,false)
 end,false)
  -------LV POINT ------

 -------LV T POINT ------
local LVtpoint  = guiCreateStaticImage(0.95-pointW+(pointW/2-0.1),0.8,0.2,0.15,"hudComponent/spawner/img/Tpoint.png", true,pointsBg)
guiSetAlpha ( LVtpoint, 0.5 )
addEventHandler( "onClientMouseEnter", LVtpoint, function()
guiStaticImageLoadImage  (  LV, "hudComponent/spawner/img/LVt.png" ) 
guiSetAlpha ( LV, 1 )
guiSetAlpha ( LVtpoint, 1 )
 end,false)
 
 
addEventHandler(  "onClientMouseLeave", LVtpoint, function() 
guiStaticImageLoadImage  (  LV, "hudComponent/spawner/img/LV.png" ) 
guiSetAlpha ( LV, 0.5 )
guiSetAlpha ( LVtpoint, 0.5 )
 end,false)

addEventHandler( "onClientGUIClick", LVtpoint, function() 
hideSpawner()
triggerServerEvent("spawnEpochZPlayer",getLocalPlayer(),getLocalPlayer(),4,false)
 end,false)
  -------LV T POINT ------



guiSetVisible(spawnerBG,false)

end)










local x,y,z =false,false,false
local kKiller = false
local startZ = false
local stopZ = false
local lx,ly,lz = false,false,false
function renderDeadCamera()
if z<stopZ then
z=z+0.5
end
--outputDebugString(tostring(kKiller))
if kKiller then
lx,ly,lz = getElementPosition(kKiller)
else
lx,ly,lz = x,y,startZ
end

--outputDebugString("startZ: "..startZ.." lz: "..lz)
setCameraMatrix ( x,y,z, lx,ly,lz )

if z >= stopZ then
guiSetVisible(spawnerBG,true)

end
end

function hideSpawner()
removeEventHandler ( "onClientRender", getRootElement(),renderDeadCamera  )
showCursor (  false )
showChat ( true )

guiSetVisible(spawnerBG,false)

end


function showSpawner(xz,yz,zz,killer)
if killer then
kKiller = killer
else
kKiller = false
end
triggerEvent("closeDebugMonitor",getLocalPlayer())
showCursor (  true )
showChat ( false )

if xz and yz and zz then
x,y,z = xz,yz,zz
startZ =z
stopZ= z+30
addEventHandler ( "onClientRender", getRootElement(),renderDeadCamera  )
else
guiSetVisible(spawnerBG,true)

end
	

end


addEvent("showSpawner",true)
addEventHandler("showSpawner",getLocalPlayer(),showSpawner)







