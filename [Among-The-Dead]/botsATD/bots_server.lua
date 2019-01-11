
function pathHit ( hitElement, matchingDimension )
if getElementData(source,"bot") then
	if getElementType (hitElement) == "player" then
	local bot = getElementData(source,"botParentCOL")

	triggerClientEvent ( "botStart", bot,hitElement )
	end
	end
	
end
addEventHandler ( "onColShapeHit", getRootElement(), pathHit )

function pathLeave( leaveElement, matchingDimension )
if getElementData(source,"bot") then
	if getElementType (leaveElement) == "player" then
	local bot = getElementData(source,"botParentCOL")
	checkCol(bot)
	end
	end
	
end
addEventHandler ( "onColShapeLeave", getRootElement(), pathLeave )



function checkCol(bot)

if bot or source then
 botCol = getElementData(bot or source,"botParentCOL") or false
 if isElement(botCol) then
 players = getElementsWithinColShape ( botCol, "player")

local tableSize = table.maxn(players)
if tableSize>0 then
for theKey,thePlayer in ipairs(players) do
	triggerClientEvent ( "botStart", bot or source,thePlayer )
	break
end
else
local patrol = getElementData( bot or source,"patrol") or false
triggerClientEvent ( "botStopFire", bot or source,false,true,true,patrol ) 
end
end
end
end
addEvent("checkCol",true)		
addEventHandler( "checkCol", getRootElement(), checkCol )


function playerdeath( ammo, attacker, weapon, bodypart )

	local peds = getElementsByType ( "ped" )
	for theKey,thePed in ipairs(peds) do
		if (getElementData (thePed, "bot") == true) then
			if (getElementData ( thePed, "attackPlayer" ) ==  source ) then

		setTimer(triggerEvent,1000,1,"checkCol",thePed,thePed)
		break
			end

		end
	end
end
addEventHandler("onPlayerWasted", getRootElement(), playerdeath)

local botLoot={

{"Бинты",10},
{"Аптечка",5},
{"Антибиотики",5},
{"Обезболивающее",5},
{"Морфий",7},
{"Бронежилет 20%",2},
{"Пустая Фляга",10}, 
{"Рюкзак ШТУРМОВОЙ 40",5},
{"Рюкзак АБРИС 60",5},
{"Прибор Ночного Виденья",10},
{"Инфракрасное Виденье",10},
{"Карта",10},
{"Спички",10},
{"Часы",10},
{"Навигатор",10},
{"Инструменты",10},
{"Рация",10}
}
function botDead(bot,killer)
local botCol = getElementData(bot,"botParentCOL")
destroyElement(botCol)
triggerClientEvent ( "botDeadClient", bot,bot )


--[[
	if killer then
	
	local playerExp = getElementData(killer,"playerexp") or 0
		if playerExp > 0 then 
		addExp=50
		local killerGroup = getElementData(killer,"group",false) or false
		if killerGroup then
		local killerGroupStatus = getElementData(killer,"groupUserStatus",false) or false
		if killerGroupStatus and killerGroupStatus~="BEGGINER" then
		local profit = getElementData(killer,"groupProfit",false) or false
		if profit then
		local SKILL_EXP = getElementData(killer,"SKILL_EXP") or false
		if SKILL_EXP and SKILL_EXP>=1 then
		addExp=25+math.floor(addExp/100*(SKILL_EXP*5))
		else
		addExp=25
		end
		setElementData(killer,"groupProfit",profit+(50-addExp))
		end
		end
		end
		
		setElementData(killer,"playerexp",playerExp+addExp) --client
		end
		
	end	
	
	]]
	takeAllWeapons ( bot )
	
	
		local x,y,z = getElementPosition(source or bot)
		 playerLoot = getElementData(source or bot,"playerLoot") or false
		if playerLoot then
		 pedCol = playerLoot
		else
		 pedCol = createColSphere(x,y,z,1.5)
		end
		
		
	killPed(source or bot)
	if getElementData(source or bot,"bot") then
	setTimer(destroyDeadBot,3600000,1,source or bot,pedCol)
	else
	setTimer(destroyDeadBot,3600000,1,source or bot,pedCol)
	end
		
		attachElements (pedCol,source or bot,0,0,0)
		setElementData(pedCol,"parent",source or bot) --client
		pname = getElementData(pedCol,"playername") --client
		if not pname then
		local pedName = getElementData(source or bot,"pedName",false) or "Бот"
		setElementData(pedCol,"playername",pedName) --client
		end
		
		setElementData(pedCol,"deadman",true) --client
		setElementData(source or bot,"deadbot",true) --client
		local time = getRealTime()
		local hours = time.hour
		local minutes = time.minute
		 
		setElementData(pedCol,"deadreason","Похоже он мертв. Расчетное время смерти: "..hours..":"..minutes.."") --client
		
		
		
		for _,items in ipairs(botLoot) do
		local lootRand = math.random(0,3)
		setElementData(pedCol,items[1],lootRand)
		end
		
		local weaponId= getWeaponIDFromName ( getElementData(bot,"weaponName" or "m4"))

		if weaponId==34 then
		setElementData(pedCol,"DMR",1)
		setElementData(pedCol,"DMR mag",20)
		elseif weaponId==30 then
		setElementData(pedCol,"G36C-SD",1)
		setElementData(pedCol,"G36 mag",50)
		elseif weaponId==31 then
		setElementData(pedCol,"MG36",1)
		setElementData(pedCol,"MG36 mag",100)
		end
		
		local botAttWeapon = getElementData(source or bot,"botAttWeapon")
