



local giveElements ={
"Weapon",
"Ammo",
"Food/Drinks",
"Others",
"Toolbelt",
"Player Data",
"Vehicles",
"Others Vehicles"
}

local playerDatass= {
{"group"},
{"alivetime"},
{"skin"},
{"MAX_Slots"},
{"bandit"},
{"blood"},
{"food"},
{"thirst"},
{"clotType_1"},
{"clotType_2"},
{"clotProfit_1"},
{"clotProfit_2"},
--{"temperature"},
{"currentweapon_1"},
{"currentweapon_2"},
{"currentweapon_3"},
{"bleeding"},
{"brokenbone"},
{"pain"},
--{"cold"},
{"infection"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},
{"playerexp"},
{"playerlvl"},
{"stat.murders"},
{"stat.zombieskilled"},
{"stat.banditskilled"},
{"stat.alivetime"},
{"stat.murdersMax"},
{"stat.zombieskilledMax"},
{"stat.banditskilledMax"},
{"stat.alivetimeMax"},
{"progress.medik"},
{"progress.attacker"},
{"progress.sniper"},
{"progress.clicks"},
{"progress.enginer"},
{"progress.economist"},
{"progress.djagernaut"},
{"progress.boec"},
{"progress.clicksOFF"},
}
local myWindow = guiCreateWindow ( 0, 0,800,500, "", false )  
guiSetAlpha(myWindow,0.7)
guiWindowSetSizable ( myWindow, false )         
centerWindow(myWindow)
guiSetVisible ( myWindow, false )
local tabs = guiCreateTabPanel ( 10, 20, 800, 500, false, myWindow )
local targ = guiCreateTab( "Give", tabs )
local sess = guiCreateTab( "Tents/Safes", tabs )
local playersTab = guiCreateTab( "Players", tabs )
local cars = guiCreateTab( "Vehicles", tabs )
local groups = guiCreateTab( "Groups", tabs )
local map = guiCreateTab( "Map", tabs )

local players= guiCreateGridList(10, 10, 250, 430, false, targ)
local playersCol = guiGridListAddColumn( players, "Player", 0.90 )
guiGridListSetSortingEnabled(players,false)
 

local category = guiCreateComboBox(270, 10, 500, 150, "-- Selected category --", false, targ)
guiSetProperty(category, "InheritsAlpha", "False") 
for key, value in pairs (giveElements) do
	guiComboBoxAddItem(category, value)	
end	
local items= guiCreateGridList(270, 35, 500, 350, false, targ)
local itemColum= guiGridListAddColumn( items, "", 0.70 )
local itemVes= guiGridListAddColumn( items, "", 0.20 )	
guiGridListSetSortingEnabled(items,false)

local quantity = guiCreateEdit(270+250-110, 390, 100, 40, "1", false,targ)
local give = guiCreateButton(270+250, 390, 100, 40, "Give", false, targ)

	guiSetFont(give, "default-bold-small")
	guiSetProperty(give, "NormalTextColour", "FFAAAAAA")
 

function addItems(tableItems,col,two)

		local row = guiGridListAddRow ( items )
			guiGridListSetItemText ( items, row, itemColum,col, true, false )
		for id, item in ipairs(tableItems) do
			local row = guiGridListAddRow ( items )
	
			if col =="Vehicles" then
				local realName = GetRealVehicleName(item[1])
				if realName then
					guiGridListSetItemText ( items, row, itemColum,realName, false, false )
					guiGridListSetItemText ( items, row, itemVes,item[1], false, false )
				end
			elseif col =="Others Vehicles" then
			
				local realName = GetRealVehicleName(item[1])
				if not realName then
					guiGridListSetItemText ( items, row, itemColum,getVehicleNameFromModel ( item[1] ), false, false )
					guiGridListSetItemText ( items, row, itemVes,item[1], false, false )
				end
			
			else
			guiGridListSetItemText ( items, row, itemColum,item[1], false, false )
			end
			
			if two then
				guiGridListSetItemText ( items, row, itemVes,two.." "..item[2] or "", false, false )
			end
		end
	

