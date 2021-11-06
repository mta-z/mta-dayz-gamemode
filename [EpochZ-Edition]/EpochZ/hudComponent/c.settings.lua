local settingsTable = {
{"radarSize",0,1},
{"iconsSize","small","standart"},
{"invSize",0.9,0.8},
{"worldTextureQ","low","normal"},
{"aim",1,1},
{"groupDistance",0,0},
}
local screenW,screenH = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]

local settingsFile = false 
function createSettings()

	 settingsFile = xmlCreateFile("interfaceSettings.xml","settings")
	for i,set in ipairs(settingsTable) do
		local NewNode = xmlCreateChild(settingsFile, tostring(set[1]))
			if screenW<1000 then
				xmlNodeSetValue(NewNode, set[2])
			else
				xmlNodeSetValue(NewNode, set[3])
			end
	end
	xmlSaveFile(settingsFile)
	xmlUnloadFile(settingsFile)
	loadSettings()
	
end

function loadSettings()

	settingsFile  = xmlLoadFile ( ":DayZ/interfaceSettings.xml" )

	local settings = xmlNodeGetChildren(settingsFile)
	for i,node in ipairs(settings) do 
	
		local nodeName = xmlNodeGetName ( node )
        local nodeValue = xmlNodeGetValue(node)  
		
		if nodeName == "radarSize" then
		exports.epz_gps:radarSiz(tonumber(nodeValue))
		
		elseif nodeName == "iconsSize" then
		exports.EpochZ:setIconsSize(tostring(nodeValue))		
		
		elseif nodeName == "invSize" then
		exports.EpochZ:setInvSize(tonumber(nodeValue))
		
		--elseif nodeName == "worldTextureQ" then
		--exports.WS:setTextureQ(tonumber(nodeValue))
		elseif nodeName == "aim" then
		selectAIM(nodeValue)
		
		elseif nodeName=="groupDistance" then
			if nodeValue =="1" then
			setGroupDistance(true)
			end
		end
    end
 
end


function getSettingsValue(settings)

local setNode =  xmlFindChild ( settingsFile, settings, 0 )
local value = 	xmlNodeGetValue ( setNode, value )  
if value then
return value
end
return false
end

function setValueSettings(child, value)

			local setNode =  xmlFindChild ( settingsFile, child, 0 )
			if  setNode then
				xmlNodeSetValue ( setNode, value )   
				xmlSaveFile(settingsFile)			
			else
				local NewNode = xmlCreateChild(settingsFile, tostring(child))
				if NewNode then
					xmlNodeSetValue(NewNode, value)
				end
			end
end


addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), function() 
if not fileExists ( ":DayZ/interfaceSettings.xml" ) then
	createSettings()
	else
	loadSettings()
end

end);


function getSettingsJson()
local jsonSettings = "{"
local settings = xmlNodeGetChildren(settingsFile)
local length = 0
local chatShowing = isChatVisible ()
if chatShowing then chatShowing = 1 else chatShowing = "noShow" end
	for i,node in ipairs(settings) do 
		local nodeName = xmlNodeGetName ( node )
        local nodeValue = xmlNodeGetValue(node)  
		if nodeName =="radarSize" and hideRadar then nodeValue ="noShow" end
		if nodeName =="iconsSize" and hideIcons then nodeValue ="noShow" end
		local value = '"'..nodeName..'"'..':"'..nodeValue..'",'
		jsonSettings = jsonSettings..""..value
		length=i
    end
	jsonSettings=jsonSettings..'"length":"'..length..'","chatShow":"'..chatShowing..'"}'
	return  jsonSettings
end

