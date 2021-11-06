--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- GlobalChat MTA:DayZ addon 1.1
-- Made by -ffs-Sniper
-- You are free to edit this addon
--///////////////////////////////////

--Add the resource as addon to DayZ

--------------------------------------------------------------------
--Your Code

--Please edit the settings in the meta.xml or admin panel instead of changing those
colorCodesDefault = { }
colorCodesDefault.colorcode1 = "#FF00FF"
colorCodesDefault.colorcode3 = "#FF00FF"
colorCodesDefault.colorcode2 = "#FFFF00"

colorCodes = { }
colorCodes.colorcode1 = get ( "colorcode1" ) or colorCodesDefault.colorcode1
colorCodes.colorcode2 = get ( "colorcode2" ) or colorCodesDefault.colorcode2
colorCodes.colorcode3 = get ( "colorcode3" ) or colorCodesDefault.colorcode3

--Check color code on start
for i, v in pairs ( colorCodes ) do
	if not getColorFromString ( v ) then
		colorCodes[i] = colorCodesDefault[i] --if the admin fails to enter a valid hex color code
		outputChatBox ( "Bad " .. i .. " specified at GlobalChat addon (format: #FFFFFF)", root, 255, 0, 0, false)
		outputDebugString ( "Bad " .. i .. " specified at GlobalChat addon (format: #FFFFFF)", 2 )
	end
end

outputLimit = 200 --character limit for chatbox outputs (do not change this)

messagePrefix = get ( "prefix" ) or "[Chat]" --prefix for the outputs

onlyLatinCharacters = get ( "latinchars" ) == "true" and true or false

timeBetweenMessages = tonumber ( get ( "messagedelay" ) ) or 1000 --time to wait between chat messages
playerTickTable = { } --create a table with tick counts of the most recent chat message

--The message output
function playeGlobalChat ( playersource, cmd, ... )
if getElementData(playersource,"logedin") then
	if cmd == "Chat" then
		--Check whether the player is muted first
		if isPlayerMuted ( playersource ) then
			outputChatBox ("You are muted!", playersource, 255, 128, 22, true)
			return
		end
		
		local msg = table.concat ( {...} , " " ) --concat the arguments from table to a string seperated by spaces
		local msg = string.gsub ( msg, '#', '' ) --remove color-codes
			exports.logger:setLog("( Conta:"..getAccountName ( getPlayerAccount ( playersource ) ).." Serial:"..getPlayerSerial ( playersource ).." IP:"..getPlayerIP ( playersource ).." ) "..getPlayerName(playersource).."escreveu para o chat global :"..msg.."","chat")	
		local message = messagePrefix .. colorCodes.colorcode2 .. string.gsub ( ( getPlayerName ( playersource ) .. " : " ), '#', '' ) .. colorCodes.colorcode3 .. msg --precreate the message string
		local message = string.sub ( message, 1, outputLimit ) --since the chatbox won't display messages with more than 128 characters we just drop the ones at the end
		local r, g, b = getColorFromString ( colorCodes.colorcode1 )		
		outputChatBox ( message, root, r, g, b, true )
		
		playerTickTable[playersource] = getTickCount ( ) 
	end
	end
end
addCommandHandler ( "Chat", playeGlobalChat )

--Admin panel resource settings checks
addEventHandler ( "onSettingChange", root, 
	function ( setting, oldValue, newValue )
		local setting = gettok ( setting, 2, string.byte ( "." ) )
		if setting == "colorcode1" or setting == "colorcode2" or setting == "colorcode3" then
			if getColorFromString ( fromJSON( newValue ) ) then --if the admin fails to enter a valid hex color code
				colorCodes[setting] = fromJSON( newValue )
			else
				colorCodes[setting] = colorCodesDefault[setting]
				outputChatBox ( "Bad " .. setting .. " specified at GlobalChat addon (format: #FFFFFF)", root, 255, 0, 0, false)
				outputDebugString ( "Bad " .. setting .. " specified at GlobalChat addon (format: #FFFFFF)", 2 )
			end
		end
		if setting == "messagedelay" then --update message delay when changed
			if tonumber ( fromJSON( newValue ) ) then
				timeBetweenMessages = tonumber ( fromJSON( newValue ) ) or 1000 --maximum securtiy is usually best
			end
		end
		if setting == "prefix" then --update message prefix when changed
			if fromJSON( newValue ) then
				messagePrefix = fromJSON ( newValue ) or "[Chat]" --segurança máxima geralmente é melhor
			end
		end
		if setting == "latinchars" then --update onlyLatinCharacters setting when changed
			onlyLatinCharacters = fromJSON ( newValue ) == "true" and true or false
		end
	end
)

addEventHandler ( "onPlayerQuit", root,
	function ( )
		playerTickTable[source] = nil --remove a leaving player from our cached table
	end
)