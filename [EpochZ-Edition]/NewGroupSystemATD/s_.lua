function getGroups(player)
--outputChatBox("getGroups")

if not player then
local groupsList = executeSQLQuery("SELECT * FROM `groups` " )
return groupsList
else
local groupsList = executeSQLQuery("SELECT * FROM `groups` ORDER BY `groupLvl` DESC LIMIT 50 " )
triggerClientEvent(player, "loadGroups", player, groupsList)
end
end
addEvent("getGroups", true)
addEventHandler("getGroups", getRootElement(), getGroups)


---executeSQLQuery("CREATE TABLE IF NOT EXISTS `group_users` (`groupName` TEXT, `userProfit` INT, `userLvl` INT, `userRole` TEXT, `userNick` TEXT, `userAccount` TEXT)")
---executeSQLQuery("CREATE TABLE IF NOT EXISTS `groups` (`groupName` TEXT, `groupLvl` INT, `groupMembers` INT, `groupMaxMembers` INT, `GroupAGR` TEXT, `groupCreatedDate` TEXT)")
---executeSQLQuery("CREATE TABLE IF NOT EXISTS `groups_skills` (`groupName` TEXT, `EMBLEM` INT, `ARMORTS` INT, `CARTRADE` INT, `MAXMEMBERS` INT, `EXP` INT)")
 
 
function addGroupPlayerProfit(groupName)
if source and isElement(source) then
local profit = getElementData(source,"groupProfit",false) or false
profit=tonumber(profit)
if profit and profit~=nil and type(profit)=="number" then
local playerAccount = getPlayerAccount(source)
if playerAccount then 
local accountName = getAccountName(playerAccount)
local groupMember = executeSQLQuery("SELECT * FROM `group_users` WHERE `groupName` =? AND `userAccount` =?",tostring(groupName),tostring(accountName))
if groupMember and profit>groupMember[1].userProfit then
executeSQLQuery("UPDATE `group_users` SET `userProfit`=? WHERE `groupName`=? AND  `userAccount`=?",tonumber(profit), tostring(groupName) , tostring(accountName) )
updateGroupLVL(groupName,profit-groupMember[1].userProfit)
end
end
end
end

end
addEvent("addGroupPlayerProfit", true)
addEventHandler("addGroupPlayerProfit", getRootElement(), addGroupPlayerProfit)





local groupOneLVL = 15000
function updateGroupLVL(groupName,addExp)
--outputChatBox("addExp: "..addExp)
if not groupName then return end
if addExp<=0 then  return end
local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName))

if groupInfo and groupInfo[1].groupExp then
local groupEXP = 0
executeSQLQuery("UPDATE `groups` SET `groupExp`=? WHERE `groupName`=? ",tonumber(groupInfo[1].groupExp+addExp), tostring(groupName) )

						
			local groupLvl = math.floor((groupInfo[1].groupExp+addExp)/groupOneLVL)
	
			if groupInfo[1].groupLvl < groupLvl then
			local plusLVL =groupLvl - groupInfo[1].groupLvl
			if  groupInfo[1].clicks then
			executeSQLQuery("UPDATE `groups` SET `clicks`=? WHERE `groupName`=?",tonumber(groupInfo[1].clicks+plusLVL), tostring(groupInfo[1].groupName) )
			--outputChatBox("NEW G LVL: "..plusLVL)
			executeSQLQuery("UPDATE `groups` SET `groupLvl`=? WHERE `groupName`=?",tonumber(groupInfo[1].groupLvl+plusLVL), tostring(groupName) )
			end
			
			
	
			end
			


end

end




function invitePlayer(groupName,invitedPlayer,typeCall)
local isOwner = getElementData(source,"groupUserStatus") or false
local groupOwner = getElementData(source,"group",false) or false
if not groupOwner then
outputChatBox("Erro: function: invitePlayer. Type: not groupOwner. Diga ao administrador do servidor",source)
return
end
if groupName~=groupOwner then
outputChatBox("Erro: function: invitePlayer. Type: groupName~=groupOwner. Diga ao administrador do servidorа",source)
return
end
if isOwner and isOwner=="OWNER" or isOwner=="MODER" or isOwner=="PARTY"  then
local playerNick= getPlayerName(invitedPlayer)
if isElement(invitedPlayer) and playerNick then

