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
		outputChatBox ( "Нажмите " .. string.upper ( GlobalChatKey ) .. " что бы написать в общий чат." , 255, 255, 255, true )
	end
)