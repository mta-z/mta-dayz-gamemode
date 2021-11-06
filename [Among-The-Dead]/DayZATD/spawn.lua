


local spawnPlayerDataTable = {

{"alivetime"},
{"skin"},
{"MAX_Slots"},
{"bandit"},
{"blood"},
{"food"},
{"thirst"},
{"clotType_1"},
{"clotType_2"},
{"currentweapon_1"},
{"currentweapon_2"},
{"currentweapon_3"},
{"bleeding"},
{"brokenbone"},
{"pain"},
{"infection"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},

}


local murdersSkinTable={
{"Одежда: Бандит 1ур",275},
{"Одежда: Бандит 2ур",274},
{"Одежда: Бандит 3ур",264},
{"Одежда: Бандит 4ур",262},
{"Одежда: Бандит 5ур",261},
{"Одежда: Герой",260},
}

local spawnPositions = {
{-2294.669921875,2252.1245117188,4.984375},
{-1481.4318847656,2617.986328125,58.787948608398},
{-216.92144775391,2730.1293945313,62.6875},
{2452.5461425781,1276.5187988281,10.8203125},
{2318.6135253906,46.717937469482,26.484008789063},
{1421.5928955078,350.49853515625,18.84375},
{251.78479003906,-57.150386810303,1.5703125},
{754.81744384766,-583.47735595703,17.328125},
{-2113.17578125,-2407.6140136719,31.302749633789},
{-2489.0092773438,92.766975402832,25.6171875},
{-2446.3566894531,944.14764404297,45.420341491699},
{715.36358642578,-1634.6197509766,2.4296875},
{1236.0673828125,-1090.5991210938,25.812145233154},
}

 local spawnPositionsLS = {
{247.06362915039,-1464.7375488281,23.72804069519},
{1137.9561767578,-1025.4813232422,31.890625},
{2348.7583007813,-1266.3508300781,22.511291503906},
{2006.8958740234,-2127.1403808594,13.546875},
{1422.8638916016,-1498.3715820313,20.430801391602},


}
local spawnPositionsLSt ={
{259.87124633789,-155.91491699219,5.0786113739014},
{657.83770751953,-628.48895263672,16.3359375},
{2237.8232421875,-42.766250610352,26.482070922852},
{1252.8126220703,-424.07275390625,2.5861835479736},
{2034.6301269531,-526.58221435547,79.294593811035},
{-76.228912353516,-1110.9442138672,1.078125},
{2861.9914550781,-713.01019287109,10.998739242554},

}

local spawnPositionsLV ={
{1280.3142089844,2208.0007324219,10.091330528259},
{2860.3986816406,897.48217773438,10.757797241211},
{2000.5731201172,1527.88671875,14.622252464294},
{1762.1490478516,2112.0512695313,10.869167327881},
{1100.3266601563,1447.4246826172,5.8203125},

}

local spawnPositionsLVt ={
{-1436.4227294922,2177.4658203125,50.105354309082},
{-583.72833251953,2616.1948242188,53.515625},
{-730.13153076172,1553.4851074219,39.851905822754},
{-222.83639526367,1070.7874755859,19.7421875},
{-332.27209472656,1177.2219238281,20.08602142334},
{192.29342651367,1391.7017822266,10.5859375},
{675.74719238281,2697.5883789063,59.609451293945},


}

local spawnPositionsSF = {
{-2672.0285644531,1437.3787841797,7.1015625},
{-2803.2255859375,-358.57473754883,7.0853719711304},
{-2866.9641113281,912.02703857422,43.921234130859},
{-1888.2065429688,1449.5307617188,7.1813373565674},
{-2317.8728027344,255.73809814453,35.3203125},


}

local spawnPositionsSFt ={
{-2449.5549316406,-646.30816650391,133.00025939941},
{-1052.009765625,-609.07092285156,32.0078125},
{-920.10992431641,-1458.9539794922,124.26876831055},
{-1307.8572998047,-1685.296875,45.984878540039},
{-588.52423095703,-1041.3714599609,23.315355300903},
{-2204.3134765625,-2340.78515625,30.625},
{-2083.78515625,-2338.8701171875,30.625},
{-2849.8325195313,-1802.2618408203,36.913944244385},

}

function spawnDayZPlayer(player,location,unbug)



