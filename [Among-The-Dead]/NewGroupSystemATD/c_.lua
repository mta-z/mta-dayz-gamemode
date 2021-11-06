﻿
function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end



groupWindows = guiCreateWindow(0, 0, 600, 600, "Groups: Top 50", false) 
guiWindowSetSizable ( groupWindows, false )


groupTabs = guiCreateTabPanel ( 10, 40, 600, 600, false, groupWindows )
 tabGroups = guiCreateTab( "Groups: Top 50", groupTabs ) 
 tabGroup = guiCreateTab( "Group", groupTabs )
 guiSetEnabled ( tabGroup, false )
 tabGroupSkills = guiCreateTab( "Group skills", groupTabs )
 guiSetEnabled ( tabGroupSkills, false )
 tabGroupSettings = guiCreateTab( "Group settings", groupTabs ) 
 guiSetEnabled ( tabGroupSettings, false )
--tabGroupStatistic = guiCreateTab( "Статистика", groupTabs ) 
 --guiSetEnabled ( tabGroupSettings, false )
 
 
 local groupList = guiCreateGridList ( 40, 20, 500, 400, false,tabGroups )
 
 guiGridListSetSortingEnabled  (  groupList, false )
	--Create a players column in the list
	local columnGroupName = guiGridListAddColumn( groupList, "Title", 0.4 )
	local columnGroupLvl = guiGridListAddColumn( groupList, "Level", 0.15 )
	local columnGroupMembers = guiGridListAddColumn( groupList, "Members", 0.2 )
	local columnGroupCreatedDate = guiGridListAddColumn( groupList, "date", 0.17 )
	

 local groupListGroupMembers = guiCreateGridList ( 40, 120, 500, 300, false,tabGroup )
 
 guiGridListSetSortingEnabled  (  groupListGroupMembers, false )
	--Create a players column in the list
	local columnGroupMembersNick = guiGridListAddColumn( groupListGroupMembers, "Nick", 0.4 )
	local columnGroupMembersLvl = guiGridListAddColumn( groupListGroupMembers, "Level", 0.1 )
	local columnGroupMembersProfit = guiGridListAddColumn( groupListGroupMembers, "Benefit (experience)", 0.2 )
	local columnGroupMembersRole = guiGridListAddColumn( groupListGroupMembers, "Rank", 0.25 )
	


local leavleGroup = 	guiCreateButton ( 10, 430, 560, 30, "Leave the group", false, tabGroup )
local groupUserInformation = 	guiCreateButton ( 10, 470, 560, 30, "Player Statistics", false, tabGroup )


	
local createNewGroup = 	guiCreateButton ( 10, 430, 560, 30, "To create a group", false, tabGroups )




local groupInviteClient = guiCreateWindow(0, 0, 300, 250, "Confirm your group membership.", false) 
guiWindowSetSizable ( groupInviteClient, false )
guiSetVisible(groupInviteClient,false)
centerWindow(groupInviteClient)
local groupInviteText = guiCreateLabel(10, 50, 300, 300,"1234567890123456789012\ninvited you to the group Confirm your entry into the group\n1234567890",false,groupInviteClient)
guiSetFont (groupInviteText , "default-bold-small" )
guiLabelSetHorizontalAlign ( groupInviteText, "center" )

--guiSetSize ( groupInviteText, 100, 100, false )

--\n Лидер группы:1234567890123456789012\nУровень группы:123
local groupInviteClientINFOGROUP = 	guiCreateButton ( 10, 250-40*3, 280, 30, "Group Information:1234567890", false, groupInviteClient )
local groupInviteClientOK = 	guiCreateButton ( 10, 250-40*2, 280, 30, "Confirm", false, groupInviteClient )
local groupInviteClientCANCEL = 	guiCreateButton ( 10, 250-40, 280, 30, "Reject", false, groupInviteClient )






playerStatisticWin = guiCreateWindow(0, 25, 400, 500, "Player Statistics", false) 

guiWindowSetSizable ( playerStatisticWin, false )
centerWindow(playerStatisticWin)
guiSetVisible(playerStatisticWin,false)

local headline = {}
local startTop = 0

function addLineToWin(typeLine,id,text,text2,startTopPos,width,parent)
startTop=startTopPos
 headline[typeLine..""..id.."_img"] = guiCreateStaticImage ( 1, startTop+(20*id), width-20, 17, "b50.png", false, parent )
headline[typeLine..""..id..""] = guiCreateLabel(5, 0, width, 100,text,false,headline[typeLine..""..id.."_img"])
headline[typeLine..""..id.."_t"] = guiCreateLabel(0, 0, width-25, 100,text2,false,headline[typeLine..""..id.."_img"])

