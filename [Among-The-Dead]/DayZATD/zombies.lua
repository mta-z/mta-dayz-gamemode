ZombiePedSkins = {13,69,105,107,108,126,127,128,152} --ALTERNATE SKIN LISTS FOR ZOMBIES (SHORTER LIST IS TEXTURED ZOMBIES ONLY)
-- 68 вояка
-- 22 док
-- 70 полицай
-- 97 вояка без каски

setElementData(getRootElement(),"zombiestotal",0)
setElementData(getRootElement(),"zombiesalive",0)
local zombieTeam = createTeam("Zombies")

itemTableZombies = {
{"Caixa de Fósforo ",328,0.4,90,5},
{"Дрова",1463,0.4,0,5},
{"Топор",339,1,90,7},
{"Пицца",1582,1,0,7},
{"Газированная Вода",2647,1,0,7},
{"Пустая Канистра",1650,1,0,5},
{"Sinal de Fogo",324,1,90,9},
{"Кола",2856,1,0,5},
{"Analgésico",2709,0.5,0,7},
{"Слезоточивый газ",343,1,0,0.5},
{"Граната",342,1,0,0.5},
{"Relôgio",2710,1,0,3},
--{"Pacote de Calor",1576,1,0,6},
{"Arame Farpado",933,0.25,0,1},
{"Колесо",1073,1,0,1},
{"Morfina",1579,1,0,2},
{"Mapa",1277,0.8,90,4},
{"GPS",2976,0.15,0,1},
{"Банка Макарон",2770,0.1,0,5},
{"Банка Бобов",2601,1,0,5},
{"Бургер",2768,1,0,2},
--{"Walkie-Talkie",2966,0.5,0,3},
{"Лом",333,1,90,0.5},
{"Бейсбольная Бита",336,1,90,0.5},
{"Мачете",337,1,90,0.5},
{"Деньги",1212,1,90,12},
}

itemTableZombieMilitaryBig = {
{"Пустая Фляга",2683,1.5,0,5}, 
{"Граната",342,1,0,1},
{"Ôculos de Visão Noturna",368,1,90,6},
{"Бинокль",369,1,0,2},
{"Ôculos de Infravermelho",369,1,90,3},
{"Walkie-Talkie",2966,1,0,4},
{"Мешки с песком",1876,1,0,2,0.100},
{"AK-107 PSO",1832,1,90,4},
{"ВСС Vintorez",1922,1,90,1},
{"M4A1",2785,1,90,2},
{"M4A1 SD",2481,1,90,1},
{"AKS-74 Kobra",1838,1,90,5},
{"AKS-74 PSO",1851,1,90,5},
{"AKS-74U",1852,1,90,5},
{"FN SCAR",1854,1,90,4},
{"G36C-SD",1861,1,90,3},
{"G36K",1863,1,90,3},
{"M240",1870,1,90,2},
{"M249 Saw",1871,1,90,2},
{"MG36",1872,1,90,2},
{"Mk 48 Mod 0",1873,1,90,1},
{"PKM",1874,1,90,1},
{"PKP",1877,1,90,1},
{"M9 SD",1881,1,90,3},
{"M1014",1905,1,90,4},
{"Saiga 12K",1911,1,90,4},
{"Mochila de Explorador 100",953,1,0,3},
{"Capacete Militar 50%",2394,1,0,7,0.7},
{"Бронежилет 20%",2020,1,90,5,0,50},
{"Большой сухой паёк",2778,1,0,4},
{"Маленький сухой паёк",1956,1,0,6},
}


itemTableZombieMilitarySmall = {
{"Пустая Фляга",2683,1.5,0,10}, 
{"Граната",342,1,0,5},
{"Ôculos de Visão Noturna",368,1,90,6},
{"Бинокль",369,1,0,5},
{"Ôculos de Infravermelho",369,1,90,5},
{"Walkie-Talkie",2966,1,0,5},
{"Мешки с песком",1876,1,0,2,0.100},
{"AK-107 PSO",1832,1,90,7},
{"M4A1",2785,1,90,3},
{"M4A1 SD",2481,1,90,2},
{"AKS-74 Kobra",1838,1,90,5},
{"AKS-74 PSO",1851,1,90,5},
{"AKS-74U",1852,1,90,5},
{"M9 SD",1881,1,90,7},
{"M1014",1905,1,90,7},
{"Saiga 12K",1911,1,90,6},
{"Бронежилет 20%",2020,1,90,7,0,50},
{"Маленький сухой паёк",1956,1,0,10},
}
itemTableZombiePolice = {
{"Бинокль",369,1,0,3},
{"Walkie-Talkie",2966,1,0,5},
{"AK-107 PSO",1832,1,90,6},
{"M4A1",2785,1,90,2},
{"AKS-74U",1852,1,90,5},
{"M1014",1905,1,90,7},
{"Бронежилет 20%",2020,1,90,4,0,50},
{"Маленький сухой паёк",1956,1,0,5},
}
itemTableZombieMedik = {
{"Kit de Primeiros Socorros",2891,0.7,0,3},
{"Ataduras",1578,0.5,0,10},
{"Bolsa de Sangue",1580,1,0,5},
{"Morfina",1579,1,0,6},
{"Analgésico",1580,1,0,7},
{"Antibiótico",1580,1,0,7},
}

