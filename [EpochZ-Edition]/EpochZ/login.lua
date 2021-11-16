local spawnPositions = {
{-2438.88671875,-663.7294921875,133.15925598145},
{-1508.5849609375,-357.5478515625,7.0065450668335},
{612.033203125,-601.666015625,17.2265625},
{-206.8271484375,-1532.0458984375,6.9672136306763},
{1625.560546875,1521.2578125,10.848795890808}

}


function playerLogin(username, pass, player)
	local playerID = getAccountData(getPlayerAccount(player),"playerID")
	account = getPlayerAccount(player)
	setElementData(player,"userAccount",username)
	setElementData(player,"userPassword",pass)
	
	local x,y,z =  getAccountData(account,"last_x") or  spawnPositions[1][1] ,getAccountData(account,"last_y") or  spawnPositions[1][2] ,getAccountData(account,"last_z") or  spawnPositions[1][3]
	local skin = getElementData(player,"skin")

				
	local skin = getAccountData(account,"skin")
				
	createZombieTable (player)
	if getAccountData(account,"isDead") then
	
		setElementData(player,"playerexp",getAccountData(account,"playerexp")) -- client
		setElementData(player,"playerlvl",getAccountData(account,"playerlvl")) -- client
				
		spawnDayZPlayer(player) 
		return
		
	end
				
	spawnPlayer (player, x,y,z, math.random(0,360), skin or 279, 0, 0)
	fadeCamera(player,true)
	setCameraTarget (player, player)
	local playerCol = createColSphere(x,y,z,1.5)
	setElementData(player,"playerCol",playerCol,false)
	attachElements ( playerCol, player, 0, 0, 0 )
	setElementData(playerCol,"parent",player) -- client
	setElementData(playerCol,"player",true) --client
				
	setElementParent(playerCol,playersObjects)		
				
	local datas = getAccountData(account,"playerDatas") or false
	if datas then
		local playerDatas = fromJSON(datas)
		--iprint(playerDatas)		
		for i,data in ipairs(playerDatas) do
			--outputChatBox(data[1].." : "..tostring(data[2]))
			setElementData(player,data[1],data[2]) -- client
		end
	else
			for i,data in ipairs(playerDataTable) do
			local elementData = getAccountData(account,data[1])
			setElementData(player,data[1],elementData) -- client
			end
	end
	setElementData(player,"logedin",true) -- client
		

	local curWeapon1 = getElementData(player,"currentweapon_1")  or "none"
	local curWeapon2 = getElementData(player,"currentweapon_2")  or "none"
	local curWeapon3 = getElementData(player,"currentweapon_3")  or "none"		


	
	if curWeapon3 ~=0 and curWeapon3 and curWeapon3 ~="none" then
		triggerEvent("onPlayerRearmWeapon",player,curWeapon3,3)
	end
	
	if curWeapon2 ~=0 and curWeapon2 and curWeapon2 ~="none" then
		triggerEvent("onPlayerRearmWeapon",player,curWeapon2,2)
	end
	
	if curWeapon1 ~=0 and curWeapon1 and curWeapon1 ~="none" then
		triggerEvent("onPlayerRearmWeapon",player,curWeapon1,1)
	end
	
	local clot1 = getElementData(player,"clotType_1") or 0 
	if clot1 and getElementData(player,clot1) >=1 then
		local profit1 = getElementData(player,"clotProfit_1") or 0
		triggerClientEvent(player,"clotElementC",player,clot1,{1,profit1})
	end

	local clot2 = getElementData(player,"clotType_2")
	if clot2 and getElementData(player,clot2) >=1 then
		local profit2 = getElementData(player,"clotProfit_2") or 0
		triggerClientEvent(player,"clotElementC",player,clot2,{2,profit2})
	end


end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)



local startLoot ={
{"M1911",1},
{"M1911 mag",20},
{"Coca-Cola",1},
{"Mapa",1},
{"Antibiótico",1},
{"Lata de Feijão",1},
{"Ataduras",2},
{"Analgésico",1}
}