guiSetFont (headline[typeLine..""..id..""] , "default-bold-small" )
guiSetFont (headline[typeLine..""..id.."_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline[typeLine..""..id.."_t"],"right")
--startTop=startTop+20
end

function setLineText(typeLine,id,text)
guiSetText(headline[typeLine..""..id.."_t"],text)
end

addLineToWin("progress",1,"Free skill points:","-",10,400,playerStatisticWin)
addLineToWin("progress",2,"Skill points spent:","-",10,400,playerStatisticWin)
addLineToWin("progress",3,"Level:","-",10,400,playerStatisticWin)
addLineToWin("progress",4,"Experience:","-",10,400,playerStatisticWin)
addLineToWin("progress",5,"Experience the next level:","-",10,400,playerStatisticWin)
addLineToWin("progress",6,"Maximum killed zombies at a time:","-",10,400,playerStatisticWin)
addLineToWin("progress",7,"Maximum players killed at one time:","-",10,400,playerStatisticWin)
addLineToWin("progress",8,"Maximum killed marauders at once:","-",10,400,playerStatisticWin)
addLineToWin("progress",9,"Maximum lived at one time:","-",10,400,playerStatisticWin)
addLineToWin("progress",10,"Zombies killed during the entire game.:","-",10,400,playerStatisticWin)
addLineToWin("progress",11,"Players killed during the entire game.:","-",10,400,playerStatisticWin)
addLineToWin("progress",12,"Killed marauders for all the time of the game:","-",10,400,playerStatisticWin)
addLineToWin("progress",13,"Lived throughout the game:","-",10,400,playerStatisticWin)
addLineToWin("progress",14,"Stormtrooper:","/",10,400,playerStatisticWin)
addLineToWin("progress",15,"Medic:","/",10,400,playerStatisticWin)
addLineToWin("progress",16,"Sniper:","/",10,400,playerStatisticWin)
addLineToWin("progress",17,"Engineer:","/",10,400,playerStatisticWin)
addLineToWin("progress",18,"Economist:","/",10,400,playerStatisticWin)
addLineToWin("progress",19,"Juggernaut:","/",10,400,playerStatisticWin)
addLineToWin("progress",20,"Fighter:","/",10,400,playerStatisticWin)
addLineToWin("progress",21,"Mechanic:","/",10,400,playerStatisticWin)

addLineToWin("groupInfo",1,"Group name:","-",0,600,tabGroup)
addLineToWin("groupInfo",2,"Members of the group:","/",0,600,tabGroup)
addLineToWin("groupInfo",3,"Group Creation Date:","0.0.0",0,600,tabGroup)
addLineToWin("groupInfo",4,"Уровень группы:","-",0,600,tabGroup)




getGroupInfoWin = guiCreateWindow(0, 0, 600, 620, "Group Information:", false) 
guiWindowSetSizable ( getGroupInfoWin, false )
guiSetVisible(getGroupInfoWin,false)

addLineToWin("groupInfo2",1,"Group Information...:","-",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",2,"Members of the group:","/",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",3,"Group Creation Date:","0.0.0",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",4,"Group level:","-",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",5,"Experience:","-",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",6,"Experience the next level:","-",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",7,"Free skill points:","-",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",8,"Skill points spent:","-",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",9,"Useful links:","-/10",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",10,"Light armor transport:","-/10",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",11,"Group extension:","-/10",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",12,"Combat training:","-/10",5,600,getGroupInfoWin)
addLineToWin("groupInfo2",13,"Traces of hacking:","-/10",5,600,getGroupInfoWin)


local closePlayerStatisticWin =	guiCreateButton ( 20, 500-45 , 360, 30, "Close", false, playerStatisticWin )


local getGroupInfo =	guiCreateButton ( 10, 470, 560, 30, "Group Information", false, tabGroups )
	guiSetEnabled ( getGroupInfo, false )
	

 local groupListGroupMembersInfo = guiCreateGridList ( (600/2)-(500/2), 520-230, 500, 230, false,getGroupInfoWin )
 
 guiGridListSetSortingEnabled  (  groupListGroupMembersInfo, false )
	--Create a players column in the list
	local columnGroupMembersNickInfo = guiGridListAddColumn( groupListGroupMembersInfo, "Nick", 0.4 )
	local columnGroupMembersLvlInfo = guiGridListAddColumn( groupListGroupMembersInfo, "Level", 0.1 )
	local columnGroupMembersProfitInfo = guiGridListAddColumn( groupListGroupMembersInfo, "Benefit (experience)", 0.2 )
	local columnGroupMembersRoleInfo = guiGridListAddColumn( groupListGroupMembersInfo, "Rank", 0.25 )
	
local groupMemberStatistic = 	guiCreateButton ( 20, 540, 560, 30, "Player Statistics", false, getGroupInfoWin )
guiSetEnabled ( groupMemberStatistic, false )
local closegetGroupInfoWin =	guiCreateButton ( 20, 580, 560, 30, "Close", false, getGroupInfoWin )
guiSetEnabled ( getGroupInfo, true )

addEventHandler ( "onClientGUIClick", closePlayerStatisticWin, function()
 guiSetText(playerStatisticWin,"Статистика игрOKа")
guiSetVisible(playerStatisticWin,false)
guiSetEnabled ( groupMemberStatistic, true )
guiMoveToBack( groupWindows )
guiMoveToBack( groupInviteClient )
local row, col = guiGridListGetSelectedItem( groupListGroupMembers )
  local stm = guiGridListGetItemText(groupListGroupMembers,row, col)
  if stm and stm~="" and stm~=nil then
  guiSetEnabled ( groupUserInformation, true )
  end
end, false )


addEventHandler ( "onClientGUIClick", groupMemberStatistic, function()
 local row, col = guiGridListGetSelectedItem( groupListGroupMembersInfo )
  local stm = guiGridListGetItemText(groupListGroupMembersInfo,row, col)
  if stm~="" and stm~=nil then
  guiSetText(playerStatisticWin,"Player Statistics:"..stm)
  guiSetEnabled ( groupMemberStatistic, false )
  local player = getPlayerFromName(stm)
  if player then
  onLoadPlayerInfo(false,player)
  else
  local userAcc = guiGridListGetItemData ( groupListGroupMembersInfo, row, columnGroupMembersNickInfo)
  --outputChatBox(userAcc)
  triggerServerEvent("getPlayerInfo", getLocalPlayer(), tostring(userAcc)) 
  end
  end

end, false )
	
centerWindow (getGroupInfoWin)	

addEventHandler ( "onClientGUIClick", getGroupInfo, function()
 local row, col = guiGridListGetSelectedItem( groupList )
  local stm = guiGridListGetItemText(groupList,row, col)
  guiSetText(getGroupInfoWin,"Group Information:"..stm)
triggerServerEvent("getGroupInfo", getLocalPlayer(), tostring(stm),getLocalPlayer(),2) 
guiSetVisible(getGroupInfoWin,true)
guiSetEnabled ( getGroupInfo, false )
guiMoveToBack( groupWindows )
end, false )

addEventHandler ( "onClientGUIClick", closegetGroupInfoWin, function()
 guiSetText(groupMemberStatistic,"Player Statistics")
guiSetVisible(getGroupInfoWin,false)
guiSetEnabled ( getGroupInfo, true )
guiSetEnabled(groupInviteClientINFOGROUP,true) 
guiSetEnabled ( groupMemberStatistic, false )

end, false )



 	addEventHandler( "onClientGUIClick", groupListGroupMembersInfo, 
	
	function( btn228 )
  if btn228 ~= 'left' then return false end
  local row, col = guiGridListGetSelectedItem( source )
  local stm = guiGridListGetItemText(groupListGroupMembersInfo,row, col)


 
if stm == "" or stm == false then
stm =""
guiSetEnabled ( groupMemberStatistic, false )
guiSetText(groupMemberStatistic,"Player Statistics"..stm)
else
stm = ":"..stm
guiSetEnabled ( groupMemberStatistic, true )
end
 guiSetText(groupMemberStatistic,"Player Statistics"..stm)
  end, false )

  
  
function loadGroupInfo2(groupMembers,groupData )


 guiGridListClear ( groupListGroupMembersInfo )
  
--for i,groupMembers in pairs(groupMembers) do 


	for i,groupMember in pairs(groupMembers) do 
	
	
		local row = guiGridListAddRow ( groupListGroupMembersInfo )
		
--outputChatBox(groupMember.userAccount)
if groupMember.player then		
local playerNick = getPlayerName(groupMember.player)
 guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersNickInfo,tostring(playerNick) , false, false)
 
 
 
 guiGridListSetItemColor ( groupListGroupMembersInfo, row, columnGroupMembersNickInfo, 255, 255, 0  )
	
	if groupMember.userRole == "Newbie" then
	guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersProfitInfo,"-" , false, true)
	else
	local playerProfit = getElementData(groupMember.player,"groupProfit") or 0
	guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersProfitInfo,math.floor( tonumber(playerProfit) ) , false, true)
	end
	
	local playerLvl = getElementData(groupMember.player,"playerlvl") or 0
	guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersLvlInfo,math.floor( tonumber(playerLvl) ) , false, false)
	

	guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersRoleInfo,tostring(groupMember.userRole) , false, false)
 else
 
 
 guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersNickInfo,tostring(groupMember.userNick) , false, false)
  
	if groupMember.userRole == "Newbie" then
	guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersProfitInfo,"-" , false, true)
	else
	guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersProfitInfo,tonumber(groupMember.userProfit) , false, true)
	end
	
  
   guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersLvlInfo,tostring(groupMember.userLvl) , false, false)
    guiGridListSetItemText(groupListGroupMembersInfo, row, columnGroupMembersRoleInfo,tostring(groupMember.userRole) , false, false)
	
 end
 
 		guiGridListSetItemData ( groupListGroupMembersInfo, row, columnGroupMembersNickInfo, tostring(groupMember.userAccount) )


	

	

end



	for i,groupInfo in pairs(groupData) do 
	setLineText("groupInfo2",1,tostring(groupInfo.groupName))
	setLineText("groupInfo2",2,tostring(groupInfo.groupMembers).."/"..tostring(groupInfo.groupMaxMembers))
	setLineText("groupInfo2",3,tostring(groupInfo.groupCreatedDate))
	setLineText("groupInfo2",4,tostring(groupInfo.groupLvl))
	setLineText("groupInfo2",5,tostring(groupInfo.groupExp))
	setLineText("groupInfo2",6,tostring(math.floor((groupInfo.groupLvl*15000)+15000)))
	setLineText("groupInfo2",7,tostring(groupInfo.clicks))
	setLineText("groupInfo2",8,tostring(groupInfo.clicksOFF))
	setLineText("groupInfo2",9,tostring(groupInfo.SKILL_CARTRADE.."/10"))
	setLineText("groupInfo2",10,tostring(groupInfo.SKILL_ARMORTS.."/10"))
	setLineText("groupInfo2",11,tostring(groupInfo.SKILL_MAXMEMBERS.."/10"))
	setLineText("groupInfo2",12,tostring(groupInfo.SKILL_EXP.."/10"))
	setLineText("groupInfo2",13,tostring(groupInfo.SKILL_HACK.."/10"))
	break
	end

	

end
addEvent("loadGroupInfo2", true)
addEventHandler("loadGroupInfo2", getLocalPlayer(), loadGroupInfo2)



function roundTime(value)
	if value then
local hours = math.floor(value/60) -- Получаем количество полных часов
local minutes = value - (hours*60) -- Получаем оставшиеся минуты	
	if minutes <= 9 then 
	minutes = "0"..minutes
	end
		value = hours..":"..minutes
		return value
	end
	return false
end



function onLoadPlayerInfo(dataTable,player)
--outputChatBox(tostring(dataTable))
guiSetVisible(playerStatisticWin,true)
guiMoveToBack( getGroupInfoWin )
guiMoveToBack( groupWindows )

if not dataTable then
dataTable= {}
dataTable["progress.clicks"] = getElementData(player,"progress.clicks")
dataTable["progress.clicksOFF"] = getElementData(player,"progress.clicksOFF")
dataTable["progress.clicksOFF"] = getElementData(player,"progress.clicksOFF")
dataTable["playerlvl"] = getElementData(player,"playerlvl")
dataTable["playerexp"] = getElementData(player,"playerexp")
dataTable["stat.zombieskilledMax"] = getElementData(player,"stat.zombieskilledMax")
dataTable["stat.murdersMax"] = getElementData(player,"stat.murdersMax")
dataTable["stat.banditskilledMax"] = getElementData(player,"stat.banditskilledMax")
dataTable["stat.alivetimeMax"] = getElementData(player,"stat.alivetimeMax")
dataTable["stat.zombieskilled"] = getElementData(player,"stat.zombieskilled")
dataTable["stat.murders"] = getElementData(player,"stat.murders")
dataTable["stat.banditskilled"] = getElementData(player,"stat.banditskilled")
dataTable["stat.alivetime"] = getElementData(player,"stat.alivetime")

dataTable["progress.medik"] = getElementData(player,"progress.medik")
dataTable["progress.attacker"] = getElementData(player,"progress.attacker")
dataTable["progress.sniper"] = getElementData(player,"progress.sniper")
dataTable["progress.enginer"] = getElementData(player,"progress.enginer")
dataTable["progress.economist"] = getElementData(player,"progress.economist")
dataTable["progress.djagernaut"] = getElementData(player,"progress.djagernaut")
dataTable["progress.boec"] = getElementData(player,"progress.boec")
dataTable["progress.automech"] = getElementData(player,"progress.automech")

