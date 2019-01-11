
--INVENTORY
local headlineExchange = {}
local gridlistItemsExchange = {}
local buttonItemsExchange = {}


local exchangeWindows =guiCreateStaticImage ( 0.15, 0.28, 0.7, 0.8,  "images/scrollmenu_1.png",true )

--inventoryWindows = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true) 

-- inventoryWindows = guiCreateStaticImage(0.25,0.25,0.5,0.5,"images/scrollmenu_1.png",true)
guiSetAlpha(exchangeWindows,0.7)

headlineExchange["loot"] = guiCreateLabel(0.06, 0.05, 0.34, 0.09,"Обмен",true,exchangeWindows)
guiLabelSetHorizontalAlign (headlineExchange["loot"],"center")
guiSetFont (headlineExchange["loot"], "default-bold-small" )

headlineExchange["inventory"] = guiCreateLabel(0.60, 0.05, 0.34, 0.09,"Инвентарь",true,exchangeWindows)
guiLabelSetHorizontalAlign (headlineExchange["inventory"],"center")
guiSetFont (headlineExchange["inventory"], "default-bold-small" )

gridlistItemsExchange["loot"] = guiCreateGridList (0.03, 0.11, 0.39, 0.375,true,exchangeWindows)
guiGridListSetSortingEnabled ( gridlistItemsExchange["loot"], false )
gridlistItemsExchange["loot_colum"] = guiGridListAddColumn( gridlistItemsExchange["loot"], "123456789123456789123 предложил:", 0.7 )
gridlistItemsExchange["loot_colum_amount"] = guiGridListAddColumn( gridlistItemsExchange["loot"], "", 0.2 )


gridlistItemsExchange["loot2"] = guiCreateGridList (0.03, 0.485, 0.39, 0.375,true,exchangeWindows)
guiGridListSetSortingEnabled ( gridlistItemsExchange["loot2"], false )
gridlistItemsExchange["loot_colum2"] = guiGridListAddColumn( gridlistItemsExchange["loot2"], "123456789123456789123 предложил:", 0.7 )
gridlistItemsExchange["loot_colum_amount2"] = guiGridListAddColumn( gridlistItemsExchange["loot2"], "", 0.2 )

guiSetEnabled ( gridlistItemsExchange["loot2"], false )

gridlistItemsExchange["inventory"] = guiCreateGridList (0.57, 0.11, 0.39, 0.83,true,exchangeWindows)
guiGridListSetSortingEnabled ( gridlistItemsExchange["inventory"], false )
gridlistItemsExchange["inventory_colum"] = guiGridListAddColumn( gridlistItemsExchange["inventory"], "", 0.7 )
gridlistItemsExchange["inventory_colum_amount"] = guiGridListAddColumn( gridlistItemsExchange["inventory"], "", 0.2 )




buttonItemsExchange["loot"] = guiCreateButton(0.42, 0.24, 0.04, 0.622, "->", true,exchangeWindows)
buttonItemsExchange["inventory"] = guiCreateButton(0.53, 0.24, 0.04, 0.70, "<-", true,exchangeWindows)

buttonItemsExchange["lootSpeed"] = guiCreateButton(0.42, 0.11, 0.04, 0.13, "->>", true,exchangeWindows)
buttonItemsExchange["inventorySpeed"] = guiCreateButton(0.53, 0.11, 0.04, 0.13, "<<-", true,exchangeWindows)

local substrateSlots = guiCreateStaticImage ( 0.57, 0.955, 0.39, 0.032,  "images/redPix.png",true,exchangeWindows )
substrateSlotsTop = guiCreateStaticImage ( 0, 0, 0.39, 1,  "images/redPix.png",true,substrateSlots )
guiSetAlpha(substrateSlots,0.5)
headlineExchange["slots"] = guiCreateLabel(0.62, 0.95, 0.29, 0.04,"Вес:",true,exchangeWindows)
guiLabelSetHorizontalAlign (headlineExchange["slots"],"center")
guiLabelSetVerticalAlign (headlineExchange["slots"],"center")
guiSetFont (headlineExchange["slots"], "default-bold-small" )