function playerRegister(username, pass, player)

	setElementData(player,"userAccount",username)
	setElementData(player,"userPassword",pass)
	
	
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 279, 0, 0)
	fadeCamera(player,true)
	setCameraTarget (player, player)
	local playerCol = createColSphere(x,y,z,1.5)
	setElementParent(playerCol,playersObjects)
	
		setElementData(player,"playerCol",playerCol,false)
		attachElements ( playerCol, player, 0, 0, 0 )
		setElementData(playerCol,"parent",player) --client
		setElementData(playerCol,"player",true) --client
		setElementData(player,"logedin",true)
		
		
				

	for i,data in ipairs(playerDataTable) do

		if data[1] =="MAX_Slots" then
			setElementData(player,data[1],50) --client
		elseif data[1] =="skin" then
			setElementData(player,data[1],279) --client
		elseif data[1] =="blood" then
			setElementData(player,data[1],12000) --client
		elseif data[1] =="brokenbone" then
			setElementData(player,data[1],false) --client	
		elseif data[1] =="pain" then
			setElementData(player,data[1],false) --client
		elseif data[1] =="infection" then
			setElementData(player,data[1],false) --client
		elseif data[1] =="food" then
			setElementData(player,data[1],100) --client
		elseif data[1] =="thirst" then
			setElementData(player,data[1],100) --client
		elseif data[1] =="bandit" then
			setElementData(player,data[1],false) --client	
		elseif data[1] =="humanity" then
			setElementData(player,data[1],2500)	 --client
        elseif data[1] =="playerexp" then
			setElementData(player,data[1],12001)	 --client
	
		else
			setElementData(player,data[1],0) --client
		end	
	end
	
	for i,data in ipairs(startLoot) do
		setElementData(player,data[1],data[2]) --client
	end
	
	
	account = getAccount(username)
	local value = getAccounts()
	local value = #value
	setElementData(player,"playerID",value+1,false)
	setAccountData(account,"playerID",value+1)
	createZombieTable (player)

end
addEvent("onPlayerDayZRegister", true)
addEventHandler("onPlayerDayZRegister", getRootElement(), playerRegister)


function saveAccounts () -- Save in the database


	
	local account = getPlayerAccount(source)
	if account then
	
		local playerJsonData ={}
		for i, data in ipairs(playerDataTable) do 
			table.insert(playerJsonData,{data[1],getElementData(source,data[1])})
		end
		for i, data in ipairs(lootData) do 
				local value = getElementData(source,data[1])
				if value and value > 0 then
					table.insert(playerJsonData,{data[1],value})
				end
			end
			--iprint(playerJsonData)
		local jsonTable = toJSON(playerJsonData)
		setAccountData(account,"playerDatas",jsonTable)
		
		local playerExp = getElementData(source,"playerexp")
		local playerLvl = getElementData(source,"playerlvl")
		setAccountData(account,"playerexp",playerExp)
		setAccountData(account,"playerlvl",playerLvl)
		
		local x,y,z =  getElementPosition(source)
		local skin = getElementData(source,"skin")
		local lastQuitTime = getRealTime(  )
		setAccountData(account,"lastQuitTime",lastQuitTime.timestamp)
		setAccountData(account,"skin",skin)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		if isElement(getElementData(source,"playerCol")) then
			destroyElement(getElementData(source,"playerCol"))
		end
	end	
	setElementData(source,"logedin",false) --client
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2 ()