if unbug then
exports.logger:setLog("( Account:"..getAccountName ( getPlayerAccount ( player ) ).." Serial:"..getPlayerSerial ( player ).." IP:"..getPlayerIP ( player ).." ) "..getPlayerName(player).." function: spawnDayZPlayer type: unbug","log")	
end

	if location then
if location == "spawnPositionsLS" or  location ==1 then
	locTable = spawnPositionsLS
	elseif location == "spawnPositionsLSt" or  location ==2 then 
	locTable = spawnPositionsLSt
		elseif location == "spawnPositionsLV" or  location ==3 then 
	locTable = spawnPositionsLV
			elseif location == "spawnPositionsLVt"  or  location ==4 then 
	locTable = spawnPositionsLVt
				elseif location == "spawnPositionsSF" or  location ==5 then 
	locTable = spawnPositionsSF
					elseif location == "spawnPositionsSFt" or  location ==6 then 
	locTable = spawnPositionsSFt
	else
	locTable = spawnPositions

end	
	local number = math.random(table.size(locTable))
	 x,y,z = locTable[number][1],locTable[number][2],locTable[number][3]
	else
	local number = math.random(table.size(spawnPositions))
	 x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	end	

	if unbug then
		local skin = getElementModel(player)
		spawnPlayer (player, x,y,z+0.1, math.random(0,360), skin or 279, 0, 0)
		return
	end
	spawnPlayer (player, x,y,z+0.1, math.random(0,360), 279, 0, 0)
	setElementAlpha(player,255)
	local playerCol = createColSphere(x,y,z,1.5)
		setElementData(player,"playerCol",playerCol,false)
		attachElements ( playerCol, player, 0, 0, 0 )
		setElementData(playerCol,"parent",player) --client
		setElementData(playerCol,"player",true) --client
		local account = getPlayerAccount(player)
		setAccountData(account,"isDead",false)
		setElementData(player,"isDead",false) --client
		setElementData(player,"logedin",true) --client
	
	setElementParent(playerCol,player)
	
	local playerLvl = getElementData(player,"playerlvl") or 0
	local progressAttacker = getElementData(player,"progress.attacker") or 0
	local progressMedik = getElementData(player,"progress.medik") or 0
	local progressSniper = getElementData(player,"progress.sniper") or 0
	local progressEnginer = getElementData(player,"progress.enginer") or 0
	local progressDjagernaut = getElementData(player,"progress.djagernaut") or 0
	local progressBoec = getElementData(player,"progress.boec") or 0
	--[[
	
	if data[1] =="Ataduras" then
			setElementData(player,data[1],2)	--client
		elseif data[1] =="Analgésico" then
			setElementData(player,data[1],1)	--client	
		elseif data[1] =="MAX_Slots" then 
			setElementData(player,data[1],15)--client
		elseif data[1] =="Coca-Cola" then
			setElementData(player,data[1],1) --client}
		elseif data[1] =="Antibiótico" then
			setElementData(player,data[1],1) --client
		elseif data[1] =="Morfina" then
			setElementData(player,data[1],1) --client
		elseif data[1] =="Lata de Feijão" then
			setElementData(player,data[1],1)	 --client	
		elseif data[1] =="Mapa" then
			setElementData(player,data[1],1)	--client
		elseif data[1] =="M1911" then
		if playerLvl>=0 and playerLvl<=30 then
			setElementData(player,data[1],1) --client
		else
			setElementData(player,data[1],0) --client
		end
		elseif data[1] =="M1911 mag" then
		if playerLvl>=0 and playerLvl<=30 then
			setElementData(player,data[1],20) --client	
		else
			setElementData(player,data[1],0) --client	
		end	
		elseif data[1] =="Kit de Primeiros Socorros" then
		if progressMedik>=90 then
			setElementData(player,data[1],1)	--client
		else
			setElementData(player,data[1],0)	--client
		end	
		elseif data[1] =="Machado" then
		if progressAttacker>=100 then
			setElementData(player,data[1],1)	--client
			setElementData(player,"Machete",0)	 --client
		else
			setElementData(player,data[1],0)	--client
			setElementData(player,"Machete",1)	 --client
		end		
	]]
	--Player Items on Start
	for i,data in ipairs(spawnPlayerDataTable) do
		
		if data[1] =="skin" then

			setElementData(player,data[1],279 ) --client
			
		elseif data[1] =="blood" then
		
		local blood = math.random(10000,12000+((progressMedik*60)+(progressBoec*20))) or 12000
			setElementData(player,data[1],blood) --client		

		elseif data[1] =="brokenbone" then
			setElementData(player,data[1],false)	 --client
			
		elseif data[1] =="pain" then
			setElementData(player,data[1],false) --client
			
		elseif data[1] =="MAX_Slots" then 
			setElementData(player,data[1],15)--client
			
		elseif data[1] =="infection" then
			setElementData(player,data[1],false) --client
			
		elseif data[1] =="food" then
			setElementData(player,data[1],100) --client
			
		elseif data[1] =="thirst" then
			setElementData(player,data[1],100) --client 	
		
		elseif data[1] =="bandit" then
			setElementData(player,data[1],false)	--client
			
		elseif data[1] =="humanity" then
			setElementData(player,data[1],2500)	--client	
			
		else
			setElementData(player,data[1],0)--client
		end		
	end
	for i,data in ipairs(murdersSkinTable) do
	removeElementData ( player, data[1] ) 
	end
	
	for i,data in ipairs(lootData) do
	removeElementData ( player, data[1] ) 
	
		if data[1] =="Ataduras" then
			setElementData(player,data[1],2)	--client
			
		elseif data[1] =="Analgésico" then
			setElementData(player,data[1],1)	--client	
		
		elseif data[1] =="Coca-Cola" then
			setElementData(player,data[1],1) --client}
			
		elseif data[1] =="Antibiótico" then
			setElementData(player,data[1],1) --client
			
		elseif data[1] =="Morfina" then
			setElementData(player,data[1],1) --client
			
		elseif data[1] =="Lata de Feijão" then
			setElementData(player,data[1],1)	 --client
			
		elseif data[1] =="Mapa" then
			setElementData(player,data[1],1)	--client
			
		elseif data[1] =="M1911" then
		
		if playerLvl>=0 and playerLvl<=30 then
			setElementData(player,data[1],1) --client
		else
			setElementData(player,data[1],0) --client
		end
		
		elseif data[1] =="M1911 mag" then
		
		if playerLvl>=0 and playerLvl<=30 then
			setElementData(player,data[1],20) --client	
		else
			setElementData(player,data[1],0) --client	
		end	
		
		elseif data[1] =="Kit de Primeiros Socorros" then
		
		if progressMedik>=90 then
			setElementData(player,data[1],1)	--client
		else
			setElementData(player,data[1],0)	--client
		end	
		
		elseif data[1] =="Machado" then
		
		if progressAttacker>=100 then
			setElementData(player,data[1],1)	--client
			setElementData(player,"Machete",0)	 --client
		else
			setElementData(player,data[1],0)	--client
			setElementData(player,"Machete",1)	 --client
		end	
		
		end
	end
	
	fadeCamera(player,true)
	setCameraTarget (player, player)
	----------------------------------
