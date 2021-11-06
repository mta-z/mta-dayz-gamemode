function tryToLoginPlayer(login,password)
  local account = getAccount(login, password)
  if account then
    local accLogin = getAccountName(account)
    local isLogin = logIn(source, account, password)
	if isLogin then
    triggerClientEvent(source, "onPlayerDoneLogin", source, accLogin, password)
    triggerEvent("onPlayerDayZLogin", getRootElement(), login, pass, source)
	end
  else
		reason = "Invalid login or password!"
	 triggerClientEvent(source,"showError", source,reason)
  end
end
 
addEvent("onClientSendLoginDataToServer", true)
addEventHandler("onClientSendLoginDataToServer", getRootElement(), tryToLoginPlayer)


function tryToRegsiterPlayer(login, pass)
  if not getAccount(login, pass) then
    theAccount = addAccount(login, pass)
    if theAccount then
     local isLogin =  logIn(source, theAccount, pass)
	 if isLogin then
      outputChatBox("Você registrou uma conta com login: " .. login .. " e senha:" .. pass .. "", source, 255, 255, 255, true)
      triggerClientEvent(source, "onPlayerDoneLogin", source, login, pass)
      triggerEvent("onPlayerDayZRegister", getRootElement(), login, pass, source)
    end
	else
      reason = "Unknown error!"
	  triggerClientEvent(source,"showError", source,reason)
    end
  else
    reason = "This account already exists!"
	  triggerClientEvent(source,"showError", source,reason)
  end
end
 
addEvent("onClientSendRegisterDataToServer", true)
addEventHandler("onClientSendRegisterDataToServer", getRootElement(), tryToRegsiterPlayer)
