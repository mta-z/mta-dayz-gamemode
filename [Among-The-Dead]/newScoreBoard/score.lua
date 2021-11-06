-------------------------------------
--Create Scoreboard
-------------------------------------

function getRankingPlayer (place)
if not playerRankingTable[place]["Player"] then 
return  false
else
return playerRankingTable[place]["Player"]
end
end

function getElementDataPosition(key,value)
	if key and value then
		local result = 1
		for i,player in pairs(getElementsByType("player")) do
			local data = tonumber(getElementData(player,key))
			if data then
				if data > value then 
					result = result+1
				end
			end
		end
		return result
	end
end

function positionGetElementData(key, positions)
	if key and positions then
		local Position = {}
		for index,player in pairs(getElementsByType("player")) do
			local data = tonumber(getElementData(player,key))
			local logedin =getElementData(player,"logedin")
			if data and logedin then
				for i1=1, positions, 1 do
					if Position[tonumber(i1)] then
						if Position[tonumber(i1)]["Wert"] < tonumber(data) then
							local Position_Cache1 = Position[tonumber(i1)]["Player"]
							local Position_Cache2 = Position[tonumber(i1)]["Wert"]
							local Position_Cache3
							local Position_Cache4
							for i2=i1, positions, 1 do
								if Position[tonumber(i2)] then
									Position_Cache3 = Position[tonumber(i2)]["Player"]
									Position_Cache4 = Position[tonumber(i2)]["Wert"]
									Position[tonumber(i2)]["Player"] = Position_Cache1
									Position[tonumber(i2)]["Wert"] = Position_Cache2
									Position_Cache1 = Position_Cache3
									Position_Cache2 = Position_Cache4
								else
									Position[tonumber(i2)] = {}
									Position[tonumber(i2)]["Player"] = Position_Cache1
									Position[tonumber(i2)]["Wert"] = Position_Cache2
									break
								end
							end
							Position[tonumber(i1)] = {}
							Position[tonumber(i1)]["Player"] = player
							Position[tonumber(i1)]["Wert"] = data
							break
						end
					else
						Position[tonumber(i1)] = {}
						Position[tonumber(i1)]["Player"] = player
						Position[tonumber(i1)]["Wert"] = data
						break
					end
				end
			end
		end
		return Position or false
	end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
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

playerRankingTable = {}

