
function EnterBase(hitPlayer)
if getElementType(hitPlayer) == "vehicle" then
setElementData(hitPlayer,"CarInBase",true)
end

if getElementType(hitPlayer) ~= "player" then
return
end
local gang = getElementData(hitPlayer, "group") or "none"
local groupUserStatus = getElementData(hitPlayer, "groupUserStatus") or false
local gangOK = getElementData(source,"gangOK")
local spawnToPos = getElementData(source,"spawnToPos")

local playerPosX,playerPosY,playerPosZ = getElementPosition (hitPlayer)
local isADMIN = isObjectInACLGroup ( "user." .. getAccountName (getPlayerAccount(hitPlayer)), aclGetGroup ( "Admin" ) )


if gangOK ~= "false" then

if  gang ==gangOK  then
if groupUserStatus and groupUserStatus~="BEGGINER" then
	outputChatBox("Você entrou em uma BASE de um grupo: "..gangOK,hitPlayer)
	exports.logger:setLog("( Account:"..getAccountName ( getPlayerAccount ( hitPlayer ) ).." Serial:"..getPlayerSerial ( hitPlayer ).." IP:"..getPlayerIP ( hitPlayer ).." ) "..getPlayerName(hitPlayer).." вошел в базу группы :"..gangOK.."","log")	
	setElementData(hitPlayer,"inBase",true)
else
local skin = getElementModel(hitPlayer) or 170
	spawnPlayer(hitPlayer,spawnToPos[1], spawnToPos[2],spawnToPos[3],0,skin)
	outputChatBox("Um novato do grupo e não pode entrar na base!",hitPlayer)

end
	else
	if not isADMIN then
	local skin = getElementModel(hitPlayer) or 170
	spawnPlayer(hitPlayer,spawnToPos[1], spawnToPos[2],spawnToPos[3],0,skin)
	outputChatBox("Você entrou em uma na base de um grupo de sobreviventes: "..gangOK.." Você não está neste grupo!",hitPlayer)
	exports.logger:setLog("( Account:"..getAccountName ( getPlayerAccount ( hitPlayer ) ).." Serial:"..getPlayerSerial ( hitPlayer ).." IP:"..getPlayerIP ( hitPlayer ).." ) "..getPlayerName(hitPlayer).." из группы "..gang.." попытался войти в базу группы :"..gangOK.."","log")	
	
	else
	outputChatBox("Você entrou em uma base de um grup : "..gangOK,hitPlayer)
	setElementData(hitPlayer,"inBase",true)	
	end
end

end


	
end

 

function LeaveBase(hitPlayer)
if getElementType(hitPlayer) == "player" then
setElementData(hitPlayer,"inBase",false)
end
if getElementType(hitPlayer) == "vehicle" then
setElementData(hitPlayer,"CarInBase",false)
end
end



function baseEnterDebug(player,text)
--outputChatBox("baseEnterDebug")
banPlayer ( player, false,false,true, "Console",text,10800 )
end
addEvent("baseEnterDebug",true)
addEventHandler("baseEnterDebug",root,baseEnterDebug)

function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

function getCars(base,countOne)
colap = getElementData(getRootElement(),base)
CarsVar = {}
local carsIndex =""
local carscOUNT =0
if base =="base20" or base =="base12" then
for theKey,col in ipairs(colap) do
	local vehtable = getElementsWithinColShape (col, "vehicle" )
carscOUNT =carscOUNT+table.size(vehtable)
	for theKey,car in ipairs(vehtable) do
		local carName = getVehicleName(car)
		if not CarsVar[carName] then
		CarsVar[carName] =1
		else
		local carCount = tonumber(CarsVar[carName])
		CarsVar[carName] = carCount+1
		end
	end
					for theKey,car in ipairs(vehtable) do
			local carName = getVehicleName(car)
			if CarsVar[carName] then
			carsIndex=carsIndex..""..carName..":"..tonumber(CarsVar[carName]).." "
			CarsVar[carName]=false
			end	
			end
	 showCarCount = "Общее количество машин:"..carscOUNT.." "
end
if countOne then
return carscOUNT
end
return showCarCount..""..carsIndex
else
	local tableVehInBase = getElementsWithinColShape (colap, "vehicle" )
	for theKey,car in ipairs(tableVehInBase) do
	local carName = getVehicleName(car)
	if not CarsVar[carName] then
	CarsVar[carName] =1
	else
	local carCount = tonumber(CarsVar[carName])
	CarsVar[carName] = carCount+1
	end
	end
	 showCarCount = "Общее количество машин:"..table.size(tableVehInBase).." "
	 if countOne then
return table.size(tableVehInBase)
end
for theKey,car in ipairs(tableVehInBase) do
local carName = getVehicleName(car)
if CarsVar[carName] then
carsIndex=carsIndex..""..carName..":"..tonumber(CarsVar[carName]).."\n"
CarsVar[carName]=false
end
end
end

return showCarCount..""..carsIndex
end


function destroyAllCar(base)
colap = getElementData(getRootElement(),base)
local cars = 0 
if base =="base20" or base =="base12" then
for theKey,col in ipairs(colap) do
local vehtable = getElementsWithinColShape (col, "vehicle" )
for theKey,veh in ipairs(vehtable) do
blowVehicle(veh)
cars=cars+1
end
end
else
tableVehInBase = getElementsWithinColShape (colap, "vehicle" )
for theKey,veh in ipairs(tableVehInBase) do
blowVehicle(veh)
cars=cars+1
end
end
return cars
end





function getTentsOnCol(col)
	if not col then return false,false end
	local allTents = {}
	
			if col then

				local antivhod = getElementData(col,"antivhod") or false
				if not antivhod then return false,false  end 
				local gangOK =  getElementData(col,"gangOK")
				local spawnToPos = getElementData(col,"spawnToPos")


				local baseCol = createColCuboid (antivhod[1],antivhod[2],antivhod[3], antivhod[4], antivhod[5], antivhod[6] )
				if not baseCol then return false,false end
				if baseCol then
				
					destroyElement(col)
					setElementData(baseCol,"antivhod",antivhod)
					setElementData(baseCol,"gangOK",gangOK)
					setElementData(baseCol,"spawnToPos",spawnToPos) 
					addEventHandler( "onColShapeHit", baseCol, EnterBase)
					addEventHandler( "onColShapeLeave", baseCol, LeaveBase)
					
					local objectsInBase = getElementsWithinColShape (baseCol, "object" )
						
					for theKey,obj in ipairs(objectsInBase) do

						if getElementModel(obj) ==3243 or getElementModel(obj) ==14785 or getElementModel(obj) ==1907 then
						table.insert(allTents,obj)
						end

					end
					return allTents,baseCol
					end
			end 
	
			return false,false
end

function removeTentsOnBase (object)
if not object or not isElement(object) then return false end
	local counter = getElementData(getElementData(object,"parent"),"counterT")
	
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
	
	if counter then 
	local tentData = getAccount("ATDtent_number_"..counter,"ATDtntNmb$Uhjm")
		if tentData then
	--	outputChatBox("remove tents: "..counter)
		setAccountData(tentData,"removed",true)
		removeAccount(tentData)
		return true
		end
	end
	
	return false
end

function removeTentsWeb(base)
	local allTents ={}	
	local bigBaseCols ={}	
	local colap = getElementData(getRootElement(),base)

	if base == "base20" or base == "base12"  then

		for theKey,col in ipairs(colap) do
			local tents,newcol = getTentsOnCol(col)
			--	outputChatBox(tostring(newcol))
			if tents then 
				for theKey,obj in ipairs(tents) do
				table.insert(allTents,obj)
				end
			table.insert(bigBaseCols,newcol)
			else
			return false
			end
		end
		setElementData(getRootElement(),base,bigBaseCols,false)
	else
	
		local tents,newcol = getTentsOnCol(colap)
		--outputChatBox(tostring(newcol))
		if tents then 
			for theKey,obj in ipairs(tents) do
				table.insert(allTents,obj)
			end
		else
		return false
		end
		setElementData(getRootElement(),base,newcol,false)
	end
	local removed = 0
	local allRemoved = 0
	for theKey,obj in ipairs(allTents) do
	local rem = removeTentsOnBase(obj)
		if rem then
		removed=removed+1
		end
		allRemoved=allRemoved+1
	end	
	
	allTents=nil
	
	return "Всего палаток: "..allRemoved.."\r\nУдалено палаток: "..removed
end


function getTentCountWeb(base)
	local tent= 0 --3243
	local bigTent = 0 --14785
	local save = 0 --1907
	local allTents ={}	
	local bigBaseCols ={}	
	local colap = getElementData(getRootElement(),base)

	if base == "base20" or base == "base12"  then

		for theKey,col in ipairs(colap) do
			local tents,newcol = getTentsOnCol(col)
			--	outputChatBox(tostring(newcol))
			if tents then 
				for theKey,obj in ipairs(tents) do
				table.insert(allTents,obj)
				end
			table.insert(bigBaseCols,newcol)
			else
			return false
			end
		end
		setElementData(getRootElement(),base,bigBaseCols,false)
	else
	
		local tents,newcol = getTentsOnCol(colap)
		--outputChatBox(tostring(newcol))
		if tents then 
			for theKey,obj in ipairs(tents) do
				table.insert(allTents,obj)
			end
		else
		return false
		end
		setElementData(getRootElement(),base,newcol,false)
	end
	
	for theKey,obj in ipairs(allTents) do
		if getElementModel(obj) ==3243 then
		tent=tent+1
		elseif getElementModel(obj) ==14785 then
		bigTent=bigTent+1
		elseif getElementModel(obj) ==1907 then
		save=save+1
		end
	end	
	
	allTents=nil
	
	return "Палатки: "..tent.."\r\nБольшие палатки: "..bigTent.."\r\nСейфы: "..save
end




config = xmlLoadFile ( "config.xml" )
function getXml(name,base)
local base = xmlFindChild( config,base,0) or false
local node = xmlFindChild( base,name,0) or false
local param = xmlNodeGetValue(node) or false
return param;
end


