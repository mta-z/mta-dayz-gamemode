function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end

function table.size(tab)

    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
	
end



local myWindow = guiCreateWindow ( 0, 0, 300, 450, "Luta de arena", false )  
local regTable= guiCreateGridList(10, 25, 290, 300, false, myWindow)
local regColumn= guiGridListAddColumn( regTable, "Participante", 0.7 )
local stavkaColumn= guiGridListAddColumn( regTable, "Avaliar", 0.2 )
local regButton = guiCreateButton( 10, 330, 290, 30, "Aplicar",false,myWindow)
local unregButton = guiCreateButton( 10, 370, 290, 30, "Cancelar o aplicativo",false,myWindow)
guiSetVisible(myWindow, false)
guiSetAlpha(myWindow,0.7)
guiWindowSetSizable ( myWindow, false ) 	
closeWin = guiCreateButton( 10, 410, 290, 30, "Feche uma janela",false,myWindow)
guiSetEnabled(unregButton,false)
centerWindow(myWindow)

local myStavka = guiCreateWindow ( 0, 0, 250, 150, "Apostar", false ) 
local myStavkaEdit = guiCreateEdit ( 10, 30, 230, 30, "2500",false,myStavka )

local myStavkaBtnOk = guiCreateButton( 10, 70, 240, 30, "OK",false,myStavka)
local myStavkaBtnCancel = guiCreateButton( 10, 110, 240, 30, "Cancelar",false,myStavka)
guiSetVisible(myStavka, false)
guiSetAlpha(myStavka,0.7)
guiWindowSetSizable ( myStavka, false )
centerWindow(myStavka)

addEventHandler ( "onClientGUIClick", regButton,function() 
		guiMoveToBack( myWindow )
		guiSetVisible(myStavka, true)
end,false)
 
addEventHandler ( "onClientGUIClick", myStavkaBtnOk,function() 
local editStavka = tonumber(guiGetText(myStavkaEdit))

if  type(editStavka)~="number" then return end
if editStavka<2500 then outputChatBox("Aposta Minima: 2500") return end
editStavka = math.ceil(editStavka)
local playerMoney = getElementData(localPlayer,"Dinheiro") or 0
if playerMoney<editStavka then outputChatBox("Dinheiro insuficiente") guiSetVisible(myStavka, false) return end

		guiSetVisible(myStavka, false)
		triggerServerEvent ("addPlayerInTable", getLocalPlayer(), getLocalPlayer(),editStavka)
		guiSetEnabled(regButton,false)
		guiSetEnabled(unregButton,true)

end,false)

addEventHandler ( "onClientGUIClick", myStavkaBtnCancel,function() 
		guiSetVisible(myStavka, false)
end,false) 
 

addEventHandler ( "onClientGUIClick", unregButton,function() 
	
		triggerServerEvent ("removePlayerInTable", getLocalPlayer())
		guiSetEnabled(regButton,true)
		guiSetEnabled(unregButton,false)
		
end,false)
 
addEventHandler ( "onClientGUIClick", closeWin,function() 
	
		guiSetVisible(myWindow, false)
		showCursor(false)
		
end,false)

function closeWinAll()
guiSetVisible(myWindow, false)
guiSetVisible(myStavka, false)
showCursor(false)
end
addEvent( "closeWinAll", true )
addEventHandler( "closeWinAll", getLocalPlayer(), closeWinAll )

function refreshUserTable(userTable)

	guiGridListClear ( regTable )
	local colStavka = 0
	local colUsch = 0
 	for i, playerData in ipairs(userTable) do
		local row = guiGridListAddRow ( regTable )
		guiGridListSetItemText ( regTable, row, regColumn, getPlayerName(playerData[1]) , false, false )
		guiGridListSetItemText ( regTable, row, stavkaColumn, playerData[2] , false, false )
		colStavka=colStavka+playerData[2]
		colUsch=colUsch+1
	end
	if colUsch>=1 then
	local row = guiGridListAddRow ( regTable )
	guiGridListSetItemText ( regTable, row, regColumn,"Dos participantes: "..colUsch, true, false )
	guiGridListSetItemText ( regTable, row, stavkaColumn,colStavka, true, false )
	end
end
addEvent( "refreshUserTable", true )
addEventHandler( "refreshUserTable", getLocalPlayer(), refreshUserTable )
	
function PlayerInArenaGUI(player)
 local partyArena = getElementData(localPlayer,"partyArena") or false
 if partyArena then
	guiSetEnabled(regButton,false)
	guiSetEnabled(unregButton,true)
 else
	guiSetEnabled(regButton,true)
	guiSetEnabled(unregButton,false)
 end
	guiSetVisible(myWindow, true)
	showCursor(true)
	

end
addEvent( "PlayerInArenaGUI", true )
addEventHandler( "PlayerInArenaGUI", getLocalPlayer(), PlayerInArenaGUI )