end

setLineText("progress",1,dataTable["progress.clicks"] or 0)
setLineText("progress",2,dataTable["progress.clicksOFF"] or 0)
local lvl = dataTable["playerlvl"] or 0
setLineText("progress",3,lvl)
setLineText("progress",4,dataTable["playerexp"] or 0)
setLineText("progress",5,((lvl*1200)+1200))
setLineText("progress",6,dataTable["stat.zombieskilledMax"] or 0)
setLineText("progress",7,dataTable["stat.murdersMax"] or 0)
setLineText("progress",8,dataTable["stat.banditskilledMax"] or 0)
setLineText("progress",9,roundTime(dataTable["stat.alivetimeMax"] or 0))
setLineText("progress",10,dataTable["stat.zombieskilled"] or 0)
setLineText("progress",11,dataTable["stat.murders"] or 0)
setLineText("progress",12,dataTable["stat.banditskilled"] or 0)
setLineText("progress",13,roundTime(dataTable["stat.alivetime"] or 0))
setLineText("progress",14,(dataTable["progress.attacker"] or 0).."/100")
setLineText("progress",15,(dataTable["progress.medik"] or 0).."/100")
setLineText("progress",16,(dataTable["progress.sniper"] or 0).."/100")
setLineText("progress",17,(dataTable["progress.enginer"] or 0).."/100")
setLineText("progress",18,(dataTable["progress.economist"] or 0).."/100")
setLineText("progress",19,(dataTable["progress.djagernaut"] or 0).."/100")
setLineText("progress",20,(dataTable["progress.boec"] or 0).."/100")
setLineText("progress",21,(dataTable["progress.automech"] or 0).."/100")
end
addEvent("onLoadPlayerInfo", true)
addEventHandler("onLoadPlayerInfo", getLocalPlayer(), onLoadPlayerInfo)









addEventHandler ( "onClientGUIClick", groupInviteClientINFOGROUP, function() 
local inviteGroup = getElementData(getLocalPlayer(),"groupInvite",false) or false
if inviteGroup then



	triggerServerEvent("getGroupInfo", getLocalPlayer(), tostring(inviteGroup),getLocalPlayer(),2) 
	guiSetVisible(getGroupInfoWin,true)
	guiSetEnabled ( groupInviteClientINFOGROUP, false )
	guiMoveToBack( groupInviteClient ) 
	guiMoveToBack( groupWindows )

else
guiSetVisible(groupInviteClient,false)
end

end, false )


local inviteTimer = false
addEventHandler ( "onClientGUIClick", groupInviteClientCANCEL, function() 
guiSetVisible(groupInviteClient,false)
showCursor(false)
local inviteGroup = getElementData(getLocalPlayer(),"groupInvite",false) or false
local inviteOwner = getElementData(getLocalPlayer(),"groupInviteOwner",false) or false
if inviteOwner and isElement(inviteOwner) then
triggerServerEvent("invitePlayerCancel", getLocalPlayer(), inviteGroup,inviteOwner) 
end
outputChatBox("#FFFFFFInvitation to the group: #FFFF00"..inviteGroup.." #FFFFFFwas rejected",255,255,255,true)
setElementData(getLocalPlayer(),"groupInvite",false)
setElementData(getLocalPlayer(),"groupInviteOwner",false)
setElementData(getLocalPlayer(),"groupInviteOwnerSTATUS",false)
if inviteTimer and isTimer(inviteTimer) then
killTimer(inviteTimer)
inviteTimer=false
end

end, false )

addEventHandler ( "onClientGUIClick", groupInviteClientOK, function()

guiSetVisible(groupInviteClient,false)
showCursor(false)
local inviteGroup = getElementData(getLocalPlayer(),"groupInvite",false) or false
if inviteGroup then
triggerServerEvent("addPlayeToGroup",getLocalPlayer(),getLocalPlayer(),inviteGroup)
setElementData(getLocalPlayer(),"groupInvite",false)
setElementData(getLocalPlayer(),"groupInviteOwner",false)
end
if inviteTimer and isTimer(inviteTimer) then
killTimer(inviteTimer)
inviteTimer=false
end


end, false )

function onPlayerInvite(groupOwner,groupName,groupLVL)
outputChatBox("#FF0000"..getPlayerName(groupOwner).." #FFFFFFinvites you to the group: #FFFF00"..groupName,255,255,255,true)
outputChatBox("#FFFFFFPress F1 to respond to the invitation.",255,255,255,true)
guiSetText(groupInviteText,getPlayerName(groupOwner).."\ninvited you to a group\n"..groupName)
guiSetText(groupInviteClientINFOGROUP,"Group Information:"..groupName)

if not inviteTimer then
inviteTimer= setTimer(function()
local groupInvite = getElementData(getLocalPlayer(),"groupInvite",false) or false
if groupInvite then
outputChatBox("#FFFFFFGroup Information......: #FFFF00"..groupInvite.." #FFFFFFwas rejected automatically by reason: Response time expired",255,255,255,true)

local inviteOwner = getElementData(getLocalPlayer(),"groupInviteOwner",false) or false
if inviteOwner and isElement(inviteOwner) then
triggerServerEvent("invitePlayerCancel", getLocalPlayer(), groupInvite,inviteOwner) 
end
setElementData(getLocalPlayer(),"groupInvite",false)
end
setElementData(getLocalPlayer(),"groupInviteOwnerSTATUS",false)
setElementData(getLocalPlayer(),"groupInviteOwner",false)
inviteTimer=false
end,300000,1) --300000
end
end
addEvent("onPlayerInvite", true)
addEventHandler("onPlayerInvite", getLocalPlayer(), onPlayerInvite)










	
local newGroupWindows = guiCreateWindow(0, 0, 300, 340, "Group creation", false) 
guiWindowSetSizable ( newGroupWindows, false )

local groupsStatus = {
"Hostile",
"Neutral",
"Friendly"
}

local helpCreateGroup = guiCreateLabel ( 0, 60, 300, 200, "The group name can consist only of letters.\nEnglish alphabet\nnumbers and symbols _ [ ] { } ( )", false, newGroupWindows )
guiLabelSetHorizontalAlign ( helpCreateGroup, "center" )
--guiLabelSetColor (helpCreateGroup, 200, 0, 0 )

local editBoxGroup = guiCreateEdit ( 50, 165, 200, 40, "A new group", false, newGroupWindows )
guiEditSetMaxLength ( editBoxGroup,12 )


local createGroup = 	guiCreateButton ( 50, 240, 200, 30, "To create a group", false, newGroupWindows )
local cancelGroup = 	guiCreateButton ( 50, 280, 200, 30, "Cancel", false, newGroupWindows )
guiSetVisible(newGroupWindows,false)

addEventHandler ( "onClientGUIClick", cancelGroup, function() 
guiSetVisible(newGroupWindows,false)
end, false )
	

centerWindow(newGroupWindows)	
centerWindow(groupWindows)
guiSetVisible(groupWindows,false)

addEventHandler ( "onClientGUIClick", createNewGroup, function() 
guiSetVisible(newGroupWindows,true)
guiMoveToBack( groupWindows )
end, false )





addEventHandler ( "onClientGUIClick", groupUserInformation, function()
 local row, col = guiGridListGetSelectedItem( groupListGroupMembers )
  local stm = guiGridListGetItemText(groupListGroupMembers,row, col)
  if stm~="" and stm~=nil then
  guiSetText(playerStatisticWin,"Player Statistics:"..stm)
  guiSetEnabled ( groupUserInformation, false )
  local player = getPlayerFromName(stm)
  if player then
  onLoadPlayerInfo(false,player)
  else
  local userAcc = guiGridListGetItemData ( groupListGroupMembers, row, columnGroupMembersNickInfo)
  triggerServerEvent("getPlayerInfo", getLocalPlayer(), tostring(userAcc)) 
  end
  end

end, false )





--`groupName` , `groupLvl` , `groupMembers` , `groupMaxMembers` , `GroupAGR` ,
-- `groupCreatedDate` , `SKILL_EMBLEM` , `SKILL_ARMORTS` , `SKILL_CARTRADE` , `SKILL_MAXMEMBERS`
-- , `SKILL_EXP` , `clicks` , `clicksOFF` , `groupExp` 


addLineToWin("groupProgress",1,"Group level:","-",0,600,tabGroupSkills)
addLineToWin("groupProgress",2,"Free skill points:","-",0,600,tabGroupSkills)
addLineToWin("groupProgress",3,"Skill points spent:","-",0,600,tabGroupSkills)
addLineToWin("groupProgress",4,"Experience:","-",0,600,tabGroupSkills)
addLineToWin("groupProgress",5,"Experience the next level:","-",0,600,tabGroupSkills)



local skilsName={
"SKILL_MAXMEMBERS",
"SKILL_ARMORTS",
"SKILL_CARTRADE",
"SKILL_EXP",
"SKILL_HACK",
}
function getPenSkill(skillName)
	for i,skill in pairs(skilsName) do 
	if skillName == skill then
	if  skilsName[i-1] then
	return skilsName[i-1] 
	else
	return false
	end
	end
	end
end


