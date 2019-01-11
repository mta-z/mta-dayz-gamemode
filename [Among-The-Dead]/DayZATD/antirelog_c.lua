local screenWidth, screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
local timer = false
local attName = false



function startAntirelog(player,attackerNick)
attName = tostring(attackerNick)
timer=setTimer(function() 
timer = false
attName = false
local tableHArelog = isEventHandlerAdded('onClientRender', root, showAntirelog)
if tableHArelog then
removeEventHandler ( "onClientRender", root, showAntirelog )
triggerServerEvent("removeAntirelog",player,player)
end
end,10000,1)
addEventHandler ( "onClientRender", root, showAntirelog )
end
addEvent( "showAntirelog", true )
addEventHandler( "showAntirelog", localPlayer, startAntirelog )

function showAntirelog ()
if timer then
	local ms, mm, ss = getTimerDetails ( timer )

	local antirelogText = "Антирелог: "..math.ceil((ms/1000)).." сек"
	
	local antirelogTextW = dxGetTextWidth ( antirelogText, 1.4, "sans" )
	local attTextW = dxGetTextWidth ( attName, 1.4, "sans" )
	local attTextH = dxGetFontHeight ( 1.4, "sans" )
		dxDrawText ( attName, 30,  (screenHeight/2)-attTextH, screenWidth, screenHeight, tocolor ( 200,200,200, 200 ), 1.4, "sans")
		dxDrawText ( antirelogText, 30,  screenHeight/2, screenWidth, screenHeight, tocolor ( 200,0,0, 200 ), 1.4, "sans" )
else
removeEventHandler("onClientRender", root, showAntirelog) 
	  end
	  end

	 function stopAntirelog()
	 timer = false
	 attName = false
	 local tableHArelog = isEventHandlerAdded('onClientRender', root, showAntirelog)
if tableHArelog then
removeEventHandler("onClientRender", root, showAntirelog) 
end
	  end
	  addEvent( "stopAntirelog", true )
addEventHandler( "stopAntirelog", localPlayer, stopAntirelog )