--[[
local substrateLoot = guiCreateStaticImage ( 0.03, 0.955, 0.39, 0.032,  "images/redPix.png",true,inventoryWindows )
substrateLootTop = guiCreateStaticImage ( 0, 0, 0.39, 1,  "images/redPix.png",true,substrateLoot )
guiSetAlpha(substrateLoot,0.5)
headline["slots_loot"] = guiCreateLabel(0.07, 0.95, 0.29, 0.04,"Вес:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots_loot"],"center")
guiLabelSetVerticalAlign (headline["slots_loot"],"center")
guiSetFont (headline["slots_loot"], "default-bold-small" )
]]


buttonItemsExchange["exchangeOk"] = guiCreateButton(0.03, 0.87, 0.43, 0.05, "Подтвердить", true,exchangeWindows)
buttonItemsExchange["exchangeCancel"] = guiCreateButton(0.03, 0.93, 0.43, 0.05, "Отменить", true,exchangeWindows)

addEventHandler ( "onClientGUIClick", buttonItemsExchange["exchangeOk"], function() 
local exchange = getElementData(localPlayer,"exchange") or false

refreshLootExc(exchange,"player",true)

triggerServerEvent("refreshRemote",localPlayer,true)

guiSetEnabled(buttonItemsExchange["loot"],false)
guiSetEnabled(buttonItemsExchange["inventory"],false)
guiSetEnabled(buttonItemsExchange["lootSpeed"],false)
guiSetEnabled(buttonItemsExchange["inventorySpeed"],false)
guiSetEnabled(gridlistItemsExchange["loot"],false)
guiSetEnabled(buttonItemsExchange["exchangeOk"],false)
--guiSetEnabled(buttonItemsExchange["exchangeCancel"],false) ???


--triggerServerEvent("exchangeCancel",localPlayer)
--guiSetVisible(exchangeWindows,false)
--showCursor(false)

end,false )


addEventHandler ( "onClientGUIClick", buttonItemsExchange["exchangeCancel"], function() 

local exchangePartner = getElementData(localPlayer,"exchangePartner") or false --- !!! тут что-то
triggerServerEvent("exchangeCancel",localPlayer)
guiSetVisible(exchangeWindows,false)
showCursor(false)

end,false )


centerWindow(exchangeWindows)

guiSetVisible(exchangeWindows,false)






local excAccept = guiCreateWindow(0, 0, 350, 150, "Подтверждение обмена", false)
local excAcceptText = guiCreateLabel(0, 30, 350, 100,"12345678901234567890123\n\nПредложил вам обмен",false,excAccept)
guiLabelSetHorizontalAlign (excAcceptText,"center")

local excAcceptOK = guiCreateButton(0.1, 0.7, 0.3, 0.7, "Согласиться", true,excAccept)
local excAcceptCancel = guiCreateButton(0.6, 0.7, 0.3, 0.7, "Отказаться", true,excAccept)

addEventHandler ( "onClientGUIClick", excAcceptOK, function() 

guiSetEnabled(buttonItemsExchange["loot"],true)
guiSetEnabled(buttonItemsExchange["inventory"],true)
guiSetEnabled(buttonItemsExchange["lootSpeed"],true)
guiSetEnabled(buttonItemsExchange["inventorySpeed"],true)
guiSetEnabled(gridlistItemsExchange["loot"],true)
guiSetEnabled(buttonItemsExchange["exchangeOk"],true)
guiSetEnabled(buttonItemsExchange["exchangeCancel"],true)
guiGridListClear(gridlistItemsExchange["loot"])
guiGridListClear(gridlistItemsExchange["loot2"])

local offerExc = getElementData(localPlayer,"offerExc") or false

guiSetVisible(excAccept,false)

if offerExc then 
	guiGridListSetColumnTitle( gridlistItemsExchange["loot"], 1, getPlayerName(localPlayer).." предложил:")
	guiGridListSetColumnTitle( gridlistItemsExchange["loot2"], 1, getPlayerName(offerExc).." предложил:" )


	triggerServerEvent("offerExcOK",localPlayer,offerExc)

	outputChatBox("#FFFF00Вы согласились на обмен",255,255,255,true)
	setTimer(function()

		guiSetVisible(exchangeWindows,true)
		showCursor(true)
		refreshInventoryExc()
		
	end,1000,1)

end

end,false )