function addSkill(skillName)
--outputChatBox(skillName)
	local groupClicks = getElementData(getLocalPlayer(),"GROUP.CLICKS") or 0
	
    if groupClicks <=0 then 
	outputChatBox("Not enough skill points!")
	return
	end
	
	local playerSkill = getElementData(getLocalPlayer(),skillName) or 0
	if playerSkill>=10 then return end
	
local isOwner = getElementData(getLocalPlayer(),"groupUserStatus") or false
local groupName = getElementData(getLocalPlayer(),"group") or false
if isOwner and isOwner=="OWNER" then
 local penSkill =getPenSkill(skillName) or false
 if penSkill then
local playerSkill = getElementData(getLocalPlayer(),penSkill) or false
if playerSkill and playerSkill>=10 then
 triggerServerEvent("addSkil", getLocalPlayer(), tostring(groupName),tostring(skillName))
end
else 
 triggerServerEvent("addSkil", getLocalPlayer(), tostring(groupName),tostring(skillName))
 end
 end
    end


local skills={}
local startLeftPos=0
function createSkill(skillName,startTop,startLeft,headText,toolTipText,skill,percent,parent)
startLeftPos=startLeft+40
skills[skillName]={}
skills[skillName]["imgs"]={}

skills[skillName]["skillCount"] =guiCreateLabel(startLeft, startTop+5, 50, 40,"-/10",false,parent)
guiSetFont (skills[skillName]["skillCount"] , "default-bold-small" ) 
local header= guiCreateLabel(0, startTop-25, 576, 100,headText,false,parent)
guiSetFont (header , "default-bold-small" ) 
guiLabelSetHorizontalAlign (header,"center")

	for i=1,10,1 do 
	
	skills[skillName]['imgs'][i] = guiCreateStaticImage ( startLeftPos, startTop, 40, 25, "prgsBar.nil.png", false, parent )
	startLeftPos =startLeftPos+ 45	
	
	addEventHandler( "onClientMouseEnter", skills[skillName]['imgs'][i],    function(aX, aY)
	
	 local penSkill =getPenSkill(skillName) or false
 if penSkill then
local playerSkill = getElementData(getLocalPlayer(),penSkill) or false
if playerSkill and playerSkill>=10 then
guiSetSize(skills[skillName]['imgs'][i],40,30,false)
	showToolTip(toolTipText..math.floor((i*skill))..""..percent ,i.."/10",skills[skillName]["imgs"][i])
end
else 
guiSetSize(skills[skillName]['imgs'][i],40,30,false)
showToolTip(toolTipText..math.floor((i*skill))..""..percent ,i.."/10",skills[skillName]["imgs"][i])
 end
 
	
	
	end,false)	
	
	addEventHandler( "onClientMouseLeave", skills[skillName]['imgs'][i],  function(aX, aY) 
	guiSetSize(skills[skillName]['imgs'][i],40,25,false)
	hideToolTip() 
	
	end,false)
	
	end
 skills[skillName]["plus"] = guiCreateStaticImage ( startLeftPos+15, startTop, 25, 25, "plus.png", false, parent )
	
addEventHandler( "onClientMouseEnter", skills[skillName]["plus"],function(aX, aY)
local isOwner = getElementData(getLocalPlayer(),"groupUserStatus") or false
if isOwner and isOwner=="OWNER" then
 local penSkill =getPenSkill(skillName) or false
 if penSkill then
local playerSkill = getElementData(getLocalPlayer(),penSkill) or false
if playerSkill and playerSkill>=10 then
guiStaticImageLoadImage ( skills[skillName]["plus"], "plus.hover.png" )
end
else 
guiStaticImageLoadImage ( skills[skillName]["plus"], "plus.hover.png" )
 end 

 end
 end,false)
 
addEventHandler( "onClientMouseLeave", skills[skillName]["plus"],function(aX, aY) 
local isOwner = getElementData(getLocalPlayer(),"groupUserStatus") or false
if isOwner and isOwner=="OWNER" then
 local penSkill =getPenSkill(skillName) or false
 if penSkill then
local playerSkill = getElementData(getLocalPlayer(),penSkill) or false
if playerSkill and playerSkill>=10 then
guiStaticImageLoadImage ( skills[skillName]["plus"], "plus.png" )
end
else 
guiStaticImageLoadImage ( skills[skillName]["plus"], "plus.png" )
 end
end
 end,false) 

addEventHandler( "onClientGUIClick", skills[skillName]["plus"],function()
local isOwner = getElementData(getLocalPlayer(),"groupUserStatus") or false
if isOwner and isOwner=="OWNER" then
 local penSkill =getPenSkill(skillName) or false
 if penSkill then
local playerSkill = getElementData(getLocalPlayer(),penSkill) or false
if playerSkill and playerSkill>=10 then
 addSkill(skillName)
end
else 
 addSkill(skillName)
 end
 end
 end,false) 



	
 
end

createSkill("SKILL_MAXMEMBERS",180,20,"GROUP EXPANSION","Максимальное кол-во участников группы +",1,"",tabGroupSkills)

createSkill("SKILL_ARMORTS",180+70,20,"LIGHT TRANSPORT BOOKING","Damage taken by the vehicle -",2.5,"%",tabGroupSkills)

createSkill("SKILL_CARTRADE",250+70,20,"USEFUL LINKS","Purchase price of the vehicle -",5,"%",tabGroupSkills)

createSkill("SKILL_EXP",320+70,20,"COMBAT TRAINING","Group experience +",3,"%",tabGroupSkills)

createSkill("SKILL_HACK",390+70,20,"Hacks","The probability of breaking the safe +",2,"%",tabGroupSkills)



	



local toolTip={}
	toolTip['img'] = guiCreateStaticImage ( 0, 0, 250, 100, "b100.png", false )
