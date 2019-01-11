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


function setCarSettings(settings)

local susSetting = settings['sus'] or "standart"
local engineSetting = settings['engine'] or "standart"
local r1,g1,b1 = settings['color1'][1], settings['color1'][2], settings['color1'][3]
local r2,g2,b2 = settings['color2'][1], settings['color2'][2], settings['color2'][3]

local vehId = getElementModel(source)

local origSettings = getModelHandling ( vehId )
local origSus = origSettings["suspensionLowerLimit"]
local origMaxSpeed = origSettings["maxVelocity"]
local origMaxAcceler = origSettings["engineAcceleration"]

local needtires,needengines,expenFuel,maxfuel,maxSlots = getVehicleAddonInfos (vehId)

setElementData(source,"settings.color1", RGBToHex(r1,g1,b1) )
setElementData(source,"settings.color2", RGBToHex(r2,g2,b2) )

if susSetting == "low" then
setVehicleHandling ( source, "suspensionLowerLimit", -0.01 ) 
setElementData(source,"settings.suspension","low")
elseif susSetting =="standart" then
setVehicleHandling ( source, "suspensionLowerLimit", origSus )
setElementData(source,"settings.suspension","standart")
elseif susSetting =="high" then
setVehicleHandling ( source, "suspensionLowerLimit", -0.3 ) 
setElementData(source,"settings.suspension","high")
end

if engineSetting == "speed" then
setVehicleHandling ( source, "maxVelocity", origMaxSpeed+(origMaxSpeed/100)*50 ) 
setVehicleHandling ( source, "engineAcceleration", origMaxAcceler+(origMaxAcceler/100)*50 ) 
setElementData(source,"expenFuel",expenFuel+(expenFuel/100)*50 )
setElementData(source,"settings.engine", "speed")
elseif engineSetting =="standart" then
setVehicleHandling ( source, "maxVelocity", origMaxSpeed ) 
setVehicleHandling ( source, "engineAcceleration", origMaxAcceler ) 
setElementData(source,"expenFuel",expenFuel)
setElementData(source,"settings.engine", "standart")
elseif engineSetting =="econom" then
setVehicleHandling ( source, "maxVelocity", origMaxSpeed-(origMaxSpeed/100)*30 ) 
setVehicleHandling ( source, "engineAcceleration", origMaxAcceler-(origMaxAcceler/100)*30 )  
setElementData(source,"expenFuel",expenFuel-(expenFuel/100)*50 )
setElementData(source,"settings.engine", "econom")
end

 setVehicleColor ( source, r1,  g1,  b1,  r2,  g2,  b2)   
end

addEvent( "setCarSettings", true )
addEventHandler( "setCarSettings", getRootElement(), setCarSettings )