if botAttWeapon then
detachElementFromBone(botAttWeapon)
	destroyElement(botAttWeapon)
end
end
addEvent( "botDead", true )
addEventHandler( "botDead", getRootElement(), botDead )


function destroyDeadBot (ped,pedCol)
local startPos = getElementData(ped,"startPos")
local patrol = getElementData(ped,"patrol") or false
local skin = getElementModel(ped)
local weaponId= getWeaponIDFromName ( getElementData(ped,"weaponName" or "m4"))
--outputChatBox(weaponId..":"..weaponId)
if weaponId==34 then
weaponModel =1918
elseif weaponId==30 then
weaponModel =1861
elseif weaponId==31 then
weaponModel =1872
end
local pedName = getElementData(ped,"pedName",false) or "Бот"

createBot (startPos,patrol, skin,weaponId,pedName )

	destroyElement(ped)
	destroyElement(pedCol)
	
end

function giveBotWeapon()
weaponId= getWeaponIDFromName ( getElementData(source,"weaponName" or "m4"))
giveWeapon(source, weaponId, 99999, true)
end
addEvent( "giveBotWeapon", true )
addEventHandler( "giveBotWeapon", getRootElement(), giveBotWeapon )

function BotTakeAllWeapon()
takeAllWeapons ( source )
end
addEvent( "BotTakeAllWeapon", true )
addEventHandler( "BotTakeAllWeapon", getRootElement(), BotTakeAllWeapon )




--EXPORTED FUNCTIONS!!!!!!!!!!!!!!
function createBot (startPos,patrol, skin,weaponId,pedName,botType )
	----outputChatBox(startPos.x)
		local bot = createPed (skin,tonumber(startPos[1]),tonumber(startPos[2]),tonumber(startPos[3]))--spawns the ped
		
		if (bot ~= false) then
		local nx,ny,nz = getElementPosition(bot)	
			if weaponId == 34 then
			colSize = 250
			else
			colSize = 150
			end
			
			local newnodecol = createColSphere ( nx,ny,nz, colSize or 150 )
			attachElements(newnodecol,bot)
			setElementData(newnodecol,"botParentCOL",bot)
			setElementData(bot,"botParentCOL",newnodecol)
			setElementData(bot,"bot",true)
			setElementData(bot,"pedName",tostring(pedName))
			setElementData(bot,"type",botType)
			setElementData(bot,"blood",12000)
			setElementData(newnodecol,"bot",true)
		
			setElementData(bot,"startPos",startPos)
			
			setElementData(bot,"patrol",patrol)
			
			
		if weaponId ==29 then
weaponName="mp5"
elseif weaponId ==30 then
weaponName="ak-47"
elseif weaponId ==31 then
weaponName="m4"
elseif weaponId ==34 then
weaponName="sniper"
end
setElementData(bot,"weaponName",weaponName or "m4")

			
if weaponId==34 then
weaponModel =1918
elseif weaponId==30 then
weaponModel =1861
elseif weaponId==31 then
weaponModel =1872
end

local botAttWeapon = createObject(weaponModel,tonumber(startPos[1]),tonumber(startPos[2])+10,tonumber(startPos[3])+10)
		setElementData(bot,"botAttWeapon",botAttWeapon)
		
		setTimer (function () 
		setElementInterior(bot, tonumber(0)) 
		setElementDimension(bot, tonumber(0))
		attachElementToBone(botAttWeapon,bot,12,0,0,0.05,-5,-100,0)
		triggerClientEvent ( "botCreated", bot )
		setPedWalkingStyle ( bot, 0)
		end,100,1) --sets interior
		
		
		


			return bot 
		else
			return false 
		end

end





