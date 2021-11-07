function RGBToHex(red, green, blue, alpha)
	
	-- Make sure RGB values passed to this function are correct
	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then
		return nil
	end

	-- Alpha check
	if alpha then
		return string.format("#%.2X%.2X%.2X%.2X", red, green, blue, alpha)
	else
		return string.format("#%.2X%.2X%.2X", red, green, blue)
	end

end



local carMechanicGarages = {
{659.0498046875,-552.731445312,15,15,15,10},
} 


local mechPed = createPed ( 264, 660.998046875,-552.1328125,16.3359375,90,false) 
	setElementData(mechPed,"pedName","Mechanic")
	setElementData(mechPed,"trader",true,false)
	setElementFrozen  ( mechPed, true )
	
function carInGarage(theElement)
local veh = getPedOccupiedVehicle(localPlayer)
	if theElement == localPlayer and  veh and getElementData(source,"isCarMechanicGarage") then
		setElementData(localPlayer,"inCarMechanicGarage",true)
		if getVehicleType (veh) =="Automobile" then 
		triggerEvent("showClientMenuItem",localPlayer,"carMechanic",veh)
		--getCarSettings( getPedOccupiedVehicle(localPlayer) )
		end
	end
end


function carOutGarage(theElement)
	if getElementData(source,"isCarMechanicGarage") and theElement==localPlayer then 
		setElementData(localPlayer,"inCarMechanicGarage",nil) 
	end
end

for i1,col in ipairs(carMechanicGarages) do
	local stantion = createColCuboid(col[1],col[2],col[3],col[4],col[5],col[6])
	setElementData(stantion,"isCarMechanicGarage",true,false)
	addEventHandler("onClientColShapeHit",stantion,carInGarage)
	addEventHandler("onClientColShapeLeave",stantion,carOutGarage)
end



	local settings ={
	["color1"] = "#FFFFFF",
	["color2"] = "#FFFFFF",
	["sus"] = "standart",
	["engine"] = "standart",
	["type"] = "mech",
	["veh"] = false,
	["price"] = 0
	}

	
local mechWin = guiCreateWindow ( 0,0, 400, 400, "Mechanic", false )	
	
local Tooltip = guiCreateStaticImage ( 0.05, 0.73, 0.90, 0.1, "images/playerScore.png", true,mechWin )

local TooltipText = guiCreateLabel(0, 0.1, 1, 1,"-",true,Tooltip)
guiSetFont (TooltipText , "default-bold" ) 
guiLabelSetHorizontalAlign (TooltipText,"center")
guiSetVisible(Tooltip,false )

function showToolTip(text,headerText,parent)

	local posx,posy = guiGetPosition(parent,false)
	local winPosX,winPosY = guiGetPosition(mechWin,false)	
			

	guiSetVisible(Tooltip,true )
	guiSetText(TooltipText,  text)
	
	
end
function hideToolTip()

	guiSetVisible(Tooltip,false )
	
