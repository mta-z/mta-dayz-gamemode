
local gPlayerTickCount = { }
local gPlayerSpams = { }
local gPlayerMessage = { }
local gPlayerMsgNum = { }
local gPlayerMuteTimer = { }

local gSettings = { }


 function onPlayerChatFlood( message )
        if not gPlayerSpams[ source ] then
			gPlayerSpams[ source ] = true
			gPlayerTickCount[ source ] = getTickCount( )
            gPlayerMessage[ source ] = message
        else
			if getTickCount( ) - gPlayerTickCount[ source ] > gSettings.delay then
				gPlayerMsgNum[ source ] = 0
				gPlayerMessage[ source ] = nil;
				gPlayerTickCount[ source ] = getTickCount( )
				return
			else
				if gPlayerMsgNum[ source ] >= gSettings.msgNum then
					gPlayerTickCount[ source ] = getTickCount( )
					cancelEvent( )
					if gSettings.mutePlayers then
						mutePlayer( source );
					end
				elseif message == gPlayerMessage[ source ] then
					cancelEvent( )
					outputChatBox( "Do not flood!", source, 82, 82, 82 )
				end
				gPlayerMsgNum[ source ] = gPlayerMsgNum[ source ] + 1
			end
        end
		gPlayerMessage[ source ] = message
    end
addEventHandler( "onPlayerChat", getRootElement( ), onPlayerChatFlood )

 function onPlayerChatFloodc( source, cmd, message )
        if not gPlayerSpams[ source ] then
			gPlayerSpams[ source ] = true
			gPlayerTickCount[ source ] = getTickCount( )
            gPlayerMessage[ source ] = message
        else
			if getTickCount( ) - gPlayerTickCount[ source ] > gSettings.delay then
				gPlayerMsgNum[ source ] = 0
				gPlayerMessage[ source ] = nil;
				gPlayerTickCount[ source ] = getTickCount( )
				return
			else
				if gPlayerMsgNum[ source ] >= gSettings.msgNum then
					gPlayerTickCount[ source ] = getTickCount( )
					cancelEvent( )
					if gSettings.mutePlayers then
						mutePlayer( source );
					end
				elseif message == gPlayerMessage[ source ] then
					cancelEvent( )
					outputChatBox( "Do not flood!", source, 82, 82, 82 )
				end
				gPlayerMsgNum[ source ] = gPlayerMsgNum[ source ] + 1
			end
        end
		gPlayerMessage[ source ] = message
    end
addEventHandler( "onPlayerChat", getRootElement( ), onPlayerChatFlood )
addCommandHandler ( "radiochat", onPlayerChatFloodc )
addCommandHandler ( "Chat", onPlayerChatFloodc )
function mutePlayer( player )
	if not isPlayerMuted( player ) then
		setPlayerMuted( player, true );
		gPlayerMuteTimer[ player ] = setTimer( unmutePlayer, gSettings.muteTime * 1000, 1, player );
		outputChatBox( "Você foi desativado Bate-papo " .. gSettings.muteTime .." segundos.", player, 82, 82, 82 )
	end
end





function unmutePlayer( player )
	setPlayerMuted( player, false );
	outputChatBox( "Seu bate-papo foi ativado!", player, 82, 82, 82 );
end

addEventHandler( "onPlayerJoin", getRootElement( ),
	function( )
		gPlayerMsgNum[ source ] = 0
	end
)

addEventHandler( "onResourceStart", getResourceRootElement( getThisResource() ),
    function( )
        gSettings.delay = get( "@differenceBetweenMessages_ms" )
		gSettings.msgNum = get( "@messagesNumber" )
		gSettings.mutePlayers = ( get( "@mutePlayers" ) == "true" ) and true or false;
		gSettings.muteTime = get( "@muteTime" );
		for _, plr in pairs( getElementsByType( "player" ) ) do
			gPlayerMsgNum[ plr ] = 0
		end
    end
)

addEventHandler( "onResourceStop", getResourceRootElement(),
	function( )
		local players = getElementsByType( "player" );
		for i, plr in pairs( players ) do
			if isPlayerMuted( plr ) then
				setPlayerMuted( plr, false );
			end
		end
	end
)

local commandSpam = {}

function preventCommandSpam()
	if (not commandSpam[source]) then
		commandSpam[source] = 1
		-- New person so add to table
	elseif (commandSpam[source] == 10) then
		cancelEvent()
		kickPlayer(source,"Flood não é permitido.") 
		-- This person is command spamming!
	else
		commandSpam[source] = commandSpam[source] + 1
		-- Add one to the table
	end
end
addEventHandler("onPlayerCommand", root, preventCommandSpam)
setTimer(function() commandSpam = {} end, 2000, 0) -- Clear the table every second