toolTip['headerText'] = guiCreateLabel(0, 0, 250, 20,"-",false,toolTip['img'])
guiSetFont (toolTip['headerText'] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (toolTip['headerText'],"center")

toolTip['TolTipText'] = guiCreateLabel(0, 20, 250, 80,"-",false,toolTip['img'])
guiSetFont (toolTip['TolTipText'] , "default-bold" ) 
guiLabelSetHorizontalAlign (toolTip['TolTipText'],"center")
guiSetVisible(toolTip['img'],false )

function showToolTip(text,headerText,parent)

	local posx,posy = guiGetPosition(parent,false)
	local winPosX,winPosY = guiGetPosition(groupWindows,false)	
			
	guiMoveToBack(groupWindows)
	guiSetText(toolTip['headerText'],  headerText)		
	guiSetText(toolTip['TolTipText'],  text)
	local toolTipWidth  = guiLabelGetTextExtent(toolTip['TolTipText'])+50
	local toolTipHeigth  = guiLabelGetFontHeight ( toolTip['TolTipText'] )+40
	guiSetSize ( toolTip['img'], toolTipWidth, toolTipHeigth, false )
	guiSetSize ( toolTip['headerText'], toolTipWidth, toolTipHeigth, false )
	guiSetSize ( toolTip['TolTipText'], toolTipWidth, toolTipHeigth, false )
	guiSetPosition(toolTip['img'],(winPosX+posx+10)-((toolTipWidth/2)-40/2)  ,winPosY+posy+7+toolTipHeigth+35,false)
	
	guiSetVisible(toolTip['img'],true )
	
	
	
end
function hideToolTip()

	guiSetVisible(toolTip['img'],false )
	
end

--`groupName` , `groupLvl` , `groupMembers` , `groupMaxMembers` , `GroupAGR` ,
-- `groupCreatedDate` , `SKILL_EMBLEM` , `SKILL_ARMORTS` , `SKILL_CARTRADE` , `SKILL_MAXMEMBERS`
-- , `SKILL_EXP` , `clicks` , `clicksOFF` , `groupExp`
--createSkill("SKILL_CARTRADE",180,20,"ПОЛЕЗНЫЕ СВЯЗИ",tabGroupSkills)

--createSkill("SKILL_ARMORTS",180+70,20,"ЛЕГКАЯ БРОНЯ ТРАНСПОРТА",tabGroupSkills)

--createSkill("SKILL_MAXMEMBERS",250+70,20,"ГРУППОВОЕ РАСШИРЕНИЕ",tabGroupSkills)

--createSkill("SKILL_EXP",320+70,20,"БОЕВАЯ ПОДГОТОВКА",tabGroupSkills)

function setSKILLSinfo(groupData)
if not groupData then return end

local isOwner = getElementData(getLocalPlayer(),"groupUserStatus")

	for i,groupInfo in pairs(groupData) do 
	--outputChatBox(groupInfo.groupLvl)
	setLineText("groupProgress",1,tostring(groupInfo.groupLvl))
	setLineText("groupProgress",2,tostring(groupInfo.clicks))
	setLineText("groupProgress",3,tostring(groupInfo.clicksOFF))
	setLineText("groupProgress",4,tostring(groupInfo.groupExp))
	setLineText("groupProgress",5,tostring(math.floor((groupInfo.groupLvl*15000)+15000)))
	
	guiSetText(skills["SKILL_CARTRADE"]["skillCount"],tostring(groupInfo.SKILL_CARTRADE).."/10")
	guiSetText(skills["SKILL_ARMORTS"]["skillCount"],tostring(groupInfo.SKILL_ARMORTS).."/10")
	guiSetText(skills["SKILL_MAXMEMBERS"]["skillCount"],tostring(groupInfo.SKILL_MAXMEMBERS).."/10")
	guiSetText(skills["SKILL_EXP"]["skillCount"],tostring(groupInfo.SKILL_EXP).."/10")
	guiSetText(skills["SKILL_HACK"]["skillCount"],tostring(groupInfo.SKILL_HACK).."/10")
	
	-- выставляем цвет блOKированных кнопOK
	if tonumber(groupInfo.SKILL_MAXMEMBERS)<10 then
	guiStaticImageLoadImage ( skills["SKILL_ARMORTS"]["plus"], "plus.false.png" )
	else
	guiStaticImageLoadImage ( skills["SKILL_ARMORTS"]["plus"], "plus.png" )
	end
	
	if tonumber(groupInfo.SKILL_ARMORTS)<10 then
	guiStaticImageLoadImage ( skills["SKILL_CARTRADE"]["plus"], "plus.false.png" )
	else
	guiStaticImageLoadImage ( skills["SKILL_CARTRADE"]["plus"], "plus.png" )
	end
	
	if tonumber(groupInfo.SKILL_CARTRADE)<10 then
	guiStaticImageLoadImage ( skills["SKILL_EXP"]["plus"], "plus.false.png" )
	else
	guiStaticImageLoadImage ( skills["SKILL_EXP"]["plus"], "plus.png" )
	end
	
	if tonumber(groupInfo.SKILL_EXP)<10 then
	guiStaticImageLoadImage ( skills["SKILL_HACK"]["plus"], "plus.false.png" )
	else
	guiStaticImageLoadImage ( skills["SKILL_HACK"]["plus"], "plus.png" )
	end
	
	-- выставляем цвет полосы прогресса
	
		for i,img in pairs(skills["SKILL_MAXMEMBERS"]['imgs']) do
	if i<=tonumber(groupInfo.SKILL_MAXMEMBERS) then
	guiStaticImageLoadImage ( img, "prgsBar.full.png" )
	else
	guiStaticImageLoadImage ( img, "prgsBar.nil.png" )
	end
	
	end
	
	

	
	for i,img in pairs(skills["SKILL_ARMORTS"]['imgs']) do
	if tonumber(groupInfo.SKILL_MAXMEMBERS)<10 then
	guiStaticImageLoadImage ( img, "prgsBar.false.png" )
	else
	if i<=tonumber(groupInfo.SKILL_ARMORTS) then
	guiStaticImageLoadImage ( img, "prgsBar.full.png" )
	else
	guiStaticImageLoadImage ( img, "prgsBar.nil.png" )
	end
	end
	end
	
	
	
		for i,img in pairs(skills["SKILL_CARTRADE"]['imgs']) do
	if tonumber(groupInfo.SKILL_ARMORTS)<10 then
	guiStaticImageLoadImage ( img, "prgsBar.false.png" )
	else
	if i<=tonumber(groupInfo.SKILL_CARTRADE) then
	guiStaticImageLoadImage ( img, "prgsBar.full.png" )
	else
	guiStaticImageLoadImage ( img, "prgsBar.nil.png" )
	end
	end
	end
	
	
	for i,img in pairs(skills["SKILL_EXP"]['imgs']) do
	if tonumber(groupInfo.SKILL_CARTRADE)<10 then
	guiStaticImageLoadImage ( img, "prgsBar.false.png" )
	else
	if i<=tonumber(groupInfo.SKILL_EXP) then
	guiStaticImageLoadImage ( img, "prgsBar.full.png" )
	else
	guiStaticImageLoadImage ( img, "prgsBar.nil.png" )
	end
	end
	end
	
	for i,img in pairs(skills["SKILL_HACK"]['imgs']) do
	if tonumber(groupInfo.SKILL_EXP)<10 then
	guiStaticImageLoadImage ( img, "prgsBar.false.png" )
	else
	if i<=tonumber(groupInfo.SKILL_HACK) then
	guiStaticImageLoadImage ( img, "prgsBar.full.png" )
	else
	guiStaticImageLoadImage ( img, "prgsBar.nil.png" )
	end
	end
	end
	
		if isOwner~="OWNER" then
	guiStaticImageLoadImage ( skills["SKILL_CARTRADE"]["plus"], "plus.false.png" )
	guiStaticImageLoadImage ( skills["SKILL_ARMORTS"]["plus"], "plus.false.png" )
	guiStaticImageLoadImage ( skills["SKILL_MAXMEMBERS"]["plus"], "plus.false.png" )
	guiStaticImageLoadImage ( skills["SKILL_EXP"]["plus"], "plus.false.png" )
	guiStaticImageLoadImage ( skills["SKILL_HACK"]["plus"], "plus.false.png" )
	else
	setElementData(getLocalPlayer(),"GROUP.CLICKS",tonumber(groupInfo.clicks),false)
	end
	
	break
	end
	
	
end
addEvent("setSKILLSinfo", true)
addEventHandler("setSKILLSinfo", getLocalPlayer(), setSKILLSinfo)

 local groupListGroupMembersSettings = guiCreateGridList ( 40, 20, 500, 310, false,tabGroupSettings )
 
 guiGridListSetSortingEnabled  (  groupListGroupMembersSettings, false )
	--Create a players column in the list
	local columnGroupMembersNickSettings = guiGridListAddColumn( groupListGroupMembersSettings, "Nick", 0.4 )
	local columnGroupMembersLvlSettings = guiGridListAddColumn( groupListGroupMembersSettings, "Level", 0.1 )
	local columnGroupMembersProfitSettings = guiGridListAddColumn( groupListGroupMembersSettings, "Benefit (experience)", 0.2 )
	local columnGroupMembersRoleSettings = guiGridListAddColumn( groupListGroupMembersSettings, "Rank", 0.25 )


local setUserStatusGroup = 	guiCreateButton ( 10, 350, 560, 30, "Assign Rank", false, tabGroupSettings )	
local deleteUserGroup = 	guiCreateButton ( 10, 390, 560, 30, "Expel", false, tabGroupSettings )
local inviteNewPlayers = 	guiCreateButton ( 10, 430, 560, 30, "Invite new members", false, tabGroupSettings )
local removeGroup = 	guiCreateButton ( 10, 470, 560, 30, "Delete group", false, tabGroupSettings )

local inviteNewPlayersWin = guiCreateWindow(0, 0, 600, 440, "Invite new members", false) 
local sendInviteToPlayer = 	guiCreateButton ( 20, 350, 560, 30, "To invite", false, inviteNewPlayersWin )	
 guiSetEnabled ( sendInviteToPlayer, false )
local closeinviteNewPlayersWin = 	guiCreateButton ( 20, 390, 560, 30, "Close", false, inviteNewPlayersWin )
centerWindow(inviteNewPlayersWin)
guiSetVisible(inviteNewPlayersWin,false)

 local inviteNewPlayersGrid = guiCreateGridList ( 20, 40, 560, 300, false,inviteNewPlayersWin )
 
 
 guiGridListSetSortingEnabled  (  inviteNewPlayersGrid, false )
	--Create a players column in the list
	local inviteNewPlayersColNICK = guiGridListAddColumn( inviteNewPlayersGrid, "Nick", 0.4 )
	local inviteNewPlayersColLVL = guiGridListAddColumn( inviteNewPlayersGrid, "Level", 0.15 )
	local inviteNewPlayersColMURDERS = guiGridListAddColumn( inviteNewPlayersGrid, "Looting", 0.2 )
	local inviteNewPlayersColALIVETIME = guiGridListAddColumn( inviteNewPlayersGrid, "Lived", 0.2 )


	
addEventHandler ( "onClientGUIClick", sendInviteToPlayer, function() 
local row, col = guiGridListGetSelectedItem( inviteNewPlayersGrid )
  local stm = guiGridListGetItemText(inviteNewPlayersGrid,row, col)
  if stm~="" and stm~=nil then
  local invitedPlayer = guiGridListGetItemData ( inviteNewPlayersGrid,row, inviteNewPlayersColNICK)
  
  if invitedPlayer and isElement(invitedPlayer) then
  local group = getElementData(getLocalPlayer(),"group") or false
  if group then
  triggerServerEvent("invitePlayer", getLocalPlayer(),group,invitedPlayer,1 ) 
  end
  end
  end

 end, false )	

 
addEventHandler ( "onClientGUIClick", closeinviteNewPlayersWin, function() 
guiSetVisible(inviteNewPlayersWin,false)
guiSetEnabled ( inviteNewPlayers, true )
guiSetEnabled ( removeGroup, true )

 end, false )	

addEventHandler ( "onClientGUIClick", inviteNewPlayersGrid, function()
 local row, col = guiGridListGetSelectedItem( inviteNewPlayersGrid )
  local stm = guiGridListGetItemText(inviteNewPlayersGrid,row, col)
  if stm~="" and stm~=nil then
  guiSetText(sendInviteToPlayer,"To invite:"..stm)
  guiSetEnabled ( sendInviteToPlayer, true )
  else
  guiSetEnabled ( sendInviteToPlayer, false )
  guiSetText(sendInviteToPlayer,"To invite")
  end
end, false )
 


 
function refreshPlayersOnInviteList()
--outputChatBox("CLIENT: refreshPlayersOnInviteList")
guiGridListClear ( inviteNewPlayersGrid) 
for i,player in ipairs(getElementsByType("player")) do
if getElementData(player,"logedin") then
local playerGROUP = getElementData(player,"group") or false
local playerGROUPInvite = getElementData(player,"groupInvite") or false
if not playerGROUP and not playerGROUPInvite then
local playerName= getPlayerName(player)
local playerLVL = getElementData(player,"playerlvl") or 0
local playerMURDERS = getElementData(player,"murders") or 0 
local playerMURDERSSTAT= getElementData(player,"stat.murders") or 0
local playerALIVETIME= getElementData(player,"alivetime") or 0
local playerALIVETIMESTAT= getElementData(player,"stat.alivetime") or 0
 local row = guiGridListAddRow ( inviteNewPlayersGrid )
 guiGridListSetItemText(inviteNewPlayersGrid, row, inviteNewPlayersColNICK,playerName , false, false)
 if getElementData(player,"bandit") then
  guiGridListSetItemColor ( inviteNewPlayersGrid, row, inviteNewPlayersColNICK, 255, 0, 0  )
 end
 guiGridListSetItemText(inviteNewPlayersGrid, row, inviteNewPlayersColLVL,playerLVL , false, false)
  guiGridListSetItemText(inviteNewPlayersGrid, row, inviteNewPlayersColMURDERS,playerMURDERS.."/"..playerMURDERSSTAT , false, false)
   guiGridListSetItemText(inviteNewPlayersGrid, row, inviteNewPlayersColALIVETIME,roundTime(playerALIVETIME).."/"..roundTime(playerALIVETIMESTAT) , false, false)
guiGridListSetItemData ( inviteNewPlayersGrid, row, inviteNewPlayersColNICK, player )
   end
   end
end
guiSetEnabled ( inviteNewPlayers, false )
guiSetEnabled ( removeGroup, false )

guiSetEnabled(sendInviteToPlayer,false)
guiSetText(sendInviteToPlayer,"To invite")
guiSetVisible(inviteNewPlayersWin,true)
guiMoveToBack( groupWindows )

end
addEvent("refreshPlayersOnInviteList", true)
addEventHandler("refreshPlayersOnInviteList", getLocalPlayer(), refreshPlayersOnInviteList) 
 

addEventHandler ( "onClientGUIClick", inviteNewPlayers,refreshPlayersOnInviteList , false ) 
 
 
local userStatusTable = {
{"Deputy","MODER"},
{"Participant","PARTY"},
{"Newbie","BEGGINER"},
}

local setStatusWin = guiCreateWindow(0, 0, 300, 200, "Assign rank", false) 


  
guiWindowSetSizable ( setStatusWin, false )

local statusText = guiCreateLabel(0, 40, 300, 150,"Choose a rank for a player",false,setStatusWin)
guiLabelSetHorizontalAlign (statusText,"center")

local userStatus = guiCreateComboBox  (  50, 80, 200, 80, "Player rank", false, setStatusWin )
local playerStatus = getElementData(getLocalPlayer(),"groupUserStatus")
for index, status in ipairs ( userStatusTable ) do 
	if playerStatus=="MODER" and status[1]=="Deputy" then 
	else
	guiComboBoxAddItem ( userStatus, status[1] ) 
	end
	end
local setStatusUserOK = 	guiCreateButton ( 0, 160, 135, 30, "OK", false, setStatusWin )
local setStatusUserCANCEL = 	guiCreateButton ( 155, 160, 150, 30, "Cancel", false, setStatusWin )
addEventHandler ( "onClientGUIClick", setStatusUserCANCEL, function() guiSetVisible(setStatusWin,false) end, false )
centerWindow(setStatusWin)
guiSetVisible(setStatusWin,false)

addEventHandler ( "onClientGUIClick", setUserStatusGroup, function() 
 local row, col = guiGridListGetSelectedItem( groupListGroupMembersSettings )
  local nickPlayer = guiGridListGetItemText(groupListGroupMembersSettings,row, col)
guiSetText(statusText,"Choose a rank for a player:\n"..nickPlayer)
guiSetText(setStatusWin,"Assign rank:"..nickPlayer)
 guiMoveToBack( groupWindows ) guiSetVisible(setStatusWin,true) end, false )



function setUserStatus()
 local row, col = guiGridListGetSelectedItem( groupListGroupMembersSettings )
  local nickPlayer = guiGridListGetItemText(groupListGroupMembersSettings,row, col)
  local userAcc = guiGridListGetItemData ( groupListGroupMembersSettings, row, 1)
  local playerStatusInGroup = guiGridListGetItemText(groupListGroupMembersSettings,row, 4)
local group = getElementData(getLocalPlayer(),"group")

if group then
local status = getElementData(getLocalPlayer(),"groupUserStatus")
if status =="OWNER" or status =="MODER"  then
local newGroupStatus = guiComboBoxGetSelected(userStatus)
local thisStatus = guiComboBoxGetItemText(userStatus, newGroupStatus)
if thisStatus ==playerStatusInGroup then
outputChatBox("This player already has the selected status!")
return
end
if status =="MODER" then
triggerServerEvent("setUserSatatus", getLocalPlayer(),getLocalPlayer(),userAcc, nickPlayer, group,newGroupStatus+1)
else
triggerServerEvent("setUserSatatus", getLocalPlayer(),getLocalPlayer(),userAcc, nickPlayer, group,newGroupStatus)
end
end

end
guiSetVisible(setStatusWin,false)

end

addEventHandler ( "onClientGUIClick", setStatusUserOK, setUserStatus, false )




local newGroupIF =false
function IFWindow(header,text,returnFunc)
 newGroupIF = guiCreateWindow(0, 0, 300, 200, "", false) 
guiWindowSetSizable ( newGroupIF, false )
local IFWinText = guiCreateLabel(0, 60, 300, 150,"",false,newGroupIF)
guiLabelSetHorizontalAlign (IFWinText,"center")
local IFOkButt = 	guiCreateButton ( 0, 160, 135, 30, "OK", false, newGroupIF )
local IFOkCancelButt = 	guiCreateButton ( 155, 160, 150, 30, "Cancel", false, newGroupIF )

if header then
guiSetText(newGroupIF,header)
end
if text then
guiSetText(IFWinText,text)
end

centerWindow(newGroupIF)
addEventHandler ( "onClientGUIClick", IFOkButt, _G[returnFunc], false )
addEventHandler ( "onClientGUIClick", IFOkButt, function() guiSetVisible(newGroupIF,false) end, false )
addEventHandler ( "onClientGUIClick", IFOkCancelButt, function() guiSetVisible(newGroupIF,false) end, false )

end

function removeGroupFunc()
local isOwner = getElementData(getLocalPlayer(),"groupUserStatus")
local group = getElementData(getLocalPlayer(),"group")
if isOwner=="OWNER" and group  then

triggerServerEvent("removeGroup", getLocalPlayer(), getLocalPlayer(), group)
end

end



addEventHandler ( "onClientGUIClick", removeGroup, function() IFWindow("Delete group","Do you really want\n delete group?","removeGroupFunc") end, false )



function deleteUserGroupFunc()
local isOwner = getElementData(getLocalPlayer(),"groupUserStatus")
local group = getElementData(getLocalPlayer(),"group")
if not group then return end
if isOwner=="OWNER" or isOwner=="MODER"   then
 local row, col = guiGridListGetSelectedItem( groupListGroupMembersSettings )
  local nickPlayer = guiGridListGetItemText(groupListGroupMembersSettings,row, col)
  local playerRanq = guiGridListGetItemText(groupListGroupMembersSettings,row, 4)
  if playerRanq == "Founder" then return end
  local userAcc = guiGridListGetItemData ( groupListGroupMembersSettings, row, 1)
triggerServerEvent("removePlayerOnGroup", getLocalPlayer(), getLocalPlayer(), userAcc,nickPlayer,group)
else
--outputChatBox("!")
end

end



addEventHandler ( "onClientGUIClick", deleteUserGroup, function() 
  local row, col = guiGridListGetSelectedItem( groupListGroupMembersSettings )
  local stm = guiGridListGetItemText(groupListGroupMembersSettings,row, col)
IFWindow("Delete group","Do you really want\n drive out"..stm.." from the group?","deleteUserGroupFunc")

 end, false )

--deleteUserGroup




local newStatus
function createGroupFunc()

local newGroupName = guiGetText(editBoxGroup)

if string.len (newGroupName) >4  then

else
outputChatBox("The name of the new group must be longer than 4 characters.")
return
end


if not string.find(newGroupName," ") then
else
outputChatBox("The name of the new group should not contain spaces.")
return
end

local newOwnerInGroup =  getElementData(localPlayer,"group") or false
if newOwnerInGroup then
outputChatBox("You cannot create a new group as you are already in another group: "..newOwnerInGroup)
return
end

triggerServerEvent("createGroup", getLocalPlayer(), getLocalPlayer(), newGroupName, "Neutral")

 
end
addEventHandler ( "onClientGUIClick", createGroup, createGroupFunc, false )



function groupRemoved()



 guiSetEnabled ( tabGroup, false )
 guiSetText(tabGroup,"Group")
 guiSetEnabled ( tabGroupSkills, false )
  guiSetText(tabGroupSkills,"Group skills")
 guiSetEnabled ( tabGroupSettings, false )
  guiSetText(tabGroupSettings,"Group settings")
  
  guiSetEnabled ( removeGroup, false )
  guiSetEnabled ( createNewGroup, true )
  guiSetSelectedTab ( groupTabs, tabGroups )
  end
addEvent("groupRemoved", true)
addEventHandler("groupRemoved", getLocalPlayer(), groupRemoved)




function groupCreated(newGroupName)

guiSetVisible(newGroupWindows,false)
guiSetEnabled ( createNewGroup, false )
 guiSetEnabled ( removeGroup, true )
 guiSetEnabled ( tabGroup, true )
 --guiSetText(tabGroup,"Group:"..newGroupName)
 guiSetEnabled ( tabGroupSkills, true )
  --guiSetText(tabGroupSkills,"Навыки:"..newGroupName)
 guiSetEnabled ( tabGroupSettings, true )
 -- guiSetText(tabGroupSettings,"Настройки:"..newGroupName)
  
  end
addEvent("groupCreated", true)
addEventHandler("groupCreated", getLocalPlayer(), groupCreated)


local newStatus
function leavleGroupFunc()






local playerInGroup =  getElementData(localPlayer,"group") or false


if playerInGroup then
triggerServerEvent("leavleGroup", getLocalPlayer(), getLocalPlayer(), playerInGroup)
else
outputChatBox("ERROR: Exit from group is not possible")
end
 
--triggerServerEvent("getGroupInfo", getLocalPlayer(), tostring(playerInGroup),getLocalPlayer(),1)
  
end
addEventHandler ( "onClientGUIClick", leavleGroup, function() IFWindow("Leave the group","Do you really want\n leave the group?","leavleGroupFunc") end, false )







function loadGroups(groups )

 guiGridListClear ( groupList )
  

	for i,group in pairs(groups) do 
	
	
		local row = guiGridListAddRow ( groupList )
 guiGridListSetItemText(groupList, row, columnGroupName,tostring(group.groupName) , false, false)
  guiGridListSetItemText(groupList, row, columnGroupLvl,tonumber(group.groupLvl) , false, true)
   guiGridListSetItemText(groupList, row, columnGroupMembers,tostring(group.groupMembers).."/"..tostring(group.groupMaxMembers) , false, false)
	
	
	guiGridListSetItemText(groupList, row, columnGroupCreatedDate,tostring(group.groupCreatedDate) , false, false)
	end

--end


end

addEvent("loadGroups", true)
addEventHandler("loadGroups", getLocalPlayer(), loadGroups)









function loadGroupInfo(groupMembers,groupData )

  groupMembersTable ={}

 guiGridListClear ( groupListGroupMembers )
  
--for i,groupMembers in pairs(groupMembers) do 


	for i,groupMember in pairs(groupMembers) do 
	
	
		local row = guiGridListAddRow ( groupListGroupMembers )

if groupMember.player then		
local playerNick = getPlayerName(groupMember.player)
 guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersNick,tostring(playerNick) , false, false)
 guiGridListSetItemColor ( groupListGroupMembers, row, columnGroupMembersNick, 255, 255, 0  )
 
 if groupMember.userRole == "Newbie" then
	guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersProfit,"-" , false, true)
	else
	local playerProfit = getElementData(groupMember.player,"groupProfit") or 0
  guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersProfit,math.floor( tonumber(playerProfit) ) , false, true)
	end
	
 
 
  