end

	
	

	guiSetVisible ( mechWin,false )
	guiWindowSetSizable ( mechWin, false )
	
	local color1Text = guiCreateLabel ( 0, 0.1, 1,  0.5, "Painting #1", true, mechWin)
		guiSetFont ( color1Text, "default-bold-small" )
		guiLabelSetHorizontalAlign ( color1Text, "center" )
		
	local colorOne = guiCreateLabel ( 0, 0.15, 1,  0.06, "█████████████████", true, mechWin)
		guiLabelSetHorizontalAlign ( colorOne, "center" )
		
	local color2Text = guiCreateLabel ( 0, 0.25, 1,  0.5, "Painting #2", true, mechWin)
		guiSetFont ( color2Text, "default-bold-small" )
		guiLabelSetHorizontalAlign ( color2Text, "center" )
		
	local colorTwo = guiCreateLabel ( 0, 0.3, 1,  0.06, "█████████████████", true, mechWin)
		guiLabelSetHorizontalAlign ( colorTwo, "center" )
	
	
	local engineText = guiCreateLabel ( 0, 0.45, 1,  0.5, "Motor", true, mechWin)
		guiSetFont ( engineText, "default-bold-small" )
		guiLabelSetHorizontalAlign ( engineText, "center" )
		
		local enginePanel    =	guiCreateLabel ( 0, 0.5, 1, 1, "", true, mechWin )
			local engineSpeed    =	guiCreateRadioButton (  0.2, 0,  0.2,  0.05, "Velocidade", true, enginePanel )
			local engineStandart = 	guiCreateRadioButton (  0.4, 0,  0.2,  0.05, "Padrão", true, enginePanel )
			local engineEconom   = 	guiCreateRadioButton (  0.6, 0,  0.3,  0.05, "Eficiência", true, enginePanel )
	
	local susText = guiCreateLabel ( 0, 0.6, 1,  0.5, "Suspensão", true, mechWin)
		guiSetFont ( susText, "default-bold-small" )
		guiLabelSetHorizontalAlign ( susText, "center" )
		
		local susPanel = guiCreateLabel ( 0, 0.65, 1, 1, "", true, mechWin )
			local susLow      = 	guiCreateRadioButton (  0.2, 0,  0.2,  0.05, "Baixo", true, susPanel )
			local susStandart = 	guiCreateRadioButton (  0.4, 0,  0.2,  0.05, "Padrão", true, susPanel )
			local susHigh	  = 	guiCreateRadioButton (  0.6, 0,  0.2,  0.05, "Alto", true, susPanel )
	
	
	local saveCarSettingsBtn = guiCreateButton ( 0.05, 0.85,  0.40,  0.1, "OK", true, mechWin )
	local closeMechWinBtn = guiCreateButton ( 0.55, 0.85,  0.40,  0.1, "Fechar", true, mechWin )
	
	
	
	addEventHandler ( "onClientGUIClick", closeMechWinBtn, function() 
	guiSetVisible ( mechWin,false )
	showCursor(false)
	end, false )
	
	
	function getPrice(buy)

	local price = 0
		local veh = settings["veh"]
		if veh  then
		
		local susSetting,engineSetting = "standart","standart"
		if guiRadioButtonGetSelected( susLow )  then susSetting = "low" elseif guiRadioButtonGetSelected( susStandart ) then susSetting = "standart" elseif guiRadioButtonGetSelected( susHigh ) then susSetting = "high" end
		if guiRadioButtonGetSelected( engineSpeed )  then engineSetting = "speed" elseif guiRadioButtonGetSelected( engineStandart ) then engineSetting = "standart" elseif guiRadioButtonGetSelected( engineEconom ) then engineSetting = "econom" end
				
		local r1,g1,b1 = guiLabelGetColor ( colorOne )
		local r2,g2,b2 = guiLabelGetColor ( colorTwo )
				
				
			if settings["type"] == "mech" then
				
				
				if susSetting ~= settings["sus"] and susSetting ~= "standart" then
				price=price+20000
				end
				if engineSetting ~= settings["engine"] and engineSetting ~= "standart" then
				price=price+30000
				end
				if (r1+g1+b1) ~= (settings["color1"][1]+settings["color1"][2]+settings["color1"][3]) then
				price=price+10000
				end
				if (r2+g2+b2) ~= (settings["color2"][1]+settings["color2"][2]+settings["color2"][3]) then
				price=price+10000
				end
				
			
				
			end
			
			if price>0 then
				guiSetText ( saveCarSettingsBtn, "Comprar por: "..price )
				
				else
				guiSetText ( saveCarSettingsBtn, "OK" )
				end
			
				if buy then
				
				if price>0 then
					local money = getElementData(localPlayer,"Money") or 0
					if money>=price then
						setElementData(localPlayer,"Money",money-price)
					else
						outputChatBox("Dinheiro insuficiente")
						 return
					end
				end
					
					settings["engine"] = engineSetting
					settings["sus"] = susSetting
						
					settings["color1"] = {r1,g1,b1}
					settings["color2"] = {r2,g2,b2}
					settings["price"] = price
						
					triggerServerEvent ( "setCarSettings", veh,settings )	
						
					outputChatBox("Configurações do veículo salvas")
					
				
					guiSetVisible ( mechWin,false )
					showCursor(false)
				end
				
				
		end
	end
	
	addEventHandler( "onClientMouseEnter", engineSpeed,function() showToolTip("Velocidade máxima: +50%\nConsumo de combustível: +50%","",engineSpeed) end,false)
	addEventHandler( "onClientMouseLeave", engineSpeed, hideToolTip ,false)
	
	addEventHandler( "onClientMouseEnter", engineStandart,function() showToolTip("Velocidade máxima: Standard\nConsumo de combustível: Standard","",engineSpeed) end,false)
	addEventHandler( "onClientMouseLeave", engineStandart, hideToolTip ,false)
	
	addEventHandler( "onClientMouseEnter", engineEconom,function() showToolTip("Velocidade máxima: -30%\nConsumo de combustível: -50%","",engineSpeed) end,false)
	addEventHandler( "onClientMouseLeave", engineEconom, hideToolTip ,false)
	
	addEventHandler( "onClientMouseEnter", colorOne,function() showToolTip("Cor Principal\nClique para mudar","",engineSpeed) end,false)
	addEventHandler( "onClientMouseLeave", colorOne, hideToolTip ,false)
	
	addEventHandler( "onClientMouseEnter", colorTwo,function() showToolTip("Cor secundária\nClique para mudar","",engineSpeed) end,false)
	addEventHandler( "onClientMouseLeave", colorTwo, hideToolTip ,false)
	
	
	addEventHandler ( "onClientGUIClick", susLow, function() getPrice(false) end, false )
	addEventHandler ( "onClientGUIClick", susStandart, function() getPrice(false) end, false )
	addEventHandler ( "onClientGUIClick", susHigh, function() getPrice(false) end, false )
	addEventHandler ( "onClientGUIClick", engineSpeed, function() getPrice(false) end, false )
	addEventHandler ( "onClientGUIClick", engineStandart, function() getPrice(false) end, false )
	addEventHandler ( "onClientGUIClick", engineEconom, function() getPrice(false) end, false )
	
	
	
	
	function saveCarSettings()
		getPrice(true) 
	end
	addEventHandler ( "onClientGUIClick", saveCarSettingsBtn, saveCarSettings, false )
	
	function selectColor()
	
	if source == colorOne then
	exports.epz_cpicker: openPicker ("#1", RGBToHex(settings["color1"][1], settings["color1"][2], settings["color1"][3] ) , "Цвет #1") 
	elseif source == colorTwo then
	exports.epz_cpicker: openPicker ("#2", RGBToHex(settings["color2"][1], settings["color2"][2], settings["color2"][3] ), "Цвет #2") 
	end
	
