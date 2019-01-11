

function setScreenResolution ( screenResolution )
--outputChatBox(screenResolution)
local resolution = executeSQLQuery("SELECT * FROM `screenResolution` WHERE `screen` =?",tostring(screenResolution) )
	if resolution[1] then 
	local screenCount = tonumber(resolution[1].count)
	executeSQLQuery("UPDATE `screenResolution` SET `count` = ? WHERE `screen` = ?",tonumber(screenCount+1),tostring(screenResolution) )
	else
	executeSQLQuery("INSERT INTO `screenResolution`(`screen`,`count`) VALUES(?,?)", tostring(screenResolution),tonumber(1) )	
	end
end
addEvent ( "setScreenResolution", true )
addEventHandler ( "setScreenResolution", getRootElement(), setScreenResolution )


addEventHandler("onResourceStart", resourceRoot, function()

executeSQLQuery("CREATE TABLE IF NOT EXISTS `screenResolution` (`screen` TEXT, `count` INT)")
executeSQLQuery("CREATE TABLE IF NOT EXISTS `playersStatistic` (`date` TEXT, `connects` INT, `newPlayers` INT, `uniquePlayers` INT, `uniquePlayersTime` INT)")	

end)

function getDate()
local time = getRealTime()
local year = 1900+time.year

 time.month=time.month+1
 if time.month <= 9 then
time.month= "0"..time.month
end
if time.monthday <= 9 then
time.monthday= "0"..time.monthday
end
	return year.."-"..time.month.."-"..time.monthday
end

function playerConnect ()
local playerSerial = getPlayerSerial(source) 
local accounts = #getAccountsBySerial ( playerSerial )
if not accounts then return end 
local realDate = getDate()
local statistic = executeSQLQuery("SELECT * FROM `playersStatistic` WHERE `date` =?",tostring(realDate) )
if not statistic[1] then
executeSQLQuery("INSERT INTO `playersStatistic` (`date`,`connects`,`newPlayers`,`uniquePlayers`,`uniquePlayersTime`) VALUES(?,?,?,?,?)", tostring(realDate),tonumber(0),tonumber(0),tonumber(0),tonumber(0) )
end


local statistic = executeSQLQuery("SELECT * FROM `playersStatistic` WHERE `date` =?",tostring(realDate) )

    if accounts>=1 then
	local debugstr = "игрок у которого уже имеется аккаунт(ы) на сервере"
	--outputDebugString(debugstr)
	else
	local debugstr ="игрок который заходит первый раз и не имеет аккаунт(ов) на сервере"
	--outputDebugString(debugstr)
	if statistic[1] then 
	local statisticNewPlayers = tonumber(statistic[1].newPlayers)
	executeSQLQuery("UPDATE `playersStatistic` SET `newPlayers` = ? WHERE `date` = ?",tonumber(statisticNewPlayers+1),tostring(realDate) )
	end
	setElementData(source,"newPlayer",true,false)
	end
	
	local debugstr = "все подключения"
	--outputDebugString(debugstr)
	
	if statistic[1] then 
	local statisticConnects = tonumber(statistic[1].connects)
	executeSQLQuery("UPDATE `playersStatistic` SET `connects` = ? WHERE `date` = ?",tonumber(statisticConnects+1),tostring(realDate) )
	end
end


addEventHandler ("onPlayerJoin", getRootElement(), playerConnect)

-- `uniquePlayersTime` (`serial` TEXT,`date` TEXT, `loginTime` INT, `quitTime` INT)

function StatisticPlayerLogin ( )
local isNewPlayer = getElementData(source,"newPlayer") or false
if isNewPlayer then
local realDate = getDate()
local statistic = executeSQLQuery("SELECT * FROM `playersStatistic` WHERE `date` =?",tostring(realDate) )
if statistic[1] then 
	local statisticUniquePlayers = tonumber(statistic[1].uniquePlayers)
	executeSQLQuery("UPDATE `playersStatistic` SET `uniquePlayers` = ? WHERE `date` = ?",tonumber(statisticUniquePlayers+1),tostring(realDate) )
	end
	local timestmap = getRealTime( ).timestamp
	setElementData(source,"loginTimeStmap",timestmap,false)
end

end
addEventHandler ( "onPlayerLogin", getRootElement(), StatisticPlayerLogin )


function quitPlayer ( quitType )
	local isNewPlayer = getElementData(source,"newPlayer") or false
	if isNewPlayer then
	local loginTimeStmap = getElementData(source,"loginTimeStmap") or false
		if loginTimeStmap then
		local realDate = getDate()
		local timestmap = getRealTime( ).timestamp
		local statistic = executeSQLQuery("SELECT * FROM `playersStatistic` WHERE `date` =?",tostring(realDate) )
			if statistic[1] then
			local playMinutes = math.floor(((timestmap-loginTimeStmap)/60))
			local playMinutes=playMinutes+statistic[1].uniquePlayersTime
			executeSQLQuery("UPDATE `playersStatistic` SET `uniquePlayersTime` = ? WHERE `date` = ?",tonumber(playMinutes),tostring(realDate) )
			
			end
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), quitPlayer )