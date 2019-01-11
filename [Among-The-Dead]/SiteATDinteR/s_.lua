﻿local playerDataTable = {
{"alivetime"},
{"skin"},
{"MAX_Slots"},
{"blood"},
{"temperature"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},
{"Дрова"},
{"Бинты"},
{"Полная Фляга"},
{"Банка Макарон"},
{"Банка Бобов"},
{"Бургер"},
{"Спички"},
{"Glokc-17 mag"},
{"M9 mag"},
{"Revolver mag"},
{"Glokc-17"},
{"M9 SD"},
{"M11-87"},
{"PDW"},
{"Охотничий Нож"},
{"Топор"},
{"Пицца"},
{"Морфий"},
{"Газированная Вода"},
{"Пустая Канистра"},
{"Полная Канистра"},
{"Сигнальный Фаер"},
{"Кола"},
{"PDW mag"},
{"TEC-9 mag"},
{"АКСУ mag"},
{"АКС mag"},
{"M4A1 mag"},
{"Слезоточивый газ"},
{"Граната"},
{"Revolver"},
{"Обрез"},
{"M1014"},
{"АКС-74У"},
{"Часы"},
{"Аптечка"},
{"Грелка"},
{"M14 EP1"},
{"PDW"},
{"TEC-9"},
{"АКС-74"},
{"Пакет Крови"},
{"Навигатор"},
{"Карта"},
{"Инструменты"},
{"Колючая Проволка"},
{"Колесо"},
{"Мотор"},
{"AS-50 mag"},
{"M14 mag"},
{"M4A1 M203 RCO"},
{"AS-50"},
{"Инфракрасное Виденье"},
{"Прибор Ночного Виденья"},
{"Палатка"},
{"Сырое Мясо"},
{"Жареное Мясо"},
{"Камуфляжная одежда"},
{"Снайперский костюм"},
{"Армейская одежда"},
{"Камуфляж лешего"},
{"Женский снайперский костюм"},
{"Гражданская одежда"},
{"Костюм бандита"},
{"Костюм инженера"},
{"Костюм пилота"},
{"Костюм SAS"},
{"Тяжелая броня"},
{"Женская одежда"},
{"Камуфляж военного"},
{"Камуфляж женщины"},
{"Одежда выжившего"},
{"Обезболивающее"},
{"Бинокль"},
{"Пустая Фляга"},
{"Пустая Бутылка"},
{"Несъедобный Бургер"},
{"M11-87 slug"},
{"2Rnd. slug"},
{"M1014 pellet"},
{"Рация"},
{"Бейсбольная Бита"},
{"Мачете"},
{"Лом"},
{"Рация"},
{"Парашют"},

}

function roundTime(value)
	if value then
local days =  math.floor((value/60)/24) -- Получаем количество полных дней

value = value - (days*24)*60 -- Удаляем дни из секунд

local hours = math.floor(value/60) -- Получаем количество полных часов


local minutes = value - (hours*60) -- Получаем оставшиеся минуты	
	if minutes <= 9 then 
	minutes = "0"..minutes
	end
		value = hours..":"..minutes
		return days,hours,math.floor(minutes)
	end
	return false
end

function getBanans()
bansTable =''
local array = getBans ()
	for banID, ban in ipairs ( array ) do 
	local btime = getBanTime(ban) or 0
	local ip = getBanIP(ban) or "-"
	local serial = getBanSerial(ban) or "-"
	local reason = getBanReason(ban) or "-"
	local admin = getBanAdmin(ban) or "-" 
	--local nick = getBanNick(ban) or "Нет"
	local unbanTime = getUnbanTime ( ban ) or 0
	local realUnbanTime =getRealTime(unbanTime)
 local realBanTime = getRealTime(btime)
 if unbanTime<=0 then
 unbanTime1 = "Нет"
 else
 realUnbanTime.month= realUnbanTime.month+1
  if realUnbanTime.month < 9 then
realUnbanTime.month= "0"..realUnbanTime.month
end
if realUnbanTime.monthday < 9 then
realUnbanTime.monthday= "0"..realUnbanTime.monthday
end
if realUnbanTime.minute < 9 then
realUnbanTime.minute= "0"..realUnbanTime.minute
end
 unbanTime1 = (realUnbanTime.year+1900).."."..(realUnbanTime.month).."."..realUnbanTime.monthday.." | "..realUnbanTime.hour..":"..realUnbanTime.minute
 end
 realBanTime.month=realBanTime.month+1
 if realBanTime.month < 9 then
realBanTime.month= "0"..realBanTime.month
end
if realBanTime.monthday < 9 then
realBanTime.monthday= "0"..realBanTime.monthday
end
	bansTable=bansTable.." <tr><td>"..serial.."</td><td>"..unbanTime1.."</td><td><button onclick=\"unbanThis('"..serial.."')\">Разбанить</button></td></tr>"
			

	end