for i, player in ipairs(getElementsByType("player")) do
	local account = getPlayerAccount(player)
	if account then
	
		local playerJsonData ={}
		for i, data in ipairs(playerDataTable) do 
			table.insert(playerJsonData,{data[1],getElementData(player,data[1])})
		end
		for i, data in ipairs(lootData) do 
			local value = getElementData(player,data[1])
			if value and value > 0 then
				table.insert(playerJsonData,{data[1],value})
			end
		end
		
		local jsonTable = toJSON(playerJsonData)
		setAccountData(account,"playerDatas",jsonTable)
	
	
	local playerExp = getElementData(player,"playerexp")
	local playerLvl = getElementData(player,"playerlvl")
			setAccountData(account,"playerexp",playerExp)
			setAccountData(account,"playerlvl",playerLvl)
			
		local skin = getElementData(player,"skin")
		setAccountData(account,"skin",skin)	
			
		local x,y,z =  getElementPosition(player)
		local lastQuitTime = getRealTime(  )
		setAccountData(account,"lastQuitTime",lastQuitTime.timestamp) 
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
	end	
end	
end
addEventHandler ( "onResourceStop", resourceRoot, saveAccounts2 )



function createVehicleOnServerStart()



setElementData(getRootElement(),"serverName",getServerName ())

	local vehicleManager = getAccount("vehicleManagerEpochZ","23g2g23g23g23g")
	if not vehicleManager then 
	vehicleManager = addAccount("vehicleManagerEpochZ","23g2g23g23g23g")
	end
	
	
	for i = 1, (getAccountData(vehicleManager,"vehicleamount") or 0) do
		wastedVehicle = false
		vehicle = getAccount("EpochZvehicle_number_"..i,"23g2g23g23g23g")
		if not vehicle then break end
		if getAccountData(vehicle,"isExploded") == true then
			setAccountData(vehicle,"health",1000)
			wastedVehicle = true
		end
			local veh = createVehicle(getAccountData(vehicle,"model"),getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),getAccountData(vehicle,"last_rx"),getAccountData(vehicle,"last_ry"),getAccountData(vehicle,"last_rz"))
			vehCol = createColSphere(getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),4)
			
			setElementParent ( veh, vehs )  
			setElementParent ( vehCol, veh )  
			
			attachElements ( vehCol, veh, 0, 0, 0 )
			setElementData(veh,"counterV",i,false)
			setElementData(vehCol,"parent",veh) -- client
			setElementData(veh,"parent",vehCol) -- client
			
		local maxfuel =	getAccountData(vehicle,"maxfuel") or 0
			setElementData(veh,"maxfuel",maxfuel)
		local needtires = getAccountData(vehicle,"needtires") or 0 
			setElementData(veh,"needtires",needtires)
		local needengines= getAccountData(vehicle,"needengines") or 0
			setElementData(veh,"needengines",needengines)		
		local expenFuel = getAccountData(vehicle,"expenFuel") or 0 
			setElementData(veh,"expenFuel",expenFuel)
		local steelList = getAccountData(vehicle,"steelList") or 0 
		
		
			local carModel = getAccountData(vehicle,"model") or 0 
			if carModel == 601 or carModel == 490 or carModel == 528 or carModel == 470 then
			setElementData(veh,"steelList",math.random(500,1000))
			end
			
			setElementData(veh,"steelList",steelList)
			
			if carModel == 584 then 
			setElementData(vehCol,"patrolstation",true) -- client
			else
			setElementData(vehCol,"vehicle",true) --client
			end
			
			
			--setElementData(vehCol,"vehicle",true)
			setElementData(vehCol,"MAX_Slots",getAccountData(vehicle,"MAX_Slots")) -- client
			setElementHealth(veh,getAccountData(vehicle,"health"))
		--vehicle_indentifikation
			xxx,yyy,zzz = getAccountData(vehicle,"spawn_x"),getAccountData(vehicle,"spawn_y"),getAccountData(vehicle,"spawn_z")
			setElementData(vehCol,"spawn",{getAccountData(vehicle,"model"),xxx,yyy,zzz},false) 
			if wastedVehicle then
				setElementPosition(veh,xxx,yyy,zzz+0.1)
				setElementRotation(veh,0,0,0)
				--Motor + Pneu	
				setElementData(vehCol,"Pneu_inVehicle",math.random(0,needtires)) --client
				setElementData(vehCol,"Motor_inVehicle",math.random(0,needengines)) --client
				setElementData(vehCol,"fuel",5) --client
			end
		--others
			setElementData(vehCol,"fuel",getAccountData(vehicle,"fuel")) --client
	if not wastedVehicle then
		
		local vehDatas = getAccountData(vehicle,"vehicleDatas") or false
		if vehDatas then
		local vehJsonTableDatas = fromJSON(vehDatas)
		for i, data in ipairs(vehJsonTableDatas) do 
			setElementData(vehCol,data[1],data[2]) --client
		end
			--[[
			else
			for i, data in ipairs(vehicleDataTable) do 
				setElementData(vehCol,data[1],getAccountData(vehicle,data[1])) --client
			end
			]]
		end
		
		local color1 = getAccountData(vehicle,"settings.color1") or false 
		if color1 then
			setElementData(veh,"settings.color1",color1)
			local color2 = getAccountData(vehicle,"settings.color2") or false 
			setElementData(veh,"settings.color2",color2)
			local engine = getAccountData(vehicle,"settings.engine") or false 
			setElementData(veh,"settings.engine",engine)
			local suspension = getAccountData(vehicle,"settings.suspension") or false 
			setElementData(veh,"settings.suspension",suspension)
			
			local r1,g1,b1 = getColorFromString ( color1 )
			local r2,g2,b2 = getColorFromString ( color2 )
			
			settings={
			['sus'] = suspension,
			['engine'] = engine,
			['color1'] = {r1,g1,b1},
			['color2'] = {r2,g2,b2}
			}
			
			triggerEvent ( "setCarSettings", veh,settings )	
		end
		
		triggerEvent ( "setWheelStates", getRootElement(), veh,getElementData(vehCol,"Pneu_inVehicle"),"-" )
	end
	end
	
	
	
	for i = 1, (getAccountData(vehicleManager,"tentamount") or 0) do
		tentData = getAccount("EpochZtent_number_"..i,"EpochZtntNmb$Uhjm")
		--if not tentData then break end
		if tentData and not getAccountData(tentData,"removed") then 
		
			local isSave = getAccountData(tentData,"save") or false
			local x,y,z,rz = getAccountData(tentData,"last_x"),getAccountData(tentData,"last_y"),getAccountData(tentData,"last_z"),getAccountData(tentData,"last_rz") or 0
			tentCol = createColSphere(x,y,z,4)
			if isSave then 
				tent = createObject(1907,x,y,z,0,0,rz)
				setElementData(tentCol,"save", true) --client
				setElementData(tentCol,"pass",getAccountData(tentData,"pass") ) --client
				setElementData(tentCol,"MAX_Slots",150) --client
			else
				local bigTent = getAccountData(tentData,"bigTent") or false
				if bigTent then
					tent = createObject(14785,x,y,z,0,0,rz)
					setElementData(tentCol,"MAX_Slots",200) --client
					setElementData(tentCol,"bigTent",true) --client
				else
					
					
					local ADMINTent = getAccountData(tentData,"ADMINTent") or false 
					if ADMINTent then
						tent = createObject(2991,x,y,z-.5,0,0,rz)
						setElementData(tentCol,"MAX_Slots",981289189298) --client
						setElementData(tentCol,"ADMINTent",true) --client
					else
						tent = createObject(3243,x,y,z,0,0,rz)
						setElementData(tentCol,"MAX_Slots",100) --client
					end
				end
			end
			--setObjectScale(tent,1.3) нахуя это ? 
			
			attachElements ( tentCol, tent, 0, 0, 0 )
			setElementData(tentCol,"parent",tent) --client
			setElementData(tent,"parent",tentCol) --client
			setElementData(tentCol,"tent",true) --client
			setElementData(tentCol,"counterT",i) --client
			setElementData(tentCol,"PlayerNick",getAccountData(tentData,"PlayerNick") or "старая Tenda")
			setElementData(tentCol,"PlayerSerial",getAccountData(tentData,"PlayerSerial") or "старая Tenda")
			setElementData(tentCol,"lastOpen",getAccountData(tentData,"lastOpen") or false)
			--setElementData(tentCol,"MAX_Slots",getAccountData(tentData,"MAX_Slots") or 0)
			
			setElementData(tentCol,"vehicle",true) --client это надо? 
		
			setElementParent ( tent, tents )  
			setElementParent ( tentCol, tent )  
			
			local tentDatas = getAccountData(tentData,"tentDatas") or false
			if tentDatas then
			
				local tentJsonTableDatas = fromJSON(tentDatas)
				for i, data in ipairs(tentJsonTableDatas) do 
				
					if data[2] and data[2] >0 then 
						setElementData(tentCol,data[1],data[2]) --client
					end
					
				end
						
			end
			
		end
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), createVehicleOnServerStart)  --!!!




