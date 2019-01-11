local root = getRootElement()
 
addEventHandler("onPlayerLogin", root,
  function()
	triggerClientEvent ( "onRollMessageStart", getRootElement(), "#FFFFFF"..getPlayerName(source).." #00FF00залогинился!",0,255,0, "Login")
  end
)

addEventHandler("onPlayerChangeNick", root,
  function(oldNick,newNick)
	triggerClientEvent ( "onRollMessageStart", getRootElement(), " #00FF00"..oldNick.." #FFFFFFизменил ник на  #00FF00"..newNick,255,255,255, "ChangeNick")
  end
)

addEventHandler("onPlayerQuit", root,
  function(quitType,reason,responsibleElement)
  if quitType ~="Bad Connection" and quitType ~="Unknown" then
	triggerClientEvent ( "onRollMessageStart", getRootElement(), "#FFFFFF"..getPlayerName(source).." #FF0000вышел по причине: #555555"..quitType,255,0,0, "Quit")
end
	end
)