local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName))
if groupInfo[1] then 
if groupInfo[1].groupMembers>=groupInfo[1].groupMaxMembers then
outputChatBox("Группа переполнена!",source)
return
end
end
--outputChatBox("SERVER: "..playerNick)
setElementData(invitedPlayer,"groupInvite",tostring(groupName))
setElementData(invitedPlayer,"groupInviteOwner",source)
if isOwner=="OWNER" or isOwner=="MODER" then
setElementData(invitedPlayer,"groupInviteOwnerSTATUS",true)
end
outputChatBox("#FF0000"..getPlayerName(invitedPlayer).." #FFFFFFfoi convidado para o grupo: #FFFF00"..groupName,source,255,255,255,true)
triggerClientEvent(invitedPlayer, "onPlayerInvite", invitedPlayer,source,groupOwner)
if typeCall == 1 then
triggerClientEvent(source, "refreshPlayersOnInviteList", source)
end
end
else
outputChatBox("Você não é membro, proprietário ou suplente de um grupo "..groupName,source)
end
end

addEvent("invitePlayer", true)
addEventHandler("invitePlayer", getRootElement(), invitePlayer)


function invitePlayerCancel(groupName,owner)
if owner and isElement(owner) then
local groupOwner = getElementData(owner,"group",false) or false
if groupOwner  and groupOwner == groupName then
outputChatBox("#FF0000"..getPlayerName(source).." #FFFFFFrecusou seu convite para o grupo: #FFFF00"..groupName,owner,255,255,255,true)
end
end
end

addEvent("invitePlayerCancel", true)
addEventHandler("invitePlayerCancel", getRootElement(), invitePlayerCancel)


function getPlayerInfo(playerAcc)
local account = getAccount(playerAcc)
if account then
dataTable= {}
dataTable["progress.clicks"] = getAccountData(account,"progress.clicks")
dataTable["progress.clicksOFF"] = getAccountData(account,"progress.clicksOFF")
dataTable["progress.clicksOFF"] = getAccountData(account,"progress.clicksOFF")
dataTable["playerlvl"] = getAccountData(account,"playerlvl")
dataTable["playerexp"] = getAccountData(account,"playerexp")
dataTable["stat.zombieskilledMax"] = getAccountData(account,"stat.zombieskilledMax")
dataTable["stat.murdersMax"] = getAccountData(account,"stat.murdersMax")
dataTable["stat.banditskilledMax"] = getAccountData(account,"stat.banditskilledMax")
dataTable["stat.alivetimeMax"] = getAccountData(account,"stat.alivetimeMax")
dataTable["stat.zombieskilled"] = getAccountData(account,"stat.zombieskilled")
dataTable["stat.murders"] = getAccountData(account,"stat.murders")
dataTable["stat.banditskilled"] = getAccountData(account,"stat.banditskilled")
dataTable["stat.alivetime"] = getAccountData(account,"stat.alivetime")

dataTable["progress.medik"] = getAccountData(account,"progress.medik")
dataTable["progress.attacker"] = getAccountData(account,"progress.attacker")
dataTable["progress.sniper"] = getAccountData(account,"progress.sniper")
dataTable["progress.enginer"] = getAccountData(account,"progress.enginer")
dataTable["progress.economist"] = getAccountData(account,"progress.economist")
dataTable["progress.djagernaut"] = getAccountData(account,"progress.djagernaut")
dataTable["progress.boec"] = getAccountData(account,"progress.boec")
dataTable["progress.automech"] = getAccountData(account,"progress.automech")
else
--outputChatBox("NO ACC")
end
--outputChatBox("LOAD")
triggerClientEvent(source, "onLoadPlayerInfo", source, dataTable,false)
end

addEvent("getPlayerInfo", true)
addEventHandler("getPlayerInfo", getRootElement(), getPlayerInfo)


--[[
d: day (01-31)
h: hour (00-23)
i: minute (00-59)
m: month (01-12)
s: second (00-59)
w: shortened day of the week (Su-Mo)
W: day of the week (Sunday-Monday)
y: shortened year (e.g. 09)
Y: year (e.g. 2009)
]]


function createGroup(owner,groupName,groupStatus)

if not groupName then return end
if not owner then return end