function checkTopPlayer()
playerRankingTable = positionGetElementData("alivetime", #getElementsByType("player"))
end
checkTopPlayer()
setTimer(checkTopPlayer,10000,0)

function onQuitGame( reason )
    checkTopPlayer()
end
addEventHandler( "onClientPlayerQuit", getRootElement(), onQuitGame )



unbindKey ("tab")

local width = 1000
local height = 0
local headerHeight = 70
local oneBlockHeight = 40

local lineHeight =0.6
local  LineTransporent = 100
local playesLines = 0
local screenWidth,screenHeight = guiGetScreenSize()
local oneColum,twoColum,threeColum,fourColum,fiveColum,sixColum,sevenColum,eightColum
function scoreBoard ()
if getKeyState( "tab" ) == false then return end
if getElementData(getLocalPlayer(),"isDead") then return end
if getElementData(getLocalPlayer(),"logedin") then

local startPos = (screenWidth/2)-width/2
local startPosX =screenHeight/2-height/2

dxDrawImage ( startPos, startPosX-30, width, headerHeight, "headerScore.png")
height=headerHeight
local players = "ИгрOKов: "..#getElementsByType("player").." / 50"
local playersW = dxGetTextWidth(players,1,"default-bold")
dxDrawText (players, (startPos+width)-playersW-20, startPosX-22, width, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )

local serverName = getElementData(getRootElement(),"serverName") or "Among The Dead"
dxDrawText (serverName, startPos+20, startPosX-22, width, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )


dxDrawRectangle ( startPos, startPosX, width, lineHeight, tocolor ( 255, 255,255, LineTransporent ) ) -- верхняя линия шапки
dxDrawRectangle ( startPos, startPosX+headerHeight-30, width, lineHeight, tocolor ( 255, 255,255, LineTransporent ) ) -- нижняя линия шапки

dxDrawRectangle ( startPos, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия

dxDrawRectangle ( startPos+width, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая правая линия

dxDrawRectangle ( startPos, (startPosX+headerHeight-30)+(oneBlockHeight*playesLines), width, lineHeight, tocolor ( 255, 255,255, LineTransporent ) ) -- нижняя закрывающая линия

 width = 0
local textWidth = dxGetTextWidth("№",1,"default-bold")
dxDrawText ("№", startPos+10, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+textWidth+20, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=textWidth+20
oneColum = textWidth+20

local textWidth = dxGetTextWidth("Ник",1,"default-bold")
dxDrawText ("Ник", startPos+width+80, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+width+textWidth+160, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=width+textWidth+160
 twoColum = textWidth+160

local textWidth = dxGetTextWidth("Мародёрства",1,"default-bold")
dxDrawText ("Мародёрства", startPos+width+10, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+width+textWidth+20, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=width+textWidth+20
 threeColum =textWidth+20

local textWidth = dxGetTextWidth("Убито зомби",1,"default-bold")
dxDrawText ("Убито зомби", startPos+width+10, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+width+textWidth+20, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=width+textWidth+20
 fourColum = textWidth+20

local textWidth = dxGetTextWidth("Прожито",1,"default-bold")
dxDrawText ("Прожито", startPos+width+30, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+width+textWidth+60, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=width+textWidth+60
 fiveColum = textWidth+60

local textWidth = dxGetTextWidth("Группа",1,"default-bold")
dxDrawText ("Группа", startPos+width+40, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+width+textWidth+80, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=width+textWidth+80
 sixColum = textWidth+80

local textWidth = dxGetTextWidth("Уровень",1,"default-bold")
dxDrawText ("Уровень", startPos+width+10, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+width+textWidth+20, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=width+textWidth+20
 sevenColum = textWidth+20

local textWidth = dxGetTextWidth("FPS / PING",1,"default-bold")
dxDrawText ("FPS / PING", startPos+width+10, startPosX+10, 100, headerHeight, tocolor ( 200, 200, 200, 255 ), 1, "default-bold" )
dxDrawRectangle ( startPos+width+textWidth+20, startPosX, lineHeight, (headerHeight-30)+(oneBlockHeight*playesLines), tocolor ( 255, 255,255, LineTransporent ) ) -- бOKовая левая линия
width=width+textWidth+20
 eightColum = textWidth+20
 
playerInList=false
local playerAmount = table.maxn(playerRankingTable)
if playerAmount > 10 then
	playerAmount = 10
end
for i = 1, playerAmount do
	--playesLines=playesLines+1

	local player = getRankingPlayer(i) or false
	if player then
	playesLines=i
		
		
	if player == getLocalPlayer() then
	createPlayerScore(player,startPosX,startPos,i,i,true)
	playerInList = true
	else
	createPlayerScore(player,startPosX,startPos,i,i,false)
	end
	
	end
	end
if not playerInList then
playesLines=playesLines+1
createPlayerScore(getLocalPlayer(),startPosX,startPos,false,11,true)
end

end	



end
addEventHandler ( "onClientRender", getRootElement(), scoreBoard )

function createPlayerScore(player,startPosX,startPos,rank,i,isLocalPlayer)

if isLocalPlayer then
image = "whitepix.png"
else
image = "playerScore.png"
end
if not rank then
rank=getElementDataPosition("alivetime",getElementData(player,"alivetime"))
end
	dxDrawImage ( startPos, (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight, width, oneBlockHeight, image)
	height=height+oneBlockHeight
	local textWidth = dxGetTextWidth(rank,1,"default-bold-small")
	dxDrawText (rank, startPos+(oneColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( 200, 200, 200, 255 ), 1, "default-bold-small" )
	r,g,b = 200, 200, 200
	local bandit = getElementData(player,"bandit")
	if bandit then r,g,b = 200,0,0 end
	local humanity = getElementData(player,"humanity") or 0
	if humanity>=5000 then
		r,g,b = 0, 200, 0 
	end
	
	local nick = string.gsub(getPlayerName(player), '#%x%x%x%x%x%x', '' ) 
	local textWidth = dxGetTextWidth(nick,1,"default-bold-small")
	dxDrawText (nick, (startPos+oneColum)+(twoColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( r,g,b, 255 ), 1, "default-bold-small" )
	
	local murders = getElementData(player,"murders")
	local murdersAll = getElementData(player,"stat.murders") or 0
	local murdersText = murders.."/"..murdersAll+murders
	local textWidth = dxGetTextWidth(murdersText,1,"default-bold-small")
	dxDrawText (murdersText, (startPos+oneColum+twoColum)+(threeColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( 200, 200, 200, 255 ), 1, "default-bold-small" )
	
	local zombieskilled = getElementData(player,"zombieskilled")
	local zombieskilledAll=  getElementData ( player, "stat.zombieskilled") or 0
	local zombieskilledText = zombieskilled.."/"..zombieskilledAll+zombieskilled
	local textWidth = dxGetTextWidth(zombieskilledText,1,"default-bold-small")
	dxDrawText (zombieskilledText, (startPos+oneColum+twoColum+threeColum)+(fourColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( 200, 200, 200, 255 ), 1, "default-bold-small" )
	
	local alivetime = getElementData(player,"alivetime") or 0
	local alivetimeAll = getElementData ( player, "stat.alivetime") or 0
	local alivetimeText = roundTime(alivetime).."/"..roundTime(alivetimeAll+alivetime)
	local textWidth = dxGetTextWidth(alivetimeText,1,"default-bold-small")
	dxDrawText (alivetimeText, (startPos+oneColum+twoColum+threeColum+fourColum)+(fiveColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( 200, 200, 200, 255 ), 1, "default-bold-small" )
	
	r,g,b = 200, 200, 200
	local gangName = getElementData(player,"group") or "Без группы"
	if not gangName or gangName=="Без группы" then
	gangName="Без группы"
	r,g,b = 0, 200, 0 
	end
	if gangName  then
	local gangNamep = getElementData(getLocalPlayer(),"group")
	if gangNamep==gangName then
	r,g,b = 200, 200, 0 
	end
	end
	
	local textWidth = dxGetTextWidth(gangName,1,"default-bold-small")
	dxDrawText (gangName, (startPos+oneColum+twoColum+threeColum+fourColum+fiveColum)+(sixColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( r,g,b, 255 ), 1, "default-bold-small" )
	
	local lvl = getElementData(player,"playerlvl") or 0
	local textWidth = dxGetTextWidth(lvl,1,"default-bold-small")
	dxDrawText (lvl, (startPos+oneColum+twoColum+threeColum+fourColum+fiveColum+sixColum)+(sevenColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( 200, 200, 200, 255 ), 1, "default-bold-small" )
	
	r,g,b = 200, 200, 200
	local pFps = getElementData(player,"FPS") or 0
	local pPing = getPlayerPing(player) or 0 
	local PINGFPS = pFps.." / "..pPing
	if pPing>=1000 then r,g,b = 200,0,0 end
	local textWidth = dxGetTextWidth(PINGFPS,1,"default-bold-small")
	dxDrawText (PINGFPS, (startPos+oneColum+twoColum+threeColum+fourColum+fiveColum+sixColum+sevenColum)+(eightColum/2)-(textWidth/2), (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight+10, 1, 1, tocolor ( r,g,b, 255 ), 1, "default-bold-small" )
	
	
	dxDrawRectangle ( startPos, (startPosX+headerHeight-30)+(oneBlockHeight*i)-oneBlockHeight, width, lineHeight, tocolor ( 255, 255,255, LineTransporent ) )

	
end