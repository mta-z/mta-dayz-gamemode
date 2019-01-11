function setLog(logMessage,loger)
local timee = getRealTime( )
if loger == "log" then
    file = fileOpen ( "logger.log" )
    if ( file ) then
        pos = fileGetSize( file );
        newPos = fileSetPos ( file, pos );
        writeFile = fileWrite ( file, "[ "..(1900+timee.year).."-"..timee.month.."-"..timee.monthday.." "..timee.hour..":"..timee.minute.." ] "..logMessage .."\n" );
        if ( writeFile ) then
            fileClose ( file );
			return true
        else
            outputDebugString ( "Error writing the logs." );
            fileClose ( file );
            return false;
        end
		else
	 file =	fileCreate("logger.log")  
	 fileClose ( file );
		return false
    end 
elseif loger=="bases" then

  file = fileOpen ( "bases.log" )
    if ( file ) then
        pos = fileGetSize( file );
        newPos = fileSetPos ( file, pos );
        writeFile = fileWrite ( file, "[ "..(1900+timee.year).."-"..timee.month.."-"..timee.monthday.." "..timee.hour..":"..timee.minute.." ] "..logMessage .."\n" );
        if ( writeFile ) then
            fileClose ( file );
			return true
        else
            outputDebugString ( "Error writing the logs." );
            fileClose ( file );
            return false;
        end
		else
	 file =	fileCreate("bases.log")  
	 fileClose ( file );
		return false
    end 
	
	else
	    file = fileOpen ( "chatLogger.log" )
    if ( file ) then
        pos = fileGetSize( file );
        newPos = fileSetPos ( file, pos );
        writeFile = fileWrite ( file, "[ "..(1900+timee.year).."-"..timee.month.."-"..timee.monthday.." "..timee.hour..":"..timee.minute.." ] "..logMessage .."\n" );
        if ( writeFile ) then
            fileClose ( file );
			return true
        else
            outputDebugString ( "Error writing the logs." );
            fileClose ( file );
            return false;
        end
		else
	 file =	fileCreate("chatLogger.log")  
	 fileClose ( file );
		return false
    end 
	
	end
	
end





function resStart ( res )
local fileLog = fileExists ( ":logger/logger.log" )
if not fileLog then
fileCreate("logger.log")  
end

local fileLog = fileExists ( ":logger/chatLogger.log" )
if not fileLog then
fileCreate("chatLogger.log")  
end
local fileLog = fileExists ( ":logger/bases.log" )
if not fileLog then
fileCreate("bases.log")  
end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), resStart)



function nickChangeHandler(oldNick, newNick)
if getElementData(source,"logedin") then
setLog("( Account:"..getAccountName ( getPlayerAccount ( source ) ).." Serial:"..getPlayerSerial (source).." IP:"..getPlayerIP ( source ).." )  Сменил ник:"..oldNick.." на "..newNick.."","log")
else
setLog("( Serial:"..getPlayerSerial ( source).." IP:"..getPlayerIP ( source ).." )  Сменил ник:"..oldNick.." на "..newNick.."","log")

end
end
addEventHandler("onPlayerChangeNick", getRootElement(), nickChangeHandler)

function loggerChat( message, messageType )
if getElementData(source,"logedin") then
	setLog("( Account:"..getAccountName ( getPlayerAccount ( source ) ).." Serial:"..getAccountSerial ( getPlayerAccount ( source ) ).." IP:"..getPlayerIP ( source ).." ) "..getPlayerName(source).."  написал в локальный чат #"..messageType.." :"..message.."","chat")
else
	setLog("( Serial:"..getPlayerSerial (source ).." IP:"..getPlayerIP ( source ).." ) "..getPlayerName(source).."  написал в локальный чат #"..messageType.." :"..message.."","chat")

	end
end
addEventHandler( "onPlayerChat", getRootElement(), loggerChat )