for i,group in pairs(getGroups()) do 
if group.groupName == groupName then
outputChatBox("Já existe um grupo com o mesmo nome!",owner)
return
end
end
-- `SKILL_EMBLEM`, `SKILL_ARMORTS`, `SKILL_CARTRADE`, `SKILL_MAXMEMBERS`, `SKILL_EXP`,`SKILL_HACK`, `clicks`, `clicksOFF`, `groupExp`
executeSQLQuery("INSERT INTO `groups`(`groupName`,`groupLvl`,`groupMembers`,groupMaxMembers,`GroupAGR`,`groupCreatedDate`,`SKILL_EMBLEM`, `SKILL_ARMORTS`, `SKILL_CARTRADE`, `SKILL_MAXMEMBERS`, `SKILL_EXP`, `SKILL_HACK`, `clicks`, `clicksOFF`, `groupExp`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", tostring(groupName), 0, 1,5,tostring(groupStatus),tostring(FormatDate("d.m.y") or "DATE"),tonumber(0),tonumber(0),tonumber(0),tonumber(0),tonumber(0),tonumber(0),tonumber(0),tonumber(0),tonumber(0) )


local ownerlvl =  getElementData(owner,"playerlvl") or 0
local ownerNick = getPlayerName(owner)
local ownerAccount = getPlayerAccount ( owner )
local ownerAccountName = getAccountName ( ownerAccount )

executeSQLQuery("INSERT INTO `group_users`(`groupName`,`userProfit`,`userLvl`,userRole,`userNick`,`userAccount`) VALUES(?,?,?,?,?,?)", tostring(groupName), 0, tonumber(ownerlvl),"Основатель",tostring(ownerNick),tostring(ownerAccountName) )



outputChatBox("#FF0000"..getPlayerName(owner).." #FFFFFFfundou um novo grupo: #FFFF00"..groupName,getRootElement(),255,255,255,true)
setElementData(owner,"group",tostring(groupName))
setElementData(owner,"groupUserStatus","OWNER")
setElementData(owner,"groupProfit",0)
setSKILLSToPlayer(groupName,owner)
triggerClientEvent(owner, "groupCreated", owner, groupName)
triggerClientEvent(owner, "loadGroups", owner, getGroups())
setInvited(owner,groupName)
end

addEvent("createGroup", true)
addEventHandler("createGroup", getRootElement(), createGroup)



function addPlayeToGroup(player,groupName)
if player then
local playerLvl = getElementData(player,"playerlvl",false) or false
playerLvl=tonumber(playerLvl)
if not playerLvl or playerLvl ==nil then return end
local playerNick= getPlayerName(player)
local playerAccountName = getAccountName(getPlayerAccount(player))
local playerStatus = "НовичOK"
local invOwner  = getElementData(player,"groupInviteOwnerSTATUS") or false
if invOwner then
playerStatus = "Участник"
end


executeSQLQuery("INSERT INTO `group_users`(`groupName`,`userProfit`,`userLvl`,userRole,`userNick`,`userAccount`) VALUES(?,?,?,?,?,?)", tostring(groupName), 0, playerLvl,tostring(playerStatus),tostring(playerNick),tostring(playerAccountName) )

local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName) )

local membersInGrup = tonumber(groupInfo[1].groupMembers)

executeSQLQuery("UPDATE `groups` SET `groupMembers`=? WHERE `groupName`=?", tonumber(membersInGrup+1), tostring(groupName) )


outputChatBox("#FF0000"..getPlayerName(player).." #FFFFFFjuntou-se ao grupo: #FFFF00"..groupName,getRootElement(),255,255,255,true)
setElementData(player,"group",tostring(groupName))

if invOwner then
setElementData(player,"groupUserStatus","PARTY")
else
setElementData(player,"groupUserStatus","BEGGINER")
end
setElementData(player,"groupProfit",0)
setElementData(player,"groupInviteOwnerSTATUS",false)
setSKILLSToPlayer(groupName,player)
setInvited(false,groupName)
end
end

addEvent("addPlayeToGroup", true)
addEventHandler("addPlayeToGroup", getRootElement(), addPlayeToGroup)












function getGroupInfo(groupName,player,typeInfo)
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

if not player then

return membersTable,groupInfo
else
if typeInfo==1 then
triggerClientEvent(player, "loadGroupInfo", player, membersTable,groupInfo)
else
triggerClientEvent(player, "loadGroupInfo2", player, membersTable,groupInfo)
end
end
end

addEvent("getGroupInfo", true)
addEventHandler("getGroupInfo", getRootElement(), getGroupInfo)




function getGroupInfoSettings(groupName,player)
local membersTable = {}
local groupMembers = executeSQLQuery("SELECT * FROM `group_users` WHERE `groupName` =?",tostring(groupName) )
local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName) )

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

if not player then

return membersTable,groupInfo
else
triggerClientEvent(player, "loadGroupInfoSettings", player, membersTable,groupInfo)
end
end