end	 
addEventHandler("onClientGUIComboBoxAccepted", category,
	function()
		guiGridListClear(items)	
		local text = guiComboBoxGetItemText(category, guiComboBoxGetSelected(category))
		if text =="Weapon" then 
		addItems(inventoryItems["Weapons"]["Primary Weapon"],"Primary weapon","Slot:")
		addItems(inventoryItems["Weapons"]["Secondary Weapon"],"Secondary Weapon","Slot:")
		addItems(inventoryItems["Weapons"]["Specially Weapon"],"Specially Weapon","Slot:")
		elseif text =="Ammo" then
		addItems(inventoryItems["Ammo"],"Ammo","Slot:") 
		elseif text =="Food/Drinks" then
		addItems(inventoryItems["Food"],"Food/Drinks","Slot:")
		elseif text =="Others" then
		addItems(inventoryItems["Items"],"Others","Slot:") 
		elseif text =="Toolbelt" then
		addItems(inventoryItems["Toolbelt"],"Toolbelt","Slot:") 
		elseif text=="Player Data" then
		addItems(playerDatass,"Player Data")  
		elseif text=="Vehicles" then
		addItems(vehicleAddonsInfo,"Vehicles")   
		elseif text=="Others Vehicles" then
		addItems(vehicleAddonsInfo,"Others Vehicles") 
		end
		
	end )	

	addEventHandler ( "onClientGUIClick", give, 
	function()
		local playerName = guiGridListGetItemText(players, guiGridListGetSelectedItem(players), 1)
		local item =  guiGridListGetItemText(items, guiGridListGetSelectedItem(items), 1)
		local text = guiComboBoxGetItemText(category, guiComboBoxGetSelected(category))
	if getPlayerFromName(playerName) and item~="" and playerName~="" then
		if text == "Vehicles" then
		local carId = guiGridListGetItemText(items, guiGridListGetSelectedItem(items), 2) 
		triggerServerEvent("onGive",  localPlayer, playerName, tonumber(carId), 1,true)
		elseif text == "Others Vehicles" then
		local carId = guiGridListGetItemText(items, guiGridListGetSelectedItem(items), 2) 
		triggerServerEvent("onGive",  localPlayer, playerName, tonumber(carId), 1,true)
		else
		triggerServerEvent("onGive",  localPlayer, playerName, item, guiGetText(quantity),false)
		end
	else
	outputChatBox("O jogador saiu ou mudou de apelido",255,0,0)
	end
	end, false);
	

local tents= guiCreateGridList(10, 10, 300, 430, false, sess)
local tentsCOL = guiGridListAddColumn( tents, "", 0.3 )
local tentsPASS = guiGridListAddColumn( tents, "", 0.5 )
local tentsDATA = guiGridListAddColumn( tents, "", 0 )
 guiGridListSetSortingEnabled(tents,false)


local tentsLoot= guiCreateGridList(320, 10, 450, 380, false, sess)
local tentsLootCOL= guiGridListAddColumn( tentsLoot, "", 0.50 )
local tentsLootQUA= guiGridListAddColumn( tentsLoot, "", 0.40 )	
guiGridListSetSortingEnabled(tentsLoot,false)

local teleport = guiCreateButton(320, 400, 450, 40, "Teleport", false, sess)

	guiSetFont(teleport, "default-bold-small")
	guiSetProperty(teleport, "NormalTextColour", "FFAAAAAA")

	addEventHandler ( "onClientGUIClick", teleport, 
	function()
	 local row, col = guiGridListGetSelectedItem( tents )
		local col = guiGridListGetItemData(tents, row, col)

	if col then
	triggerServerEvent("adminTeleport",  localPlayer, col)
	else
	outputChatBox("Escolha um cofre ou tenda",255,0,0)
	end
	end, false);	
	
	


function getTentLoot(tableGlobal,value,col)
		local row = guiGridListAddRow ( tentsLoot )
			guiGridListSetItemText ( tentsLoot, row, itemColum,value, true, false )
		for id, item in ipairs(tableGlobal) do
			local row = guiGridListAddRow ( tentsLoot )
		local elementsInTent= getElementData(col,item[1],false) or false
		if elementsInTent then
			guiGridListSetItemText ( tentsLoot, row, itemColum,item[1], false, false )
			guiGridListSetItemText ( tentsLoot, row, itemVes,"Number: "..elementsInTent, false, false )
		end

		end

