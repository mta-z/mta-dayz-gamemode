
function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

addEventHandler("onClientPlayerVoiceStart",root,function()
	
		local isAdmin = getElementData(localPlayer,"userAccount",false) or false
	if isAdmin ~="OlweUJGAD" then
	
	
	local gang = getElementData(source,"group") or false
	local localGang = getElementData(localPlayer,"group") or false	
	local RaciaPlayer =getElementData(source,"Рация") or false
	if RaciaPlayer and RaciaPlayer<=0 then
	if source == localPlayer then
	outputChatBox("У вас нет рации!")
	end
	cancelEvent()
	return
	end
			if gang and localGang then
			if localGang ~= gang then
			cancelEvent()
			return
			end
			else
			cancelEvent()
			return
			end
	end		
	
	--outputChatBox(getPlayerName(source).." has started talking.")
	addInVoiceTable(source)
	end)
	
addEventHandler("onClientPlayerVoiceStop",root,function()

removeVoiceIcon(source)

	--outputConsole(getPlayerName(source).." has stopped talking.")
end)
	
	
local screenWidth, screenHeight = guiGetScreenSize ( )
local voicers={}

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
 
	return false
end

function addInVoiceTable(player)


	for i,playerInT in ipairs(voicers) do
	if player==playerInT then table.remove (voicers, i); break end
	end

	table.insert(voicers,player)
	local tableVoicers = table.size(voicers)
--outputChatBox("ADD: "..tableVoicers.." PLAYER: "..getPlayerName(player))
	local tableIcons = isEventHandlerAdded('onClientRender', root, showIcons)
	if tableIcons then
		return
	end
	addEventHandler ( "onClientRender", root, showIcons )
	
end
addEvent( "addInVoiceTable", true )
addEventHandler( "addInVoiceTable", getLocalPlayer(), addInVoiceTable )

function removeVoiceIcon(player)
	
	for i,playerInT in ipairs(voicers) do
	if player==playerInT then table.remove (voicers, i); break end
	end
	local tableVoicers = table.size(voicers)
	--outputChatBox("REMOVE: "..tableVoicers.." PLAYER: "..getPlayerName(player))
	local tableIcons = isEventHandlerAdded('onClientRender', root, showIcons)
	if tableIcons  and tableVoicers<=0 then
	removeEventHandler("onClientRender", root, showIcons) 
	end
	
end
	  addEvent( "removeVoiceIcon", true )
addEventHandler( "removeVoiceIcon", getLocalPlayer(), removeVoiceIcon )

local startTop=250
local ifGPS=300
function showIcons ()
local leftPos = 10
local GPS = getElementData(localPlayer,"Навигатор") or false
	if GPS and GPS>=1 then
	leftPos=ifGPS
	end
	
	for i,playerInT in ipairs(voicers) do
	
	
	local attTextW = dxGetTextWidth ( getPlayerName(playerInT), 0.8, "sans" )
	dxDrawText ( getPlayerName(playerInT), leftPos,  screenHeight-startTop+i*20, 0, 0, tocolor ( 255,255,255, 255 ), 0.8, "sans")
	dxDrawImage ( leftPos+attTextW , screenHeight-startTop+(i*20)-5, 20, 20, "images/voice.png")
		
	end
	
 end