addEvent("getGroupInfoSettings", true)
addEventHandler("getGroupInfoSettings", getRootElement(), getGroupInfoSettings)





function leavleGroup(player,groupName)
local playerAccount = getPlayerAccount ( player )
local playerAccountName = getAccountName ( playerAccount )
local isowner = getElementData(player,"groupUserStatus") or false
if isowner and isowner~="OWNER" then
local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName))

local membersInGrup = tonumber(groupInfo[1].groupMembers)

executeSQLQuery("UPDATE `groups` SET `groupMembers`=? WHERE `groupName`=?", tonumber(membersInGrup-1), tostring(groupName) )

local delte = executeSQLQuery("DELETE FROM `group_users` WHERE `userAccount`=? AND `groupName`=? ",tostring(playerAccountName),tostring(groupName) )


outputChatBox("#FF0000"..getPlayerName(player).." #FFFFFFdeixou o grupo: #FFFF00"..groupName,getRootElement(),255,255,255,true)
setElementData(player,"group",false)
setElementData(player,"groupUserStatus",false)
setElementData(player,"groupProfit",false)
clearSKILLToPlayer(player,false)
triggerClientEvent(player, "groupRemoved", player)

setInvited(false,groupName)
end
end

addEvent("leavleGroup", true)
addEventHandler("leavleGroup", getRootElement(), leavleGroup)




function removeGroup(owner,groupName)
local isowner = getElementData(owner,"groupUserStatus") or false

local group = getElementData(owner,"group") or false

if isowner =="OWNER" and group then

local membersTable,groupInfo = getGroupInfo(tostring(group))
clearSKILLToPlayer(false,group)
for i,playerData in pairs(membersTable) do 

if playerData.player then
setElementData(playerData.player,"group",false)
setElementData(playerData.player,"groupUserStatus",false)
setElementData(playerData.player,"groupProfit",0)
if playerData.player ~= owner then
outputChatBox("Você foi excluído do grupo #FFFF00"..tostring(groupName).." #FFFFFFsobre o motivo: #DCDCDCОo fundador deletou o grupo ",playerData.player,255,255,255,true)
triggerClientEvent(playerData.player, "groupRemoved", playerData.player)
end
else
local accountPlayer  = getAccount ( tostring(playerData.userAccount) )
if accountPlayer then
setAccountData ( accountPlayer, "group", nil )
setAccountData ( accountPlayer, "groupUserStatus", nil )
setAccountData ( accountPlayer, "groupMessage", "Você foi excluído do grupo #FFFF00"..tostring(groupName).." #FFFFFFпsobre o motivo: #DCDCDCОo fundador deletou o grupo" )
end
end

end

executeSQLQuery("DELETE FROM `group_users` WHERE `groupName`=? ",tostring(groupName) )
executeSQLQuery("DELETE FROM `groups` WHERE `groupName`=? ",tostring(groupName) )
--executeSQLQuery("DELETE FROM `groups_skills` WHERE `groupName`=? ",tostring(groupName) )


outputChatBox("#FF0000"..getPlayerName(owner).." #FFFFFFexcluiu o grupo: #FFFF00"..groupName,getRootElement(),255,255,255,true)
setElementData(owner,"group",false)
setElementData(owner,"groupUserStatus",false)
setElementData(owner,"groupProfit",0)
triggerClientEvent(owner, "groupRemoved", owner)

end

end

addEvent("removeGroup", true)
addEventHandler("removeGroup", getRootElement(), removeGroup)

--executeSQLQuery("DELETE FROM players WHERE name=?", playerName)

local userStatusTable = {
{"Заместитель","MODER"},
{"Участник","PARTY"},
{"НовичOK","BEGGINER"},
}

function setUserSatatus(owner,userAcc,nick,group,role)
if role ~=-1 then
newRole = userStatusTable[tonumber(role+1)][1]
local accountPlayer = getAccount(tostring(userAcc)) or false

if accountPlayer then

local player = getAccountPlayer(accountPlayer)
if player then
local playerGroup = getElementData(player,"group",false) or false

if playerGroup then
if playerGroup~=group then
outputChatBox("Este jogo OK não está em seu grupo!",owner)
getGroupInfoSettings(group,owner)
return
end
else
outputChatBox("Este jogo OK não está em seu grupo!",owner)
getGroupInfoSettings(group,owner)
return
end
executeSQLQuery("UPDATE `group_users` SET `userRole`=? WHERE `groupName`=? AND  `userAccount`=?",tostring(newRole), tostring(group) , tostring(userAcc) )
outputChatBox("Você atribuiu um jogador #FF0000"..nick.." #FFFFFF Para Rank: #0000FF"..newRole,owner,255,255,255,true)
outputChatBox("No grupo #FFFF00"..group.." #FFFFFFvocê foi atribuído a um novo Rank: #0000FF"..tostring(newRole),player,255,255,255,true)
setElementData(player,"groupUserStatus",userStatusTable[tonumber(role+1)][2])
getGroupInfoSettings(group,owner)