function saveVehOnExit ( thePlayer, seat, jacked,closeVEH )
if closeVEH then
 source = closeVEH
--return
end
if seat == 0 then

counter  = getElementData(source,"counterV") 
if not counter then return end	
account = getAccount("EpochZvehicle_number_"..counter,"A23g2g23g23g23g") or false
		if not account then return end	
		setElementData(source,"counterV",counter,false) 
		local col = getElementData(source,"parent")
			setAccountData(account,"spawn_x",getElementData(col,"spawn")[2])
			setAccountData(account,"spawn_y",getElementData(col,"spawn")[3])
			setAccountData(account,"spawn_z",getElementData(col,"spawn")[4])
		
				
				
		local tableJsonData ={}
		for i, data in ipairs(vehicleDataTable) do -- SALVAMOS OS DADOS DA MÁQUINA NA TABELA !!! CONVERTER DATA PARA A CONTA?
				--setAccountData(account,data[1],)
			local value  = getElementData(col,data[1])
			table.insert(tableJsonData,{data[1],value})
				
		end
		
		
		
		for i, data in ipairs(tentDataTable) do 

				local value  = getElementData(col,data[1])
				table.insert(tableJsonData,{data[1],value})
		
		end
		
		for i, data in ipairs(lootData) do  ---- SALVAMOS A MÁQUINA EM UMA MESA

			local value  = getElementData(col,data[1])
			if value and value > 0 then
				table.insert(tableJsonData,{data[1],value})
			end
		end
		
			local jsonTable = toJSON(tableJsonData)
		setAccountData(account,"vehicleDatas",jsonTable)
				
		outputDebugString("veh:"..tostring(counter))
		local model = getElementModel(source)
		local x,y,z = getElementPosition(source)
		local rx,ry,rz = getElementRotation(source)
		local health = getElementHealth(source)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		setAccountData(account,"last_rx",rx)
		setAccountData(account,"last_ry",ry)
		setAccountData(account,"last_rz",rz)
		setAccountData(account,"health",health)
		local maxfuel =	getElementData(source,"maxfuel") or 0
			setAccountData(account,"maxfuel",maxfuel)
		local needtires = getElementData(source,"needtires") or 0 
			setAccountData(account,"needtires",needtires)
		local needengines= getElementData(source,"needengines") or 0
			setAccountData(account,"needengines",needengines)		
		local expenFuel = getElementData(source,"expenFuel") or 0 
			setAccountData(account,"expenFuel",expenFuel)
		local steelList = getElementData(source,"steelList") or 0 
			setAccountData(account,"steelList",steelList)
		
		local color1 = getElementData(source,"settings.color1") or false 
			setAccountData(account,"settings.color1",color1)
		local color2 = getElementData(source,"settings.color2") or false 
			setAccountData(account,"settings.color2",color2)
		local engine = getElementData(source,"settings.engine") or false 
			setAccountData(account,"settings.engine",engine)
		local suspension = getElementData(source,"settings.suspension") or false 
			setAccountData(account,"settings.suspension",suspension)
		
				if getAccountData(account,"model") ~= model then	
	setAccountData(account,"HACKERSERIAL",getPlayerSerial(thePlayer))
		else
		setAccountData(account,"model",model)
		end
		
		
		
		
		setAccountData(account,"isExploded",getElementData(source,"isExploded") or false)

