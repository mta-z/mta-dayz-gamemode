function offerExc(player)
	if player and isElement(player) then
	if getElementData(player,"exchange") then return end
	if getElementData(source,"exchange") then return end
	
		setElementData(player,"offerExc",source)
		triggerClientEvent(player,"hideInventoryManual",player)
		
		outputChatBox("#FFFF00"..getPlayerName(source).."#FFFFFF Предложил вам обмен.",player,255,255,255,true)
		outputChatBox("#FFFF00Нажмите #FF0000J #FFFF00чтобы согласиться/отказаться",player,255,255,255,true)
		setTimer(function()
		triggerEvent("offerExcCancel",player,source)
		end,10000,1)
	end
end
addEvent("offerExc",true)
addEventHandler("offerExc",getRootElement(),offerExc)


function offerExcCancel(player)

	setElementData(source,"offerExc",false)
	
	if player and isElement(player) then

		outputChatBox("#FFFF00"..getPlayerName(source).."#FFFFFF Отказался от обмена.",player,255,255,255,true)
		

	end
end
addEvent("offerExcCancel",true)
addEventHandler("offerExcCancel",getRootElement(),offerExcCancel)


function offerExcOK(player)

	setElementData(source,"offerExc",false)
	
	if player and isElement(player) then

		outputChatBox("#FFFF00"..getPlayerName(source).."#FFFFFF Согласился на обмен.",player,255,255,255,true)
		triggerClientEvent(player,"hideInventoryManual",player)
		
		--setTimer(function()



		--end,1000,1)

		
		
		
		
	local x,y,z = getElementPosition(source)
	local excCol = createColSphere ( x,y,z+5, 5 )
	setElementData(source,"exchange",excCol)
	setElementData(source,"exchangePartner",player)
	
	local x,y,z = getElementPosition(player)
	local excColPlayer = createColSphere ( x,y,z+5, 5 )
	setElementData(player,"exchange",excColPlayer)
	setElementData(player,"exchangePartner",source)
	
	setElementData(player,"exchangePartnerCol",excCol)
	setElementData(source,"exchangePartnerCol",excColPlayer)

triggerClientEvent(player,"offerExcRemoteOK",player,source)

	end
end
addEvent("offerExcOK",true)
addEventHandler("offerExcOK",getRootElement(),offerExcOK)







function exchangeCompleted()

	local exchangePartnerCol = getElementData(source,"exchangePartnerCol")

	local data = getAllElementData ( exchangePartnerCol )     
    for k, v in pairs ( data ) do                  
        outputConsole ( k .. ": " .. tostring ( v ) )
		
		local datas = getElementData(source,tostring(k)) 
		setElementData(source,tostring(k),datas+v) -- добавляем в Inventário из Coca-Colaпса партнера по обмену
		
		--local datas = getElementData(exchangePartner,tostring(k))
		--setElementData(exchangePartner,tostring(k),datas-v) -- удаляем из инвентаря партнера по обмену
		
		
    end
	destroyElement(exchangePartnerCol)
	
	setElementData(source,"exchange",nil)
	
	setElementData(source,"exchangePartner",nil)
	setElementData(source,"exchangePartnerCol",nil)
	
	outputChatBox(getPlayerName(source).." exchangePartner set to nil")
	
	outputChatBox("#FFFFFFОбмен завершен.",source,255,255,255,true)
end

addEvent("exchangeCompleted",true)
addEventHandler("exchangeCompleted",getRootElement(),exchangeCompleted)


function exchangeCancel()
	local exchangePartner = getElementData(source,"exchangePartner")
	local exchangeCol = getElementData(source,"exchange")
	
	if exchangePartner and isElement(exchangePartner) then

		outputChatBox("#FFFF00"..getPlayerName(source).."#FFFFFF Отменил обмен.",exchangePartner,255,255,255,true)
	
	end
	local exchangeColPartner = getElementData(exchangePartner,"exchange")
	
	destroyElement(exchangeColPartner)
	
	destroyElement(exchangeCol)
	
	
	setElementData(exchangePartner,"exchange",nil)
	setElementData(source,"exchange",nil)
	
	setElementData(exchangePartner,"exchangePartner",nil)
	setElementData(source,"exchangePartner",nil)
	
	triggerClientEvent(exchangePartner,"exchangeCancelRemote",exchangePartner) 
	
end
addEvent("exchangeCancel",true)
addEventHandler("exchangeCancel",getRootElement(),exchangeCancel)



function quitPlayerRemoveExchange ( quitType )

local exchangeCol = getElementData(source,"exchange")

if exchangeCol then

triggerEvent("exchangeCancel",source)

end

end
addEventHandler ( "onPlayerQuit", getRootElement(), quitPlayerRemoveExchange )


function refreshRemote(accept)
	local exchangePartner = getElementData(source,"exchangePartner")
	
	outputChatBox(getPlayerName(source).." refreshRemote1 accept:"..tostring(accept)) 
	if exchangePartner and isElement(exchangePartner) then
	outputChatBox(getPlayerName(source).." refreshRemote2 accept:"..tostring(accept)) 
		local exchangeCol = getElementData(source,"exchange")
		triggerClientEvent(exchangePartner,"refreshRemote",exchangePartner,exchangeCol,"remote",accept)
	
	end

	
end
addEvent("refreshRemote",true)
addEventHandler("refreshRemote",getRootElement(),refreshRemote)