end

function onSelectTent( btn )
  if btn ~= 'left' then return false end
  local row, col = guiGridListGetSelectedItem( source )
  local selectedTent = guiGridListGetItemText(tents,row, col)

if selectedTent or row then
guiGridListClear ( tentsLoot )
end

if selectedTent~="" then
local col = guiGridListGetItemData ( tents, row, col )

if isElement(col) then
local nick=getElementData(col,"PlayerNick") or false
if nick then
local row = guiGridListAddRow ( tentsLoot )
guiGridListSetItemText ( tentsLoot, row, itemColum,"Nick: "..nick, true, false )
end	
local serial=getElementData(col,"PlayerSerial") or false
if serial then
local row = guiGridListAddRow ( tentsLoot )
guiGridListSetItemText ( tentsLoot, row, itemColum,"Serial: "..serial, true, false )
end
local pass=getElementData(col,"pass") or false
if pass then
local row = guiGridListAddRow ( tentsLoot )
guiGridListSetItemText ( tentsLoot, row, itemColum,"Password: "..pass, true, false )
end		
			
getTentLoot(inventoryItems["Weapons"]["Primary Weapon"],"Primary weapon",col)
getTentLoot(inventoryItems["Weapons"]["Secondary Weapon"],"Secondary Weapon",col)
getTentLoot(inventoryItems["Weapons"]["Specially Weapon"],"Specially Weapon",col)
getTentLoot(inventoryItems["Ammo"],"Munições",col) 
getTentLoot(inventoryItems["Food"],"Food/Drinks",col)
getTentLoot(inventoryItems["Items"],"Others",col) 
getTentLoot(inventoryItems["Toolbelt"],"Toolbelt",col)
end
end		
end
addEventHandler( "onClientGUIClick", tents,onSelectTent , false )
	


local allPlayers= guiCreateGridList(10, 10, 250, 430, false, playersTab)
local allPlayersPlayer = guiGridListAddColumn( allPlayers, "Player", 0.9 )
guiGridListSetSortingEnabled(allPlayers,false)
 


local playerLoot= guiCreateGridList(270, 10, 500, 430, false, playersTab)
local playerLootCOL= guiGridListAddColumn( playerLoot, "", 0.50 )
local playerLootQUA= guiGridListAddColumn( playerLoot, "", 0.40 )	
guiGridListSetSortingEnabled(playerLoot,false)
	
function getPlayerLoot(tableGlobal,value,col)
		local row = guiGridListAddRow ( playerLoot )
			guiGridListSetItemText ( playerLoot, row, itemColum,value, true, false )
		for id, item in ipairs(tableGlobal) do
			local row = guiGridListAddRow ( playerLoot )
		local elementsInTent= getElementData(col,item[1],false) or false
		if elementsInTent and elementsInTent~=0 then
			guiGridListSetItemText ( playerLoot, row, playerLootCOL,item[1], false, false )
			guiGridListSetItemText ( playerLoot, row, playerLootQUA,elementsInTent, false, false )
		end

		end

end	
function onSelectPlayers( btn )
  if btn ~= 'left' then return false end
  local row, col = guiGridListGetSelectedItem( source )
  local selectedPlayer = guiGridListGetItemText(allPlayers,row, col)

if selectedPlayer or row then
guiGridListClear ( playerLoot )
end

if selectedPlayer~="" then
local player = guiGridListGetItemData ( allPlayers, row, col )

if isElement(player) then

