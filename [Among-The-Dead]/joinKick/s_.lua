 function playerConnect (playerNick, playerIP, playerUsername, playerSerial, playerVersionNumber)
 local players =getPlayerCount ( )
    if players >=40 then 
    cancelEvent(true,"This server is full, but we have 2 more servers: Among the dead No. 2 and Among the dead No. 3") 
    end
end
  
addEventHandler ("onPlayerConnect", getRootElement(), playerConnect)