end
end
addEventHandler ( "onVehicleExit", getRootElement(), saveVehOnExit )
addEvent("saveVehOnExit",true)
addEventHandler ( "saveVehOnExit", getRootElement(), saveVehOnExit )

function saveOneVeh (veh,counter)

	account = getAccount("EpochZvehicle_number_"..counter,"23g2g23g23g23g") or false
	if not account then
		account = addAccount("EpochZvehicle_number_"..counter,"23g2g23g23g23g")
	end	
		
	local col = getElementData(veh,"parent")
	if  not getElementData(col,"NOCARSPAWN") then
		setElementData(veh,"counterV",counter,false) 
		setAccountData(account,"spawn_x",getElementData(col,"spawn")[2])
		setAccountData(account,"spawn_y",getElementData(col,"spawn")[3])
		setAccountData(account,"spawn_z",getElementData(col,"spawn")[4])
		
				
		local tableJsonData ={}
		for i, data in ipairs(vehicleDataTable) do 
			table.insert(tableJsonData,{data[1],getElementData(col,data[1])})
		end
		
		local jsonTable = toJSON(tableJsonData)
		setAccountData(account,"vehicleDatas",jsonTable)
				
				
		local model = getElementModel(veh)
		local x,y,z = getElementPosition(veh)
		local rx,ry,rz = getElementRotation(veh)
		local health = getElementHealth(veh)
		
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		setAccountData(account,"last_rx",rx)
		setAccountData(account,"last_ry",ry)
		setAccountData(account,"last_rz",rz)
		setAccountData(account,"health",health)
		setAccountData(account,"model",model)
		setAccountData(account,"isExploded",getElementData(veh,"isExploded") or false)
		
		local maxfuel =	getElementData(veh,"maxfuel") or 0
		setAccountData(account,"maxfuel",maxfuel)
		
		local needtires = getElementData(veh,"needtires") or 0 
		setAccountData(account,"needtires",needtires)
			
		local needengines= getElementData(veh,"needengines") or 0
		setAccountData(account,"needengines",needengines)
			
		local expenFuel = getElementData(veh,"expenFuel") or 0 
		setAccountData(account,"expenFuel",expenFuel)
			
		local steelList = getElementData(veh,"steelList") or 0 
		setAccountData(account,"steelList",steelList)
		
		outputChatBox("Salvo :"..counter)
		
		local vehicleManager = getAccount("vehicleManagerEpochZ","EpochZVhMngrUJ$GH")		
		setAccountData(vehicleManager,"vehicleamount",counter)
		
	end