else


local playerAccount = getAccount ( tostring(userAcc))
if playerAccount then
executeSQLQuery("UPDATE `group_users` SET `userRole`=? WHERE `groupName`=? AND  `userAccount`=?",tostring(newRole), tostring(group) , tostring(userAcc) )

setAccountData(playerAccount,"groupUserStatus",userStatusTable[tonumber(role+1)][2])
setAccountData ( playerAccount, "groupMessage", "No grupo #FFFF00"..group.." #FFFFFFvocê foi atribuído a um novo Rank : #0000FF"..tostring(newRole) )

outputChatBox("Você atribuiu um jogador #FF0000"..nick.." #FFFFFF para o Rank: #0000FF"..newRole,owner,255,255,255,true)
getGroupInfoSettings(group,owner)
end
end
else
outputChatBox("Conta não encontrada",owner)
end
else
outputChatBox("Escolha um novo Rank!",owner)
end


end
addEvent("setUserSatatus", true)
addEventHandler("setUserSatatus", getRootElement(), setUserSatatus)

function removePlayerOnGroup(owner,playerAccountName,selectedNick,groupName)

	--outputChatBox("playerAccount: "..playerAccountName)
	local playerAccount = getAccount ( tostring(playerAccountName))

	if playerAccount then

		local player = getAccountPlayer ( playerAccount )
		if player  then
			local playerGroup = getElementData(player,"group") or false

			if playerGroup then

				if playerGroup == groupName  then
					local isOwner = getElementData(owner,"groupUserStatus") or false
					if isOwner =="OWNER" or isOwner =="MODER" then
						local isOwnerPlayer = getElementData(player,"groupUserStatus") or false
						if isOwnerPlayer and isOwnerPlayer=="OWNER" then return end
						local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName))
						local membersInGrup = tonumber(groupInfo[1].groupMembers)
						executeSQLQuery("UPDATE `groups` SET `groupMembers`=? WHERE `groupName`=?", tonumber(membersInGrup-1), tostring(groupName) )
						local delte = executeSQLQuery("DELETE FROM `group_users` WHERE `userAccount`=? AND `groupName`=? ",tostring(playerAccountName),tostring(groupName))
						setElementData(player,"group",false)
						setElementData(player,"groupUserStatus",false)
						setElementData(player,"groupProfit",0)
						clearSKILLToPlayer(player,false)
						setInvited(false,groupName)
						local ownerNick = getPlayerName(owner)
						outputChatBox("#FF0000"..ownerNick.." #FFFFFFexpulsou #FF0000"..getPlayerName(player).." #FFFFFFdo grupo #FFFF00"..groupName,getRootElement(),255,255,255,true)
						getGroupInfoSettings(groupName,owner)
						triggerClientEvent(player, "groupRemoved", player)

					else
						outputChatBox("Você não é o fundador ou representante deste grupo!",owner)
						return

					end
					
				else
				
					outputChatBox("Este jogador está em outro grupo!",owner)
					return
					
				end


			else
				outputChatBox("Este jogador não está em seu grupo.!",owner)
				return
			end

		else


			local isOwner = getElementData(owner,"groupUserStatus") or false
			if isOwner =="OWNER" or isOwner =="MODER" then


				local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(groupName))
				if groupInfo[1] and groupInfo[1].groupMembers then
					local membersInGrup = tonumber(groupInfo[1].groupMembers)

					executeSQLQuery("UPDATE `groups` SET `groupMembers`=? WHERE `groupName`=?", tonumber(membersInGrup-1), tostring(groupName) )
					local delte = executeSQLQuery("DELETE FROM `group_users` WHERE `userAccount`=? AND `groupName`=? ",tostring(playerAccountName),tostring(groupName))
					local playerAccount = getAccount ( tostring(playerAccountName))
					setAccountData ( playerAccount, "group", nil )
					setAccountData ( playerAccount, "groupUserStatus", nil )
					local ownerNick = getPlayerName(owner)
					setAccountData ( playerAccount, "groupMessage", "#FF0000"..ownerNick.." #FFFFFFexpulsou você do grupo #FFFF00"..tostring(groupName) )
					setInvited(false,groupName)
	
					outputChatBox("#FF0000"..ownerNick.." #FFFFFFexpulso #FF0000"..selectedNick.."#FFFFFF do grupo #FFFF00"..groupName,getRootElement(),255,255,255,true)
					getGroupInfoSettings(groupName,owner)
				end
			end

		end
	else
		outputChatBox("Conta não encontrada",owner)
		return
	end