end

addEvent("spawnATDPlayer",true)
addEventHandler("spawnATDPlayer",getRootElement(),spawnDayZPlayer)




function notifyAboutExplosion2()
if  getVehicleOccupants(source) then
	for i,player in pairs(getVehicleOccupants(source)) do
	
	if not getElementData(player,"isDead") == true then
		triggerEvent("kilLDayZPlayer",player)
		setElementData(player,"isDead",true) --server
	end
end
end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion2)

function destroyDeadPlayer (ped,pedCol)
	destroyElement(ped)
	destroyElement(pedCol)
end 






function setPedStats()
local acc = getPlayerAccount(source)


-- получаем стаатистику на время смерти
	local murders = getElementData(source,'murders')
	local zombieskilled = getElementData(source,'zombieskilled')
	local banditskilled = getElementData(source,'banditskilled') 
	local alivetime = getElementData(source,"alivetime")

-- статистика игрока за все время	
	local accMurders = getElementData ( source, "stat.murders") or 0
	local accZombieskilled = getElementData ( source, "stat.zombieskilled") or 0
	local accBanditskilled = getElementData ( source, "stat.banditskilled") or 0
	local accAlivetime = getElementData ( source, "stat.alivetime") or 0	
	
	
	setElementData ( source, "stat.murders",accMurders + murders)
	setElementData ( source, "stat.zombieskilled", accZombieskilled + zombieskilled )
	setElementData ( source, "stat.banditskilled", accBanditskilled + banditskilled )
	setElementData ( source, "stat.alivetime", accAlivetime + alivetime )
	