function offerExcRemoteOK(player)


outputChatBox("offerExcRemoteOK")
	if player then 

	setTimer(function()
	
		guiGridListSetColumnTitle( gridlistItemsExchange["loot"], 1, getPlayerName(localPlayer).." предложил:")
		guiGridListSetColumnTitle( gridlistItemsExchange["loot2"], 1, getPlayerName(player).." предложил:" )

		guiSetVisible(exchangeWindows,true)
		showCursor(true)
		refreshInventoryExc()

	end,1000,1)

	end


end

addEvent("offerExcRemoteOK",true)
addEventHandler("offerExcRemoteOK",localPlayer,offerExcRemoteOK)


function exchangeCancelRemote()


		guiSetVisible(exchangeWindows,false)
		showCursor(false)
		



end

addEvent("exchangeCancelRemote",true)
addEventHandler("exchangeCancelRemote",localPlayer,exchangeCancelRemote)



addEventHandler ( "onClientGUIClick", excAcceptCancel, function() 

local offerExc = getElementData(localPlayer,"offerExc") or false
triggerServerEvent("offerExcCancel",localPlayer,offerExc)
guiSetVisible(excAccept,false)
showCursor(false)

end,false )

centerWindow(excAccept)

guiSetVisible(excAccept,false)

function showAcceptExc()
local offerExc = getElementData(localPlayer,"offerExc") or false

if offerExc and isElement(offerExc) and getElementType(offerExc) =="player" then 
guiSetText(excAcceptText,getPlayerName(offerExc).."\n\nПредложил вам обмен")
guiSetVisible(excAccept,true)
showCursor(true)
end

end
bindKey("j","down",showAcceptExc)





local cancelBtnFlood = false
function inventoryLootToExc(all)
local networkStatus = getElementData(localPlayer,"networkStatus",false) or false
if networkStatus then
startRollMessage2("Обмен", "Пинг превышает норму!", 255, 22, 0 )
return
end

if gameplayVariables["checkBTNFLOOD"] then
if cancelBtnFlood then
startRollMessage2("Обмен", "Не нажимайте слишком часто!", 255, 0, 0 )
return
end
cancelBtnFlood = true
setTimer( function()
cancelBtnFlood = false
end,gameplayVariables["checkBTNtimer"],1)
end

if all == nil then 
all=false
end

local itemName = guiGridListGetItemText ( gridlistItemsExchange["inventory"], guiGridListGetSelectedItem ( gridlistItemsExchange["inventory"] ), 1 )

if not itemName  or itemName =='' or itemName ==" " then
return
end


local exchangeLoot = getElementData(localPlayer,"exchange")
	local itemsInCol = getElementData(exchangeLoot,itemName) or 0 