local playerLvl = getElementData(groupMember.player,"playerlvl") or 0
 guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersLvl,math.floor( tonumber(playerLvl) ) , false, false)
    
	guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersRole,tostring(groupMember.userRole) , false, false)
 else
 
 
 guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersNick,tostring(groupMember.userNick) , false, false)
 
	if groupMember.userRole == "Newbie" then
	guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersProfit,"-" , false, true)
	else
	 guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersProfit,tonumber(groupMember.userProfit) , false, true)
	end
 
   guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersLvl,tostring(groupMember.userLvl) , false, false)
    guiGridListSetItemText(groupListGroupMembers, row, columnGroupMembersRole,tostring(groupMember.userRole) , false, false)
	
 end
 
 guiGridListSetItemData ( groupListGroupMembers, row, columnGroupMembersNick, tostring(groupMember.userAccount) )


	

	
end
	

	for i,groupInfo in pairs(groupData) do 
		setLineText("groupInfo",1,tostring(groupInfo.groupName))
		setLineText("groupInfo",2,tostring(groupInfo.groupMembers).."/"..tostring(groupInfo.groupMaxMembers))
		setLineText("groupInfo",3,tostring(groupInfo.groupCreatedDate))
		setLineText("groupInfo",4,tostring(groupInfo.groupLvl))
	end

	