local botPos = {
-- начальная позиция{x,y,z},патрулировать,скин,ид оружия,имя,тип
{{-16.976196289063,2053.9111328125,36.785938262939},false,252,34,"Бандит(снайпер)","sniper1"}, -- вышка 51 вход
{{-4.0426149368286,2048.8603515625,36.785938262939},false,252,34,"Бандит(снайпер)","sniper1"}, -- вышка 51 вход
{{-19.291917800903,2076.7243652344,36.885936737061},false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 вход
{{-4.5757546424866,2077.0698242188,36.885936737061},false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 вход
{{187.09552001953,2074.3786621094,41.985939025879},false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 
{{236.15644836426,1691.9311523438,41.985939025879},false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 
{{239.46963500977,1706.3896484375,41.97985458374},false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 
{{17.900009155273,1711.9049072266,41.985939025879},false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 
{{14.670338630676,1727.7993164063,41.97985458374} ,false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 
{{196.38674926758,2083.2763671875,41.985939025879},false,252,34,"Бандит(снайпер)","sniper2"}, -- вышка 51 
{{322.94805908203,1930.7377929688,36.398155212402},false,252,34,"Бандит(снайпер)","sniper1"}, -- вышка 51 
{{160.35119628906,1931.0390625,18.712942123413},true,264,30,"Бандит(штурмовик)","hedgehopper"}, -- 51 
{{224.09785461426,1872.4929199219,13.734375} ,true,264,30,"Бандит(штурмовик)","hedgehopper"}, -- 51 
{{293.25415039063,1964.7601318359,17.640625},true,262,31,"Бандит(пулеметчик)","gunner"},  -- 51
{{202.80583190918,1868.7039794922,13.140625},true,262,31,"Бандит(пулеметчик)","gunner"},	-- 51
{{210.73320007324,1863.55078125,13.140625},true,264,30,"Бандит(штурмовик)","hedgehopper"},  -- 51 
{{120.67301177979,1722.3991699219,17.640625} ,true,262,31,"Бандит(пулеметчик)","gunner"}, -- 51
{{28.848569869995,1963.3264160156,17.640625} ,true,262,31,"Бандит(пулеметчик)","gunner"}, -- 51
{{2338.4284667969,-633.09051513672,131.88124084473} ,true,262,31,"Бандит(пулеметчик)","gunner"}, -- пещера вход
{{2359.853515625,-680.46765136719,113.2894821167} ,true,264,30,"Бандит(штурмовик)","hedgehopper"}, -- пещера тоннель
{{2384.9946289063,-741.65698242188,90.282592773438} ,true,262,31,"Бандит(пулеметчик)","gunner"}, -- пещера внутри напротив входа
{{2364.0791015625,-755.0302734375,84.850631713867} ,true,262,31,"Бандит(пулеметчик)","gunner"}, -- пещера внутри рядом со входом
{{2325.6879882813,-787.61297607422,74.84797668457} ,true,264,30,"Бандит(штурмовик)","hedgehopper"}, -- пещера внутри
{{2306.9689941406,-776.46557617188,76.246719360352} ,true,264,30,"Бандит(штурмовик)","hedgehopper"}, -- пещера внутри
{{2314.9631347656,-753.23394775391,74.717247009277} ,true,264,30,"Бандит(штурмовик)","hedgehopper"}, -- пещера внутри


{{2224.8405761719,-2463.3059082031,-11.943175315857},false,262,31,"Бандит(пулеметчик)","gunner"},	-- секретка 1 комната
{{2222.1279296875,-2438.4819335938,-19.670936584473} ,false,264,30,"Бандит(штурмовик)","hedgehopper"}, -- секретка 2 комната
{{2199.208984375,-2416.2448730469,-15.416250228882} ,false,264,30,"Бандит(штурмовик)","hedgehopper"}, -- секретка 3 комната над входом
{{2187.6472167969,-2396.9072265625,-15.920352935791},false,262,31,"Бандит(пулеметчик)","gunner"},	-- секретка 3 комната на контейнере
{{2156.46875,-2396.0397949219,-15.416250228882},false,262,31,"Бандит(пулеметчик)","gunner"},	-- секретка 3 комната выход сверху

{{2111.5725097656,-2412.4462890625,-19.893928527832} ,false,264,30,"Бандит(штурмовик)","hedgehopper"}, -- секретка вход в лабу
{{2116.6774902344,-2441.7861328125,-20.120416641235} ,false,264,30,"Бандит(штурмовик)","hedgehopper"}, -- секретка лаба
}


function createBotTest()
setWeaponProperty (31, "std","weapon_range", 310)
setWeaponProperty (30, "std","weapon_range", 310)


for theKey,botTable in ipairs(botPos) do
createBot (botTable[1],botTable[2], botTable[3],botTable[4],botTable[5],botTable[6] )

end
	if player then

		local x,y,z=getElementPosition(player)
		outputChatBox(x..","..y..","..z)
		createBot ( {x,y,z},false, botTable[1],botTable[2],botTable[3],botTable[4])
	end
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),createBotTest) 
--addCommandHandler("cB", createBotTest)