-- максимально достигнутая статистика игрока 
		local accMurdersMax = getElementData ( source, "stat.murdersMax") or 0
	local accZombieskilledMax = getElementData ( source, "stat.zombieskilledMax") or 0
	local accBanditskilledMax = getElementData ( source, "stat.banditskilledMax") or 0
	local accAlivetimeMax = getElementData ( source, "stat.alivetimeMax") or 0	
	
	if murders >accMurdersMax then setElementData ( source, "stat.murdersMax",murders) end
	
	if zombieskilled> accZombieskilledMax then setElementData ( source, "stat.zombieskilledMax",zombieskilled) end
	if banditskilled> accBanditskilledMax then setElementData ( source, "stat.banditskilledMax",banditskilled) end
	if alivetime> accAlivetimeMax then setElementData ( source, "stat.alivetimeMax",alivetime) end

	
	
	
-- запись общей статистики игроков за все время 

local USERnick = getPlayerName (source)

statMaganer = getAccount("statMaganer","3g223g23g2")
	if ( not statMaganer ) then  
	addAccount("statMaganer","3g223g23g2")
statMaganer = getAccount("statMaganer","3g223g23g2")	
	setAccountData ( statMaganer, "allstats.murders" ,  0 )
	setAccountData ( statMaganer, "allstats.zombieskilled" ,  0)
	setAccountData ( statMaganer, "allstats.banditskilled" ,  0)
	setAccountData ( statMaganer, "allstats.bandits" ,  0 )
	setAccountData ( statMaganer, "allstats.alivetime" ,  0 )
	
	
	setAccountData ( statMaganer, "allstats.murdersMAX" ,  0 )
	setAccountData ( statMaganer, "allstats.zombieskilledMAX" ,  0)
	setAccountData ( statMaganer, "allstats.banditskilledMAX" ,  0)
	setAccountData ( statMaganer, "allstats.alivetimeMAX" ,  0 )
	end
	 
	local allmur =  getAccountData(statMaganer,'allstats.murders') or 0
	local allbandit =  getAccountData(statMaganer,'allstats.bandits') or 0
	local allzk=  getAccountData(statMaganer,'allstats.zombieskilled') or 0
	local allbk =  getAccountData(statMaganer,'allstats.banditskilled') or 0
	local allat =  getAccountData(statMaganer,'allstats.alivetime') or 0
		
	local murdersMAX = getAccountData(statMaganer,'allstats.murdersMAX') or 0 
	local zombieskilledMAX = getAccountData(statMaganer,'allstats.zombieskilledMAX') or 0 
	local banditskilledMAX = getAccountData(statMaganer,'allstats.banditskilledMAX') or 0 
	local alivetimeMAX = getAccountData(statMaganer,'allstats.alivetimeMAX') or 0

	if murders>murdersMAX then 
	setAccountData ( statMaganer, "allstats.murdersMAX",murders)
	setAccountData ( statMaganer, "allstats.murdersMAXNICK",tostring(USERnick))
	end
	if zombieskilled>zombieskilledMAX then 
	setAccountData ( statMaganer, "allstats.zombieskilledMAX",zombieskilled)
	setAccountData ( statMaganer, "allstats.zombieskilledMAXNICK",tostring(USERnick))
	end 
	if banditskilled>banditskilledMAX then 
	setAccountData ( statMaganer, "allstats.banditskilledMAX",banditskilled)
setAccountData ( statMaganer, "allstats.banditskilledMAXNICK",tostring(USERnick))	
	end
	if alivetime>alivetimeMAX then 
	setAccountData ( statMaganer, "allstats.alivetimeMAX",alivetime) 
	setAccountData ( statMaganer, "allstats.alivetimeMAXNICK",tostring(USERnick)) 
	end	
	   	
		
	   
	   

	
	 
	 

	 
	 setAccountData ( statMaganer, "allstats.murders" ,  allmur+murders )
	 setAccountData ( statMaganer, "allstats.zombieskilled" ,  allzk+zombieskilled )
	 setAccountData ( statMaganer, "allstats.banditskilled" ,  allbk+banditskilled )
	 local userbandit = getElementData(source,"bandit")
	 if userbandit then 
	  setAccountData ( statMaganer, "allstats.bandits" ,  allbandit+1 )
	else
	setAccountData ( statMaganer, "allstats.bandits" ,  allbandit+0 ) 
	end
	 setAccountData ( statMaganer, "allstats.alivetime" ,  allat+alivetime )
	 