local plus = 1
	if all then 

		plus = getElementData(localPlayer,itemName)-itemsInCol or 1
		 
		for i,weaponData in ipairs(weaponAmmoTable["Weapons"]) do
			if itemName == weaponData[3] then
				plus = math.floor(plus/weaponData[5]) 
				break
			end
		end 
					
		for i,weaponData in ipairs(weaponAmmoTable["others"]) do
			if weaponData[3] then
				if itemName == weaponData[3] then
					plus = math.floor(plus/weaponData[5]) 
					break
				end
			end
		end 
	
	else
	 plus = 1
	end

	
	if itemName=="Одежда: Бандит 1ур" or itemName=="Одежда: Бандит 2ур" or itemName=="Одежда: Бандит 3ур" or itemName=="Одежда: Бандит 4ур" or itemName=="Одежда: Бандит 5ур" or itemName=="Одежда: Герой"  then
		triggerEvent ("displayClientInfo", localPlayer,"Обмен","Нельзя обменять!",255,22,0)
		return
	end

	if getElementData(localPlayer,"backPackUsed") == itemName then
		if getElementData(localPlayer,itemName) <= 1 or all then
			triggerEvent ("displayClientInfo", localPlayer,"Обмен","Нельзя обменять используемый рюкзак!",255,22,0)
			return
		end
	end

	if itemName =="GPS маяк" and getElementData(localPlayer,"GPSpharos")  then
		if getElementData(localPlayer,itemName) <= 1 or all then
			triggerEvent ("displayClientInfo", localPlayer,"Обмен","Нельзя обменять активированный маяк!",255,22,0)
			return
		end
	end

	if getElementData(localPlayer,"clotType_1") == itemName then
		if getElementData(localPlayer,itemName) <= 1 or all then
			triggerEvent ("displayClientInfo", localPlayer,"Обмен","Нельзя обменять используемую вещь!",255,22,0)
			return
		end
	end

	if getElementData(localPlayer,"clotType_2") == itemName then
		if getElementData(localPlayer,itemName) <= 1 or all then
			triggerEvent ("displayClientInfo", localPlayer,"Обмен","Нельзя обменять используемую вещь!",255,22,0)
			return
		end
	end
	
	if getElementData(localPlayer,"currentweapon_1") == itemName or getElementData(localPlayer,"currentweapon_2") == itemName or getElementData(localPlayer,"currentweapon_3") == itemName then
		if getElementData(localPlayer,itemName) <= 1 or all then
			triggerEvent ("displayClientInfo", localPlayer,"Обмен","Нельзя обменять используемую вещь!",255,22,0)
			return
		end
	end
	
	
	setElementData(exchangeLoot,itemName,itemsInCol+plus)
	refreshLootExc(exchangeLoot,"player",false)
	refreshInventoryExc()
	setTimer(function()
	triggerServerEvent("refreshRemote",localPlayer,false)
	end,1000,1)
	end



addEventHandler ( "onClientGUIClick", buttonItemsExchange["inventory"], function() 
inventoryLootToExc(false) 
end,false )


addEventHandler ( "onClientGUIClick", buttonItemsExchange["inventorySpeed"], function() 
inventoryLootToExc(true) 
end,false )

local playerAccept = false
local remoteAccept = false

local scrollpos2 =false
function refreshLootExc(loot,lootRefresh,accept)

outputChatBox(lootRefresh.." all:"..tostring(accept))

if loot == false or not isElement(loot) then
	guiGridListClear(gridLoot)
	return
end

local gridLoot = gridlistItemsExchange["loot"]
local gridLootCol = gridlistItemsExchange["loot_colum"]
local gridLootColAmout = gridlistItemsExchange["loot_colum_amount"]

	if lootRefresh =="player" then
		 gridLoot = gridlistItemsExchange["loot"]
		 gridLootCol = gridlistItemsExchange["loot_colum"]
		 gridLootColAmout = gridlistItemsExchange["loot_colum_amount"]
		
		 if accept then
		 playerAccept = true
		 end
		 if playerAccept then
		 accept = true
		 end
		 
	elseif lootRefresh == "remote" then
		 gridLoot = gridlistItemsExchange["loot2"]
		 gridLootCol = gridlistItemsExchange["loot_colum2"]
		 gridLootColAmout = gridlistItemsExchange["loot_colum_amount2"]
		 if accept then
		 remoteAccept = true
		 end
		 if remoteAccept then
		 accept = true
		 end
	end


