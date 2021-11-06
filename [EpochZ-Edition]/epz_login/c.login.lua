local cameraPositions={
{2334,99,30,2342,88,26},
{2293,40,31,2196,42,31},
{643,-660,30,642,-586,16},
{1659,-935,72,1639,-1147,82}
}

function setCameraPositions()

local r = math.random(1,#cameraPositions)
setCameraMatrix  ( cameraPositions[r][1], cameraPositions[r][2], cameraPositions[r][3],cameraPositions[r][4], cameraPositions[r][5], cameraPositions[r][6],0,70)  
end
setCameraPositions()

local screenW, screenH = guiGetScreenSize()
local browser = guiCreateBrowser(0, 0, screenW, screenH, true, true,false)
local pageLoaded = false

 	local theBrowser = guiGetBrowser(browser) 


	addEventHandler("onClientBrowserCreated", theBrowser, 
	function()
		loadBrowserURL(theBrowser, "http://mta/epz_login/CEF/login.html")
		--setBrowserRenderingPaused ( theBrowser, true )
		--toggleBrowserDevTools ( theBrowser, true )
		showChat(false)
		showCursor(true)
	--guiSetVisible ( browser, false )
	end
)

 

addEventHandler ( "onClientBrowserDocumentReady" , theBrowser , 
	function ( url ) 
		pageLoaded=true
		fadeCamera ( true, 5,0,0,0 )
		local login = ""
		local pass = ""
		
		local confFile = xmlLoadFile(":epz_login/preferencesL.xml")
	if (confFile) then
		login = xmlNodeGetAttribute(confFile,"username")
		pass = xmlNodeGetAttribute(confFile,"pass")
		xmlUnloadFile ( confFile )
		else
		confFile = xmlCreateFile("preferencesL.xml","user")
		xmlNodeSetAttribute(confFile,"username","")
		xmlNodeSetAttribute(confFile,"pass","")	
		xmlSaveFile(confFile)
		xmlUnloadFile ( confFile )    
		
	end	
	
	executeBrowserJavascript ( theBrowser, "loadAccount('"..login.."','"..pass.."')" )	
		
	end 
)


function loginAccount(login,pass)
triggerServerEvent("onClientSendLoginDataToServer", getLocalPlayer(), login, pass)
end
addEvent ( "loginAccount", true )
addEventHandler ( "loginAccount", theBrowser, loginAccount )

function registerAccount(login,pass)
triggerServerEvent("onClientSendRegisterDataToServer", getLocalPlayer(), login, pass)
end
addEvent ( "registerAccount", true )
addEventHandler ( "registerAccount", theBrowser, registerAccount )

function toggleSavePassword(login, pass)
		confFile = xmlLoadFile(":epz_login/preferencesL.xml")
		xmlNodeSetAttribute(confFile, "username", login)
		xmlNodeSetAttribute(confFile, "pass", pass)
		xmlSaveFile(confFile)
		xmlUnloadFile ( confFile )  
end

function onPlayerDoneLogin(login,pass)
showCursor(false)
showChat(true)
destroyElement(browser)
		toggleSavePassword(login,pass)
end
addEvent ( "onPlayerDoneLogin", true )
addEventHandler ( "onPlayerDoneLogin", getRootElement(), onPlayerDoneLogin )


function showError(errorText)
	if pageLoaded then
		executeBrowserJavascript ( theBrowser, "showError('"..errorText.."')" )
	end
end
addEvent ( "showError", true )
addEventHandler ( "showError", localPlayer, showError )