-- конец общей статистики
	
	
end
 


lastKillPlayer = false
lastKillPlayerTime = false

function kilLDayZPlayer (killer,headshot,weapon,botName,botWeapon,zoneName)







pedCol = false
local account = getPlayerAccount(source)
--if getElementData(source,"isInEvent") then removePlayerEvent(source) return end




 
	 
	 
	 











if not account then return end

local timeAlive = getElementData(source,"alivetime") or 0 
if killer then
exports.logger:setLog("( Account:"..getAccountName ( getPlayerAccount ( source ) ).." Serial:"..getPlayerSerial ( source ).." IP:"..getPlayerIP ( source ).." ) "..getPlayerName(source).." function: kilLDayZPlayer killer:"..getPlayerName (killer).." killer serial: "..getPlayerSerial (killer).." aliveTime: "..timeAlive.."","log")	
else
exports.logger:setLog("( Account:"..getAccountName ( getPlayerAccount ( source ) ).." Serial:"..getPlayerSerial ( source ).." IP:"..getPlayerIP ( source ).." ) "..getPlayerName(source).." function: kilLDayZPlayer killer: none aliveTime: "..timeAlive.."","log")
end
local  x,y,z = getElementPosition(source)

	
	triggerClientEvent(source,"hideInventoryManual",source)
	

	setPedStats()
	setElementData(source,"backPackUsed",false)
	setElementData(source,"inArena",false)
	setElementData(source,"weaponSwith",false)
	setElementData(source,"GPSpharos",false)
	
	setTimer(setElementPosition,500,1,source,6000,6000,0) -- зачем это? чтобы труп можно было лутать после смерти сразу
	setAccountData(account,"isDead",true)
	setElementData(source,"isDead",true) --client
	destroyElement(getElementData(source,"playerCol"))
	triggerClientEvent (source, "showSpawner",source,x,y,z,killer)

	
	
	
	if getElementData(source,"alivetime") > 1 then 
	
	if lastKillPlayer and lastKillPlayer==source then
	--outputChatBox("lastKillPlayer==source")
		local realTick = getTickCount ()
		if lastKillPlayerTime then
			local ticks = realTick-lastKillPlayerTime
			if ticks<60000 then -- 1 минута не прошла и последний убитый = тот же человек = отменить
				outputDebugString("abort player kill "..getPlayerName(source).." left: "..ticks.."ms")
				
				lastKillPlayerTime = getTickCount ()
				lastKillPlayer = source
				--outputChatBox("abortPlayerKill ticks: "..ticks)
				return
			end
		end
	end
	lastKillPlayerTime = getTickCount ()
	lastKillPlayer = source
	
	
	
	setElementAlpha(source,0)

	if not isElementInWater(source) then
	--local x,y,z = getElementPosition(source)