end
	addEventHandler ( "onClientGUIClick", colorOne, selectColor, false )
	addEventHandler ( "onClientGUIClick", colorTwo, selectColor, false )
	
	function saveCarColor(id,hex,r,g,b)
		
			
			
			if id=="#1" then
				guiLabelSetColor ( colorOne, r,g,b )
			elseif id=="#2" then
				guiLabelSetColor ( colorTwo, r,g,b )
			end
			getPrice(false)
		
	end
	addEventHandler ( "onColorPickerOK", localPlayer, saveCarColor )
	
local disallowedCars ={
-- id, 1цвет, 2цвет, двиг, подвеска
{470,false,false,true,true},
{601,false,false,true,true},
{403,true,true,true,false},
}
function getCarSettings(veh)
-- color1Text
-- colorOne

-- color2Text
-- colorTwo

--engineText
--enginePanel

--susText
--susPanel
	
	guiSetVisible ( mechWin,true )
	showCursor(true)
	
	
	guiSetVisible ( color1Text,true )
	guiSetVisible ( colorOne,true )
	
	guiSetVisible ( color2Text,true )
	guiSetVisible ( colorTwo,true )
	
	guiSetVisible ( engineText,true )
	guiSetVisible ( enginePanel,true )
	
	guiSetVisible ( susText,true )
	guiSetVisible ( susPanel,true )
	
	local id = getElementModel(veh) 
	for theKey,car in ipairs(disallowedCars) do
		if id==car[1] then
		
			if car[2] == false then
				guiSetVisible ( color1Text,false )
				guiSetVisible ( colorOne,false )
			end
			
			if car[3] == false then
				guiSetVisible ( color2Text,false )
				guiSetVisible ( colorTwo,false )
			end
			
			if car[4] == false then
				guiSetVisible ( engineText,false )
				guiSetVisible ( enginePanel,false )
			end
			
			if car[5] == false then
				guiSetVisible ( susText,false )
				guiSetVisible ( susPanel,false )
			end
			
		end
	end
	
	guiSetText ( saveCarSettingsBtn, "OK" )
	local settingsSus = getElementData(veh,"settings.suspension") or "standart"
	if settingsSus=="standart" then
		guiRadioButtonSetSelected ( susStandart, true )
	elseif settingsSus == "low" then
		guiRadioButtonSetSelected ( susLow, true )
	elseif settingsSus == "high" then
		guiRadioButtonSetSelected ( susHigh, true )
	end
	settings["sus"] = settingsSus
	
	local settingsEngine = getElementData(veh,"settings.engine") or "standart"
	if settingsEngine=="standart" then
		guiRadioButtonSetSelected ( engineStandart, true )
	elseif settingsEngine == "speed" then
		guiRadioButtonSetSelected ( engineSpeed, true )
	elseif settingsEngine == "econom" then
		guiRadioButtonSetSelected ( engineEconom, true )
	end
	settings["engine"] = settingsEngine
	
	local r1,g1,b1, r2,g2,b2 = getVehicleColor ( veh, true)

	settings["color1"] = {r1,g1,b1}
	settings["color2"] = {r2,g2,b2}

	guiLabelSetColor ( colorOne, r1,g1,b1 )
	guiLabelSetColor ( colorTwo, r2,g2,b2 )

end
centerWindow(mechWin)

function openMechWin(key, keyState,type)
	local veh = getPedOccupiedVehicle(localPlayer)
	
	if type =="progress"  then
		veh = getElementData(getElementData(localPlayer,"currentCol"),"parent") or false
	end
	
	if getVehicleType (veh) ~="Automobile" then 
	outputChatBox("Este veículo não pode ser configurado.")
	return
	end
	
	if veh then
		settings["type"] = type
		settings["veh"] = veh
		getCarSettings( veh )
	end
	
end
--bindKey ( "B", "down", openMechWin,"mech" )


