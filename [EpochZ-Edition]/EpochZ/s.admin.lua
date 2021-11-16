function adminGive(kp)
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(kp)),aclGetGroup("Admin"))
if isAdmin then
triggerClientEvent(kp,"showGivePanel",kp)
end
end

function onPlayerJoinBind ()
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))
if isAdmin then
	bindKey ( source, "u", "down", adminGive )
	setElementData(source,"adminMap",true)
end
end
addEventHandler ( "onPlayerLogin", getRootElement(), onPlayerJoinBind  )	
function onResourceStartBind  ()
  for i,v in ipairs ( getElementsByType("player")) do
  local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(v)),aclGetGroup("Admin"))
if isAdmin then
  bindKey ( v, "u", "down", adminGive )
  setElementData(v,"adminMap",true)
end
end
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), onResourceStartBind )	



function adminOnGive(pName, item, quantity,isCar,name)

local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))
if isAdmin then
	if getPlayerFromName(pName) then
		if isCar then
		exports.epz_carspawner:CarSpawner ( getPlayerFromName(pName), "spawnCar", item )
		else
			setElementData(getPlayerFromName(pName), item, tonumber(quantity))
			outputChatBox(""..quantity.." "..item.." emitido para "..pName, source, 255, 255, 0)
			outputChatBox("O admin deu a você "..quantity.." "..item, getPlayerFromName(pName), 255, 255, 0)
		end
		
		for i,v in ipairs ( getElementsByType("player")) do
		local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(v)),aclGetGroup("Admin"))
		if isAdmin then
		if v~=source and v~= getPlayerFromName(pName) then
		outputChatBox(getPlayerName(source).." Deu "..quantity.." "..item.." para "..pName, v, 255, 255, 0)
		end
		end
		end
		
	else
	outputChatBox("O Player saiu ou mudou o apelido", source, 255, 0, 0)
	end	
end

end

addEvent("onGive", true)
addEventHandler("onGive", root,adminOnGive)






function adminTeleport(col)
if not col then return end
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))
if isAdmin then
	if isElement(col) then
	local x,y,z = getElementPosition(col)
	setElementPosition(source,x,y,z+2)
	else
	outputChatBox("Item não encontrado", source, 255, 0, 0)
	end	
end

end

addEvent("adminTeleport", true)
addEventHandler("adminTeleport", root,adminTeleport)


function adminCarBlow(car)
if not car then return end
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))
if isAdmin then
	if isElement(car) then
	local isExploded = getElementData(car,"isExploded",false) or false
	if not isExploded then
		local col = getElementData(car,"parent")
		local x1,y1,z1 = getElementPosition(car)
		setTimer(respawnDayZVehicle,1000,1,car)
		setElementData(col,"deadVehicle",true) --client
		setElementData(car,"isExploded",true)
		createExplosion (x1+4,y1+1,z1,4)
		createExplosion (x1+2,y1-4,z1,4)
		createExplosion (x1-1,y1+5,z1,4)
		createExplosion (x1-4,y1,z1-2,4)
	end
	else
	outputChatBox("Item não encontrado", source, 255, 0, 0)
	end	
end

end

addEvent("adminCarBlow", true)
addEventHandler("adminCarBlow", root,adminCarBlow)


function clearSKILLToPlayer(player,group)

if player then

setElementData(player,"SKILL_ARMORTS",false)
setElementData(player,"SKILL_CARTRADE",false)
setElementData(player,"SKILL_EXP",false)
setElementData(player,"SKILL_MAXMEMBERS",false)
setElementData(player,"mayInvite",false)

end

if group and not player then
local members,groupInfo = getGroupInfo(group)
if not members then return end 
for index, playerInfo in ipairs(members) do
if playerInfo and playerInfo.player then

setElementData(playerInfo.player,"SKILL_ARMORTS",false)
setElementData(playerInfo.player,"SKILL_CARTRADE",false)
setElementData(playerInfo.player,"SKILL_EXP",false)
setElementData(playerInfo.player,"SKILL_MAXMEMBERS",false)
setElementData(playerInfo.player,"mayInvite",false)
end
end
end
end


function getGroupInfo(groupName)
local membersTable = {}
local groupMembers = executeSQLQuery("SELECT * FROM `group_users` WHERE `groupName` =?",tostring(groupName))
local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName))

for i,group in pairs(groupMembers) do 
local memberAccount = getAccount ( tostring(group.userAccount) )

if memberAccount then
 isPlayerOnline = getAccountPlayer ( memberAccount ) 
else
 isPlayerOnline = false
end

if isPlayerOnline then
table.insert(membersTable,{
groupName = group.groupName,
userProfit = group.userProfit,
userLvl = group.userLvl,
userRole = group.userRole,
userNick = group.userNick,
userAccount = group.userAccount,
player = isPlayerOnline
})
else
table.insert(membersTable,{
groupName = group.groupName,
userProfit = group.userProfit,
userLvl = group.userLvl,
userRole = group.userRole,
userNick = group.userNick,
userAccount = group.userAccount,
player = false
})
end

end



return membersTable,groupInfo


end

function getGroups()
local groupInfo = executeSQLQuery("SELECT * FROM `groups` ORDER BY `groupLvl` DESC")