killPed(source)
	if getDistanceBetweenPoints3D (x,y,z,6000,6000,0) > 200 then
		--local x,y,z = getElementPosition(source)
		local rotX,rotY,rotZ = getElementRotation(source)
		local skin = getElementModel(source)
		
		local pedCol = createColSphere(x,y,z,1.5)
	
		if pedCol then
		--outputChatBox("Coca-ColaПС ТРУПА СОЗДАН")
		for i,data in ipairs(murdersSkinTable) do
			removeElementData ( source, data[1] ) 
		end
	
		for i,data in ipairs(lootData) do
			local plusData = getElementData(source,data[1]) or 0
			if plusData>0 then
				setElementData(pedCol,data[1],plusData) --client
			end
		end
		--Skin
		local skinID = getElementData(source,"skin")
		local skin = getSkinNameFromID(skinID) or 279
		setElementData(pedCol,skin,1) --client
	end
	
		takeAllWeapons ( source )
		--killPed(ped)
		if killer then
	--	local kx,ky,kz = getElementPosition(killer)
		pdistance = 500 -- 500 = не создавать зомби после убийства
		else
		pdistance = 500
		end
		if headshot or pdistance > 60 then
		local ped = createPed(skin,x,y,z+.05,rotZ)
	--	setTimer(function() setElementFrozen ( ped, true ) end,1500,1)
		if headshot then
		setPedHeadless(ped,true)
		end
		killPed(ped)	
		attachElements (pedCol,ped,0,0,0)
		setElementData(pedCol,"parent",ped) --client
		setElementData(pedCol,"playername",getPlayerName(source)) --client
		setElementData(pedCol,"deadman",true) --client
		setElementData(pedCol,"MAX_Slots",getElementData(source,"MAX_Slots")) --client
		
		setElementParent(ped,deadPlayers)
		setElementParent(pedCol,ped)
		
		local time = getRealTime()
		local hours = time.hour
		local minutes = time.minute
		setElementData(pedCol,"deadreason",getPlayerName(source)..": Был убит : "..(weapon or "Unknown")..". Время смерти: "..hours..":"..minutes.." часов.")--client
		
		setTimer(destroyDeadPlayer,3600000,1,ped,pedCol)
		else
		if pdistance < 60 then
	local playerZomb = call (getResourceFromName("zombie"),"createZombiePlayer",x,y,z,rotX,rotY,rotZ,skin,pedCol,source)
	setElementData(playerZomb,"blood",gameplayVariables["zombieblood"])
		end
		end
	
		
	end	
	end
	
		if killer then
		

		
		
		if not getElementData(source,"bandit") then
		local huma = math.random(-2500,-1000)
			addPlayerStats (killer,"humanity",huma)
			triggerClientEvent (killer, "drawingAlphaText",killer,killer,"Карма: "..huma.."",200,0,0,"down",false,true)
		else
		local playerExp = getElementData(killer,"playerexp") or 0
		if playerExp > 0 then 
			local murderExpAdd = 100
		
		local playerExp = getElementData(killer,"playerexp") or 1
		
		local killerGroup = getElementData(killer,"group",false) or false
		if killerGroup then
			
				local profit = getElementData(killer,"groupProfit",false) or false
				if profit then
				
					local groupExpAdd = (murderExpAdd/100*50)
					murderExpAdd = murderExpAdd - groupExpAdd
				
					local SKILL_EXP = getElementData(killer,"SKILL_EXP") or false
					if SKILL_EXP and SKILL_EXP>=1 then
						
						groupExpAdd = groupExpAdd+math.floor(groupExpAdd/100*(SKILL_EXP*3))
					end
					setElementData(killer,"groupProfit",profit+groupExpAdd)
				
					
					triggerClientEvent ( killer,"drawingAlphaText",killer,killer,"Опыт группы: +"..groupExpAdd,200,200,200,"down",false,true)
				end
			
		end
		
		setElementData(killer,"playerexp",playerExp+murderExpAdd) --client
		
			triggerClientEvent ( killer,"drawingAlphaText",killer,killer,"Опыт: +"..murderExpAdd,200,200,200,"up",false,true)
		
		end
		local huma = math.random(1000,2500)
			addPlayerStats (killer,"humanity",huma)
			triggerClientEvent ( killer,"drawingAlphaText",killer,killer,"Карма: +"..huma.."",200,0,0,"down",false,true)
		end
		setElementData(killer,"murders",getElementData(killer,"murders")+1) --client
		if getElementData(killer,"humanity") < 0 then
			setElementData(killer,"bandit",true) --client
		end
		if getElementData(source,"bandit") == true then
			setElementData(killer,"banditskilled",getElementData(killer,"banditskilled")+1) --client
		end
		if headshot == true then
			setElementData(killer,"headshots",getElementData(killer,"headshots")+1) --client
		end
		end
		
		
			
			if headshot then 
		headshot ='в голову'
		else
		headshot =false
		end
		
		if (killer and weapon) then
		killer="игроком #FF0000"..getPlayerName (killer).."#FFFFFF"
		else
		killer=false
		end
				if weapon ~= nil and weapon ~= false then
		weapon = "c помощью: #FFFF00".. weapon or ""
		end
		 
		triggerClientEvent ("onRollMessageStart", getRootElement(),"#FF0000"..getPlayerName(source).." #FFFFFF был убит "..(killer or botName or "").." "..(headshot or "").." "..(weapon or botWeapon or "").." #FFFFFF"..(zoneName or ""),0,22,255, "died")
		
		
		else
		killPed(source)
	

end
		--SetElementDatas

		

end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),kilLDayZPlayer)
