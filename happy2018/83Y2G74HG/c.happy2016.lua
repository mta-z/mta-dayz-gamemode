
local ePosition={
{1637.7099609375,1573.2666015625,10.8203125,0,0,-90},
{652.9365234375,-592.4912109375,16.3111743927,0,0,90},
{-1538.0751953125,-409.078125,7.078125,0,0,90}
}
function ceelca()
local x,y,z=getElementPosition(localPlayer)

for id, pos in ipairs(ePosition) do
local sound = playSound3D("83Y2G74HG/54f6ec9e26bd89.mp3", pos[1],pos[2],pos[3], true) 
setSoundMaxDistance ( sound, 120 )
createObject ( 14607, pos[1],pos[2],pos[3],pos[4],pos[5],pos[6] )
local elcaCol = createColSphere ( pos[1],pos[2],pos[3], 5 )
setElementData(elcaCol,"elca",true)
addEventHandler("onClientColShapeHit",elcaCol,onClientColShapeHit)
addEventHandler("onClientColShapeLeave",elcaCol,onClientColShapeLeave)
end
end




function onClientColShapeHit( theElement, matchingDimension )
    if ( theElement == getLocalPlayer() ) then  
        outputChatBox( "Digite /2022 no bate-papo para receber um presente" )
		setElementData(localPlayer,"InElca",true,false)
    end
end



function onClientColShapeLeave( theElement, matchingDimension )
    if ( theElement == getLocalPlayer() ) then 
		setElementData(localPlayer,"InElca",false,false)
    end
end





function getGift()
local inElca=getElementData(localPlayer,"InElca") or false
if inElca then
triggerServerEvent("checkSerial", getLocalPlayer(), getLocalPlayer())
end
end

addCommandHandler ( "2022", getGift )



function replaceModel() 

local tablePalm = {
{14607,"sss.txd","sss.dff","juwhfegwenj"}
}




for _, id in ipairs ( tablePalm ) do
		txd = engineLoadTXD ( "83Y2G74HG/"..id[2] )
        engineImportTXD ( txd, id[1] )
        
        dff = engineLoadDFF ( "83Y2G74HG/"..id[3] )
        engineReplaceModel ( dff, id[1] )
		
		itemCOL = engineLoadCOL ( "83Y2G74HG/"..id[4] )
		engineReplaceCOL ( itemCOL, id[1] )
		
		engineSetModelLODDistance(id[1], 100)
	end 	
	engineSetAsynchronousLoading ( true, true )
setOcclusionsEnabled(false)
ceelca()
		end
		addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)