end
addEvent("SaveVeh",true)
addEventHandler ( "SaveVeh", getRootElement(), saveOneVeh )






function saveTentOnClose (col,counterTent)


	vehicleManager = getAccount("vehicleManagerEpochZ","EpochZVhMngrUJ$GH")		
	tentAmount =  getAccountData(vehicleManager,"tentamount") or 0

	account = getAccount("EpochZtent_number_"..counterTent,"EpochZtntNmb$Uhjm") or false
	if not account then
			
		account = addAccount("EpochZtent_number_"..tostring(tentAmount+1),"EpochZtntNmb$Uhjm")
		setElementData(col,"counterT",tentAmount+1) --client
				
		setAccountData(vehicleManager,"tentamount",tentAmount+1)
			
	else
		
		setElementData(col,"counterT",counterTent) --client
			
	end	
			
	local tent = getElementData(col,"parent")
	local x,y,z = getElementPosition(tent)
	local rx,ry,rz = getElementRotation(tent)
		

	local save= getElementData(col,"save") or false
	if save then
		local savePass= getElementData(col,"pass")
		setAccountData(account,"pass",savePass or "0000")
		setAccountData(account,"save",true)
	end
		
	local bigTent= getElementData(col,"bigTent") or false
	if bigTent then
		setAccountData(account,"bigTent",true)
	end
	
	local ADMINTent= getElementData(col,"ADMINTent") or false
	if ADMINTent then
		setAccountData(account,"ADMINTent",true)
	end
	
		local PlayerNick = (getElementData(col,"PlayerNick") or "Não")
		local PlayerSerial = (getElementData(col,"PlayerSerial") or "Não")
		local MAXSlots = (getElementData(col,"MAX_Slots") or 0) 
		
	local lastLoginTime = getRealTime(  )
	setAccountData(account,"lastOpen",lastLoginTime.timestamp)
	setAccountData(account,"PlayerNick",PlayerNick)
	setAccountData(account,"PlayerSerial",PlayerSerial )
	--setAccountData(account,"MAX_Slots",MAXSlots )
	setAccountData(account,"last_x",x)
	setAccountData(account,"last_y",y)
	setAccountData(account,"last_z",z)
	setAccountData(account,"last_rx",rx)
	setAccountData(account,"last_ry",ry)
	setAccountData(account,"last_rz",rz)

			
	local tableJsonData ={}
	for i, data in ipairs(lootData) do 
		local value = getElementData(col,data[1])
		if value and value > 0 then
			table.insert(tableJsonData,{data[1],value})
		end
	end
	
	table.insert(tableJsonData,{"MAX_Slots",MAXSlots})
	
	local jsonTable = toJSON(tableJsonData)
	setAccountData(account,"tentDatas",jsonTable)
			
	outputDebugString("Save Tent: "..tostring(counterTent))
	