end

addEvent("removePlayerOnGroup", true)
addEventHandler("removePlayerOnGroup", getRootElement(), removePlayerOnGroup)




function groupChat(message, messageType)
 --outputChatBox("messType: "..messageType) 
 cancelEvent()
  if messageType == 2 then
 
  local group = getElementData(source, "group") or false
    if not group then
      return
   end

    for i, player in ipairs(getElementsByType("player")) do
     local playerGroup = getElementData(player, "group") or false
	if playerGroup and playerGroup==group then
        outputChatBox("#FFFF00[GROUP]#FF0000" .. getPlayerName(source) .. ": #FFFF00" .. message, player, 255, 255, 22, true)
      end
    end
  end
end
addEventHandler("onPlayerChat", getRootElement(), groupChat)



function getSKILLSinfo(group,player)
if not group then return end
if not player then return end
local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(group))
if groupInfo and groupInfo[1].groupName then
triggerClientEvent(player, "setSKILLSinfo", player,groupInfo)
end
end
addEvent("getSKILLSinfo", true)
addEventHandler("getSKILLSinfo", getRootElement(), getSKILLSinfo)


function setSKILLSToPlayer(group,player)
local members,groupInfo = getGroupInfo(group)

if groupInfo[1] ==nil then return end

if groupInfo and groupInfo[1].groupName then

if player then
if groupInfo[1].SKILL_ARMORTS then
setElementData(player or source,"SKILL_ARMORTS",tonumber(groupInfo[1].SKILL_ARMORTS))
end
if groupInfo[1].SKILL_CARTRADE then
setElementData(player or source,"SKILL_CARTRADE",tonumber(groupInfo[1].SKILL_CARTRADE))
end
if groupInfo[1].SKILL_EXP then
setElementData(player or source,"SKILL_EXP",tonumber(groupInfo[1].SKILL_EXP))
end
if groupInfo[1].SKILL_HACK then
setElementData(player or source,"SKILL_HACK",tonumber(groupInfo[1].SKILL_HACK))
end

if groupInfo[1].SKILL_MAXMEMBERS then
setElementData(player or source,"SKILL_MAXMEMBERS",tonumber(groupInfo[1].SKILL_MAXMEMBERS))
end

else

if group and not player then

if not members then return end 
for index, playerInfo in ipairs(members) do
if playerInfo and playerInfo.player then

if groupInfo[1].SKILL_ARMORTS then
setElementData( playerInfo.player,"SKILL_ARMORTS",tonumber(groupInfo[1].SKILL_ARMORTS))
end
if groupInfo[1].SKILL_CARTRADE then
setElementData( playerInfo.player,"SKILL_CARTRADE",tonumber(groupInfo[1].SKILL_CARTRADE))
end
if groupInfo[1].SKILL_EXP then
setElementData( playerInfo.player,"SKILL_EXP",tonumber(groupInfo[1].SKILL_EXP))
end
if groupInfo[1].SKILL_HACK then
setElementData( playerInfo.player,"SKILL_HACK",tonumber(groupInfo[1].SKILL_HACK))
end
if groupInfo[1].SKILL_MAXMEMBERS then
setElementData( playerInfo.player,"SKILL_MAXMEMBERS",tonumber(groupInfo[1].SKILL_MAXMEMBERS))
end

end
end
end




end

end

end

function clearSKILLToPlayer(player,group)

if player then

setElementData(player,"SKILL_ARMORTS",false)
setElementData(player,"SKILL_CARTRADE",false)
setElementData(player,"SKILL_EXP",false)
setElementData(player,"SKILL_HACK",false)
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
setElementData(playerInfo.player,"SKILL_HACK",false)
setElementData(playerInfo.player,"SKILL_MAXMEMBERS",false)
setElementData(playerInfo.player,"mayInvite",false)
end
end
end
end

function addSkil(group,skillName)
if not group then return end
if not skillName then return end 
local group = getElementData(source,"group") or false
if group then
local isOwner = getElementData(source,"groupUserStatus") or false
if isOwner=="OWNER" then