-- #1 база аппле там где спавнится кловер на крыше в сф -- пустая
baseCol1 = createColCuboid (-2130.3286132813,337.6530456543,60.8, 107.5, 42.5, 20.5 )
setElementData(baseCol1,"antivhod",{-2130.3286132813,337.6530456543,60.8, 107.5, 42.5, 20.5})
--createRadarArea ( -2130.3286132813,337.6530456543,107.5, 42.5, 0, 0, 0, 255 )
setElementData(baseCol1,"gangOK",tostring(getXml("GANG","base0")))
setElementData(baseCol1,"spawnToPos",{-2077.185546875,385.2236328125,35.171875}) 
setElementData(getRootElement(),"base0",baseCol1,false)
addEventHandler( "onColShapeHit", baseCol1, EnterBase)
addEventHandler( "onColShapeLeave", baseCol1, LeaveBase)

local lift118723711hf1 = createObject(3115,-2076.8000488281,388.89999389648,33.799999237061,0,0,90) 
local gate11231241r12r12rt = createObject(10828,-2078,379,79.300003051758,0,0,0.120849609375)
local vgate11231241r12r12rt = createObject(10828,-2042.0999755859,351.29998779297,80.800003051758,90,179.31335449219,0.8074951171875) -- Cоздаем ворота
local vgate11231241r12r12rt1 = createObject(10828,-2042.4000244141,362.79998779297,80.699996948242,90,179.31335449219,0.8074951171875) -- Cоздаем ворота

local base0_CloseTimer1 = false 
function base0_OP()
moveObject (lift118723711hf1,20000,-2076.8000488281,388.89999389648,66.699996948242)
moveObject (gate11231241r12r12rt,20000,-2112.6000976563,379.10000610352,79.300003051758)
if isTimer(base0_CloseTimer1) then killTimer(base0_CloseTimer1) end
base0_CloseTimer1 = setTimer(base0_CL,40000,1)

end 
addCommandHandler(tostring(getXml("OP","base0")),base0_OP)