return bansTable
end


function getDateFromTimeStmap(timestmap,mh)

local dateTime = getRealTime(timestmap)

 dateTime.month=dateTime.month+1
 if dateTime.month < 9 then
dateTime.month= "0"..dateTime.month
end
if dateTime.monthday < 9 then
dateTime.monthday= "0"..dateTime.monthday
end
local year = dateTime.year+1900
if not mh then
return year,dateTime.month,dateTime.monthday
else
if dateTime.minute < 9 then
dateTime.minute= "0"..dateTime.minute
end

return  year,dateTime.month,dateTime.monthday,dateTime.hour,dateTime.minute
end
end

--[[
mute.serial .. "</td>\
	<td>" .. mute.reason .. "</td>\
	<td>" .. lostTime
]]
function getMutes()
local muteTable = ""
local muted = executeSQLQuery("SELECT * FROM `muteTime` " )
local timestmapMute = getRealTime( ).timestamp

for i,mute in pairs(muted) do 
		if mute.timestmap then
local muteTimeTstmp= tonumber(mute.timestmap)
--local d,h,m = roundTime(((muteTimeTstmp-timestmapMute)/60))	
--local lostTime = d.."д "..h.."ч "..m.."м"	
--if d<300 then 
local unmuteTime = {getDateFromTimeStmap(muteTimeTstmp,true)}
unmuteTime= unmuteTime[1].."."..unmuteTime[2].."."..unmuteTime[3].." | "..unmuteTime[4]..":"..unmuteTime[5]
--else
--local unmuteTime="нет"
--end
muteTable=muteTable.."<tr><td>"..mute.serial.."</td><td>"..unmuteTime.."</td><td><button onclick=\"unmutThis('"..mute.serial.."')\">Размутить</button></td></tr>"
end

end
return muteTable
end

function loginCheck(login)
local account = getAccount ( login )
	if account then 
	return "true"
	else
	return "false"
	end
end

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


function getBestPlayers()

	statMaganer = getAccount("statMaganer","kajwfhn")	
	
		local allmur =  getAccountData(statMaganer,'allstats.murders') or 0
	local allzk=  getAccountData(statMaganer,'allstats.zombieskilled') or 0
	local allat =  getAccountData(statMaganer,'allstats.alivetime') or 0
		
	local murdersMAX = getAccountData(statMaganer,'allstats.murdersMAX') or 0 
	local zombieskilledMAX = getAccountData(statMaganer,'allstats.zombieskilledMAX') or 0
	local alivetimeMAX = getAccountData(statMaganer,'allstats.alivetimeMAX') or 0
	
	local murdersMAXNICK = getAccountData(statMaganer,'allstats.murdersMAXNICK') or "Нет лидера" 
	local zombieskilledMAXNICK = getAccountData(statMaganer,'allstats.zombieskilledMAXNICK') or "Нет лидера"
	local alivetimeMAXNICK = getAccountData(statMaganer,'allstats.alivetimeMAXNICK') or "Нет лидера"
	
	murdersMAX=murdersMAXNICK.." - "..murdersMAX
	zombieskilledMAX=zombieskilledMAXNICK.." - "..zombieskilledMAX
	alivetimeMAX=alivetimeMAXNICK.." - "..roundTime(alivetimeMAX)
	
return allmur,allzk,roundTime(allat),murdersMAX,zombieskilledMAX,alivetimeMAX
end




function result(response,errors)
--outputDebugString(tostring(response))
--outputDebugString(tostring(errors))
end

local  color =1
function playeGlobalChat ( playersource, cmd, ... )
	if cmd == "Chat" then	
if isPlayerMuted ( playersource ) then return end	
		local msg = table.concat ( {...} , " " ) --concat the arguments from table to a string seperated by spaces
		local msg = string.gsub ( msg, '#%x%x%x%x%x%x', '' ) --remove color-codes
		local nick = getPlayerName ( playersource )
		 nick = string.gsub ( nick, '#%x%x%x%x%x%x', '' )
		 local msg = string.gsub ( msg, '<', '&lt;' ) --remove color-codes
		 local msg = string.gsub ( msg, '>', '&gt;' ) --remove color-codes
		 
		  local nick = string.gsub ( nick, '<', '&lt;' ) --remove color-codes
		 local nick = string.gsub ( nick, '>', '&gt;' ) --remove color-codes
		 
		msg="<div id='chatnick'>"..nick..":</div> <div id='chatmsg'>"..msg.."</div>"
	

		
callRemote ( "http://dayz-mta.ru/getServerChatAndWrr.php", result, msg,1,color )		

if color==1 then 
color = 2
elseif color==2 then
color = 1 
end

	end
end
addCommandHandler ( "Chat", playeGlobalChat )
