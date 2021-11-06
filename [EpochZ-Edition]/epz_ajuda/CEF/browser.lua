function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end	

local screenW, screenH = guiGetScreenSize()
local browser = guiCreateBrowser(0, 0, screenW, screenH, true, true,false)

 	local theBrowser = guiGetBrowser(browser) 
 addEventHandler("onClientBrowserCreated", theBrowser, 
	function()
		loadBrowserURL(theBrowser, "http://mta/epz_ajuda/CEF/pagesLoader.html")
		setBrowserRenderingPaused ( theBrowser, true )
		--loadNews(5)
		toggleBrowserDevTools ( theBrowser, true )
	guiSetVisible ( browser, false )
	end
)

 

local keystate= 0
local fileLoad = ""
function showBrowser(key,state)
if keystate==0 then
showCursor(true)
local theBrowser = guiGetBrowser(browser) 
guiSetVisible ( browser, true )
keystate=1
--outputChatBox(key)
if key =="F7" and fileLoad~="http://mta/epz_ajuda/CEF/settings.html" then
executeBrowserJavascript ( theBrowser, "loadPages('Definições','http://mta/epz_ajuda/CEF/settings.html')" )
fileLoad="http://mta/epz_ajuda/CEF/settings.html"
elseif key =="F6" and fileLoad~="http://mta/epz_ajuda/CEF/rules.html" then
executeBrowserJavascript ( theBrowser, "loadPages('as regras','http://mta/epz_ajuda/CEF/rules.html')" )
fileLoad="http://mta/epz_ajuda/CEF/rules.html"
elseif key =="F5" and fileLoad~="http://mta/epz_ajuda/CEF/help.html" then
executeBrowserJavascript ( theBrowser, "loadPages('Ajuda','http://mta/epz_ajuda/CEF/help.html')" )
fileLoad="http://mta/epz_ajuda/CEF/help.html"
end
--loadNews(5)
setBrowserRenderingPaused ( theBrowser, false )
else
guiSetVisible ( browser, false )
setBrowserRenderingPaused ( theBrowser, true )

keystate=0
showCursor(false)
end
end
bindKey ( "F5", "down", showBrowser )
bindKey ( "F6", "down", showBrowser )
bindKey ( "F7", "down", showBrowser )

--[[
function onloadBansMuts(data,type)
--outputDebugString(data)
 executeBrowserJavascript ( theBrowser, "onloadBansMuts('"..data.."',"..type..")" )
 --outputChatBox("client onloadBansMuts = "..type)
end
addEvent( "onloadBansMuts", true )
addEventHandler( "onloadBansMuts", getRootElement(), onloadBansMuts )

function loadBansMuts(type)
triggerServerEvent ( "loadBansMuts", getLocalPlayer(),type )
--outputChatBox("client loadNews = "..type)
end

addEvent ( "loadBansMuts", true )
addEventHandler ( "loadBansMuts", theBrowser, loadBansMuts )
]]

function selectRadarSize(size)
--outputChatBox(size)
if size=="noShow" then
exports.EpochZ:setHideRadar(true)
exports.epz_gps:setState("hide","radar")

else
exports.EpochZ:setHideRadar(false)
exports.epz_gps:radarSiz(tonumber(size))
exports.EpochZ:setValueSettings("radarSize",tonumber(size))

end
end
addEvent ( "selectRadarSize", true )
addEventHandler ( "selectRadarSize", theBrowser, selectRadarSize )

function selectShowChat(bool)
bool = tonumber(bool)
	if bool == 1 then
	showChat(true)
	else
	showChat(false)
	end
end



addEvent ( "selectShowChat", true )
addEventHandler ( "selectShowChat", theBrowser, selectShowChat )


function selectIconsSize(size)
if size=="noShow" then
triggerEvent("showDebugMonitor",localPlayer,false)
else
exports.EpochZ:setIconsSize(tostring(size))
exports.EpochZ:setValueSettings("iconsSize",tostring(size))
end
end

addEvent ( "selectIconsSize", true )
addEventHandler ( "selectIconsSize", theBrowser, selectIconsSize )


function selectInvSize(size)

exports.EpochZ:setInvSize(tonumber(size))
exports.EpochZ:setValueSettings("invSize",tonumber(size))
end

addEvent ( "selectInvSize", true )
addEventHandler ( "selectInvSize", theBrowser, selectInvSize )


function selectAIM(aim)

exports.EpochZ:selectAIM(tonumber(aim))
exports.EpochZ:setValueSettings("aim",tonumber(aim))
end

addEvent ( "selectAIM", true )
addEventHandler ( "selectAIM", theBrowser, selectAIM )


function selectTextureQ(Q)
exports.EpochZ:setValueSettings("worldTextureQ",Q)
end
addEvent ( "selectTextureQ", true )
addEventHandler ( "selectTextureQ", theBrowser, selectTextureQ )

function setGroupDistance(value)
	value = tonumber(value)
	exports.EpochZ:setGroupDistance(value)
	exports.EpochZ:setValueSettings("groupDistance",value)
end
addEvent ( "setGroupDistance", true )
addEventHandler ( "setGroupDistance", theBrowser, setGroupDistance )



function loadSettings()

local jsonSettings = exports.EpochZ:getSettingsJson()
 executeBrowserJavascript ( theBrowser, "onLoadSettings('"..jsonSettings.."')" )
end

addEvent ( "loadSettings", true )
addEventHandler ( "loadSettings", theBrowser, loadSettings )