function base0_CL() 
moveObject (lift118723711hf1,20000,-2076.8000488281,388.89999389648,33.799999237061)
moveObject (gate11231241r12r12rt,20000,-2078,379,79.300003051758)
if isTimer(base0_CloseTimer1) then killTimer(base0_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base0")),base0_CL)

local base0_CloseTimer2 = false 
function base0_vOP()
moveObject (vgate11231241r12r12rt,20000,-2077.3000488281,351.20001220703,80.800003051758)
moveObject (vgate11231241r12r12rt1,20000,-2077.3999023438,362.79998779297,80.699996948242)
if isTimer(base0_CloseTimer2) then killTimer(base0_CloseTimer2) end
base0_CloseTimer2 = setTimer(base0_vCL,40000,1)
end
addCommandHandler(tostring(getXml("vOP","base0")),base0_vOP)

function base0_vCL() 
moveObject (vgate11231241r12r12rt,20000,-2042.0999755859,351.29998779297,80.800003051758)
moveObject (vgate11231241r12r12rt1,20000,-2042.4000244141,362.79998779297,80.699996948242)
if isTimer(base0_CloseTimer2) then killTimer(base0_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base0")),base0_vCL)

----------------------------------------------------------------------------------------------------------------------
-- #2 база ШУТЕРА В ПОЛЕ ХУЙ ЗНАЕТ ГДЕ БОЛЬШАЯ 400 руб -- пустая
baseCol2 = createColCuboid ( -1195.1280517578,-1061.1181640625,118, 189.5, 141.5, 25 )
setElementData(baseCol2,"antivhod",{-1195.1280517578,-1061.1181640625,118, 189.5, 141.5, 25} )
--createRadarArea ( -1195.1280517578,-1061.1181640625,189.5, 141.5, 0, 0, 0, 255 )
setElementData(baseCol2,"gangOK",tostring(getXml("GANG","base1")) )
setElementData(baseCol2,"spawnToPos",{-1211.0302734375,-1054.3583984375,128.265625} )

setElementData(getRootElement(),"base1",baseCol2,false)
addEventHandler( "onColShapeHit", baseCol2, EnterBase)
addEventHandler( "onColShapeLeave", baseCol2, LeaveBase)
local gate11231241r12r12rt123 = createObject(10828,-1194.0999755859,-1043.5999755859,140.5,0,0,90) 
local vgate11231241r12r12rt123 = createObject(10828,-1097.4000244141,-983.5,142.10000610352,270,179.98352050781,359.98352050781)
local vgate11231241r12r12rt1123 = createObject(10828,-1097.1999511719,-988.70001220703,142.10000610352,270,180.0439453125,180.0439453125) 

local base1_CloseTimer1 = false
function base1_OP()
moveObject (gate11231241r12r12rt123,10000,-1194,-1008.9000244141,140.5)
if isTimer(base1_CloseTimer1) then killTimer(base1_CloseTimer1) end
base1_CloseTimer1 = setTimer(base1_CL,30000,1)
end  
addCommandHandler(tostring(getXml("OP","base1")),base1_OP)

function base1_CL() 
moveObject (gate11231241r12r12rt123,10000,-1194.0999755859,-1043.5999755859,140.5)
if isTimer(base1_CloseTimer1) then killTimer(base1_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base1")),base1_CL)

local base1_CloseTimer2 = false
function base1_vOP()
moveObject (vgate11231241r12r12rt123,10000,-1097,-968.70001220703,142.10000610352)
moveObject (vgate11231241r12r12rt1123,10000,-1096.8000488281,-1003.299987793,142.10000610352)
if isTimer(base1_CloseTimer2) then killTimer(base1_CloseTimer2) end
base1_CloseTimer2 = setTimer(base1_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base1")),base1_vOP)

function base1_vCL() 
moveObject (vgate11231241r12r12rt123,10000,-1097.4000244141,-983.5,142.10000610352)
moveObject (vgate11231241r12r12rt1123,10000,-1097.1999511719,-988.70001220703,142.10000610352)
if isTimer(base1_CloseTimer2) then killTimer(base1_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base1")),base1_vCL)
-----------------------------------------------------------------------------------------------------------------------
-- #3 не стандарт база макавели -- 400 руб - 29 июля
baseCol3 = createColCuboid ( 1397.8472900391,663.83227539063,-1, 158.5, 133.5, 41 )
setElementData(baseCol3,"antivhod",{1397.8472900391,663.83227539063,-1, 158.5, 133.5, 41})
--createRadarArea ( 1397.8472900391,663.83227539063,158.5, 133.5, 0, 0, 0, 255 )
setElementData(baseCol3,"gangOK",tostring(getXml("GANG","base2")))
setElementData(baseCol3,"spawnToPos",{1444.1728515625,652.0185546875,10.814715385437})

setElementData(getRootElement(),"base2",baseCol3,false)
addEventHandler( "onColShapeHit", baseCol3, EnterBase)
addEventHandler( "onColShapeLeave", baseCol3, LeaveBase)
local gate11231241r12r12rt1111231231 = createObject(10828,1452.8000488281,664.70001220703,22.299999237061,0,0,0)
local vgate11231241r12r12rt111112312 = createObject(10828,1508.4000244141,750.09997558594,39.299999237061,90,179.99450683594,359.99450683594)
local vgate11231241r12r12rt111113123132 = createObject(10828,1508.5,755.29998779297,39.299999237061,90,0,0)

local base2_CloseTimer1 = false
function base2_OP()
moveObject (gate11231241r12r12rt1111231231,10000,1483.3000488281,664.70001220703,22.299999237061)
if isTimer(base2_CloseTimer1) then killTimer(base2_CloseTimer1) end
base2_CloseTimer1 = setTimer(base2_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base2")),base2_OP)

function base2_CL() 
moveObject (gate11231241r12r12rt1111231231,10000,1452.8000488281,664.70001220703,22.299999237061)
if isTimer(base2_CloseTimer1) then killTimer(base2_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base2")),base2_CL)

local base2_CloseTimer2 = false
function base2_vOP()
moveObject (vgate11231241r12r12rt111112312,10000,1508,735.40002441406,39.299999237061)
moveObject (vgate11231241r12r12rt111113123132,10000,1508.3000488281,770.70001220703,39.299999237061)
if isTimer(base2_CloseTimer2) then killTimer(base2_CloseTimer2) end
base2_CloseTimer2 = setTimer(base2_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base2")),base2_vOP)

function base2_vCL() 
moveObject (vgate11231241r12r12rt111112312,10000,1508.4000244141,750.09997558594,39.299999237061)
moveObject (vgate11231241r12r12rt111113123132,10000,1508.5,755.29998779297,39.299999237061)
if isTimer(base2_CloseTimer2) then killTimer(base2_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base2")),base2_vCL)
---------------------------------------------------------------------------------------------------------------------
-- #4 новая база в сф рядом с красной зоной которую строил бублик2 - пустая
baseCol4 = createColCuboid (-2374.3623046875,882.64031982422,87, 39.5, 66.5, 20.5 )
setElementData(baseCol4,"antivhod",{-2374.3623046875,882.64031982422,87, 39.5, 66.5, 20.5 })
--createRadarArea ( -2374.3623046875,882.64031982422,39.5, 66.5, 0, 0, 0, 255 )
setElementData(baseCol4,"gangOK",tostring(getXml("GANG","base3")))
setElementData(baseCol4,"spawnToPos",{-2383.427734375,893.2607421875,45.316902160645})

setElementData(getRootElement(),"base3",baseCol4,false)
addEventHandler( "onColShapeHit", baseCol4, EnterBase)
addEventHandler( "onColShapeLeave", baseCol4, LeaveBase)
local lift118723711hf11111 = createObject(10828,-2373.5,900.40002441406,104.90000152588,0,0,90.494384765625)
local gate11231241r12r12rt1111 = createObject(3115,-2385.1999511719,894.5,44,0,0,179.99993896484)

local base3_CloseTimer1 = false
function base3_OP()
moveObject (lift118723711hf11111,20000,-2373.783203125,931.1201171875,104.93409729004)
moveObject (gate11231241r12r12rt1111,20000,-2385.1999511719,894.5,92.699996948242)
if isTimer(base3_CloseTimer1) then killTimer(base3_CloseTimer1) end
base3_CloseTimer1 = setTimer(base3_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base3")),base3_OP)

function base3_CL() 
moveObject (lift118723711hf11111,20000,-2373.5,900.40002441406,104.90000152588)
moveObject (gate11231241r12r12rt1111,20000,-2385.1999511719,894.5,44)
if isTimer(base3_CloseTimer1) then killTimer(base3_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base3")),base3_CL)
---------------------------------------------------------------------------------------------------------------------------
-- #5 первый раз 1к -- возле пирамиды на низком, желтом здании -- пустая
baseCol5 = createColCuboid (2369.5854492188,1086.4232177734,27.5, 35.5, 93.5, 20.5 )
setElementData(baseCol5,"antivhod",{2369.5854492188,1086.4232177734,27.5, 35.5, 93.5, 20.5 })
--createRadarArea ( 2369.5854492188,1086.4232177734,35.5, 93.5, 0, 0, 0, 255 )
setElementData(baseCol5,"gangOK",tostring(getXml("GANG","base4")))
setElementData(baseCol5,"spawnToPos",{2388.294921875,1076.5302734375,10.671875})

setElementData(getRootElement(),"base4",baseCol5,false)
addEventHandler( "onColShapeHit", baseCol5, EnterBase)
addEventHandler( "onColShapeLeave", baseCol5, LeaveBase)
local gate11231241r12r12rt11111 = createObject(10828,2387.3000488281,1087.6999511719,45.599998474121,0,0,0)
local llift11231241r12r12rt11111 = createObject(3115,2387.1999511719,1076.5,9.3000001907349,0,0,270)
local vgate11231241r12r12rt11111awd = createObject(10828,2387.3000488281,1131.3000488281,47.200000762939,270,179.92309570313,179.91760253906)
local vgate11231241r12r12rt111111awdawf = createObject(10828,2387.1999511719,1146.1999511719,47.200000762939,270,179.92309570313,179.91760253906)

local base4_CloseTimer1 = false
function base4_OP()
moveObject (gate11231241r12r12rt11111,10000,2387.3000488281,1087.6999511719,29.700000762939)
moveObject (llift11231241r12r12rt11111,10000,2387.1999511719,1076.5,33)
if isTimer(base4_CloseTimer1) then killTimer(base4_CloseTimer1) end
base4_CloseTimer1 = setTimer(base4_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base4")),base4_OP)

function base4_CL() 
moveObject (gate11231241r12r12rt11111,10000,2387.3000488281,1087.6999511719,45.599998474121)
moveObject (llift11231241r12r12rt11111,10000,2387.1999511719,1076.5,9.3000001907349)
if isTimer(base4_CloseTimer1) then killTimer(base4_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base4")),base4_CL)

local base4_CloseTimer2 = false
function base4_vOP()
moveObject (vgate11231241r12r12rt11111awd,10000,2387.3000488281,1116.4000244141,47.099998474121)
moveObject (vgate11231241r12r12rt111111awdawf,10000,2387.1000976563,1161.1999511719,47.099998474121)
if isTimer(base4_CloseTimer2) then killTimer(base4_CloseTimer2) end
base4_CloseTimer2 = setTimer(base4_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base4")),base4_vOP)

function base4_vCL() 
moveObject (vgate11231241r12r12rt11111awd,10000,2387.3000488281,1131.3000488281,47.200000762939)
moveObject (vgate11231241r12r12rt111111awdawf,10000,2387.1999511719,1146.1999511719,47.200000762939)
if isTimer(base4_CloseTimer2) then killTimer(base4_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base4")),base4_vCL)
-------------------------------------------------------------------------------------------------------------------------
-- #6 лв длинная - пустая
baseCol6 = createColCuboid (2437.6950683594,1027.5922851563,51, 78.5, 35.5, 20.5 )
setElementData(baseCol6,"antivhod",{2437.6950683594,1027.5922851563,51, 78.5, 35.5, 20.5})
--createRadarArea (2437.6950683594,1027.5922851563, 78.5, 35.5, 0, 0, 0, 255 )
setElementData(baseCol6,"gangOK",tostring(getXml("GANG","base5")))
setElementData(baseCol6,"spawnToPos",{2527.4599609375,1047.3427734375,10.671875})

setElementData(getRootElement(),"base5",baseCol6,false)
addEventHandler( "onColShapeHit", baseCol6, EnterBase)
addEventHandler( "onColShapeLeave", baseCol6, LeaveBase)
local gate1817 = createObject(10828,2515.3999023438,1045.5999755859,68.800003051758,0,0,270.9228515625)
local lift2381 = createObject(3115,2526.8999023438,1045.5,9.3000001907349,0,0,0)

local base5_CloseTimer1 = false
function base5_OP()
moveObject (gate1817,20000,2515.3999023438,1045.5999755859,53)
moveObject (lift2381,20000,2526.8999023438,1045.5,56.200000762939)
if isTimer(base5_CloseTimer1) then killTimer(base5_CloseTimer1) end
base5_CloseTimer1 = setTimer(base5_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base5")),base5_OP)

function base5_CL() 
moveObject (gate1817,15000,2515.3999023438,1045.5999755859,68.800003051758)
moveObject (lift2381,15000,2526.8999023438,1045.5,9.3000001907349)
if isTimer(base5_CloseTimer1) then killTimer(base5_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base5")),base5_CL)
------------------------------------------------------------------------------------------------------------------------------
-- #7 Самая 1 база на сервере! в СФ  Houston -- 20 августа 
baseCol7 = createColCuboid (-1661.3146972656,1007.0494384766,63, 36.5, 70.5, 20.5 )
setElementData(baseCol7,"antivhod",{-1661.3146972656,1007.0494384766,63, 36.5, 70.5, 20.5})
--createRadarArea (-1661.3146972656,1007.0494384766, 36.5, 70.5, 0, 0, 0, 255 )
setElementData(baseCol7,"gangOK",tostring(getXml("GANG","base6")))
setElementData(baseCol7,"spawnToPos",{-1669.05078125,1057.8818359375,7.921875})

setElementData(getRootElement(),"base6",baseCol7,false)
addEventHandler( "onColShapeHit", baseCol7, EnterBase)
addEventHandler( "onColShapeLeave", baseCol7, LeaveBase)
local lift1 = createObject(3115,-1671.5999755859,1058.6999511719,4.3000001907349,0,0,0)
local gate1 = createObject(10828,-1660.8000488281,1059.5999755859,81.099998474121,0,0,89.788208007813)
local vert1 = createObject(10828,-1644.4000244141,1049.3000488281,82.599998474121,87.994995117188,179.99450683594,1.03271484375)
local vert2 = createObject(10828,-1644.1999511719,1035,82.599998474121,87.994995117188,179.99450683594,1.03271484375)

local base6_CloseTimer1 = false
function base6_OP()
moveObject (lift1,20000,-1671.5999755859,1058.6999511719,68.599998474121)
moveObject (gate1,20000,-1660.8000488281,1059.5999755859,64.400001525879)
if isTimer(base6_CloseTimer1) then killTimer(base6_CloseTimer1) end
base6_CloseTimer1 = setTimer(base6_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base6")),base6_OP)

function base6_CL() 
moveObject (lift1,20000,-1671.5999755859,1058.6999511719,4.3000001907349)
moveObject (gate1,20000,-1660.8000488281,1059.5999755859,81.099998474121)
if isTimer(base6_CloseTimer1) then killTimer(base6_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base6")),base6_CL)

local base6_CloseTimer2 = false
function base6_vOP()
moveObject (vert1,10000,-1644.4000244141,1064.3000488281,83.599998474121)
moveObject (vert2,10000,-1643,1020.799987793,84.099998474121)
if isTimer(base6_CloseTimer2) then killTimer(base6_CloseTimer2) end
base6_CloseTimer2 = setTimer(base6_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base6")),base6_vOP)

function base6_vCL() 
moveObject (vert1,10000,-1644.4000244141,1049.3000488281,82.599998474121)
moveObject (vert2,10000,-1644.1999511719,1035,82.599998474121)
if isTimer(base6_CloseTimer2) then killTimer(base6_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base6")),base6_vCL)
-------------------------------------------------------------------------------------------------------------------------------
-- #8 бывшая база чемодана в лв -  22 августа
baseCol8 = createColCuboid (2437.4299316406,2243.2204589844,85, 50.5, 88.5, 20.5 )
setElementData(baseCol8,"antivhod",{2437.4299316406,2243.2204589844,85, 50.5, 88.5, 20.5})
--createRadarArea (2437.4299316406,2243.2204589844, 50.5, 88.5, 0, 0, 0, 255 )
setElementData(baseCol8,"gangOK",tostring(getXml("GANG","base7")))
setElementData(baseCol8,"spawnToPos",{2493.9384765625,2318.06640625,10.825572967529})

setElementData(getRootElement(),"base7",baseCol8,false)
addEventHandler( "onColShapeHit", baseCol8, EnterBase)
addEventHandler( "onColShapeLeave", baseCol8, LeaveBase)
local gateFBI1 = createObject(10828,2486.6999511719,2314,102.90000152588,0,0,89.719848632813)
local liftFBP1 = createObject(3115,2489.1000976563,2319,9.5,0,0,90.000061035156)

local base7_CloseTimer1 = false
function base7_OP()
moveObject (gateFBI1,20000,2486.6999511719,2314,86.699996948242)
moveObject (liftFBP1,20000,2496.8000488281,2318,90.3)
if isTimer(base7_CloseTimer1) then killTimer(base7_CloseTimer1) end
base7_CloseTimer1 = setTimer(base7_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base7")),base7_OP)

function base7_CL() 
moveObject (gateFBI1,15000,2486.6999511719,2314,102.90000152588)
moveObject (liftFBP1,15000,2489.1000976563,2319,9.5)
if isTimer(base7_CloseTimer1) then killTimer(base7_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base7")),base7_CL)
-----------------------------------------------------------------------------------------------------------------------------------
-- #9 база в лc наемники -- 30 июля
baseCol9 = createColCuboid (1743.5679931641,-1809.7482910156,46, 67.5, 68.5, 20.5 )
setElementData(baseCol9,"antivhod",{1743.5679931641,-1809.7482910156,46, 67.5, 68.5, 20.5 })
--createRadarArea (1743.5679931641,-1809.7482910156,  67.5, 68.5, 0, 0, 0, 255 )
setElementData(baseCol9,"gangOK",tostring(getXml("GANG","base8")))
setElementData(baseCol9,"spawnToPos",{1794.6533203125,-1732.2919921875,13.3828125})

setElementData(getRootElement(),"base8",baseCol9,false)
addEventHandler( "onColShapeHit", baseCol9, EnterBase)
addEventHandler( "onColShapeLeave", baseCol9, LeaveBase)
local gateFBI1 = createObject(10828,1793.6298828125,-1742.9296875,63.770000457764,0,0,359.37316894531)
local liftFBP1 = createObject(3115,1794.4000244141,-1731.8000488281,12,0,0,0)
local vert111of121 = createObject(10828,1765.9000244141,-1790.5,65.900001525879,90,192.30578613281,77.688690185547)
local vert211121211 = createObject(10828,1780.1999511719,-1790.5,65.800003051758,90,169.30108642578,100.69891357422)

local base8_CloseTimer1 = false
function base8_OP()
moveObject (gateFBI1,20000,1761.4000244141,-1742.4000244141,63.770000457764)
moveObject (liftFBP1,20000,1794.4000244141,-1731.8000488281,53.299999237061)
if isTimer(base8_CloseTimer1) then killTimer(base8_CloseTimer1) end
base8_CloseTimer1 = setTimer(base8_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base8")),base8_OP)

function base8_CL() 
moveObject (gateFBI1,20000,1793.6298828125,-1742.9296875,63.770000457764)
moveObject (liftFBP1,20000,1794.4000244141,-1731.8000488281,12)
if isTimer(base8_CloseTimer1) then killTimer(base8_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base8")),base8_CL)

local base8_CloseTimer2 = false
function base8_vOP()
moveObject (vert111of121,10000,1751.5999755859,-1790.4000244141,65.900001525879)
moveObject (vert211121211,10000,1793.9000244141,-1790.0999755859,65.800003051758)
if isTimer(base8_CloseTimer2) then killTimer(base8_CloseTimer2) end
base8_CloseTimer2 = setTimer(base8_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base8")),base8_vOP)

function base8_vCL() 
moveObject (vert111of121,10000,1765.9000244141,-1790.5,65.900001525879)
moveObject (vert211121211,10000,1780.1999511719,-1790.5,65.800003051758)
if isTimer(base8_CloseTimer2) then killTimer(base8_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base8")),base8_vCL)
------------------------------------------------------------------------------------------------------------------------------
-- #10 sabse база в сф старая зевса -- пустая
baseCol10 = createColCuboid (-2129.5356445313,513.20361328125,72, 114.5, 41.5, 20.5 )
setElementData(baseCol10,"antivhod",{-2129.5356445313,513.20361328125,72, 114.5, 41.5, 20.5})
--createRadarArea (-2129.5356445313,513.20361328125,  114.5, 41.5, 0, 0, 0, 255 )
setElementData(baseCol10,"gangOK",tostring(getXml("GANG","base9")))
setElementData(baseCol10,"spawnToPos",{-2078.0986328125,565.8134765625,35.015625})

setElementData(getRootElement(),"base9",baseCol10,false)
addEventHandler( "onColShapeHit", baseCol10, EnterBase)
addEventHandler( "onColShapeLeave", baseCol10, LeaveBase)
local gate3 = createObject(10828,-2076.8000488281,553.59997558594,90.199996948242,0,0,0)
local lift3 = createObject(3115,-2078.5,565.59997558594,33.700000762939,0,0,90.000030517578)

local base9_CloseTimer1 = false
function base9_OP()
moveObject (gate3,20000,-2110.8999023438,553.5,90.199996948242)
moveObject (lift3,20000,-2078.5,565.59997558594,78.699996948242)
if isTimer(base9_CloseTimer1) then killTimer(base9_CloseTimer1) end
base9_CloseTimer1 = setTimer(base9_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base9")),base9_OP)
function base9_CL() 
moveObject (gate3,20000,-2076.8000488281,553.59997558594,90.199996948242)
moveObject (lift3,20000,-2078.5,565.59997558594,33.700000762939)
if isTimer(base9_CloseTimer1) then killTimer(base9_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base9")),base9_CL)
-------------------------------------------------------------------------------------------------------------------------------
-- #11 самая первая база макавели  - 15 августа
baseCol11 = createColCuboid (2389.5961914063,2441.8666992188,63, 54.5, 58.5, 20.5 )
setElementData(baseCol11,"antivhod",{2389.5961914063,2441.8666992188,63, 54.5, 58.5, 20.5})
--createRadarArea (2389.5961914063,2441.8666992188,  54.5, 58.5, 0, 0, 0, 255 )
setElementData(baseCol11,"gangOK",tostring(getXml("GANG","base10")))
setElementData(baseCol11,"spawnToPos",{2454.861328125,2488.48828125,21.875})

setElementData(getRootElement(),"base10",baseCol11,false)
addEventHandler( "onColShapeHit", baseCol11, EnterBase)
addEventHandler( "onColShapeLeave", baseCol11, LeaveBase)
local lift1222 = createObject(3115,2455.3999023438,2484.8000488281,18,0,0,90.000030517578)
local gate1222 = createObject(10828,2443.5,2482.8999023438,80.800003051758,0.406494140625,0,90.164794921875)
local vert1222 = createObject(10828,2414.3999023438,2460.6000976563,82.5,270.33514404297,359.98901367188,270.34619140625)
local vert2222 = createObject(10828,2419.6000976563,2460.6000976563,82.5,270.34057617188,0,89.6044921875) 

local base10_CloseTimer1 = false
function base10_OP()
moveObject (lift1222,20000,2453.8000488281,2487.5,68.099998474121)
moveObject (gate1222,20000,2443.3999023438,2460,80.800003051758)
if isTimer(base10_CloseTimer1) then killTimer(base10_CloseTimer1) end
base10_CloseTimer1 = setTimer(base10_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base10")),base10_OP)

function base10_CL() 
moveObject (lift1222,20000,2455.3999023438,2484.8000488281,18)
moveObject (gate1222,20000,2443.5,2482.8999023438,80.800003051758)
if isTimer(base10_CloseTimer1) then killTimer(base10_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base10")),base10_CL)

local base10_CloseTimer2 = false
function base10_vOP()
moveObject (vert1222,10000,2401.5,2461.3000488281,82.5)
moveObject (vert2222,10000,2431.5,2460.6999511719,82.5)
if isTimer(base10_CloseTimer2) then killTimer(base10_CloseTimer2) end
base10_CloseTimer2 = setTimer(base10_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base10")),base10_vOP)

function base10_vCL() 
moveObject (vert1222,10000,2414.3999023438,2460.6000976563,82.5)
moveObject (vert2222,10000,2419.6000976563,2460.6000976563,82.5)
if isTimer(base10_CloseTimer2) then killTimer(base10_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base10")),base10_vCL)
---------------------------------------------------------------------------------------------------------------------------------
-- #12 Xitman -- пустая
baseCol12 = createColCuboid (-1884.4450683594,619.31781005859,74.5, 50, 97.5, 20.5 )
setElementData(baseCol12,"antivhod",{-1884.4450683594,619.31781005859,74.5, 50, 97.5, 20.5})
--createRadarArea (-1884.4450683594,619.31781005859,  50, 97.5, 0, 0, 0, 255 )
setElementData(baseCol12,"gangOK",tostring(getXml("GANG","base11")))
setElementData(baseCol12,"spawnToPos",{-1900.1416015625,668.75,40.673561096191})

setElementData(getRootElement(),"base11",baseCol12,false)
addEventHandler( "onColShapeHit", baseCol12, EnterBase)
addEventHandler( "onColShapeLeave", baseCol12, LeaveBase)
local lift12212 = createObject(3115,-1897.1999511719,668.70001220703,37.599998474121,0,0,179.99993896484)
local gate12212 = createObject(10828,-1883.5,668.5,92.400001525879,0,0,269.95056152344)
local vert12212 = createObject(10828,-1854,662.5,94,270,179.99450683594,180.02197265625)
local vert22212 = createObject(10828,-1854.1999511719,667.79998779297,94,270,179.99853515625,0.025970458984375)

local base11_CloseTimer1 = false
function base11_OP()
moveObject (lift12212,20000,-1897.1999511719,668.70001220703,80.099998474121)
moveObject (gate12212,20000,-1883.5,698.40002441406,92.400001525879)
if isTimer(base11_CloseTimer1) then killTimer(base11_CloseTimer1) end
base11_CloseTimer1 = setTimer(base11_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base11")),base11_OP)

function base11_CL() 
moveObject (lift12212,20000,-1897.1999511719,668.70001220703,37.599998474121)
moveObject (gate12212,20000,-1883.5,668.5,92.400001525879)
if isTimer(base11_CloseTimer1) then killTimer(base11_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base11")),base11_CL)

local base11_CloseTimer2 = false
function base11_vOP()
moveObject (vert12212,10000,-1854.6999511719,647.90002441406,94)
moveObject (vert22212,10000,-1854,682.29998779297,94)
if isTimer(base11_CloseTimer2) then killTimer(base11_CloseTimer2) end
base11_CloseTimer2 = setTimer(base11_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base11")),base11_vOP)

function base11_vCL() 
moveObject (vert12212,10000,-1854,662.5,94)
moveObject (vert22212,10000,-1854.1999511719,667.79998779297,94)
if isTimer(base11_CloseTimer2) then killTimer(base11_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base11")),base11_vCL)
--------------------------------------------------------------------------------------------------------------------------------------
-- #13 база на крыше возле авио -- 16 августа
baseCol13 = createColCuboid (-1571.4389648438,282.84655761719,47, 100.5, 71.5, 20.5 )
baseCol13_1 = createColCuboid (-1505,336.10067749023,28, 137, 105, 25 )
setElementData(baseCol13,"antivhod",{-1571.4389648438,282.84655761719,47, 100.5, 71.5, 20.5})
setElementData(baseCol13_1,"antivhod",{-1505,336.10067749023,28, 137, 105, 25})
--createRadarArea (-1571.4389648438,282.84655761719, 100.5, 71.5, 0, 0, 0, 255 )

setElementData(baseCol13,"gangOK",tostring(getXml("GANG","base12")))
setElementData(baseCol13_1,"gangOK",tostring(getXml("GANG","base12")))
setElementData(baseCol13,"spawnToPos",{-1578.97265625,297.2080078125,7.1875})
setElementData(baseCol13_1,"spawnToPos",{-1578.97265625,297.2080078125,7.1875})

setElementData(getRootElement(),"base12",{baseCol13,baseCol13_1},false)


addEventHandler( "onColShapeHit", baseCol13, EnterBase)
addEventHandler( "onColShapeLeave", baseCol13, LeaveBase)
addEventHandler( "onColShapeHit", baseCol13_1, EnterBase)
addEventHandler( "onColShapeLeave", baseCol13_1, LeaveBase)
local lift12131311 = createObject(3115,-1582,299.29998779297,5.8000001907349,0,0,0)
local gate12131311 = createObject(10828,-1569.5999755859,300.60000610352,64.800003051758,0,0,270.68664550781)
local vert112131311 = createObject(10828,-1533.6999511719,349.20001220703,66.400001525879,270.4228515625,181.33471679688,180.71325683594)
local vert212131311 = createObject(10828,-1534,334.39999389648,66.400001525879,270.42297363281,181.33483886719,180.71411132813)

local vop2O = createObject(10828,-1418.7998046875,353.900390625,56,270.43395996094,181.3349609375,271.75799560547)
local vop21O = createObject(10828,-1433,354.2998046875,56,270.43395996094,181.33489990234,271.7578125)

local base12_CloseTimer1 = false
function base12_OP()
moveObject (lift12131311,20000,-1582,299.29998779297,53.099998474121)
moveObject (gate12131311,20000,-1570,335.79998779297,64.800003051758)
if isTimer(base12_CloseTimer1) then killTimer(base12_CloseTimer1) end
base12_CloseTimer1 = setTimer(base12_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base12")),base12_OP)

function base12_CL() 
moveObject (lift12131311,20000,-1582,299.29998779297,5.8000001907349)
moveObject (gate12131311,20000,-1569.5999755859,300.60000610352,64.800003051758)
if isTimer(base12_CloseTimer1) then killTimer(base12_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base12")),base12_CL)

local base12_CloseTimer2 = false
function base12_vOP()
moveObject (vert112131311,10000,-1567.5,349.79998779297,66.400001525879)-- Открыть ворота для ветра 
moveObject (vert212131311,10000,-1500.3000488281,334.29998779297,66.400001525879)-- Открыть ворота для ветра2
moveObject (vop2O,10000,-1405.7998046875,353.599609375,56)-- Открыть ворота для ветра 2
moveObject (vop21O,10000,-1446.2001953125,354.599609375,56)-- Открыть ворота для ветра 2
if isTimer(base12_CloseTimer2) then killTimer(base12_CloseTimer2) end
base12_CloseTimer2 = setTimer(base12_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base12")),base12_vOP)

function base12_vCL() 
moveObject (vert112131311,10000,-1533.6999511719,349.20001220703,66.400001525879)-- Открыть ворота для ветра 
moveObject (vert212131311,10000,-1534,334.39999389648,66.400001525879)-- Открыть ворота для ветра2
moveObject (vop2O,10000,-1418.7998046875,353.900390625,56)-- Открыть ворота для ветра 2
moveObject (vop21O,10000,-1433,354.2998046875,56)-- Открыть ворота для ветра 2
if isTimer(base12_CloseTimer2) then killTimer(base12_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base12")),base12_vCL)
-----------------------------------------------------------------------------------------------------------------------------------
-- #14 база на крыше парковки возле розовой "ракушки?" -- 12 августа
baseCol14 = createColCuboid (2217.8173828125,1920.2504882813,32.5, 80.5, 65.5, 20.5 )
setElementData(baseCol14,"antivhod",{2217.8173828125,1920.2504882813,32.5, 80.5, 65.5, 20.5})
--createRadarArea (2217.8173828125,1930.2504882813, 80.5, 55.5, 0, 0, 0, 255 )
setElementData(baseCol14,"gangOK",tostring(getXml("GANG","base13")))
setElementData(baseCol14,"spawnToPos",{2291.7509765625,1994.31640625,15.346448898315})

setElementData(getRootElement(),"base13",baseCol14,false)
addEventHandler( "onColShapeHit", baseCol14, EnterBase)
addEventHandler( "onColShapeLeave", baseCol14, LeaveBase)
local lift121313112 = createObject(3115,2286.1000976563,1996,9.6000003814697,0,0,88)
local gate121313112 = createObject(10828,2280.8000488281,1984.8000488281,50.599998474121,0,0,0)
local vert1121313112 = createObject(10828,2237.1999511719,1958.8000488281,52.299999237061,270.14282226563,260.38696289063,80.864868164063)
local vert2121313113 = createObject(10828,2237.1999511719,1953.5,52.299999237061,270.14263916016,260.38806152344,260.86560058594)

local base13_CloseTimer1 = false
function base13_OP()
moveObject (lift121313112,20000,2286.1000976563,1996,38)
moveObject (gate121313112,20000,2253.1999511719,1984.9000244141,50.599998474121)
if isTimer(base13_CloseTimer1) then killTimer(base13_CloseTimer1) end
base13_CloseTimer1 = setTimer(base13_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base13")),base13_OP)

function base13_CL() 
moveObject (lift121313112,20000,2286.1000976563,1996,9.6000003814697)
moveObject (gate121313112,20000,2280.8000488281,1984.8000488281,50.599998474121)
if isTimer(base13_CloseTimer1) then killTimer(base13_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base13")),base13_CL)

local base13_CloseTimer2 = false
function base13_vOP()
moveObject (vert1121313112,10000,2237.1999511719,1973.0999755859,52.299999237061)-- Открыть ворота для ветра 
moveObject (vert2121313113,10000,2237.1000976563,1939.0999755859,52.299999237061)-- Открыть ворота для ветра2
if isTimer(base13_CloseTimer2) then killTimer(base13_CloseTimer2) end
base13_CloseTimer2 = setTimer(base13_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base13")),base13_vOP)

function base13_vCL() 
moveObject (vert1121313112,10000,2237.1999511719,1958.8000488281,52.299999237061)-- Открыть ворота для ветра 
moveObject (vert2121313113,10000,2237.1999511719,1953.5,52.299999237061)-- Открыть ворота для ветра2
if isTimer(base13_CloseTimer2) then killTimer(base13_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base13")),base13_vCL)
--------------------------------------------------------------------------------------------------------------------------------
-- #15 новая база в сф рядом с красной зоной которую строил бублик == пустая
baseCol15 = createColCuboid (-2243.0549316406,1190.7838134766,80, 61, 64, 20.5 )
setElementData(baseCol15,"antivhod",{-2243.0549316406,1190.7838134766,80, 61, 64, 20.5})
--createRadarArea (-2243.0549316406,1190.7838134766, 61, 64, 0, 0, 0, 255 )
setElementData(baseCol15,"gangOK",tostring(getXml("GANG","base14")))
setElementData(baseCol15,"spawnToPos",{-2191.125,1177.2861328125,55.578125})

setElementData(getRootElement(),"base14",baseCol15,false)
addEventHandler( "onColShapeHit", baseCol15, EnterBase)
addEventHandler( "onColShapeLeave", baseCol15, LeaveBase)
local lift118723711hf111 = createObject(3115,-2193.6999511719,1180.1999511719,54.099998474121,0,0,269.99996948242)
local gate11231241r12r12rt11 = createObject(10828,-2200.6000976563,1191.5,98.5,0,0,0)
local vgate11231241r12r12rt11 = createObject(10828,-2209.6000976563,1235.0999755859,99.699996948242,270.24169921875,179.99450683594,269.24194335938)
local vgate11231241r12r12rt111 = createObject(10828,-2214.6999511719,1236.8000488281,99.699996948242,270.23620605469,179.99450683594,90.24169921875)

local base14_CloseTimer1 = false
function base14_OP()
moveObject (lift118723711hf111,20000,-2193.6999511719,1180.1999511719,86.300003051758)
moveObject (gate11231241r12r12rt11,20000,-2225.1000976563,1191.5,98.5)
if isTimer(base14_CloseTimer1) then killTimer(base14_CloseTimer1) end
base14_CloseTimer1 = setTimer(base14_CL,40000,1)
end 
addCommandHandler(tostring(getXml("OP","base14")),base14_OP)

function base14_CL() 
moveObject (lift118723711hf111,20000,-2193.6999511719,1180.1999511719,54.099998474121)
moveObject (gate11231241r12r12rt11,20000,-2200.6000976563,1191.5,98.5)
if isTimer(base14_CloseTimer1) then killTimer(base14_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base14")),base14_CL)

local base14_CloseTimer2 = false
function base14_vOP()
moveObject (vgate11231241r12r12rt11,20000,-2195.1999511719,1234.5,99.699996948242)
moveObject (vgate11231241r12r12rt111,20000,-2229.6999511719,1237,99.699996948242)
if isTimer(base14_CloseTimer2) then killTimer(base14_CloseTimer2) end
base14_CloseTimer2 = setTimer(base14_vCL,40000,1)
end 
addCommandHandler(tostring(getXml("vOP","base14")),base14_vOP)

function base14_vCL() 
moveObject (vgate11231241r12r12rt11,20000,-2209.6000976563,1235.0999755859,99.699996948242)
moveObject (vgate11231241r12r12rt111,20000,-2214.6999511719,1236.8000488281,99.699996948242)
if isTimer(base14_CloseTimer2) then killTimer(base14_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base14")),base14_vCL)
--------------------------------------------------------------------------------------------------------------------------------
-- #16 новая база макавели в деревне на земле - пустая
baseCol16 = createColCuboid (-75.803031921387,-395.73297119141,-1, 93.5, 129, 20.5 )
setElementData(baseCol16,"antivhod",{-75.803031921387,-395.73297119141,-1, 93.5, 129, 20.5})
--createRadarArea (-75.803031921387,-395.73297119141, 93.5, 129, 0, 0, 0, 255 )
setElementData(baseCol16,"gangOK",tostring(getXml("GANG","base15")))
setElementData(baseCol16,"spawnToPos",{-87.1357421875,-352.7177734375,1.4296875})

setElementData(getRootElement(),"base15",baseCol16,false)
addEventHandler( "onColShapeHit", baseCol16, EnterBase)
addEventHandler( "onColShapeLeave", baseCol16, LeaveBase)
local gate11231241r12r12rt111 = createObject(10828,-74.800003051758,-355,12.300000190735,0,0,269.99450683594)
local vgate11231241r12r12rt111 = createObject(10828,-12,-284.79998779297,19.10000038147,270,179.98901367188,270.47790527344)
local vgate11231241r12r12rt1111 = createObject(10828,-17.299999237061,-286.10000610352,19.10000038147,270,180,90.488891601563)

local base15_CloseTimer1 = false
function base15_OP()
moveObject (gate11231241r12r12rt111,10000,-74.800003051758,-355,18.10000038147)
if isTimer(base15_CloseTimer1) then killTimer(base15_CloseTimer1) end
base15_CloseTimer1 = setTimer(base15_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base15")),base15_OP)

function base15_CL() 
moveObject (gate11231241r12r12rt111,10000,-74.800003051758,-355,12.300000190735)
if isTimer(base15_CloseTimer1) then killTimer(base15_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base15")),base15_CL)

local base15_CloseTimer2 = false
function base15_vOP()
moveObject (vgate11231241r12r12rt111,20000,2.9677734375,-286.181640625,19.129800796509)
moveObject (vgate11231241r12r12rt1111,20000,-31.10000038147,-286.39999389648,19.10000038147)
if isTimer(base15_CloseTimer2) then killTimer(base15_CloseTimer2) end
base15_CloseTimer2 = setTimer(base15_vCL,40000,1)
end 
addCommandHandler(tostring(getXml("vOP","base15")),base15_vOP)

function base15_vCL() 
moveObject (vgate11231241r12r12rt111,20000,-12,-284.79998779297,19.10000038147)
moveObject (vgate11231241r12r12rt1111,20000,-17.299999237061,-286.10000610352,19.10000038147)
if isTimer(base15_CloseTimer2) then killTimer(base15_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base15")),base15_vCL)
--------------------------------------------------------------------------------------------------------------------------------
-- #17 новая база на земле в аэро лв счет со стороны больницы1 = 19 августа
baseCol17 = createColCuboid (1474.8153076172,1774.4624023438,4, 70.5, 70.5, 20.5 )
setElementData(baseCol17,"antivhod",{1474.8153076172,1774.4624023438,4, 70.5, 70.5, 20.5})
--createRadarArea (1474.8153076172,1774.4624023438, 70.5, 70.5, 0, 0, 0, 255 )
setElementData(baseCol17,"gangOK",tostring(getXml("GANG","base16")))
setElementData(baseCol17,"spawnToPos",{1534.328125,1764.3779296875,10.8203125})

setElementData(getRootElement(),"base16",baseCol17,false)
addEventHandler( "onColShapeHit", baseCol17, EnterBase)
addEventHandler( "onColShapeLeave", baseCol17, LeaveBase)
local gate11231241r12r12rt1111 = createObject(10828,1527.8000488281,1775.3000488281,22.10000038147,0,0,359.74731445313)
local vgate11231241r12r12rt1111 = createObject(10828,1494,1816.1999511719,23.700000762939,270.24719238281,179.99450683594,359.74731445313)
local vgate11231241r12r12rt11111 = createObject(10828,1494.1999511719,1810.9000244141,23.700000762939,270.24169921875,179.99450683594,179.74182128906)

local base16_CloseTimer1 = false
function base16_OP()
moveObject (gate11231241r12r12rt1111,10000,1492.5,1775.5,22.10000038147)
if isTimer(base16_CloseTimer1) then killTimer(base16_CloseTimer1) end
base16_CloseTimer1 = setTimer(base16_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base16")),base16_OP)

function base16_CL() 
moveObject (gate11231241r12r12rt1111,10000,1527.8000488281,1775.3000488281,22.10000038147)
if isTimer(base16_CloseTimer1) then killTimer(base16_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base16")),base16_CL)

local base16_CloseTimer2 = false
function base16_vOP()
moveObject (vgate11231241r12r12rt1111,20000,1493.5634765625,1831.076171875,23.691600799561)
moveObject (vgate11231241r12r12rt11111,20000,1493.9013671875,1796.779296875,23.691600799561)
if isTimer(base16_CloseTimer2) then killTimer(base16_CloseTimer2) end
base16_CloseTimer2 = setTimer(base16_vCL,40000,1)
end 
addCommandHandler(tostring(getXml("vOP","base16")),base16_vOP)

function base16_vCL() 
moveObject (vgate11231241r12r12rt1111,20000,1494,1816.1999511719,23.700000762939)
moveObject (vgate11231241r12r12rt11111,20000,1494.1999511719,1810.9000244141,23.700000762939)
if isTimer(base16_CloseTimer2) then killTimer(base16_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base16")),base16_vCL)
-------------------------------------------------------------------------------------------------------------------------------
-- #18 новая база на земле в аэро лв счет со стороны больницы2 == пустая
baseCol18 = createColCuboid (1343.9757568359,1774.0010986328,4, 70.5, 70.5, 20.5 )
setElementData(baseCol18,"antivhod",{1343.9757568359,1774.0010986328,4, 70.5, 70.5, 20.5})
--createRadarArea (1343.9757568359,1774.0010986328, 70.5, 70.5, 0, 0, 0, 255 )
setElementData(baseCol18,"gangOK",tostring(getXml("GANG","base17")))
setElementData(baseCol18,"spawnToPos",{1358.8583984375,1763.0341796875,10.8203125})

setElementData(getRootElement(),"base17",baseCol18,false)
addEventHandler( "onColShapeHit", baseCol18, EnterBase)
addEventHandler( "onColShapeLeave", baseCol18, LeaveBase)
local gate11231241r12r12rt1111 = createObject(10828,1362,1775.0999755859,22.10000038147,0,0,0)
local vgate11231241r12r12rt1111 = createObject(10828,1362.5999755859,1818.8000488281,23.700000762939,270.23620605469,179.99450683594,0.4888916015625)
local vgate11231241r12r12rt11111 = createObject(10828,1363.6999511719,1813.5999755859,23.700000762939,270.24169921875,179.99450683594,180.48889160156)

local base17_CloseTimer1 = false
function base17_OP() 
moveObject (gate11231241r12r12rt1111,10000,1397.3000488281,1775.0999755859,22.10000038147)
if isTimer(base17_CloseTimer1) then killTimer(base17_CloseTimer1) end
base17_CloseTimer1 = setTimer(base17_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base17")),base17_OP)

function base17_CL() 
moveObject (gate11231241r12r12rt1111,10000,1362,1775.0999755859,22.10000038147)
if isTimer(base17_CloseTimer1) then killTimer(base17_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base17")),base17_CL)

local base17_CloseTimer2 = false
function base17_vOP()
moveObject (vgate11231241r12r12rt1111,20000,1362.65234375,1830.5625,23.691600799561)
moveObject (vgate11231241r12r12rt11111,20000,1363.1455078125,1800.6767578125,23.691600799561)
if isTimer(base17_CloseTimer2) then killTimer(base17_CloseTimer2) end
base17_CloseTimer2 = setTimer(base17_vCL,40000,1)
end 
addCommandHandler(tostring(getXml("vOP","base17")),base17_vOP)

function base17_vCL() 
moveObject (vgate11231241r12r12rt1111,20000,1362.5999755859,1818.8000488281,23.700000762939)
moveObject (vgate11231241r12r12rt11111,20000,1363.6999511719,1813.5999755859,23.700000762939)
if isTimer(base17_CloseTimer2) then killTimer(base17_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base17")),base17_vCL)
-------------------------------------------------------------------------------------------------------------------------------
-- #19 новая база на земле в аэро лв счет со стороны больницы3 = ПУСТАЯ
baseCol19 = createColCuboid (1267.1683349609,1587.8924560547,4, 70.5, 70.5, 20.5 )
setElementData(baseCol19,"antivhod",{1267.1683349609,1587.8924560547,4, 70.5, 70.5, 20.5})
--createRadarArea (1267.1683349609,1587.8924560547, 70.5, 70.5, 0, 0, 0, 255 )
setElementData(baseCol19,"gangOK",tostring(getXml("GANG","base18")))
setElementData(baseCol19,"spawnToPos",{1346.8388671875,1601.576171875,10.8203125})

setElementData(getRootElement(),"base18",baseCol19,false)
addEventHandler( "onColShapeHit", baseCol19, EnterBase)
addEventHandler( "onColShapeLeave", baseCol19, LeaveBase)
local gate11231241r12r12rt1111 = createObject(10828,1336.6999511719,1605.6999511719,22.10000038147,0,0,90)
local vgate11231241r12r12rt1111 = createObject(10828,1286,1631.3000488281,23.700000762939,270.23620605469,179.99450683594,359.73083496094)
local vgate11231241r12r12rt11111 = createObject(10828,1286.0999755859,1626.0999755859,23.700000762939,270.23071289063,179.99450683594,179.73083496094)

local base18_CloseTimer1 = false
function base18_OP()
moveObject (gate11231241r12r12rt1111,10000,1336.6999511719,1641.0999755859,22.10000038147)
if isTimer(base18_CloseTimer1) then killTimer(base18_CloseTimer1) end
base18_CloseTimer1 = setTimer(base18_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base18")),base18_OP)

function base18_CL() 
moveObject (gate11231241r12r12rt1111,10000,1336.6999511719,1605.6999511719,22.10000038147)
if isTimer(base18_CloseTimer1) then killTimer(base18_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base18")),base18_CL)

local base18_CloseTimer2 = false
function base18_vOP()
moveObject (vgate11231241r12r12rt1111,20000,1285.9000244141,1646.1999511719,23.700000762939)
moveObject (vgate11231241r12r12rt11111,20000,1285.177734375,1612.2529296875,23.746599197388)
if isTimer(base18_CloseTimer2) then killTimer(base18_CloseTimer2) end
base18_CloseTimer2 = setTimer(base18_vCL,40000,1)
end 
addCommandHandler(tostring(getXml("vOP","base18")),base18_vOP)

function base18_vCL() 
moveObject (vgate11231241r12r12rt1111,20000,1286,1631.3000488281,23.700000762939)
moveObject (vgate11231241r12r12rt11111,20000,1286.0999755859,1626.0999755859,23.700000762939)
if isTimer(base18_CloseTimer2) then killTimer(base18_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base18")),base18_vCL)
----------------------------------------------------------------------------------------------------------------------------------
-- #20 новый нестандарт возле нестандарта макавели - wm makso == пустая
baseCol20 = createColCuboid ( 1580.2786865234,663.65319824219,-7, 173, 119, 45 )
setElementData(baseCol20,"antivhod",{1580.2786865234,663.65319824219,-7, 173, 119, 45})
--createRadarArea (1580.2786865234,663.65319824219, 173, 119, 0, 0, 0, 255 )
setElementData(baseCol20,"gangOK",tostring(getXml("GANG","base19")))
setElementData(baseCol20,"spawnToPos",{1567.2060546875,713.6806640625,10.880794525146})

setElementData(getRootElement(),"base19",baseCol20,false)
addEventHandler( "onColShapeHit", baseCol20, EnterBase)
addEventHandler( "onColShapeLeave", baseCol20, LeaveBase)
local gate11231241r12r12rt111111 = createObject(10828,1581.8000488281,715.59997558594,22,0,0,90)
local vgate11231241r12r12rt11111awd1 = createObject(10828,1669.4000244141,727,38.099998474121,270,180,0)
local vgate11231241r12r12rt111111awdawf1 = createObject(10828,1669.5999755859,721.59997558594,38.200000762939,270,359.99639892578,0)

local base19_CloseTimer1 = false
function base19_OP()
moveObject (gate11231241r12r12rt111111,10000,1581.9000244141,750.59997558594,22)
if isTimer(base19_CloseTimer1) then killTimer(base19_CloseTimer1) end
base19_CloseTimer1 = setTimer(base19_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base19")),base19_OP)

function base19_CL() 
moveObject (gate11231241r12r12rt111111,10000,1581.8000488281,715.59997558594,22)
if isTimer(base19_CloseTimer1) then killTimer(base19_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base19")),base19_CL)

local base19_CloseTimer2 = false
function base19_vOP()
moveObject (vgate11231241r12r12rt11111awd1,10000,1670,742,38.099998474121)
moveObject (vgate11231241r12r12rt111111awdawf1,10000,1669.4000244141,706.70001220703,38.200000762939)
if isTimer(base19_CloseTimer2) then killTimer(base19_CloseTimer2) end
base19_CloseTimer2 = setTimer(base19_vCL,30000,1)
end 
addCommandHandler(tostring(getXml("vOP","base19")),base19_vOP)

function base19_vCL() 
moveObject (vgate11231241r12r12rt11111awd1,10000,1669.4000244141,727,38.099998474121)
moveObject (vgate11231241r12r12rt111111awdawf1,10000,1669.5999755859,721.59997558594,38.200000762939)
if isTimer(base19_CloseTimer2) then killTimer(base19_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base19")),base19_vCL)
------------------------------------------------------------------------------------------------------------------------------------
-- #21 база на заброшенном аэро -- 2 августа
baseCol21 = createColCuboid (166.69613647461,2365.0849609375,4.5, 70.5, 105.5, 40.5 )
setElementData(baseCol21,"antivhod",{166.69613647461,2365.0849609375,4.5, 70.5, 105.5, 40.5})
----createRadarArea (166.69613647461,2365.0849609375,  70.5, 105.5, 0, 0, 0, 255 )
baseCol22 = createColCuboid (60.515007019043,2365.0446777344,9.5, 106, 105.5, 20.5 )
setElementData(baseCol22,"antivhod",{60.515007019043,2365.0446777344,9.5, 106, 105.5, 20.5})
----createRadarArea (60.515007019043,2365.0446777344,  106, 105.5, 0, 0, 0, 255 )
setElementData(baseCol21,"gangOK",tostring(getXml("GANG","base20")))
setElementData(baseCol22,"gangOK",tostring(getXml("GANG","base20")))
setElementData(baseCol21,"spawnToPos",{113.8681640625,2484.2666015625,16.484375})
setElementData(baseCol22,"spawnToPos",{113.8681640625,2484.2666015625,16.484375})

setElementData(getRootElement(),"base20",{baseCol21,baseCol22},false)

addEventHandler( "onColShapeHit", baseCol21, EnterBase)
addEventHandler( "onColShapeLeave", baseCol21, LeaveBase)
addEventHandler( "onColShapeHit", baseCol22, EnterBase)
addEventHandler( "onColShapeLeave", baseCol22, LeaveBase)
local gate11231241r12r12rt11111ajwhhwuwu1 = createObject(10828,113.69999694824,2470,27.700000762939,0,0,359.99450683594)
local vgate11231241r12r12rt11111awd123 = createObject(10828,219.80000305176,2467.3999023438,44.099998474121,90,179.99450683594,359.98901367188)
local vgate11231241r12r12rt111111awdawf1234 = createObject(10828,219.80000305176,2454.5,44.200000762939,90,179.99450683594,359.98901367188)
local vgate11231241r12r12rt111111awdawf212345 = createObject(10828,219.80000305176,2439.6000976563,44.200000762939,90,179.99450683594,359.98901367188)
local vgate11231241r12r12rt11111awd123456 = createObject(10828,184.39999389648,2467.3999023438,44.099998474121,90,179.99450683594,359.98901367188)
local vgate11231241r12r12rt111111awdawf1234567 = createObject(10828,184.39999389648,2454.5,44.200000762939,90,179.99450683594,359.98901367188)
local vgate11231241r12r12rt111111awdawf212345678 = createObject(10828,184.39999389648,2439.6000976563,44.200000762939,90,179.99450683594,359.98901367188)

local base20_CloseTimer1 = false
function base20_OP()
moveObject (gate11231241r12r12rt11111ajwhhwuwu1,10000,78.300003051758,2470,27.700000762939)
if isTimer(base20_CloseTimer1) then killTimer(base20_CloseTimer1) end
base20_CloseTimer1 = setTimer(base20_CL,30000,1)
end 
addCommandHandler(tostring(getXml("OP","base20")),base20_OP)

function base20_CL() 
moveObject (gate11231241r12r12rt11111ajwhhwuwu1,10000,113.69999694824,2470,27.700000762939)
if isTimer(base20_CloseTimer1) then killTimer(base20_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base20")),base20_CL)

local base20_CloseTimer2 = false
function base20_vOP()
moveObject (vgate11231241r12r12rt11111awd123,10000,219.80000305176,2424.6999511719,44.200000762939)
moveObject (vgate11231241r12r12rt111111awdawf1234,10000,219.80000305176,2424.6999511719,44.200000762939) 
moveObject (vgate11231241r12r12rt111111awdawf212345,10000,219.80000305176,2424.6999511719,44.200000762939)
moveObject (vgate11231241r12r12rt11111awd123456,10000,184.39999389648,2424.6999511719,44.200000762939)
moveObject (vgate11231241r12r12rt111111awdawf1234567,10000,184.39999389648,2424.6999511719,44.200000762939)
moveObject (vgate11231241r12r12rt111111awdawf212345678,10000,184.39999389648,2424.6999511719,44.200000762939)
if isTimer(base20_CloseTimer2) then killTimer(base20_CloseTimer2) end
base20_CloseTimer2 = setTimer(base20_vCL,30000,1)
end  
addCommandHandler(tostring(getXml("vOP","base20")),base20_vOP)

function base20_vCL() 
moveObject (vgate11231241r12r12rt11111awd123,10000,219.80000305176,2467.3999023438,44.099998474121)
moveObject (vgate11231241r12r12rt111111awdawf1234,10000,219.80000305176,2454.5,44.200000762939)
moveObject (vgate11231241r12r12rt111111awdawf212345,10000,219.80000305176,2439.6000976563,44.200000762939)
moveObject (vgate11231241r12r12rt11111awd123456,10000,184.39999389648,2467.3999023438,44.099998474121)
moveObject (vgate11231241r12r12rt111111awdawf1234567,10000,184.39999389648,2454.5,44.200000762939)
moveObject (vgate11231241r12r12rt111111awdawf212345678,10000,184.39999389648,2439.6000976563,44.200000762939)
if isTimer(base20_CloseTimer2) then killTimer(base20_CloseTimer2) end
end
addCommandHandler(tostring(getXml("vCL","base20")),base20_vCL)
-------------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------------------------------------------------------------------------
-- #22 Маленькая база возле касс в лв, квадрат Б-24
local smallBase21Antivhod = createColCuboid (2801.7058105469,2665.1105957031,0,35, 32, 20 )
setElementData(smallBase21Antivhod,"antivhod",{2801.7058105469,2665.1105957031,0,35, 32, 20})
--createRadarArea (-2129.5356445313,513.20361328125,  114.5, 41.5, 0, 0, 0, 255 )
setElementData(smallBase21Antivhod,"gangOK",tostring(getXml("GANG","base21")))
setElementData(smallBase21Antivhod,"spawnToPos",{2819.66015625,2654.751953125,10.671875})

setElementData(getRootElement(),"base21",smallBase21Antivhod,false)
addEventHandler( "onColShapeHit", smallBase21Antivhod, EnterBase)
addEventHandler( "onColShapeLeave", smallBase21Antivhod, LeaveBase)
local base21gate = createObject(3037,2819.6999511719,2671.5999023438,11.7,0,0,270)

local base21_CloseTimer1 = false
function base21_OP()
moveObject (base21gate,5000,2819.6999511719,2671.5999023438,7)

if isTimer(base21_CloseTimer1) then killTimer(base21_CloseTimer1) end
base21_CloseTimer1 = setTimer(base21_CL,25000,1)
end 
addCommandHandler(tostring(getXml("OP","base21")),base21_OP)
function base21_CL() 
moveObject (base21gate,5000,2819.6999511719,2671.5999023438,11.7)
if isTimer(base21_CloseTimer1) then killTimer(base21_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base21")),base21_CL)
-------------------------------------------------------------------------------------------------------------------------------




------------------------------------------------------------------------------------------------------------------------------
-- #23 Маленькая база возле гольф поля в лв, квадрат А-18
local smallBase22Antivhod = createColCuboid (1390.365234375,2829.835937,0, 35, 35, 18 )
setElementData(smallBase22Antivhod,"antivhod",{1390.365234375,2829.835937,0, 35, 35, 18})
--createRadarArea (-2129.5356445313,513.20361328125,  114.5, 41.5, 0, 0, 0, 255 )
setElementData(smallBase22Antivhod,"gangOK",tostring(getXml("GANG","base22")))
setElementData(smallBase22Antivhod,"spawnToPos",{1426.041015625,2846.1787109375,10.8203125})

setElementData(getRootElement(),"base22",smallBase22Antivhod,false)
addEventHandler( "onColShapeHit", smallBase22Antivhod, EnterBase)
addEventHandler( "onColShapeLeave", smallBase22Antivhod, LeaveBase)
local base22gate = createObject(3037,1417.6999511719,2846.3000488281,12,0,0,0)

local base22_CloseTimer1 = false
function base22_OP()
moveObject (base22gate,5000,1417.6999511719,2846.3000488281,7.5)

if isTimer(base22_CloseTimer1) then killTimer(base22_CloseTimer1) end
base22_CloseTimer1 = setTimer(base22_CL,25000,1)
end 
addCommandHandler(tostring(getXml("OP","base22")),base22_OP)
function base22_CL() 
moveObject (base22gate,5000,1417.6999511719,2846.3000488281,12)
if isTimer(base22_CloseTimer1) then killTimer(base22_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base22")),base22_CL)
-------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------
-- #24 Маленькая база возле красного моста в сф, квадрат И-1
local smallBase23Antivhod = createColCuboid (-2761.5751953125,1239.0693359375,-1, 35, 35, 18 )
setElementData(smallBase23Antivhod,"antivhod",{-2761.5751953125,1239.0693359375,-1, 35, 35, 18})
--createRadarArea (-2129.5356445313,513.20361328125,  114.5, 41.5, 0, 0, 0, 255 )
setElementData(smallBase23Antivhod,"gangOK",tostring(getXml("GANG","base23")))
setElementData(smallBase23Antivhod,"spawnToPos",{-2763.8115234375,1257.0107421875,11.765625})

setElementData(getRootElement(),"base23",smallBase23Antivhod,false)
addEventHandler( "onColShapeHit", smallBase23Antivhod, EnterBase)
addEventHandler( "onColShapeLeave", smallBase23Antivhod, LeaveBase)
local base23gate = createObject(3037,-2755.1999511719,1255.0999755859,12.5,0,0,0)

local base23_CloseTimer1 = false
function base23_OP()
moveObject (base23gate,5000,-2755.1999511719,1255.0999755859,8)

if isTimer(base23_CloseTimer1) then killTimer(base23_CloseTimer1) end
base23_CloseTimer1 = setTimer(base23_CL,25000,1)
end 
addCommandHandler(tostring(getXml("OP","base23")),base23_OP)
function base23_CL() 
moveObject (base23gate,5000,-2755.1999511719,1255.0999755859,12.5)
if isTimer(base23_CloseTimer1) then killTimer(base23_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base23")),base23_CL)
-------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------
-- #25 Маленькая база возле обучения стрельбе в лс, квадрат Ц-22
local smallBase24Antivhod = createColCuboid (2302.6474609375,-2012.844116210,-2.5, 35, 35, 21 )
setElementData(smallBase24Antivhod,"antivhod",{2302.6474609375,-2012.844116210,-2.5, 35, 35, 21})
--createRadarArea (2302.6474609375,-2012.844116210,  35,35, 0, 0, 0, 255 )
setElementData(smallBase24Antivhod,"gangOK",tostring(getXml("GANG","base24")))
setElementData(smallBase24Antivhod,"spawnToPos",{2327.119140625,-1974.515625,13.351716041565})

setElementData(getRootElement(),"base24",smallBase24Antivhod,false)
addEventHandler( "onColShapeHit", smallBase24Antivhod, EnterBase)
addEventHandler( "onColShapeLeave", smallBase24Antivhod, LeaveBase)
local base24gate = createObject(3037,2320,-1987,14.5,0,0,90)

local base24_CloseTimer1 = false
function base24_OP()
moveObject (base24gate,5000,2320,-1987,10)

if isTimer(base24_CloseTimer1) then killTimer(base24_CloseTimer1) end
base24_CloseTimer1 = setTimer(base24_CL,25000,1)
end 
addCommandHandler(tostring(getXml("OP","base24")),base24_OP)
function base24_CL() 
moveObject (base24gate,5000,2320,-1987,14.5)
if isTimer(base24_CloseTimer1) then killTimer(base24_CloseTimer1) end
end
addCommandHandler(tostring(getXml("CL","base24")),base24_CL)
-------------------------------------------------------------------------------------------------------------------------------




function getValues(value)
local baseTable =""
local copyData =""
local onePass =""
base = xmlFindChild( config,value,0) or false
base = xmlNodeGetChildren(base)
for theKey,veh in ipairs(base) do
local txmlTag = xmlNodeGetName(veh);
local xmlValue = xmlNodeGetValue(veh);
if txmlTag =="DATE" then
baseTable=baseTable.."<tr><td>Дата аренды:</td><td><input type='date' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.." onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
copyData=copyData.."\r\nДата окончания аренды:"..xmlValue.."\r\n"
elseif txmlTag =="GANG" then
baseTable=baseTable.."<tr><td>Группа антивхода:</td><td><input type='text' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.." onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
if xmlValue =="false" then
xmlValue="БЕЗ АНТИВХОДА"
end
copyData=copyData.."Группа антивхода:"..xmlValue.."\r\n"
elseif txmlTag =="OP" then
baseTable=baseTable.."<tr><td>Пароль открытия:</td><td><input type='text' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.." onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
copyData=copyData.."Пароль открытия:"..xmlValue.."\r\n"
onePass =xmlValue

elseif txmlTag =="CL" then
baseTable=baseTable.."<tr><td>Пароль закрытия:</td><td><input type='text' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.." onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
copyData=copyData.."Пароль закрытия:"..xmlValue.."\r\n"

elseif txmlTag =="pOP" then
baseTable=baseTable.."<tr><td>Пароль открытия доп. ворот:</td><td><input type='text' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.." onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
copyData=copyData.."Пароль открытия доп. ворот:"..xmlValue.."\r\n"

elseif txmlTag =="pCL" then
baseTable=baseTable.."<tr><td>Пароль закрытия доп. ворот:</td><td><input type='text' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.." onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
copyData=copyData.."Пароль закрытия доп. ворот:"..xmlValue.."\r\n"

elseif txmlTag =="vOP" then
baseTable=baseTable.."<tr><td>Пароль открытия крыши:</td><td><input type='text' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.." onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
copyData=copyData.."Пароль открытия крыши:"..xmlValue.."\r\n"

elseif txmlTag =="vCL" then
baseTable=baseTable.."<tr><td>Пароль закрытия крыши:</td><td><input type='text' id="..txmlTag.." value='"..xmlValue.."'/></td><td><input title="..txmlTag.."  onclick='setNewValue(this)' type='button' value='Готово'/></td></tr>"
copyData=copyData.."Пароль закрытия крыши:"..xmlValue.."\r\n"

end

end
local carCount =getCars(value,true)
return baseTable,copyData,onePass,carCount
end



function setValues(name,baseIndex,newValue)
local base = xmlFindChild( config,baseIndex,0) or false
local node = xmlFindChild( base,name,0) or false
if name =="GANG" then
if baseIndex == "base20" or baseIndex == "base12"  then
local tableCols = getElementData(getRootElement(),baseIndex)
for theKey,col in ipairs(tableCols) do
setElementData(col,"gangOK",newValue,false)
end
else
setElementData(getElementData(getRootElement(),baseIndex),"gangOK",newValue,false)
end

-- or name =="vCL" or name =="pCL" or name =="CL" 
elseif name =="OP"  or name =="pOP" or name =="vOP" or name =="vCL" or name =="pCL" or name =="CL" then
removeCommandHandler ( tostring(getXml(name,baseIndex) ) )
addCommandHandler(tostring(newValue),_G[baseIndex.."_"..name])
end
local param = xmlNodeSetValue(node,newValue) or false
xmlSaveFile ( config)
return param;
end





function getBasesData()

local baseArr = {}
for i = 0, 24 do
local baseTable ={}
base = xmlFindChild( config,"base"..i,0) or false
base = xmlNodeGetChildren(base)
for theKey,veh in ipairs(base) do
local txmlTag = xmlNodeGetName(veh);
local xmlValue = xmlNodeGetValue(veh);
if txmlTag =="DATE" then
table.insert(baseTable,(i+1))
table.insert(baseTable,xmlValue)
elseif txmlTag =="GANG" then
table.insert(baseTable,xmlValue)
table.insert(baseArr,baseTable)

end

end


end

return baseArr

end