end

--groupName TEXT, userProfit INT, userLvl INT, userRole TEXT, userOldNick TEXT, userAccount TEXT)


addEvent("loadGroupInfo", true)
addEventHandler("loadGroupInfo", getLocalPlayer(), loadGroupInfo)






function loadGroupInfoSettings(groupMembers,groupData )


  groupMembersTable ={}

 guiGridListClear ( groupListGroupMembersSettings )
  
--for i,groupMembers in pairs(groupMembers) do 


	for i,groupMember in pairs(groupMembers) do 
	
	
		local row = guiGridListAddRow ( groupListGroupMembersSettings )

if groupMember.player then		
local playerNick = getPlayerName(groupMember.player)
 guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersNickSettings,tostring(playerNick) , false, false)
 guiGridListSetItemColor ( groupListGroupMembersSettings, row, columnGroupMembersNickSettings, 255, 255, 0  )
 if groupMember.userRole=="Newbie" then
 guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersProfitSettings,"-" , false, true)
 else
 local playerProfit = getElementData(groupMember.player,"groupProfit") or 0
  guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersProfitSettings,math.floor( tonumber(playerProfit) ) , false, true)
  end
local playerLvl = getElementData(groupMember.player,"playerlvl") or 0
 guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersLvlSettings,math.floor( tonumber(playerLvl) ) , false, false)
    
	guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersRoleSettings,tostring(groupMember.userRole) , false, false)
 guiGridListSetItemData ( groupListGroupMembersSettings, row, columnGroupMembersNickSettings, tostring(groupMember.userAccount) )
 else
 
 
 guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersNickSettings,tostring(groupMember.userNick) , false, false)
 guiGridListSetItemData ( groupListGroupMembersSettings, row, columnGroupMembersNickSettings, tostring(groupMember.userAccount) )
 if groupMember.userRole=="Newbie" then
 guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersProfitSettings,"-" , false, true)
 else
 guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersProfitSettings,math.floor(tonumber(groupMember.userProfit)) , false, true)
  end
  
 


 guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersLvlSettings,tostring(groupMember.userLvl) , false, false)
    guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersRoleSettings,tostring(groupMember.userRole) , false, false)
	-- guiGridListSetItemText(groupListGroupMembersSettings, row, columnGroupMembersAccountSettings,tostring(groupMember.userAccount) , false, false)
	
	
 end
 
 


end
	

guiSetEnabled ( deleteUserGroup, false )
	guiSetText(deleteUserGroup,"Expel")
	guiSetEnabled ( setUserStatusGroup, false )
	guiSetText(setUserStatusGroup,"Assign rank")	

end

--groupName TEXT, userProfit INT, userLvl INT, userRole TEXT, userOldNick TEXT, userAccount TEXT)


addEvent("loadGroupInfoSettings", true)
addEventHandler("loadGroupInfoSettings", getLocalPlayer(), loadGroupInfoSettings)




local getGroupTimerTab= false

function OnChange( selectedTab )
local tabText = guiGetText(selectedTab)
 guiSetText(groupWindows,tabText)
	local playerGroupStatus = getElementData(getLocalPlayer(),"groupUserStatus")
		local playerGroup = getElementData(getLocalPlayer(),"group")
	if selectedTab == tabGroups then 
 
		if not getGroupTimerTab then
		triggerServerEvent("getGroups", getLocalPlayer(), getLocalPlayer())
		getGroupTimerTab=true
		setTimer(function() getGroupTimerTab = false end,15000,1)
		end
guiSetEnabled ( getGroupInfo, false )
guiSetText(getGroupInfo,"Group Information")
	elseif selectedTab == tabGroup then
	
	guiSetEnabled ( groupUserInformation, false )
