theTexts = {}
theInfoTexts = {}
theTextTimer = {}
function startRollMessage(text, r, g, b)
	if #theTexts == 4 then
		destroyTextItem()
	end
		table.insert(theTexts,{text,r,g,b})
		checkTimers()
end
addEvent("onRollMessageStart", true)
addEventHandler("onRollMessageStart", getLocalPlayer(), startRollMessage)

function destroyTextItem ()
	table.remove(theTexts,1)
end


function checkTimers ()
	if isTimer(theTextTimer["destroy"]) then
		killTimer(theTextTimer["destroy"])
	end
	theTextTimer["destroy"] = setTimer(destroyTextItem,4000,4)
end



local startRoll = -100

function startRollMessage2(head,text)
	if #theInfoTexts == 1 then
		theInfoTexts ={}
		startRoll= -100
	end
		table.insert(theInfoTexts,{head,text})
		checkTimers2()
end
addEvent("displayClientInfo", true)
addEventHandler("displayClientInfo", getLocalPlayer(), startRollMessage2)


function destroyTextItem2 ()
	theInfoTexts ={}
	startRoll= -100
	end
		



function checkTimers2 ()
	if isTimer(theTextTimer["destroyInfo"]) then
		killTimer(theTextTimer["destroyInfo"])
	end
	theTextTimer["destroyInfo"] = setTimer(destroyTextItem2,2000,1)
end

--Draw Part
local screenWidth, screenHeight = guiGetScreenSize()
local boxSpace = dxGetFontHeight(1,"default-bold")+dxGetFontHeight(1,"default-bold")*0.3



		local headTextScale = 1
		local bodyTextScale = 1
		local headTextHeigth = dxGetFontHeight (headTextScale,"default-bold" )
		local bodyTextHeigth = dxGetFontHeight (bodyTextScale,"default-bold-small" )

	
		
addEventHandler("onClientRender", getRootElement(), 
function()
	for id, value in pairs(theTexts) do
			local a = 200
			dxDrawText ( value[1],screenWidth*0.3, screenHeight-id*boxSpace, screenWidth*0.7, screenHeight-(id-1)*boxSpace,tocolor(value[2],value[3],value[4],a),1,"default-bold","center","bottom",false,false,false,true)--, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(value[2],value[3],value[4],a),a, 0.9, "default-bold", "center", "center" )
	end
	
	if startRoll<0 then startRoll=startRoll+5 end
	for id, value in pairs(theInfoTexts) do
		local headText = dxGetTextWidth(value[1],headTextScale,"default-bold")
		local bodyText = dxGetTextWidth(value[2],bodyTextScale, "default-bold-small")

		
		local recWidthBody = (screenWidth*0.01)+bodyText
		local recHeigthBody = (screenWidth*0.01)+bodyTextHeigth
		
		local recWidthHead = (screenWidth*0.01)+headText
		local recHeigthHead = (screenWidth*0.01)+headTextHeigth
			--newbieHeight = dxGetFontHeight(1, "default-bold")*dxGetTextHeight(newbieText)
			
		dxDrawRectangle ( screenWidth/2-(recWidthHead/2),startRoll, recWidthHead, recHeigthHead, tocolor (33,33,33,170) )
		
		dxDrawRectangle ( screenWidth/2-(recWidthBody/2),startRoll+recHeigthHead, recWidthBody, recHeigthBody, tocolor (33,33,33,140) )
		
				
		dxDrawText ( value[1],screenWidth/2-(recWidthHead/2), startRoll, screenWidth/2-(recWidthHead/2)+recWidthHead, startRoll+recHeigthHead,tocolor(255,0,0,255),headTextScale,"default-bold","center","center")--, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(value[2],value[3],value[4],a),a, 0.9, "default-bold", "center", "center" )
		
		dxDrawText ( value[2],screenWidth/2-(recWidthBody/2), startRoll+recHeigthHead, screenWidth/2-(recWidthBody/2)+recWidthBody, startRoll+recHeigthHead+recHeigthBody,tocolor(255,255,255,255),bodyTextScale,"default-bold-small","center","center")--, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(value[2],value[3],value[4],a),a, 0.9, "default-bold", "center", "center" )
		
		
		--dxDrawText ( value[2],screenWidth/2-(recWidth/2), 0, (screenWidth/2-(recWidth/2))+((screenWidth*0.1)+bodyText), screenWidth*0.05,tocolor(255,255,255,255),1.2,"default-bold-small","left","center")--, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(value[2],value[3],value[4],a),a, 0.9, "default-bold", "center", "center" )
				 
	end
	
end
)