triggerClientEvent(source,"loadGroupsADMIN",source,groupInfo)
end
addEvent("getGroups", true)
addEventHandler("getGroups", getRootElement(), getGroups)


function loadGroupPlayers(groupName)
local membersTable = {}
local groupMembers = executeSQLQuery("SELECT * FROM `group_users` WHERE `groupName` =?",tostring(groupName))
if not groupMembers[1] then return end
for i,group in pairs(groupMembers) do 
local memberAccount = getAccount ( tostring(group.userAccount) )

if memberAccount then
 isPlayerOnline = getAccountPlayer ( memberAccount ) 
else
 isPlayerOnline = false
end

if isPlayerOnline then
table.insert(membersTable,{
groupName = group.groupName,
userProfit = group.userProfit,
userLvl = group.userLvl,
userRole = group.userRole,
userNick = group.userNick,
userAccount = group.userAccount,
player = isPlayerOnline
})
else
table.insert(membersTable,{
groupName = group.groupName,
userProfit = group.userProfit,
userLvl = group.userLvl,
userRole = group.userRole,
userNick = group.userNick,
userAccount = group.userAccount,
player = false
})
end

end

triggerClientEvent(source,"loadPlayers",source,membersTable)
end
addEvent("loadGroupPlayers", true)
addEventHandler("loadGroupPlayers", getRootElement(), loadGroupPlayers)


function adminRemoveGroup(groupName)

local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))
if isAdmin then

local membersTable,groupInfo = getGroupInfo(tostring(groupName))
clearSKILLToPlayer(false,groupName)
for i,playerData in pairs(membersTable) do 

if playerData.player then
setElementData(playerData.player,"group",false)
setElementData(playerData.player,"groupUserStatus",false)
setElementData(playerData.player,"groupProfit",0)
outputChatBox("Você foi expulso do grupo #FFFF00"..tostring(groupName).." #FFFFFFpor causa de: #DCDCDCАadmin excluiu o grupo ",playerData.player,255,255,255,true)
triggerClientEvent(playerData.player, "groupRemoved", playerData.player)

else
local accountPlayer  = getAccount ( playerData.userAccount )
if accountPlayer then
setAccountData ( accountPlayer, "group", false )
setAccountData ( accountPlayer, "groupUserStatus", false )
setAccountData ( accountPlayer, "groupMessage", "Você foi expulso do grupo #FFFF00"..tostring(groupName).." #FFFFFFpor motivos de: #DCDCDCАadmin excluiu o grupo" )
end
end

end

executeSQLQuery("DELETE FROM `group_users` WHERE `groupName`=? ",tostring(groupName) )
executeSQLQuery("DELETE FROM `groups` WHERE `groupName`=? ",tostring(groupName) )
--executeSQLQuery("DELETE FROM `groups_skills` WHERE `groupName`=? ",tostring(groupName) )


outputChatBox("GRUPO REMOVIDO DE: ",source)
triggerEvent("getGroups",source)
end
end

addEvent("adminRemoveGroup", true)
addEventHandler("adminRemoveGroup", getRootElement(), adminRemoveGroup)




function removeOldTents(ps,comm)
	local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin"))
	if isAdmin then
	
		local vehicleManager = getAccount("vehicleManagerEpochZ","EpochZVhMngrUJ$GH")
		local countRemoveTents = 0
		local tentamount = getAccountData(vehicleManager,"tentamount") or 0 
		for i = 1, tentamount do
		
			acc = getAccount("EpochZtent_number_"..i,"EpochZtntNmb$Uhjm")
		
			if acc and getAccountData(acc,"removed") then 
		
				removeAccount(acc)
				countRemoveTents=countRemoveTents+1
				outputConsole ( "remove tent id:"..i,ps)
			end
		end
		outputChatBox("REMOVER TENDASs("..tentamount.."): "..countRemoveTents)
		
		
		
		
		
	end

end
addCommandHandler ( "removeOT", removeOldTents )


function removeOldAccounts(ps,comm)
	local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin"))
	if isAdmin then
	
		local accountsRemove = 0
		local playerAccounts = 0
		local accounts = getAccounts ()
		for i,acc in pairs(accounts) do 
		
			if acc and getAccountData(acc,"playerID") then 
			playerAccounts=playerAccounts+1
			if not getAccountData(acc,"playerDatas") then
			
				removeAccount(acc)
				accountsRemove=accountsRemove+1
				outputConsole ( "remove account id:"..i,ps)
			end
			end
		end
		outputChatBox("REMOVER CONTAS("..playerAccounts.."): "..accountsRemove)
		
		
		
		
		
	end

end
addCommandHandler ( "removeOA", removeOldAccounts )

local ped
function testFunc(ps,comm)
	local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin"))
	if isAdmin then
	
		local x,y,z = getElementPosition(ps)
		local rotX,rotY,rotZ = getElementRotation(ps)
		local ped = createPed(0,x,y+5,z+.2,rotZ)
		setTimer(function() setElementFrozen ( ped, true ) end,2000,1)
		
		setPedHeadless(ped,true)
		
		killPed(ped)
	end

end
addCommandHandler ( "testFunc", testFunc )