getPlayerLoot(playerDatass,"Player Data",player)		
getPlayerLoot(inventoryItems["Weapons"]["Primary Weapon"],"Primary weapon",player)
getPlayerLoot(inventoryItems["Weapons"]["Secondary Weapon"],"Secondary Weapon",player)
getPlayerLoot(inventoryItems["Weapons"]["Specially Weapon"],"Specially Weapon",player)
getPlayerLoot(inventoryItems["Ammo"],"Munições",player) 
getPlayerLoot(inventoryItems["Food"],"Food/Drinks",player)
getPlayerLoot(inventoryItems["Items"],"Others",player) 
getPlayerLoot(inventoryItems["Toolbelt"],"Toolbelt",player)
else
outputChatBox("O jogador liberou ou substituiu aquele. Atualize a guia",255,0,0)
end
end		
end
addEventHandler( "onClientGUIClick", allPlayers,onSelectPlayers , false )	
	
	
local allCars= guiCreateGridList(10, 10, 760, 380, false, cars)
local allCarsNAME = guiGridListAddColumn( allCars, "Name", 0.3 )
local allCarsTRADE = guiGridListAddColumn( allCars, "Withdraw", 0.1 )
local allCarsINZZ = guiGridListAddColumn( allCars, "In ZZ", 0.1 )
local allCarsINBASE = guiGridListAddColumn( allCars, "In the database", 0.1 )
local allCarsINMOD = guiGridListAddColumn( allCars, "With the name", 0.1 )
local allCarsOWNER = guiGridListAddColumn( allCars, "Owner", 0.2 )
guiGridListSetSortingEnabled(allCars,false)


local carBlow = guiCreateButton(10, 400, 760, 40, "Blow up", false, cars)

	guiSetFont(carBlow, "default-bold-small")
	guiSetProperty(carBlow, "NormalTextColour", "FFAAAAAA")

	addEventHandler ( "onClientGUIClick", carBlow, 
	function()
  local row, col = guiGridListGetSelectedItem( allCars )
  local selectedCar = guiGridListGetItemText(allCars,row, col)

if selectedCar~="" then
local car = guiGridListGetItemData ( allCars, row, col )

if isElement(car) then
triggerServerEvent("adminCarBlow",  localPlayer, car)

else
outputChatBox("Essa máquina não existe",255,0,0)
end
end
	end, false);	
	
	
	
function onSelectCar( btn )
  if btn ~= 'left' then return false end
  local row, col = guiGridListGetSelectedItem( source )
  local selectedCar = guiGridListGetItemText(allCars,row, col)


if selectedCar~="" then
local car = guiGridListGetItemData ( allCars, row, col )

if isElement(car) then
triggerServerEvent("adminTeleport",  localPlayer, car)

else
outputChatBox("Essa máquina não existe",255,0,0)
end
end		
end
addEventHandler( "onClientGUIDoubleClick", allCars,onSelectCar , false )
 
 
local allGroups= guiCreateGridList(10, 10, 300, 430, false, groups)
local allGroupsName= guiGridListAddColumn( allGroups, "Name", 0.4 )
local allGroupsLVL= guiGridListAddColumn( allGroups, "Level", 0.15 )
local allGroupsMemmers= guiGridListAddColumn( allGroups, "Participants", 0.15 )
local allGroupsCreateDate= guiGridListAddColumn( allGroups, "Creation Date", 0.2 )
guiGridListSetSortingEnabled(allGroups,false)
 


local playersInGroup= guiCreateGridList(320, 10, 450, 350, false, groups)
local playersInGroupName= guiGridListAddColumn( playersInGroup, "Nick", 0.4 )
local playersInGroupLVL= guiGridListAddColumn( playersInGroup, "Level", 0.15 )
local playersInGroupRanq= guiGridListAddColumn( playersInGroup, "Rank", 0.18 )	
local playersInGroupAccount= guiGridListAddColumn( playersInGroup, "Account", 0.2 )	
guiGridListSetSortingEnabled(playersInGroup,false) 

--local playerKick = guiCreateButton(320, 370, 450, 30, "Выгнать", false, groups)
local removeGroup = guiCreateButton(320, 370, 450, 50, "Delete Group", false, groups)
--guiSetEnabled(playerKick,false)
guiSetEnabled(removeGroup,false)

 --`groupName` , `groupLvl` , `groupMembers` , `groupMaxMembers` , `GroupAGR` ,
-- `groupCreatedDate` , `SKILL_EMBLEM` , `SKILL_ARMORTS` , `SKILL_CARTRADE` , `SKILL_MAXMEMBERS`
-- , `SKILL_EXP` , `clicks` , `clicksOFF` , `groupExp`




