--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- GlobalChat MTA:DayZ addon 1.1
-- Made by -ffs-Sniper
-- You are free to edit this addon
--///////////////////////////////////

--Define your desired chat key
GlobalChatKey = "m"

addEventHandler( "onClientResourceStart", getResourceRootElement ( ),
	function ( )
		bindKey ( GlobalChatKey, "down", "chatbox", "Chat" )
		outputChatBox ( "Click " .. string.upper ( GlobalChatKey ) .. " to write in general chat." , 255, 255, 255, true )
	end
)