guiSetText(groupUserInformation,"Player Statistics")
	guiSetEnabled ( leavleGroup, true )

	
	
	
	
	
	if playerGroupStatus =="OWNER" then
	guiSetEnabled ( leavleGroup, false )
	
	end
	
	if playerGroup then
	triggerServerEvent("getGroupInfo", getLocalPlayer(), tostring(playerGroup),getLocalPlayer(),1)
	
	end
	elseif selectedTab == tabGroupSkills then
	if playerGroup then
	triggerServerEvent("getSKILLSinfo", getLocalPlayer(), tostring(playerGroup),getLocalPlayer())
	end
	
	elseif selectedTab == tabGroupSettings then
	triggerServerEvent("getGroupInfoSettings", getLocalPlayer(), tostring(playerGroup),getLocalPlayer())
	guiSetEnabled ( deleteUserGroup, false )
	guiSetText(deleteUserGroup,"Expel")
	guiSetEnabled ( setUserStatusGroup, false )
	guiSetText(setUserStatusGroup,"Assign rank")
	if playerGroupStatus=="MODER" then
	guiSetEnabled ( removeGroup, false )
	end
	
	local mayInvite = getElementData(localPlayer,"mayInvite") or false
	if mayInvite then
	guiSetEnabled ( inviteNewPlayers, true )
	--outputChatBox("true")
	else
	guiSetEnabled ( inviteNewPlayers, false )
	--outputChatBox("false")
	end
	
	end	
 
end
 addEventHandler("onClientGUITabSwitched", tabGroups, OnChange)
 addEventHandler("onClientGUITabSwitched", tabGroup, OnChange)
 addEventHandler("onClientGUITabSwitched", tabGroupSkills, OnChange)
 addEventHandler("onClientGUITabSwitched", tabGroupSettings, OnChange)



 
 	addEventHandler( "onClientGUIClick", groupList, 
	
	function( btn228 )
  if btn228 ~= 'left' then return false end
  local row, col = guiGridListGetSelectedItem( source )
  local stm = guiGridListGetItemText(groupList,row, col)


 
if stm == "" or stm == false then
stm =""
guiSetEnabled ( getGroupInfo, false )
else
stm = ":"..stm
guiSetEnabled ( getGroupInfo, true )
end
 guiSetText(getGroupInfo,"Group Information"..stm)
  end, false )
 
 
 -- groupUserInformation groupListGroupMembers
 
  	addEventHandler( "onClientGUIClick", groupListGroupMembers, 
	
	function( btn228 )
  if btn228 ~= 'left' then return false end
  local row, col = guiGridListGetSelectedItem( source )
  local stm = guiGridListGetItemText(groupListGroupMembers,row, col)


 
if stm == "" or stm == false then
stm =""
guiSetEnabled ( groupUserInformation, false )
else
stm = ":"..stm
guiSetEnabled ( groupUserInformation, true )
end
 guiSetText(groupUserInformation,"Player Statistics"..stm)
  end, false )
 
 

 
 
   	addEventHandler( "onClientGUIClick", groupListGroupMembersSettings, 
	
	function( btn228 )
  if btn228 ~= 'left' then return false end
  local playergroupStatus = getElementData(getLocalPlayer(),"groupUserStatus")
  local row, col = guiGridListGetSelectedItem( source )
  local stm = guiGridListGetItemText(groupListGroupMembersSettings,row, col)
	local stm2 = guiGridListGetItemText(groupListGroupMembersSettings,row, 4)
playerName  =stm
 
if stm == "" or stm == false then
stm =""
guiSetEnabled ( deleteUserGroup, false )
guiSetEnabled ( setUserStatusGroup, false )
else
--outputChatBox(stm2)
if getPlayerName(getLocalPlayer()) ~= playerName then

stm = ":"..stm
guiSetEnabled ( deleteUserGroup, true )
guiSetEnabled ( setUserStatusGroup, true )

if playergroupStatus =="MODER" and stm2=="Deputy" or  stm2=="Founder" then
	guiSetEnabled ( deleteUserGroup, false )
	guiSetText(deleteUserGroup,"Expel")
	guiSetEnabled ( setUserStatusGroup, false )
	guiSetText(setUserStatusGroup,"Assign rank")
end 

else
guiSetEnabled ( deleteUserGroup, false )
guiSetText(deleteUserGroup,"Expel")
guiSetEnabled ( setUserStatusGroup, false )
guiSetText(setUserStatusGroup,"Assign rank")

end
end

if getPlayerName(getLocalPlayer()) ~= playerName   then
	guiSetText(deleteUserGroup,"Expel"..stm)
	guiSetText(setUserStatusGroup,"Assign rank"..stm)
if playergroupStatus =="MODER" and stm2=="Deputy" or  stm2=="Founder" then
	guiSetText(deleteUserGroup,"Expel")
	guiSetText(setUserStatusGroup,"Assign rank")

end
 end
  end, false )
 
 
 
 
local isGroupWinOpen= false
local getGroupTimer=false
function openGroupWindow (cmd,keyState)

if getElementData(getLocalPlayer(),"logedin") then
	if not isGroupWinOpen then

	local groupInvite = getElementData(getLocalPlayer(),"groupInvite",false) or false
if groupInvite then
guiSetVisible(groupInviteClient,true)
showCursor(true)
return
end
	
guiSetEnabled ( getGroupInfo, false )
guiSetText(getGroupInfo,"Group Information")



	local playergroup = getElementData(getLocalPlayer(),"group")
	local playergroupStatus = getElementData(getLocalPlayer(),"groupUserStatus")
	if playergroup then
	
	 guiSetEnabled ( tabGroup, true )
 --guiSetText(tabGroup,"Group:"..playergroup)
 guiSetEnabled ( tabGroupSkills, true )
 -- guiSetText(tabGroupSkills,"Навыки:"..playergroup)
  
  if playergroupStatus =="OWNER" or playergroupStatus=="MODER" then
  guiSetEnabled ( inviteNewPlayers, true )

 guiSetEnabled ( tabGroupSettings, true )
 -- guiSetText(tabGroupSettings,"Настройки:"..playergroup)
  else
   guiSetEnabled ( tabGroupSettings, false )
  --guiSetText(tabGroupSettings,"Настройки:"..playergroup)
end
if playergroupStatus =="OWNER" then
guiSetEnabled ( removeGroup, true )
end
  
  
	guiSetEnabled ( createNewGroup, false )
	
	
	
	elseif not playergroup and not guiGetEnabled ( createNewGroup ) then
	guiSetEnabled ( createNewGroup, true)
	
	else
	
	 guiSetEnabled ( tabGroup, false )
 guiSetText(tabGroup,"Group")
 guiSetEnabled ( tabGroupSkills, false )
  guiSetText(tabGroupSkills,"Group skills")
   guiSetEnabled ( tabGroupSettings, false )
  guiSetText(tabGroupSettings,"Group settings")
	end
	
	

	
	
	
		guiSetVisible(groupWindows,true)
		showCursor(true)
		if not getGroupTimer then
		triggerServerEvent("getGroups", getLocalPlayer(), getLocalPlayer())
		getGroupTimer=true
		setTimer(function() getGroupTimer = false end,15000,1)
		end
		isGroupWinOpen=true
		else
		


		guiSetVisible(groupInviteClient,false)
		guiSetVisible(groupWindows,false )
		
		guiSetVisible(playerStatisticWin,false)
		guiSetVisible(getGroupInfoWin,false)
		guiSetVisible(newGroupWindows,false)
		guiSetVisible(inviteNewPlayersWin,false)
		guiSetVisible(setStatusWin,false)
		guiSetVisible(toolTip['img'],false )
		if newGroupIF then guiSetVisible(newGroupIF,false) end
		
		showCursor(false)
		isGroupWinOpen=false
	end
end	
end
bindKey ( "f1", "down", openGroupWindow ) 





function addProfitServer()
if getElementData(getLocalPlayer(),"logedin") then
	local group = getElementData(getLocalPlayer(),"group",false) or false
		if group then
		local groupStatus = getElementData(getLocalPlayer(),"groupUserStatus",false) or false
		if groupStatus and groupStatus~="BEGGINER" then
		triggerServerEvent("addGroupPlayerProfit",getLocalPlayer(),group)
		end
		end
end
end

setTimer(addProfitServer,10000,0) --300000



playerBlibs = {}
amouunt = 0
function updateGPS()
  amouunt = 0
  for i, blip in ipairs(playerBlibs) do
  if isElement(blip) then
    destroyElement(blip)
	end
  end
  
  local group = getElementData(getLocalPlayer(), "group") or false
  local groupStatus = getElementData(getLocalPlayer(),"groupUserStatus",false) or false
  if not group then
    return
  end
  if groupStatus and groupStatus=="BEGGINER" then
  return
  end
  
  playerBlibs = {}
  
  for i, player in ipairs(getElementsByType("player")) do
  if player~=getLocalPlayer() then
  local playerGroup = getElementData(player, "group") or false
  local playerStatus = getElementData(player,"groupUserStatus",false) or false
  if playerGroup  then
		if playerStatus~="BEGGINER" then
		if playerGroup==group then
      amouunt = amouunt + 1
      playerBlibs[amouunt] = createBlipAttachedTo(player, 0, 2, 255, 255, 0)
      setBlipVisibleDistance(playerBlibs[amouunt], 1000)
		end
		end
   end
  
  end
  end
  end
  
  
setTimer(updateGPS, 10000, 0)