function createZombieTable (player)
		setElementData(player,"spawnedzombies",0,false)
end

function createZomieForPlayer (x,y,z,zombieType)




	
	if zombieType then
	if zombieType == "zombieHospital" then
	local randomZZ= math.random(1,2)
	if randomZZ==1 then
	randomZskin = 22
	else
	local getEa= math.random ( 1, table.getn ( ZombiePedSkins ) )
	randomZskin = ZombiePedSkins[getEa]
	end
	elseif zombieType=="zombiePolice" then
	local randomZZ= math.random(1,2)
	if randomZZ==1 then
	randomZskin = 70
	else
	local getEa= math.random ( 1, table.getn ( ZombiePedSkins ) )
	randomZskin = ZombiePedSkins[getEa]
	end
	elseif zombieType=="zombieMilitary" then 
	local randomZZ= math.random(1,2)
	if randomZZ==1 then
	local randomMiZ= math.random(1,2)
	if randomMiZ==1 then
	randomZskin=68
	else
	randomZskin=97
	end
	else
	local getEa= math.random ( 1, table.getn ( ZombiePedSkins ) )
	randomZskin = ZombiePedSkins[getEa]
	end
	end
	else
	local getEa= math.random ( 1, table.getn ( ZombiePedSkins ) )
	randomZskin = ZombiePedSkins[getEa]
	end
	
			
		if gameplayVariables["playerzombies"]  > getElementData(source,"spawnedzombies") then
		
		  zombie = call (getResourceFromName("zombie"),"createZombie",x,y,z,randomZskin,source) -- !!!
		
		 
		  
		if zombie then 
		--setElementParent(zombie,aliveZombies)
		setElementData(source,"spawnedzombies",getElementData(source,"spawnedzombies")+1)
		setElementData(zombie,"blood",gameplayVariables["zombieblood"]) -- [ID:0000009 - Zombie menace] //L --client
		end
	else
 return
	end
		
	end

addEvent("createZomieForPlayer",true)
addEventHandler("createZomieForPlayer",getRootElement(),createZomieForPlayer)


function cZ( playerSource,  commandName, skin)
local isAdmin = isObjectInACLGroup("user."..getAccountName(getPlayerAccount(playerSource)),aclGetGroup("Admin"))
if isAdmin then
local x,y,z = getElementPosition(playerSource)
if skin then
zombie = call (getResourceFromName("zombie"),"createZombie",x,y,z,skin,false)
setElementData(zombie,"blood",gameplayVariables["zombieblood"]) -- [ID:0000009 - Zombie menace] //L --client
else
randomZskin = math.random ( 1, table.getn ( ZombiePedSkins ) )	
zombie = call (getResourceFromName("zombie"),"createZombie",x,y,z,ZombiePedSkins[randomZskin],false)
setElementData(zombie,"blood",gameplayVariables["zombieblood"]) -- [ID:0000009 - Zombie menace] //L --client
end
end
end
addCommandHandler ( "cZ", cZ )






function destroyDeadZombie (ped,pedCol)
	destroyElement(ped)
	destroyElement(pedCol)
end

