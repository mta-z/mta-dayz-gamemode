local root = getRootElement()
 
addEventHandler("onPlayerLogin", root,
  function()
	triggerClientEvent ( "onRollMessageStart", getRootElement(), "#FFFFFF"..getPlayerName(source).." #00FF00Logou!",0,255,0, "Login")
  end
)

addEventHandler("onPlayerChangeNick", root,
  function(oldNick,newNick)
	triggerClientEvent ( "onRollMessageStart", getRootElement(), " #00FF00"..oldNick.." #FFFFFFMudou o apelido para  #00FF00"..newNick,255,255,255, "ChangeNick")
  end
)

addEventHandler("onPlayerQuit", root,
  function(quitType,reason,responsibleElement)
  if quitType ~="Bad Connection" and quitType ~="Unknown" then
	triggerClientEvent ( "onRollMessageStart", getRootElement(), "#FFFFFF"..getPlayerName(source).." #FF0000 saiu por uma razão: #555555"..quitType,255,0,0, "Quit")
end
	end
)