end

addEvent("saveTentOnClose",true)
addEventHandler ( "saveTentOnClose", getRootElement(), saveTentOnClose )





















function saveVehsOnDetatch(veh)

	counter = getElementData(veh,"counterV")


	if not counter  then return end

		
		local col = getElementData(veh,"parent")
	if  not getElementData(col,"NOCARSPAWN") then
		account = getAccount("EpochZvehicle_number_"..counter,"23g2g23g23g23g") or false
		if not account then return end	
		setElementData(veh,"counterV",counter,false) 
		setAccountData(account,"spawn_x",getElementData(col,"spawn")[2])
		setAccountData(account,"spawn_y",getElementData(col,"spawn")[3])
		setAccountData(account,"spawn_z",getElementData(col,"spawn")[4])
			
				
		local tableJsonData ={}
		for i, data in ipairs(tentDataTable) do 
			local value  = getElementData(col,data[1])
			table.insert(tableJsonData,{data[1],value})
		end
	
		for i, data in ipairs(lootData) do 
			local value = getElementData(col,data[1])
			if value and value > 0 then
				table.insert(tableJsonData,{data[1],value})
			end
		end
		
		local jsonTable = toJSON(tableJsonData)
		setAccountData(account,"vehicleDatas",jsonTable)
		
				
		local model = getElementModel(veh)
		local x,y,z = getElementPosition(veh)
		local rx,ry,rz = getElementRotation(veh)
		local health = getElementHealth(veh)
		
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		setAccountData(account,"last_rx",rx)
		setAccountData(account,"last_ry",ry)
		setAccountData(account,"last_rz",rz)
		setAccountData(account,"health",health)
		setAccountData(account,"model",model)
		setAccountData(account,"isExploded",getElementData(veh,"isExploded") or false)
		
		outputDebugString(" attached save:"..tostring(counter))
		
end
end
function reattachTrailer(theTruck)
    saveVehsOnDetatch(source)
end
 
addEventHandler("onTrailerDetach", getRootElement(), reattachTrailer)
