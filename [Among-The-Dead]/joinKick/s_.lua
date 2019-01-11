 function playerConnect (playerNick, playerIP, playerUsername, playerSerial, playerVersionNumber)
 local players =getPlayerCount ( )
    if players >=40 then 
    cancelEvent(true,"Этот сервер переполнен, но у нас есть ещё 2 сервера: Among the dead №2 и Among the dead №3") 
    end
end
  
addEventHandler ("onPlayerConnect", getRootElement(), playerConnect)