local groupInfo = executeSQLQuery("SELECT * FROM `groups` WHERE `groupName` =?",tostring(group))

if groupInfo[1] then

local groupMaxMembers=groupInfo[1].groupMaxMembers or 10
local skillArmorTS = groupInfo[1].SKILL_ARMORTS or 0
local skillCarTrade = groupInfo[1].SKILL_CARTRADE or 0
local skillExp = groupInfo[1].SKILL_EXP or 0
local skillMech = groupInfo[1].SKILL_HACK or 0
local skillMaxMembers = groupInfo[1].SKILL_MAXMEMBERS or 0
local clicks = groupInfo[1].clicks or 0 
local clicksOFF = groupInfo[1].clicksOFF or 0

if clicks>=1 then


if skillName =="SKILL_MAXMEMBERS" then
executeSQLQuery("UPDATE `groups` SET `groupMaxMembers`=? WHERE `groupName`=?", tonumber(groupMaxMembers+1), tostring(group) )
executeSQLQuery("UPDATE `groups` SET `SKILL_MAXMEMBERS`=? WHERE `groupName`=?", tonumber(skillMaxMembers+1), tostring(group) )
setInvited(false,group)
elseif skillName =="SKILL_ARMORTS" then
executeSQLQuery("UPDATE `groups` SET `SKILL_ARMORTS`=? WHERE `groupName`=?", tonumber(skillArmorTS+1), tostring(group) )
elseif skillName =="SKILL_CARTRADE" then
executeSQLQuery("UPDATE `groups` SET `SKILL_CARTRADE`=? WHERE `groupName`=?", tonumber(skillCarTrade+1), tostring(group) )
elseif skillName =="SKILL_EXP" then
executeSQLQuery("UPDATE `groups` SET `SKILL_EXP`=? WHERE `groupName`=?", tonumber(skillExp+1), tostring(group) )
elseif skillName =="SKILL_HACK" then
executeSQLQuery("UPDATE `groups` SET `SKILL_HACK`=? WHERE `groupName`=?", tonumber(skillMech+1), tostring(group) )
end

executeSQLQuery("UPDATE `groups` SET `clicks`=? WHERE `groupName`=?", tonumber(clicks-1), tostring(group) )
executeSQLQuery("UPDATE `groups` SET `clicksOFF`=? WHERE `groupName`=?", tonumber(clicksOFF+1), tostring(group) )

getSKILLSinfo(group,source)
setSKILLSToPlayer(tostring(group))
end


end


end

end

end
addEvent("addSkil", true)
addEventHandler("addSkil", getRootElement(), addSkil)


function setInvited(player,group)
local members,groupInfo = getGroupInfo(group)
if player then 

if groupInfo[1] then 

if groupInfo[1].groupMembers>=groupInfo[1].groupMaxMembers then
setElementData(player,"mayInvite",false)
--outputChatBox("false")
else
if #members and #members>groupInfo[1].groupMembers then
setElementData(player,"mayInvite",false)
else
setElementData(player,"mayInvite",true)
end
--outputChatBox("true")
end
end

else

if members[1] then
 
for index, playerInfo in ipairs(members) do
if playerInfo and playerInfo.player then
if groupInfo[1].groupMembers>=groupInfo[1].groupMaxMembers then
setElementData(playerInfo.player,"mayInvite",false)
--outputChatBox("false")
else
if #members and #members>groupInfo[1].groupMembers then
setElementData(playerInfo.player,"mayInvite",false)
else
setElementData(playerInfo.player,"mayInvite",true)
end
--outputChatBox("true")
end

end
end

end

end


end



local saveloadUserData = {
{"group"},
{"groupUserStatus"}

}

addEventHandler("onResourceStart", resourceRoot, function()

	
	
  
  for index, player in ipairs(getElementsByType("player")) do
    local accountPlayer = getPlayerAccount ( player )
	
		  for index, data in ipairs(saveloadUserData) do
		local dataName = getAccountData ( accountPlayer, data[1] )
		if dataName then
		setElementData(player, data[1], dataName)
		end
		  end
 
  end

  
executeSQLQuery("CREATE TABLE IF NOT EXISTS `group_users` (`groupName` TEXT, `userProfit` INT, `userLvl` INT, `userRole` TEXT, `userNick` TEXT, `userAccount` TEXT)")
 

executeSQLQuery("CREATE TABLE IF NOT EXISTS `groups` (`groupName` TEXT, `groupLvl` INT, `groupMembers` INT, `groupMaxMembers` INT, `GroupAGR` TEXT, `groupCreatedDate` TEXT, `SKILL_EMBLEM` INT, `SKILL_ARMORTS` INT, `SKILL_CARTRADE` INT, `SKILL_MAXMEMBERS` INT, `SKILL_EXP` INT, `SKILL_HACK` INT, `clicks` INT, `clicksOFF` INT, `groupExp` INT)")

--executeSQLQuery("CREATE TABLE IF NOT EXISTS `groups_skills` (`groupName` TEXT)")
 
 

  
  
end)