local adminMap = guiCreateCheckBox ( 100, 50, 200, 20, "Teleport around the map", false, false, map )
addEventHandler ( "onClientGUIClick", adminMap, function ( comboBox ) setAdminFunc(adminMap) end,false)
local adminShowTents = guiCreateCheckBox ( 100, 100, 200, 20, "Show tents nearby", false, false, map )
addEventHandler ( "onClientGUIClick", adminShowTents, function ( comboBox ) setAdminFunc(adminShowTents) end,false)
local adminShowPlayers = guiCreateCheckBox ( 100, 150, 200, 20, "Show players side", false, false, map )
addEventHandler ( "onClientGUIClick", adminShowPlayers, function ( comboBox ) setAdminFunc(adminShowPlayers) end,false)
local adminShowCars = guiCreateCheckBox ( 100, 200, 200, 20, "Show the description", false, false, map )
addEventHandler ( "onClientGUIClick", adminShowCars, function ( comboBox ) setAdminFunc(adminShowCars) end,false)


function setAdminFunc(box)
local boolBox  = guiCheckBoxGetSelected ( box ) or false
local name = false
if box == adminMap then name="adminMap" elseif box == adminShowTents then name ="adminShowTents" elseif box == adminShowPlayers then name ="adminShowPlayers" elseif box == adminShowCars then name ="adminShowCars" end
setElementData(localPlayer,name,boolBox)
end

function loadGroupsADMIN(groupsInfo) 
guiGridListClear(allGroups)
guiGridListClear(playersInGroup)
	for id, group in ipairs(groupsInfo) do
			local row = guiGridListAddRow ( allGroups )
		
			guiGridListSetItemText ( allGroups, row, allGroupsName,tostring(group.groupName), false, false )
			guiGridListSetItemText ( allGroups, row, allGroupsLVL,tostring(group.groupLvl), false, false )
			guiGridListSetItemText ( allGroups, row, allGroupsMemmers,tostring(group.groupMembers.."/"..group.groupMaxMembers), false, false )
			guiGridListSetItemText ( allGroups, row, allGroupsCreateDate,tostring(group.groupCreatedDate), false, false )
	end

end
 addEvent("loadGroupsADMIN", true)
addEventHandler("loadGroupsADMIN", localPlayer, loadGroupsADMIN)



function onSelectGroup( btn )
  if btn ~= 'left' then return false end
  local row, col = guiGridListGetSelectedItem( source )
  local selectedGroup = guiGridListGetItemText(allGroups,row, col)

if selectedGroup or row then
guiGridListClear ( playersInGroup )
guiSetText(removeGroup,"Delete Group")
guiSetEnabled(removeGroup,false)
end

if selectedGroup~="" then
triggerServerEvent("loadGroupPlayers",localPlayer,tostring(selectedGroup))
guiSetEnabled(removeGroup,true)
guiSetText(removeGroup,"Delete group: "..selectedGroup)
end
end
addEventHandler( "onClientGUIClick", allGroups,onSelectGroup , false )

function loadPlayers(membersTable)
	for id, player in ipairs(membersTable) do
			local row = guiGridListAddRow ( playersInGroup )
		
		
		--[[
local playersInGroupName= guiGridListAddColumn( playerLoot, "Nick", 0.50 )
local playersInGroupLVL= guiGridListAddColumn( playerLoot, "Level", 0.40 )
local playersInGroupRanq= guiGridListAddColumn( playerLoot, "Rank", 0.40 )	
(`groupName` TEXT, `userProfit` INT, `userLvl` INT, `userRole` TEXT, `userNick` TEXT, `userAccount` TEXT)
]]
			if player.player then
			guiGridListSetItemText ( playersInGroup, row, playersInGroupName,tostring(getPlayerName(player.player)), false, false )
			guiGridListSetItemText ( playersInGroup, row, playersInGroupLVL,tostring(getElementData(player.player,"playerlvl") or 0), false, false )
			guiGridListSetItemText ( playersInGroup, row, playersInGroupRanq,tostring(getElementData(player.player,"groupUserStatus")), false, false )
			guiGridListSetItemColor ( playersInGroup, row, playersInGroupName, 255,255,0 )
			else
			guiGridListSetItemText ( playersInGroup, row, playersInGroupName,tostring(player.userNick), false, false )
			guiGridListSetItemText ( playersInGroup, row, playersInGroupLVL,tostring(player.userLvl), false, false )
			guiGridListSetItemText ( playersInGroup, row, playersInGroupRanq,tostring(player.userRole), false, false )
			end
			guiGridListSetItemText ( playersInGroup, row, playersInGroupAccount,tostring(player.userAccount), false, false )
			
		end