if ( gridLootCol ) then
	row2,column2 = guiGridListGetSelectedItem ( gridLoot )
		scrollpos2  = guiGridListGetVerticalScrollPosition( gridLoot )
	guiGridListClear(gridLoot)

	
			if scrollpos2 then
		setTimer( function()
		 guiGridListSetVerticalScrollPosition( gridLoot, scrollpos2)
		end,50,1)
		end
		

		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridLoot )
				guiGridListSetItemText ( gridLoot, row, gridLootCol,item[1], false, false )
				guiGridListSetItemText ( gridLoot, row, gridLootColAmout,getElementData(loot,item[1]), false, false )
				if accept then
				guiGridListSetItemColor ( gridLoot, row, gridLootCol, 0,255,0 )
				guiGridListSetItemColor ( gridLoot, row, gridLootColAmout, 0,255,0 )
				end
			end
		end

		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridLoot )
				guiGridListSetItemText ( gridLoot, row, gridLootCol,item[1], false, false )
				guiGridListSetItemText ( gridLoot, row, gridLootColAmout,getElementData(loot,item[1]), false, false )
				if accept then
				guiGridListSetItemColor ( gridLoot, row, gridLootCol, 0,255,0 )
				guiGridListSetItemColor ( gridLoot, row, gridLootColAmout, 0,255,0 )
				end
			end
		end

		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridLoot )
				guiGridListSetItemText ( gridLoot, row, gridLootCol,item[1], false, false )
				guiGridListSetItemText ( gridLoot, row, gridLootColAmout,getElementData(loot,item[1]), false, false )
				if accept then
				guiGridListSetItemColor ( gridLoot, row, gridLootCol, 0,255,0 )
				guiGridListSetItemColor ( gridLoot, row, gridLootColAmout, 0,255,0 )
				end
			end
		end

		for id, item in ipairs(inventoryItems["Ammo"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridLoot )
				guiGridListSetItemText ( gridLoot, row, gridLootCol,item[1], false, false )
				guiGridListSetItemText ( gridLoot, row, gridLootColAmout,getElementData(loot,item[1]), false, false )
				if accept then
				guiGridListSetItemColor ( gridLoot, row, gridLootCol, 0,255,0 )
				guiGridListSetItemColor ( gridLoot, row, gridLootColAmout, 0,255,0 )
				end
			end
		end

		for id, item in ipairs(inventoryItems["Food"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridLoot )
				guiGridListSetItemText ( gridLoot, row, gridLootCol,item[1], false, false )
				guiGridListSetItemText ( gridLoot, row, gridLootColAmout,getElementData(loot,item[1]), false, false )
				if accept then
				guiGridListSetItemColor ( gridLoot, row, gridLootCol, 0,255,0 )
				guiGridListSetItemColor ( gridLoot, row, gridLootColAmout, 0,255,0 )
				end
			end
		end 

		for id, item in ipairs(inventoryItems["Items"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridLoot )
				guiGridListSetItemText ( gridLoot, row, gridLootCol,item[1], false, false )
				guiGridListSetItemText ( gridLoot, row, gridLootColAmout,getElementData(loot,item[1]), false, false )
				if accept then
				guiGridListSetItemColor ( gridLoot, row, gridLootCol, 0,255,0 )
				guiGridListSetItemColor ( gridLoot, row, gridLootColAmout, 0,255,0 )
				end
			end
		end

		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridLoot )
				guiGridListSetItemText ( gridLoot, row, gridLootCol,item[1], false, false )
				guiGridListSetItemText ( gridLoot, row, gridLootColAmout,getElementData(loot,item[1]), false, false )
				if accept then
				guiGridListSetItemColor ( gridLoot, row, gridLootCol, 0,255,0 )
				guiGridListSetItemColor ( gridLoot, row, gridLootColAmout, 0,255,0 )
				end
			end
		end

		if row2 and column2 then
			guiGridListSetSelectedItem ( gridLoot, row2,column2)
		end
		
	
	if playerAccept and remoteAccept then
	
	outputChatBox("СОГЛАСНЫ ОБА - ОБМЕН")
	guiSetVisible(exchangeWindows,false)
	showCursor(false)
	triggerServerEvent("exchangeCompleted",localPlayer)
	end
	
	end
end



addEvent("refreshRemote",true)
addEventHandler("refreshRemote",localPlayer,refreshLootExc)




local scrollpos = 0
function refreshInventoryExc()
local exchangeLoot = getElementData(localPlayer,"exchange") 
outputChatBox(tostring(exchangeLoot))
if ( gridlistItemsExchange["inventory_colum"] ) then --If the column has been created, fill it with players
	row1,column1 = guiGridListGetSelectedItem ( gridlistItemsExchange["inventory"] )
	scrollpos  = guiGridListGetVerticalScrollPosition( gridlistItemsExchange["inventory"] )
			if scrollpos then
		setTimer( function()
		 guiGridListSetVerticalScrollPosition( gridlistItemsExchange["inventory"], scrollpos)
		end,50,1)
		end
	guiGridListClear(gridlistItemsExchange["inventory"])
			local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
			--guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"ITEMS", false, false )
			local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
			guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"Основное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		local lootAmout =  (getElementData(localPlayer,item[1]) or 0 ) - (getElementData(exchangeLoot,item[1]) or 0 ) or 0
			if   lootAmout >= 1 then
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"],lootAmout, false, false )
			
			if getElementData(localPlayer,"currentweapon_1") == item[1] then
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"], 0,255,0 )
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"], 0,255,0 )
				end
				
			
			end
		end
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
			guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"Дополнительное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			local lootAmout =  (getElementData(localPlayer,item[1]) or 0 ) - (getElementData(exchangeLoot,item[1]) or 0 ) or 0
			if   lootAmout >= 1 then
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"],lootAmout, false, false )
			
			if getElementData(localPlayer,"currentweapon_2") == item[1] then
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"], 0,255,0 )
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"], 0,255,0 )
				end
			
			end
		end
			local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
			guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"Специальное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			local lootAmout =  (getElementData(localPlayer,item[1]) or 0 ) - (getElementData(exchangeLoot,item[1]) or 0 ) or 0
			if   lootAmout >= 1 then
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"],lootAmout, false, false )
			
			if getElementData(localPlayer,"currentweapon_3") == item[1] then
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"], 0,255,0 )
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"], 0,255,0 )
				end
				
			end
		end
			local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] ) 
			guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"Боеприпасы", true, false )
		for id, item in ipairs(inventoryItems["Ammo"]) do
			local lootAmout =  (getElementData(localPlayer,item[1]) or 0 ) - (getElementData(exchangeLoot,item[1]) or 0 ) or 0
			if   lootAmout >= 1 then
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"],lootAmout, false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
			guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"Еда/Вода", true, false )
		for id, item in ipairs(inventoryItems["Food"]) do
			local lootAmout =  (getElementData(localPlayer,item[1]) or 0 ) - (getElementData(exchangeLoot,item[1]) or 0 ) or 0
			if   lootAmout >= 1 then
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"],lootAmout, false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
			guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"Прочее", true, false )
		for id, item in ipairs(inventoryItems["Items"]) do
			local lootAmout =  (getElementData(localPlayer,item[1]) or 0 ) - (getElementData(exchangeLoot,item[1]) or 0 ) or 0
			if   lootAmout >= 1 then
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"],lootAmout, false, false )
				if item[4] == getElementData(localPlayer,"MAX_Slots") then
				setElementData(localPlayer,"backPackUsed",item[1]) --server
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"], 255,255,0 )
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"], 255,255,0 )
				end
				if getElementData(localPlayer,"clotType_1") == item[1] then
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"], 0,255,0 )
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"], 0,255,0 )
				end
				
				if getElementData(localPlayer,"clotType_2") == item[1] then
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"], 0,255,0 )
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"], 0,255,0 )
				end
			end
		end
			local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
			guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],"Инструменты", true, false )
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			local lootAmout =  (getElementData(localPlayer,item[1]) or 0 ) - (getElementData(exchangeLoot,item[1]) or 0 ) or 0
			if   lootAmout >= 1 then
				local row = guiGridListAddRow ( gridlistItemsExchange["inventory"] )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"],lootAmout, false, false )
			local GPSpharos = getElementData(localPlayer,"GPSpharos") or false
				if GPSpharos and item[1]=="GPS маяк" then
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum"], 255,0,0 )
				guiGridListSetItemColor ( gridlistItemsExchange["inventory"], row, gridlistItemsExchange["inventory_colum_amount"], 255,0,0 )
				end
			end
		end
		if row1 and column1 then
			guiGridListSetSelectedItem ( gridlistItemsExchange["inventory"], row1,column1)
		end

		
		local enginerSlots = getElementData(localPlayer,"progress.enginer") or 0
		local attackerSlots = getElementData(localPlayer,"progress.attacker") or 0
		
		local curSlots = getPlayerCurrentSlots() 
		local maxSlots = getPlayerMaxAviableSlots()
		local maxSlotsReal = maxSlots+math.floor((enginerSlots+attackerSlots)*0.2)
		setProgressBar("slots",curSlots,maxSlotsReal)
		guiSetText(headlineExchange["slots"],"Вес: "..curSlots.."/"..maxSlots.."+"..math.floor((enginerSlots+attackerSlots)*0.2).."")
	end
end