addEventHandler ( "onResourceStop", resourceRoot, 
    function ( )
         for index, player in ipairs(getElementsByType("player")) do
    local accountPlayer = getPlayerAccount ( player )
	
		  for index, data in ipairs(saveloadUserData) do
		local dataName = getElementData ( player, data[1] )

		setAccountData(accountPlayer, data[1], dataName)
		
		  end
 
  end
   
   
   end)


  addEventHandler ( "onResourceStart", resourceRoot, 
    function ( )
         for index, player in ipairs(getElementsByType("player")) do
		  setPlayerTeam(player, playerTeam)
 
  end
   
   
   end) 
   
   
   
   function nickChangeHandler(oldNick, newNick)
   
   local group = getElementData(source,"group") or false
   
   if group then
   executeSQLQuery("UPDATE `group_users` SET `userNick`=? WHERE `groupName`=? AND  `userNick`=?",tostring(newNick), tostring(group) , tostring(oldNick) )
   
   end

end
addEventHandler("onPlayerChangeNick", getRootElement(), nickChangeHandler)
   
   
   -- добавили в группу - вышел - зашел - в группе - удалили из группы - вышел - в группе в которой был? 
 function quitPlayer (  quitType,  reason,  responsibleElement )
 local group = getElementData(source,"group") or false
 local accountPlayer = getPlayerAccount ( source )
		  for index, data in ipairs(saveloadUserData) do
			local dataName = getElementData ( source, data[1] ) or false
			setAccountData(accountPlayer, data[1], dataName)
		  end
 if group then
 
	
	
	local groupProfit = getElementData(source,"groupProfit",false) or false 
	if groupProfit then
	groupProfit=tonumber(groupProfit)
	if groupProfit~=nil and type(groupProfit)=="number" then
	local accountName = getAccountName(accountPlayer)
	local groupMember = executeSQLQuery("UPDATE `group_users` SET `userProfit`=? WHERE `groupName`=? AND  `userAccount`=?",tonumber(groupProfit),tostring(group),tostring(accountName))
	end
	end
	
	end
	
	
	
end
addEventHandler ( "onPlayerQuit", getRootElement(), quitPlayer )



playerTeam = createTeam("Players")
 function onPlayerLogin (  thePreviousAccount,  theCurrentAccount,  autoLogin )
 setPlayerTeam(source, playerTeam)
 local accountPlayer = getPlayerAccount ( source )

local group = getAccountData ( accountPlayer, "group" ) or false

local groupMessage = getAccountData( accountPlayer, "groupMessage" )
if groupMessage then
outputChatBox(groupMessage,source,255,255,255,true)
setAccountData(accountPlayer,"groupMessage",nil)
end
if group then
local playerAccountName = getAccountName  ( accountPlayer )
local playerNick = getPlayerName(source)
local groupMember = executeSQLQuery("SELECT * FROM `group_users` WHERE `groupName` =? AND `userAccount`=?",tostring(group),tostring(playerAccountName))
if groupMember[1]  then


if groupMember[1].userNick ~= playerNick then
 executeSQLQuery("UPDATE `group_users` SET `userNick`=? WHERE `groupName`=? AND  `userAccount`=?",tostring(playerNick), tostring(group) , tostring(playerAccountName) )
end

if groupMember[1].userProfit then

groupMember[1].userProfit=tonumber(groupMember[1].userProfit)

if groupMember[1].userProfit~=nil and type(groupMember[1].userProfit)=="number" then
setElementData(source,"groupProfit",groupMember[1].userProfit)
end

end


	for index, data in ipairs(saveloadUserData) do
		local dataName = getAccountData ( accountPlayer, data[1] )
		if dataName then
			setElementData(source, data[1], dataName)
		end
	end
	
setSKILLSToPlayer(group,source)
setInvited(player,group)	


else
setElementData(source, "group", false)
setElementData(source, "groupUserStatus", false)
		  
end




end




end
addEventHandler ( "onPlayerLogin", getRootElement(), onPlayerLogin )
   