end
 addEvent("loadPlayers", true)
addEventHandler("loadPlayers", localPlayer, loadPlayers)



function adminRemoveGroup()
local row, col = guiGridListGetSelectedItem( allGroups )
  local selectedGroup = guiGridListGetItemText(allGroups,row, col)
if selectedGroup and  selectedGroup~="" then
  triggerServerEvent("adminRemoveGroup",localPlayer,tostring(selectedGroup))
end
  end
addEventHandler( "onClientGUIClick", removeGroup,adminRemoveGroup , false )


	guiSetFont(give, "default-bold-small")
	guiSetProperty(give, "NormalTextColour", "FFAAAAAA")

	
	function OnChange(selectedTab)
	-- If there is a selected tab.
	if selectedTab ~= nil then 
	
		if selectedTab==sess then
			guiGridListClear(tents)
			for i,col in ipairs ( getElementsByType("colshape")) do
			local isTent = getElementData(col,"tent") or false
			local isBitTent = getElementData(col,"bigTent") or false
			local isSave = getElementData(col,"save") or false
			
			if isSave then 
			local PlayerNick = getElementData(col,"PlayerNick") or false
			local row = guiGridListAddRow ( tents )
					guiGridListSetItemText ( tents, row, tentsCOL,"Safe", false, false )
					guiGridListSetItemText ( tents, row, tentsPASS,"Owner:"..PlayerNick, true, false )
					guiGridListSetItemData ( tents, row, tentsCOL, col )
			end
			if isTent and not isBitTent and not isSave  then 
			local PlayerNick = getElementData(col,"PlayerNick") or false
			local row = guiGridListAddRow ( tents )
					guiGridListSetItemText ( tents, row, tentsCOL,"Tent", false, false )
					guiGridListSetItemText ( tents, row, tentsPASS,"Owner:"..PlayerNick, true, false )
					guiGridListSetItemData ( tents, row, tentsCOL, col )
			end
			if isBitTent then 
			local PlayerNick = getElementData(col,"PlayerNick") or false
			local row = guiGridListAddRow ( tents )
					guiGridListSetItemText ( tents, row, tentsCOL,"Big tent", false, false )
					guiGridListSetItemText ( tents, row, tentsPASS,"Owner:"..PlayerNick, true, false )
					guiGridListSetItemData ( tents, row, tentsCOL, col )
			end
			
			end
		elseif selectedTab==playersTab  then
		guiGridListClear(allPlayers)
		  for i,player in ipairs ( getElementsByType("player")) do
				local row = guiGridListAddRow ( allPlayers )
				guiGridListSetItemText ( allPlayers, row, allPlayersPlayer,getPlayerName ( player), false, false )
				guiGridListSetItemData ( allPlayers, row, allPlayersPlayer,player, false, false )
			end
			
		elseif selectedTab==cars then
		guiGridListClear(allCars)
		  for i,car in ipairs ( getElementsByType("vehicle")) do
				local row = guiGridListAddRow ( allCars )
				if isElement(car) then
				local carId = getElementModel(car) or false
					if carId then
						local carName = GetRealVehicleName(carId) or getVehicleNameFromModel(carId)
						local carCol = getElementData(car,"parent") 
						local NOCARSPAWN = getElementData(carCol,"NOCARSPAWN") or false
						local playerCar = "No" 
						if NOCARSPAWN then  playerCar="Yes" end
						local CarInZZ = getElementData(car,"CarInZZ") or false
						local CarInZZE = "No"
						if CarInZZ then  CarInZZE="Yes"  end
						local CarInBase = getElementData(car,"CarInBase") or false
						local CarInBaseE = "No"
						if CarInBase then CarInBaseE="Yes"  end
						local CarInMod = GetRealVehicleName(carId) or false
						local CarInModE = "No"
						if CarInMod then CarInModE="Yes"  end
						local CarOwner = getElementData(car,"owner") or false
						local CarOwnerE = "--"
						if CarOwner then CarOwnerE=CarOwner  end
						guiGridListSetItemText ( allCars, row, allCarsNAME,carName, false, false )
						guiGridListSetItemText ( allCars, row, allCarsTRADE,playerCar, false, false )
						guiGridListSetItemText ( allCars, row, allCarsINZZ,CarInZZE, false, false )
						guiGridListSetItemText ( allCars, row, allCarsINBASE,CarInBaseE, false, false )
						guiGridListSetItemText ( allCars, row, allCarsINMOD,CarInModE, false, false )
						guiGridListSetItemText ( allCars, row, allCarsOWNER,CarOwnerE, false, false )
						
						guiGridListSetItemData ( allCars, row, allCarsNAME,car, false, false )
					end
				end
			end
		
		elseif selectedTab==groups then
		guiSetText(removeGroup,"Delete Group")
		guiSetEnabled(removeGroup,false)
		guiGridListClear(allGroups)
		guiGridListClear(playersInGroup)
		triggerServerEvent("getGroups",localPlayer)

		elseif selectedTab==map then
		guiCheckBoxSetSelected ( adminMap, getElementData(localPlayer,"adminMap") )
		guiCheckBoxSetSelected ( adminShowTents, getElementData(localPlayer,"adminShowTents") )
		guiCheckBoxSetSelected ( adminShowPlayers, getElementData(localPlayer,"adminShowPlayers") )
		guiCheckBoxSetSelected ( adminShowCars, getElementData(localPlayer,"adminShowCars") )
		end
	
	end	