function zombieKilled (killer,headshot)
--outputChatBox("Server: destroyed zombie (reason: zombie died)")
	if killer then
	
	--[[
	local playerExp = getElementData(killer,"playerexp") or 0
		if playerExp > 0 then 
		local addExp = 30
		
		local killerGroup = getElementData(killer,"group",false) or false
		if killerGroup then
		local killerGroupStatus = getElementData(killer,"groupUserStatus",false) or false
		if killerGroupStatus and killerGroupStatus~="BEGGINER" then
		local profit = getElementData(killer,"groupProfit",false) or false
		if profit then
		local SKILL_EXP = getElementData(killer,"SKILL_EXP") or false
		if SKILL_EXP and SKILL_EXP>=1 then
		addExp=15+math.floor(addExp/100*(SKILL_EXP*5))
		else
		addExp=15
		end
		setElementData(killer,"groupProfit",profit+(30-addExp))
		end
		end
		end
		
		setElementData(killer,"playerexp",playerExp+addExp) --client
		end
		]]
		
		setElementData(killer,"zombieskilled",getElementData(killer,"zombieskilled")+1) --client
	end	
	
	
	
		local x,y,z = getElementPosition(source)
		 playerLoot = getElementData(source,"playerLoot") or false
		if playerLoot then
		 pedCol = playerLoot
		else
		 pedCol = createColSphere(x,y,z,1.5)
		end
		
		setElementParent(pedCol,deadZombies)
		--setElementParent(pedCol,source)
		
			if headshot == true then
		--outputChatBox("в голову z")
		setPedHeadless(source,true)
			setElementData(killer,"headshots",getElementData(killer,"headshots")+1) --client
		end	
	killPed(source)
	if getElementData(source,"zombiePlayer") then
	setTimer(destroyDeadZombie,3600000,1,source,pedCol)
	else
	setTimer(destroyDeadZombie,120000,1,source,pedCol)
	end
		
		attachElements (pedCol,source,0,0,0)
		setElementData(pedCol,"parent",source) --client
		pname = getElementData(pedCol,"playername") --client
		if not pname then
		setElementData(pedCol,"playername","Zombie") --client
		end
		
		setElementData(pedCol,"deadman",true) --client
		setElementData(source,"deadzombie",true) --client
		local time = getRealTime()
		local hours = time.hour
		local minutes = time.minute
		local rand= math.random(1,15)
		if rand ==1 then
		setElementData(pedCol,"zombieR",true) --client
		end
		 
		setElementData(pedCol,"deadreason","Похоже он мертв. Расчетное время смерти: "..hours..":"..minutes.."") --client
	-- 68 вояка
-- 22 док
-- 70 полицай
-- 97 вояка без каски	
		if not playerLoot then
		local zSkin = getElementModel(source)
if tonumber(zSkin) ~= 68 and tonumber(zSkin) ~= 22 and  tonumber(zSkin) ~= 70 and tonumber(zSkin) ~= 97    then
		for i, item in ipairs(itemTableZombies) do
			local value =  math.percentChance (item[5]/2.5)	
			if value > 0 then
				setElementData(pedCol,item[1],value) --client	
			end
			
		if (item[1] == "Деньги") then
			local rand = math.random(1,2)	
			if rand ==2 then
				setElementData(pedCol,item[1],math.random(0,100)) --client
			end
		end 
			--weapon Ammo
		local ammoData,weapID,modelID,AmmoKol = getWeaponAmmoType (item[1],true)
			if ammoData and value > 0 then
				setElementData(pedCol,ammoData,AmmoKol) --client
			end
		end
end	
if tonumber(zSkin) == 68 then

	for i, item in ipairs(itemTableZombieMilitaryBig) do
		local value =  math.percentChance (item[5]/2)	
		if value > 0 then
			setElementData(pedCol,item[1],value) --client	
		end
			--weapon Ammo
		local ammoData,weapID,modelID,AmmoKol = getWeaponAmmoType (item[1],true)
		if ammoData and value > 0 then
				setElementData(pedCol,ammoData,AmmoKol) --client
		end
	end
			
end			


if tonumber(zSkin) == 97 then

	for i, item in ipairs(itemTableZombieMilitarySmall) do
		local value =  math.percentChance (item[5]/2)	
		if value > 0 then
			setElementData(pedCol,item[1],value) --client	
		end
			--weapon Ammo
		local ammoData,weapID,modelID,AmmoKol = getWeaponAmmoType (item[1],true)
		if ammoData and value > 0 then
			setElementData(pedCol,ammoData,AmmoKol) --client
		end
	end
	
end	

if tonumber(zSkin) == 70 then

	for i, item in ipairs(itemTableZombiePolice) do
		local value =  math.percentChance (item[5]/2)
		if value > 0 then
			setElementData(pedCol,item[1],value) --client	
		end
			--weapon Ammo
		local ammoData,weapID,modelID,AmmoKol = getWeaponAmmoType (item[1],true)
			if ammoData and value > 0 then
				setElementData(pedCol,ammoData,AmmoKol) --client
			end
	end
	
end	

if tonumber(zSkin) == 22 then

		for i, item in ipairs(itemTableZombieMedik) do
			local value =  math.percentChance (item[5]/2)	
			if value > 0 then
				setElementData(pedCol,item[1],value) --client	 
			end
			--weapon Ammo
			local ammoData,weapID,modelID,AmmoKol = getWeaponAmmoType (item[1],true)
			if ammoData and value > 0 then
				setElementData(pedCol,ammoData,AmmoKol) --client
			end
		end
		
end	
			
end

		triggerEvent("zomb_Destroy",source,source)
end
addEvent("onZombieGetsKilled",true)
addEventHandler("onZombieGetsKilled",getRootElement(),zombieKilled)