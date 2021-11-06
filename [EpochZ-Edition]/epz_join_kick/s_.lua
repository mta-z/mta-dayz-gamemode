 function playerConnect (playerNick, playerIP, playerUsername, playerSerial, playerVersionNumber)
 local players =getPlayerCount ( )
    if players >=100 then 
    cancelEvent(true,"Este servidor está cheio, mas temos mais 2 servidores: Entre os mortos No. 2 e Entre os mortos No. 3") 
    end
end
  
addEventHandler ("onPlayerConnect", getRootElement(), playerConnect)