end

addEventHandler("onClientGUITabSwitched", resourceRoot, OnChange)

function showGivePanel()
guiSetVisible(myWindow,not guiGetVisible(myWindow))
		showCursor(not isCursorShowing())
		
		row2,column2 = guiGridListGetSelectedItem ( players )
		scrollpos2  = guiGridListGetVerticalScrollPosition( players )
		
guiGridListClear(players)	
  for i,player in ipairs ( getElementsByType("player")) do
  local row = guiGridListAddRow ( players )
					guiGridListSetItemText ( players, row, playersCol,getPlayerName ( player), false, false )
  end
  
  if row2 and column2 then
			guiGridListSetSelectedItem ( players, row2,column2)
		end
  if scrollpos2 then
		setTimer( function()
		 guiGridListSetVerticalScrollPosition( players, scrollpos2)
		end,50,1)
		end
end
addEvent("showGivePanel",true)
addEventHandler("showGivePanel", localPlayer,showGivePanel)




function adminMapFunc()
local blips = getElementsByType ( "blip" ) 
for i, blip in ipairs(blips) do
if getElementData(blip,"adminCarBlip") or getElementData(blip,"adminPlayerBlip") or getElementData(blip,"adminTentBlip") then
destroyElement(blip)
end
end

	if getElementData(localPlayer,"adminShowCars") then
		local carsStream =  getElementsByType ( "vehicle",root,true ) 
		for i, car in ipairs(carsStream) do
		local blip = createBlipAttachedTo ( car, 55, 2 ,255,0,0  )
		setElementData(blip,"adminCarBlip",true,false)
		end
	end



	if getElementData(localPlayer,"adminShowPlayers") then
		local playersStream =  getElementsByType ( "player",root,true )
		for i, player in ipairs(playersStream) do
			if player ~=localPlayer then
				local blip = createBlipAttachedTo ( player, 0, 2 ,255,0,0  )
				setElementData(blip,"adminPlayerBlip",true,false)
			end
		end
	end



	if getElementData(localPlayer,"adminShowTents") then
		local tentsStream =  getElementsByType ( "colshape",root,true )
		for i, tent in ipairs(tentsStream) do
			if getElementData(tent,"tent") then
				local blip = createBlipAttachedTo ( tent, 42, 2 ,255,0,0  )
				setElementData(blip,"adminTentBlip",true,false)
			end
		end
	end
	
end
adminMapFunc()
setTimer(adminMapFunc,10000,0)