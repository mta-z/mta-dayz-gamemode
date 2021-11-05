--Create Scroll Menü
local spalten = {}
local spalteGuiImage = {}
local spalteGuiText = {}



spalten[1] = ""
spalten[2] = ""
spalten[3] = ""
spalten[4] = ""
spalten[5] = ""
spalten[6] = ""
spalten[7] = ""
spalten[8] = ""
spalten[9] = ""
spalten[10] = ""

local menuItemTop = 350
local menuItemWidth = 300
local menuItemTopP = 20

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
    function ( startedRes )
	
	
	for i = 1, (#spalten or 1) do
	
	spalteGuiImage[i] = guiCreateStaticImage(0,menuItemTop,menuItemWidth,menuItemTopP,"images/scrollmenu_2.png",false)
	menuItemTop=menuItemTop+menuItemTopP
	spalteGuiText[i] = guiCreateLabel(0,0,menuItemWidth,menuItemTopP,spalten[i],false,spalteGuiImage[i])
	guiSetFont ( spalteGuiText[i], "default-bold-small" )
	guiLabelSetHorizontalAlign (spalteGuiText[i], "center")
	guiLabelSetVerticalAlign (spalteGuiText[i], "center")
	guiSetVisible(spalteGuiImage[i],false)
	guiSetAlpha ( spalteGuiImage[i], 0.5)
	end
	
    end
);



function PlayerScrollMenu (key,keyState,arg)

if ( keyState == "down" ) then
if not guiGetVisible(spalteGuiImage[2]) then
	return
end
if arg == "up" then

		for i = 2, (#spalten or 1) do
			
		if getElementData(spalteGuiText[i],"markedMenuItem") then
		
		setElementData(spalteGuiText[i-1],"markedMenuItem",true,false)
		guiLabelSetColor (spalteGuiText[i-1],255,255,255,255)
		guiSetAlpha ( spalteGuiImage[i-1], 1)
		guiSetSize ( spalteGuiImage[i-1], menuItemWidth+menuItemTopP, menuItemTopP, false )
		guiSetSize ( spalteGuiText[i-1],  menuItemWidth+menuItemTopP, menuItemTopP, false )
		
		setElementData(spalteGuiText[i],"markedMenuItem",false,false)
		guiLabelSetColor (spalteGuiText[i],190, 190, 190)
		guiSetSize ( spalteGuiImage[i],  menuItemWidth, menuItemTopP, false )
		guiSetSize ( spalteGuiText[i],  menuItemWidth, menuItemTopP, false )
		guiSetAlpha ( spalteGuiImage[i], 0.5)
		break
		end
		
		
		end

elseif arg == "down" then

for i = 1, ((#spalten-1) or 1) do
			
			
			
		
		if getElementData(spalteGuiText[i],"markedMenuItem") then
		
		if  guiGetVisible(spalteGuiImage[i+1]) then
		
		setElementData(spalteGuiText[i],"markedMenuItem",false,false)
		guiLabelSetColor (spalteGuiText[i],190, 190, 190)
		
		guiSetSize ( spalteGuiImage[i], menuItemWidth, menuItemTopP, false )
		guiSetSize ( spalteGuiText[i], menuItemWidth, menuItemTopP, false )
		guiSetAlpha ( spalteGuiImage[i], 0.5)
		

		setElementData(spalteGuiText[i+1],"markedMenuItem",true,false)
		guiLabelSetColor (spalteGuiText[i+1],255,255,255,255)
		guiSetAlpha ( spalteGuiImage[i+1], 1)
		guiSetSize ( spalteGuiImage[i+1], menuItemWidth+menuItemTopP, menuItemTopP, false )
		guiSetSize ( spalteGuiText[i+1], menuItemWidth+menuItemTopP, menuItemTopP, false )
		end
		
		break
			end
		
		
		end



	
end
end
end
--end
bindKey ( "mouse_wheel_up", "down", PlayerScrollMenu, "up" )
bindKey ( "mouse_wheel_down", "down", PlayerScrollMenu, "down" )


------------------------------------------------------------------------------
--MENU

VehDetals={
{402,{0,2.45,0,0,0,0,size= 0.6},{0,2.55,-0.1,0,0,0,size =0.9}},
{470,{0,2.55,0.1,0,0,0,size=0.7},{0,2.6,0.1,0,0,0,size=1.1}},
{601,{0,2.9,0.25,0,0,0,size =0.7},{0,3,0.35,0,0,-2.2,size=1}},
{490,{0,2.9,-0.2,0,0,0,size=0.7},{0,3,-0.2,0,0,0,size=1}},
{422,{0,2.5,-0.3,0,0,0,size =0.7},{0,2.7,-0.3,0,0,0,size=1}},
{403,{0,5,-0.7,0,0,0,size=0.7},{0,5.1,-0.8,0,0,0,size=1.1}},
{416,{0,3,-0.5,0,0,0,size=0.7},{0,3.25,-0.6,0,0,0,size=1}},
{528,{0,2.9,-0.3,0,0,0,size=0.7},{0,3,-0.4,0,0,0,size=1}},
{504,{0,2.7,-0.1,0,0,0,size=0.7},{0,2.9,-0.1,0,0,0,size=1}},
{542,{0,3,-0.3,0,0,0,size=0.7},{0,3.1,-0.2,0,0,-3,size=1}},
--{500,{0,2.3,-0.2,0,0,0,size=0.7},{0,2.5,-0.4,0,0,-3,size=1}},
{596,{0,2.88,0,0,0,0,size=0.7},{0,2.88,0,0,0,-3,size=1}}
}

function createMenuItem(number,menuText,usedItem)
	if not getElementData(localPlayer,"logedin") then return end 
	if  getElementData(localPlayer,"isDead") then return end 
	
		if number == 1 then
		guiLabelSetColor (spalteGuiText[number],255,255,255,255)
		guiSetAlpha ( spalteGuiImage[number], 1)
		setElementData(spalteGuiText[number],"markedMenuItem",true,false)
		guiSetSize ( spalteGuiImage[number], menuItemWidth+menuItemTopP, menuItemTopP, false )
		guiSetSize ( spalteGuiText[number], menuItemWidth+menuItemTopP, menuItemTopP, false )
		end
		guiSetVisible(spalteGuiImage[number],true)
		guiSetText(spalteGuiText[number],"["..number.."] "..menuText)
		setElementData(spalteGuiText[number],"usedItem",usedItem,false)
		
		bindKey(tostring(number),"down", onPlayerPressMiddleMouse,tostring(usedItem))
		
end



function disableMenu()
for i = 1, ((#spalten) or 1) do
			
unbindKey ( tostring(i),"down", onPlayerPressMiddleMouse)			
			
	guiSetAlpha ( spalteGuiImage[i], 0.5)	
guiSetVisible(spalteGuiImage[i],false)

setElementData(spalteGuiText[i],"markedMenuItem",false,false)		
guiLabelSetColor (spalteGuiText[i],190, 190, 190)
guiStaticImageLoadImage ( spalteGuiImage[i], "images/scrollmenu_2.png" )

guiSetSize ( spalteGuiImage[i],  menuItemWidth, menuItemTopP, false )
guiSetSize ( spalteGuiText[i],  menuItemWidth, menuItemTopP, false )		
		end

setNewbieInfo (false,"","")
setShowItemIcon(false,"")
end
addEvent("disableMenu",true)
addEventHandler("disableMenu",localPlayer,disableMenu)


function showClientMenuItem(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10)


		if getPedOccupiedVehicle(localPlayer) and arg1 ~= "TradeCar" and arg1 ~="autoPatrolStantion" and arg1 ~="carMechanic" then
	disableMenu()
			return
		end
		if getElementData(localPlayer,"inArena") then disableMenu() return  end
local number = 0
if arg1 == "Подобрать" then
	number = number+1
	
	createMenuItem(number,"Подобрать: "..arg2,arg2)
	
end
if arg1 == "stop" then
	disableMenu()
	refreshLoot(false)
end

if arg1 == "autoPatrolStantion" then
		number = number+1	
		createMenuItem(number,"Починить ("..(GetRealVehicleName(arg2) or "Транспортное средство" )..")","autoRepVeh")
		
		number = number+1
		createMenuItem(number,"Заправить ("..(GetRealVehicleName(arg2) or "Транспортное средство")..")","autoFulVeh")
end

if arg1 == "carMechanic" then
		number = number+1
		createMenuItem(number,"Автомеханик ("..(GetRealVehicleName(arg2) or "Транспортное средство" )..")","carMechanic")
end

if arg1 == "TradeCar" then
	if getElementData(arg2,"owner") == getElementData(localPlayer,"userAccount") then
		number = number+1
		createMenuItem(number,"Продать ("..(GetRealVehicleName(arg2) or "Транспортное средство")..")","tradeCarSell")
		end
end

if arg1 == "startFishing" then
if getElementData(localPlayer,"fishing") then
		number = number+1
		createMenuItem(number,"Начать рыбачить","startFishing")
else
return
end
end

if arg1 == "checkFishing" then
if getElementData(localPlayer,"fishing") then

		number = number+1
		createMenuItem(number,"Подсечь рыбу","checkFishing")
		setTimer(function() 
		if not getElementData(localPlayer,"checkFishing") then
			outputChatBox("Рыба сорвалась!")
			--setElementData(localPlayer,"Наживка",getElementData(localPlayer,"Наживка") or 0 -1)
			triggerServerEvent("startFishing",localPlayer,localPlayer,"stop")
			disableMenu()
			showClientMenuItem("startFishing")
		end
		end,5000,1)
else
return
end	
end
if arg1 == "stopFishing" then
if getElementData(localPlayer,"fishing") then
		number = number+1
		createMenuItem(number,"Закончить рыбачить","stopFishing")
else
return
end
end

if arg1 == "baiting" then
if getElementData(localPlayer,"inbaitZone") then
		number = number+1
		createMenuItem(number,"Накопать червей","baiting")

		
		number = number+1
		createMenuItem(number,"Отмена","cancelbaiting")

else
return
		end
end


if arg1 == "Helicrashsite" then
	number = number+1
	createMenuItem(number,"Обыскать: Разбитый вертолёт","helicrashsite")

end

if arg1 == "Aircrashsite" then
	number = number+1
	createMenuItem(number,"Обыскать: Разбитый самолет","aircrash")
end



if arg1 == "Осмотреть могилу" then
	number = number+1
	createMenuItem(number,"Осмотреть могилу","mogilsmtr")
end

if arg1 == "Hospitalbox" then
	number = number+1
	createMenuItem(number,"Обыскать: Коробка госпиталя","hospitalbox")
end

if arg1 == "Yashik" then
	number = number+1
	createMenuItem(number,"Обыскать: Военный ящик","yashik")

end


if arg1 == "Vehicle" then
local bigTent = getElementData(getElementData(arg3,"parent"),"bigTent") or false
local ADMINTent = getElementData(getElementData(arg3,"parent"),"ADMINTent")  or false
if bigTent then 
arg2 = "Большая палатка"
elseif ADMINTent then
arg2 = "Огромный ящик"
end
	number = number+1
	
	
	createMenuItem(number,"Обыскать ("..arg2..")","vehicle")
	
	if getElementData(getElementData(arg3,"parent"),"tent") then
	if getElementData(getElementData(arg3,"parent"),"save") then
		number = number+1
			createMenuItem(number,"Выкопать сейф","removesave")
			
			
		if  not getElementData(getElementData(arg3,"parent"),"hackSave")  then
	local otms = getElementData(localPlayer,"Отмычка") or 0
	if  otms >=1 then
	number = number+1
	local SKILL_HACK = getElementData(localPlayer,"SKILL_HACK") or 0
		createMenuItem(number,"Взломать("..(20+SKILL_HACK*2).."%)","passkey")
		end
	end
	
		return
	else
	
	
	
		if bigTent then
		
			number = number+1
			createMenuItem(number,"Убрать ("..arg2..")","removebigtent")
			
			return
		
		else
			
			
			if ADMINTent then
				number = number+1
				createMenuItem(number,"Убрать ("..arg2..")","removeadmintent") --- сделать проверку на сериал !!!
				return 
			else
				number = number+1
				createMenuItem(number,"Убрать ("..arg2..")","removetent")
				return
			end

		end
	
	
	end
	end

	if getElementModel(arg3) ~= 584 and getElementModel(arg3) ~= 591 then
	if getElementHealth(arg3) < 1000 and getElementHealth(arg3) >= 50 and (getElementData(localPlayer,"Caixa de Ferramentas") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Починить ("..arg2..")","repairvehicle")
	end
	
	if getVehicleType (arg3) =="Automobile" then 
		 local progressMech = getElementData(localPlayer,"progress.automech") or 0
		
		 if progressMech==100 and not isVehicleLocked(arg3) and (getElementData(localPlayer,"Caixa de Ferramentas") or 0) >= 1 then
			number = number+1
			createMenuItem(number,"Автомеханик ("..arg2..")","progressAutoMech")
			
		 end
	 end
	 
	if getElementData(arg3,"owner") == getElementData(localPlayer,"userAccount") then
		if isVehicleLocked(arg3) then

		number = number+1
		createMenuItem(number,"Открыть ("..arg2..")","openCar")
		
		else
		
		number = number+1
		createMenuItem(number,"Закрыть ("..arg2..")","closeCar")
		
		end
		
	else

	
		
		local heckKey = getElementData(localPlayer,"Отмычка") or 0
		if heckKey>=1 then
			if isVehicleLocked(arg3) then
			
			number = number+1
			local precent = 20+math.floor(progressMech*0.2)
			createMenuItem(number,"Взломать ("..arg2..")("..precent.."%)","hackCar")
			
			end
		end
	
	end
	
	
	
	
	local lists = getElementData(localPlayer,"Стальной лист") or 0
	local listsInCar = getElementData(arg3,"steelList") or 0 
	if  lists >=1  and (getElementData(localPlayer,"Caixa de Ferramentas") or 0) >= 1 and listsInCar<1000 then
	number = number+1
		createMenuItem(number,"Установить: Стальной лист","steelList")
		end
	
	
			if (getElementData(localPlayer,"Шланг") or 0) >=1 and (getElementData(localPlayer,"Пустая Канистра") or 0) >=1  and not isVehicleLocked(arg3)  then
		
			if getElementData(getElementData(arg3,"parent"),"fuel") >=20 then
					number = number+1
					createMenuItem(number,"Слить бензин","fuelRems")
					end
			end	
			
						if (getElementData(localPlayer,"Galão de Combútivel Completo") or 0) >=1  and not isVehicleLocked(arg3)  then
		local maxFuel= getElementData(arg3,"maxfuel") or 0
	
		if 	(getElementData(getElementData(arg3,"parent"),"fuel")+20) < tonumber(maxFuel) then

					number = number+1
					createMenuItem(number,"Заправить","fuelCar")
			end		
			end	
			
			local progressEnginer = getElementData(localPlayer,"progress.enginer") or 0
				
				if not isVehicleLocked(arg3)  then
				if progressEnginer >=40 then
					if getElementData(getElementData(arg3,"parent"),"Колесо_inVehicle") >=1 then
					number = number+1

					createMenuItem(number,"Снять колесо","nscrewwheel")
					end
					local model = getElementModel(arg3) 
					for theKey,datas in ipairs(VehDetals) do
					if datas[1] == model then

					if not getElementData(arg3,"kowh") then
					if (getElementData(localPlayer,"Металлический ковш 1") or 0) >=1  then
					
					number = number+1
					createMenuItem(number,"Установить: Металлический ковш 1","instkoyw")
					end
					if (getElementData(localPlayer,"Металлический ковш 2") or 0) >=1  then
					
					number = number+1
					createMenuItem(number,"Установить: Металлический ковш 2","instkoyw2")
					end
					else
					number = number+1
					createMenuItem(number,"Снять ковш","dystrkoyw")
					
					end
					
					end
					end
					
					if getElementData(getElementData(arg3,"parent"),"Мотор_inVehicle") >=1 then
					number = number+1
					createMenuItem(number,"Снять мотор","nscrewengine")
					return
					end
					else
					if (getElementData(localPlayer,"Caixa de Ferramentas") or 0) >=1 then
						if getElementData(getElementData(arg3,"parent"),"Колесо_inVehicle") >=1 then
					number = number+1
					createMenuItem(number,"Снять колесо","nscrewwheel")
					end
						local model = getElementModel(arg3) 
					for theKey,datas in ipairs(VehDetals) do
					if datas[1] == model then
					
					if not getElementData(arg3,"kowh") then
					if (getElementData(localPlayer,"Металлический ковш 1") or 0) >=1  then
					
					number = number+1
					createMenuItem(number,"Установить: Металлический ковш 1","instkoyw")
					end
					if (getElementData(localPlayer,"Металлический ковш 2") or 0) >=1  then
					
					number = number+1
					createMenuItem(number,"Установить: Металлический ковш 2","instkoyw2")
					end
					else
					number = number+1
					createMenuItem(number,"Снять ковш","dystrkoyw")
					end
					
					
					end
					end
					if getElementData(getElementData(arg3,"parent"),"Мотор_inVehicle") >=1 then
					number = number+1
					createMenuItem(number,"Снять мотор","nscrewengine")
					return
					end
					end
					end
				end
	
	end
	
end
if arg1 == "Player" then
local progressMedik = getElementData(localPlayer,"progress.medik") or 0
	--1
		if not getElementData(arg2,"group") and not getElementData(arg2,"groupInvite") then
		if  getElementData(localPlayer,"groupUserStatus") =="OWNER" or getElementData(localPlayer,"groupUserStatus") =="MODER" or getElementData(localPlayer,"groupUserStatus")=="PARTY" then
		if getElementData(localPlayer,"mayInvite") then
		number = number+1
		createMenuItem(number,"Пригласить в группу:"..getElementData(localPlayer,"group"),"inviteToGroup")
		end
		end
	end	
	--[[
	if not getElementData(arg2,"isDead") and not getElementData(arg2,"offerExc") and not getElementData(localPlayer,"offerExc") and not getElementData(localPlayer,"exchange") and not getElementData(arg2,"exchange")   then
		number = number+1
		createMenuItem(number,"Предложить обмен","offerExc")
	end
	]]
	if getElementData(arg2,"bleeding") > 0 and (getElementData(localPlayer,"Ataduras") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Перевязать","bandage")
	end	
	
	if getElementData(arg2,"blood") < 11900 and (getElementData(localPlayer,"Bolsa de Sangue") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Перелить кровь","giveblood")

	end
	
	if getElementData(arg2,"brokenbone") and (getElementData(localPlayer,"Morfina") or 0) >= 1 and progressMedik>=40 then
		number = number+1
		createMenuItem(number,"Дать: Morfina","givemorph")
	end
			if getElementData(arg2,"pain") and (getElementData(localPlayer,"Analgésico") or 0) >= 1 and progressMedik>=40 then
		number = number+1
		createMenuItem(number,"Дать: Analgésico","giveobezb")
	end
	
	


end
if arg1 == "Dead" then

	number = number+1
	createMenuItem(number,"Обыскать труп ("..arg2..")","dead")

	
	
	number = number+1
	createMenuItem(number,"Осмотреть труп ("..arg2..")","deadreason")

	local col = getElementData(localPlayer,"currentCol")
	local parent = getElementData(col,"parent") or false
	if parent then 
		local isDeadBot= getElementData(parent,"deadbot") or false
		if not isDeadBot then
			if (getElementData(localPlayer,"Лопата") or 0) >=1  then
			number = number+1
			createMenuItem(number,"Закопать труп ("..arg2..")","deadbury")
			end
		end
	end
	
	
	if arg2 == "Zombie" then
	local col = getElementData(localPlayer,"currentCol")
	local rand = getElementData(col,"zombieR") or false
	if rand then
	number = number+1
	createMenuItem(number,"Расчленить труп ("..arg2..")","zombieR")
	end
	end
	
end
if arg1 == "Fireplace" then
	if (getElementData(localPlayer,"Сырое Мясо") or 0) >= 1 then
	number = number+1
	createMenuItem(number,"Жарить: Сырое Мясо","fireplace")
	end
		if (getElementData(localPlayer,"Сырая рыба") or 0) >= 1 then
	number = number+1
	createMenuItem(number,"Жарить: Сырая рыба","fireplace1")

	end
	--	if getElementData(localPlayer,"Украшения") >= 3 then
	--number = number+1
	--guiSetVisible(spalteGuiImage[number],true)
	--guiSetText(spalteGuiText[number],"Переплавить украшения")
	--setElementData(spalteGuiText[number],"markedMenuItem",true)
	--setElementData(spalteGuiText[number],"usedItem","goold")
	--end
end
if arg1 == "patrol" then
	if (getElementData(localPlayer,"Пустая Канистра") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Наполнить: Пустая Канистра","patrolstation")
	end	
end

if arg1 == "water" then
	if (getElementData(localPlayer,"Пустая Фляга") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Наполнить: Пустая Фляга","upwater")
	end	
end

if arg1 == "treepos" then
	if (getElementData(localPlayer,"Топор") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Нарубить дров","treepos")
	end	
end


if arg1 == "Arame Farpado" then
	if (getElementData(localPlayer,"Caixa de Ferramentas") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Разобрать: Arame Farpado","wirefence")
	end	
end
if arg1 == "Мешки с песком" then
	if (getElementData(localPlayer,"Лопата") or 0) >= 1 then
		number = number+1
		createMenuItem(number,"Разобрать: Мешки с песком","sandbags")
	end	
end

if arg1 == "Обыскать" then
	number = number+1
	createMenuItem(number,"Обыскать","itemloot")
end
end
addEvent("showClientMenuItem",true)
addEventHandler("showClientMenuItem",localPlayer,showClientMenuItem)


function onQuitGame( reason )
    local ColIn = getElementData(source,"ColInPlayerdd") or false
	if ColIn then 
	setElementData(ColIn,"PlayerInCol",false)
	end
end
addEventHandler( "onClientPlayerQuit", getRootElement(), onQuitGame )








------------------------------------------------------------------------------

------------------------------------------------------------------------------
--TAKE OBJECT FUNCTIONS

function getPlayerInCol(tab)




	for theKey,thePlayer in ipairs(tab) do
		if thePlayer ~= localPlayer  then
			return true
		end
	end
	return false
	

end

isInFirePlace = false
function onPlayerTargetPickup (theElement)

if not getElementData(localPlayer,"isDead") then
if theElement == localPlayer  then

if getElementData(localPlayer,"inAutoPatrilStantion")  or getElementData(localPlayer,"inTraderCar") or getElementData(localPlayer,"inCarMechanicGarage") then 
return
end

local PlayerInCol = getElementData(source,"PlayerInCol") or false
if 	PlayerInCol then
if PlayerInCol == localPlayer then

setElementData(source,"PlayerInCol",false)
setElementData(localPlayer,"ColInPlayerdd",false)
end
end	

if getElementData(source,"zombie") then 
return
end

onPlayerTargetPickup2(theElement)
if getElementData(source,"parent") == localPlayer then return end
		local player = getPlayerInCol(getElementsWithinColShape ( source, "player" ))
		if getPedOccupiedVehicle(localPlayer) then
			return
		end
		isInFirePlace = false
		setElementData(spalteGuiText[2],"markedMenuItem",false,false)
		setElementData(spalteGuiText[1],"markedMenuItem",true,false)
		
		guiLabelSetColor (spalteGuiText[1],255,255,255,255)
		guiLabelSetColor (spalteGuiText[2],190, 190, 190)
		if getElementData(source,"player") then
			showClientMenuItem("Player",getElementData(source,"parent"))
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			return
		end
		if player then
			return
		end

		
		if getElementData(source,"itemloot") then
			showClientMenuItem("Обыскать")
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname","Обыскать",false)
			setElementData(localPlayer,"currentCol",source,false)
			setShowItemIcon (true,source)
			return
		end

	if getElementData(source,"deadbury") then
			showClientMenuItem("Осмотреть могилу")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			return
		end
		
		if getElementData(source,"patrolstation") then
			showClientMenuItem("patrol")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			setNewbieInfo (true,"Наполнить канистру","Требуется: Пустая канистра",source)
			return
		end
		
		if getElementData(source,"water") then
			showClientMenuItem("water")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			setNewbieInfo (true,"Наполнить Флягу","Требуется: Пустая Фляга",source)
			return
		end
		
			if getElementData(source,"treepos") then
			showClientMenuItem("treepos")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			setNewbieInfo (true,"Нарубить дров","Требуется: Топор",source)
			return
		end
		
		if getElementData(source,"wirefence") then
			showClientMenuItem("Arame Farpado")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			setNewbieInfo (true,"Разобрать колючую проволку","Требуется: Caixa de Ferramentas",source)
			return
		end
		if getElementData(source,"sandbags") then
			showClientMenuItem("Мешки с песком")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			setNewbieInfo (true,"Разобрать мешки с песком","Требуется: Лопата",source)
			return
		end
		
		if getElementData(source,"fireplace") then
			showClientMenuItem("Fireplace")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			isInFirePlace = true
			return
		end
		if getElementData(source,"deadman") then
			setElementData(localPlayer,"currentCol",source,false)
			showClientMenuItem("Dead",getElementData(source,"playername"))
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname",""..getElementData(source,"playername").."",false)
			setShowItemIcon (true,source)
			return
		end
		if getElementData(source,"item") then
			showClientMenuItem("Подобрать",getElementData(source,"item"))
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",false,false)
			setShowItemIcon (true,source)
			return
		end
		if getElementData(source,"helicrash") then
			showClientMenuItem("Helicrashsite","helicrash")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname","Разбитый вертолет",false)
			return
		end
		if getElementData(source,"aircrash") then
			showClientMenuItem("Aircrashsite","aircrash")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname","Разбитый самолет",false)
			return
		end
		
		
		
		if getElementData(source,"hospitalbox") then
			showClientMenuItem("Hospitalbox","hospitalbox")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname","Коробка госпиталя",false)
			setShowItemIcon (true,source)
			return
		end
		if getElementData(source,"Yashik") then
			showClientMenuItem("Yashik","yashik")
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname","Военный ящик",false)
			setShowItemIcon (true,source)
			return
		end
		
		if getElementData(source,"vehicle") then
		if guiGetVisible(inventoryWindows,true) then
		guiSetVisible(inventoryWindows,false)
		showCursor(not isCursorShowing())
		end
		if saveWindows and isElement(saveWindows) then
		if guiGetVisible (saveWindows,true) then
		guiSetVisible(saveWindows,false)
		showCursor(not isCursorShowing())
		end
		end
		
		if getElementData(source,"save") then
		showClientMenuItem("Vehicle","сейф",getElementData(source,"parent"))
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname","Сейф",false)
			
			setNewbieInfo (true,"Сейф", "Вес: "..getLootCurrentSlots(source).."/"..(getLootMaxAviableSlots(source)or 0).."\nВладелец: "..( string.gsub ( getElementData(source,"PlayerNick"), '#', '' ) or "Нет"),source)

			return
		else
			if not getElementData(source,"deadVehicle") then
			name = ""
			local bigTent = getElementData(source,"bigTent") or false
			if bigTent then
			 name = "Большая палатка"
			else
			local isTent = getElementData(source,"tent") or false
			if isTent then
			 name = "Палатка"
			else
			 name = "Транспортное средство"
			end
			 
			end
			showClientMenuItem("Vehicle",(GetRealVehicleName(getElementData(source,"parent")) or name),getElementData(source,"parent"))
			setElementData(localPlayer,"currentCol",source,false)
			setElementData(localPlayer,"loot",true,false)
			setElementData(localPlayer,"lootname",""..(GetRealVehicleName(getElementData(source,"parent")) or name).."",false)
			if getElementData(source,"tent") then
			local bigTent = getElementData(source,"bigTent") or false
			if bigTent then
			setNewbieInfo (true,"Большая палатка", "Вес: "..getLootCurrentSlots(source).."/"..(getLootMaxAviableSlots(source)or 0).."\nВладелец: "..(string.gsub ( getElementData(source,"PlayerNick"), '#', '' ) or "Нет"),source)
			else
				local ADMINTent = getElementData(source,"ADMINTent") or false
				if ADMINTent then
					setNewbieInfo (true,"Огромный ящик", "Вес: "..getLootCurrentSlots(source).."/"..(getLootMaxAviableSlots(source)or 0).."\nВладелец: "..(string.gsub ( getElementData(source,"PlayerNick"), '#', '' ) or "Нет"),source)
				else
					setNewbieInfo (true,"Палатка", "Вес: "..getLootCurrentSlots(source).."/"..(getLootMaxAviableSlots(source)or 0).."\nВладелец: "..(string.gsub ( getElementData(source,"PlayerNick"), '#', '' ) or "Нет"),source)
				end
			end
			
			else
			if getElementModel(getElementData(source,"parent")) ~= 584 and getElementModel(getElementData(source,"parent")) ~= 591 then
	
			
			local ownerCar = getElementData(getElementData(source,"parent"),"ownerNick")
			if ownerCar then
			 carOwner = "\nВладелец: "..ownerCar
			else
			 carOwner=""
			end
			local maxFuel= getElementData(getElementData(source,"parent"),"maxfuel") or 0
			local needtires = getElementData(getElementData(source,"parent"),"needtires") or 0 
		local needengines= getElementData(getElementData(source,"parent"),"needengines") or 0 
			setNewbieInfo (true,""..(GetRealVehicleName(getElementData(source,"parent")) or "Транспортное средство" ).."", "Бензин: "..math.floor(getElementData(source,"fuel")).."/"..tonumber(maxFuel).."\nКолесо: "..getElementData(source,"Колесо_inVehicle").."/"..needtires.."\nМотор: "..getElementData(source,"Мотор_inVehicle").."/"..needengines.."\nСостояние:"..( math.floor(getElementHealth ( getElementData(source,"parent") )) or "-").."/1000\nВес: "..getLootCurrentSlots(source).."/"..(getLootMaxAviableSlots(source)or 0)..""..carOwner,source)
			else
			--
			end
			end
			return
			end
			end
		end
		
		

		
		
		
		
	showClientMenuItem("stop")
end	
end
end
addEventHandler("onClientColShapeHit",getRootElement(),onPlayerTargetPickup)







function onPlayerTargetPickup2 (theElement)
if theElement == localPlayer then
if getElementData(localPlayer,"inAutoPatrilStantion") or getElementData(localPlayer,"inTraderCar") or getElementData(localPlayer,"inCarMechanicGarage")  then 
return
end
local PlayerInCol = getElementData(source,"PlayerInCol") or false
if 	PlayerInCol then
if PlayerInCol == localPlayer then

setElementData(source,"PlayerInCol",false)
setElementData(localPlayer,"ColInPlayerdd",false)
end
end	
if getElementData(localPlayer,"CloseTent") then
local col = getElementData(localPlayer,"CloseTent") or false
				local counterT = getElementData(col,"counterT") or "none"
				triggerServerEvent("saveTentOnClose",localPlayer,col,counterT)
				setElementData(localPlayer,"CloseTent",false,false)
end

if getElementData(localPlayer,"CloseVEH") then
local veh = getElementData(localPlayer,"CloseVEH") or false
				triggerServerEvent("saveVehOnExit",localPlayer,localPlayer,0,0,veh)
				setElementData(localPlayer,"CloseVEH",false,false)
end

				
	showClientMenuItem("stop")
	setElementData(localPlayer,"loot",false,false)
	setElementData(localPlayer,"currentCol",false,false)
	setNewbieInfo (false,"","")
	setShowItemIcon(false,"")
	isInFirePlace = false
end
end
addEventHandler("onClientColShapeLeave",getRootElement(),onPlayerTargetPickup2)




addEventHandler("onClientVehicleStartEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == localPlayer then	
		
	showClientMenuItem("stop")
	setElementData(localPlayer,"loot",false,false)
	setElementData(localPlayer,"currentCol",false,false)
	setNewbieInfo (false,"","")
	setShowItemIcon(false,"")
	isInFirePlace = false		
        end
    end
)

addEventHandler("onClientVehicleEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == localPlayer then	
		
	showClientMenuItem("stop")
	setElementData(localPlayer,"loot",false,false)
	setElementData(localPlayer,"currentCol",false,false)
	setNewbieInfo (false,"","")
	setShowItemIcon(false,"")
	isInFirePlace = false		
        end
    end
)





--Newbie Infos
local screenWidth, screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]
local newbieShow = false
local newbieHead = "-"
local newbieText = "-"
local newbiePosition = 0,0,0

local lengthText = 0
local lengthHead = 0
local headHight  = dxGetFontHeight(1, "default-bold-small")

function setNewbieInfo (show,head,text,element)
newbieShow = show
newbieHead = head
newbieText = text
newbiePosition = element
lengthText = dxGetTextWidth(text,1,"default-bold")
lengthHead = dxGetTextWidth(head,1, "default-bold-small")
 
newbieHeight = dxGetFontHeight(1, "default-bold")*dxGetTextHeight(newbieText)
end


local newbieShowIcon = false
local newbiePositionIcon = 0,0,0

function setShowItemIcon (show,element)
newbieShowIcon = show
newbiePositionIcon = element
end

addEventHandler("onClientRender", getRootElement(), 
function()


	if newbieShowIcon then
	local x,y,z = getElementPosition(newbiePositionIcon)
	local x,y = getScreenFromWorldPosition (x,y,z)
	if not x then 
	return
	end
	
	dxDrawImage ( x-(128/1.5)/2, y-(80/1.5)/2, 128/1.5, 80/1.5, "images/items.png" )
	end
	
	if newbieShow == false then return end
	local x,y,z = getElementPosition(newbiePosition)
	local x,y = getScreenFromWorldPosition (x,y,z)
	if not x then 
	return
	end

	
	
	if lengthHead>lengthText then
	 length = lengthHead
	else
	 length = lengthText
	end
	local startXPosRec = (screenWidth*0.02+length)/2
	local startYPosRec = (screenWidth*0.02+newbieHeight)/2
	local recWidth = screenWidth*0.02+length
	local recHeight = screenWidth*0.02+newbieHeight
	
	local recHeadWidth = screenWidth*0.01+lengthHead
	local recHeadHeight = screenWidth*0.01+headHight
	
	dxDrawRectangle ( x-startXPosRec,y-startYPosRec, recWidth, recHeight, tocolor (33,33,33,170) )
	dxDrawText(newbieText,x-startXPosRec+(screenWidth*0.02)/2 ,y-startYPosRec, x-(recWidth/2)+recWidth, y-(recHeight/2)+recHeight, tocolor(255,255,255,255), 1, "default-bold", "left", "center")

	
	dxDrawRectangle ( (x-startXPosRec)+((recWidth)/2)-(recHeadWidth/2),y-startYPosRec-recHeadHeight, recHeadWidth, recHeadHeight, tocolor (33,33,33,230) )

	dxDrawText(newbieHead,(x-startXPosRec)+((recWidth)/2)-(recHeadWidth/2), y-startYPosRec-recHeadHeight, (x-startXPosRec)+((recWidth)/2)-(recHeadWidth/2)+recHeadWidth,y-startYPosRec, tocolor(255,255,255), 1, "default-bold-small", "center", "center")
	
	
	

				   
	end
)
--[[
function fireRaiseTemperature ()
	if isInFirePlace then
		if getElementData(localPlayer,"temperature") <= 38 then
			setElementData(localPlayer,"temperature",getElementData(localPlayer,"temperature")+0.25) --server
		end
	end
end
setTimer(fireRaiseTemperature,10000,0)
]]
------------------------------------------------------------------------------

unbindKey("mouse3","both")



function onPlayerPressMiddleMouse (key,keyState,usedBind)
if ( keyState == "down" ) then
	if not guiGetVisible(spalteGuiText[1]) then return end
	
	local col = getElementData(localPlayer,"currentCol") or false
	local parent = false
	if col then
	
	
	

	if not isElement(col) then
	--outputChatBox("IS NOT ELEMENT!")
		disableMenu()
		return
		end
	
	if not getElementData(col,"player") then
	if #getElementsWithinColShape(col, "player") > 1 then
	--outputChatBox(">1 PLAYERS")
		disableMenu()
		return 
        end	
	end
	
	local preParent = getElementData(col,"parent") or false
	
	if preParent and isElement(preParent) then
	parent= preParent
	end
	
	end
	
	
		
		local networkStatus = getElementData(localPlayer,"networkStatus",false) or false
		if networkStatus then
		disableMenu()
		return
		end
			
		if getElementData(getRootElement(),"checkPacketlossLastSecond") and getNetworkStats().packetlossLastSecond > gameplayVariables["MAXpacketlossLastSecond"]  then
		startRollMessage2("Инвентарь", "PLLS: пинг выше нормы!", 255, 22, 0 )
		disableMenu()
		return
		end
		
		if getElementData(getRootElement(),"checkMessagesInResendBuffer") and getNetworkStats().messagesInResendBuffer >gameplayVariables["MAXmessagesInResendBuffer"] then
		startRollMessage2("Инвентарь", "MIRB: пинг выше нормы!", 255, 22, 0 )
		disableMenu()
		return
		end
		
		if getElementData(getRootElement(),"checkPing") and getPlayerPing(localPlayer)  > gameplayVariables["pingMAX"] then
		startRollMessage2("Инвентарь", "PP: пинг выше нормы!", 255, 22, 0 )
		disableMenu()
		return
		end
		
		if usedBind then 
		
			 itemName = usedBind
		else
			 itemName = getMenuMarkedItem()
		end
		
		
		if itemName == "helicrashsite" then
			local gearName = "Обыскать (Разбитый вертолёт)"
			refreshLoot(col,gearName)
			showInventoryManual()
			triggerEvent("PlaySoundDayZ",localPlayer,"InventoryOpen",0,4)
			disableMenu()
			return
		end
		
		if itemName == "aircrash" then
			local gearName = "Обыскать (Разбитый самолет)"
			refreshLoot(col,gearName)
			showInventoryManual()
			triggerEvent("PlaySoundDayZ",localPlayer,"InventoryOpen",0,4)
			disableMenu()
			return
		end
		
		if itemName == "itemloot" then
			local gearName = "Обыскать"
			refreshLoot(col,gearName)
			showInventoryManual()
			triggerEvent("PlaySoundDayZ",localPlayer,"InventoryOpen",0,4)
			disableMenu()
			return
		end
		
		if itemName == "openCar" then
			triggerServerEvent("openMyVH",localPlayer,parent)	
			disableMenu()
			return
		end
		
		if itemName == "progressAutoMech" then
			openMechWin(false,false,"progress")
			disableMenu()
			return
		end
		
		
		
		
		if itemName == "closeCar" then
			triggerServerEvent("closeMyVH",localPlayer,parent)
			disableMenu()
			return
		end
		
		
		
		
		if itemName == "hackCar" then
			
			
			local rand = math.random(0,100)
			
			local precent = 20+math.floor(progressMech*0.2)
			
			if rand<precent then
			outputChatBox("Вам удалось взломать "..GetRealVehicleName(parent))
			triggerServerEvent("openMyVH",localPlayer,parent)	
			else
			outputChatBox("Отмычка сломалась!")
			end
			local hackKeys = getElementData(localPlayer,"Отмычка") or 0
			setElementData(localPlayer,"Отмычка",hackKeys-1)
			
			disableMenu()
			return
		end
		
		
		if itemName == "passkey" then			
			local vero1 = 	math.random(0,100)
			local SKILL_HACK = getElementData(localPlayer,"SKILL_HACK") or 0
			if vero1 <= (20+SKILL_HACK*2) then 
			outputChatBox("Вы успешно взломали сейф!")
			setElementData(localPlayer,"Отмычка",getElementData(localPlayer,"Отмычка") -1 ) --server
			setElementData(col,"hackSave",true)
			else
			outputChatBox("Отмычка сломалась")
			setElementData(localPlayer,"Отмычка",getElementData(localPlayer,"Отмычка") -1 ) --server
			end
			disableMenu()
			return
		end
		
		if itemName == "cancelbaiting" then
			disableMenu()
			return
		end
		
		if itemName == "autoRepVeh" then
			autoPatrolStantionAction(1)
			--disableMenu()
			return
		end
		
		if itemName == "autoFulVeh" then
			autoPatrolStantionAction(2)
			--disableMenu()
			return
		end
		if itemName == "carMechanic" then
			openMechWin(false,false,"mech")
			disableMenu()
			return
		end
		if  itemName == "tradeCarSell" then
			autoTradeAction(1)
			disableMenu()
			return
		end
		
		
		if itemName == "baiting" then
			if getElementData(localPlayer,"inbaitZone") then
			triggerServerEvent("startFishing",localPlayer,localPlayer,"baiting")
			disableMenu()
			return
			end
		end
		
		
		if itemName == "startFishing" then
		if  (getElementData(localPlayer,"Удочка") or 0) >=1 then
			triggerServerEvent("startFishing",localPlayer,localPlayer,"start")
			fishing("start")
			checkKeysStart()
			disableMenu()
			return
		else 
		outputChatBox("У вас нет удочки")
		disableMenu()
		return
		end
		end
		
		if itemName == "checkFishing" then
			triggerServerEvent("startFishing",localPlayer,localPlayer,"check")
			fishing("check")
			setElementData(localPlayer,"checkFishing",true,false)
			disableMenu()
			return
		end
		
		if itemName == "stopFishing" then
			triggerServerEvent("startFishing",localPlayer,localPlayer,"stop")
			checkKeysStop()
			showClientMenuItem("startFishing")
			disableMenu()
			return
		end
		
		if itemName == "nscrewwheel" then
			vehicleAction(1,col)
			disableMenu()
			return
		end
		
		if itemName == "nscrewengine" then
			vehicleAction(2,col)
			disableMenu()
			return
		end
	
		
		if itemName == "fuelRems" then
			vehicleAction(3,col)
			disableMenu()
			return
		end
		
		
		if itemName == "steelList" then
			vehicleAction(5,col)
			disableMenu()
			return
		end
		
		
		if itemName == "fuelCar" then
			vehicleAction(4,col)
			disableMenu()
			return
		end
		
		if itemName == "instkoyw" then
			vehDetals(1,col,"kowh1")
			disableMenu()
			return
		end
		
		if itemName == "instkoyw2" then
			vehDetals(1,col,"kowh2")
			disableMenu()
			return
		end
		
		if itemName == "dystrkoyw" then
			vehDetals(2,col)
			disableMenu()
			return
		end
		
		
		if itemName == "wirefence" then
			local gearName = "Разобрать колючую проволку"
			triggerServerEvent("removeWirefence",localPlayer,parent)
			disableMenu()
			return
		end
		
		if itemName == "sandbags" then
			local gearName = "Разобрать мешки с песком"
			triggerServerEvent("removeSandBags",localPlayer,parent)
			disableMenu()
			return
		end
		
		if itemName == "mogilsmtr" then
			outputChatBox(getElementData(col,"deadtext"))
			disableMenu()
			return
		end	
		
		if itemName == "hospitalbox" then
			local gearName = "Обыскать (Коробка госпиталя)"
			refreshLoot(col,gearName)
			showInventoryManual()
			triggerEvent("PlaySoundDayZ",localPlayer,"InventoryOpen",0,4)
			disableMenu()
			return
		end
		
		if itemName == "yashik" then
			local gearName = "Обыскать ящик"
			refreshLoot(col,gearName)
			showInventoryManual()
			triggerEvent("PlaySoundDayZ",localPlayer,"InventoryOpen",0,4)
			disableMenu()
			return
		end
			
		if itemName == "vehicle" then -----------------------------------------------------
			local col = getElementData(localPlayer,"currentCol")
			if getElementData(col,"save") then
			local gearName = "Открыть ( сейф )"
			openSave(col)

			else
			local col = getElementData(localPlayer,"currentCol")
			local isBigTent = getElementData(col,"bigTent") or false
			if isBigTent then 
			
			local gearName = "Обыскать ("..(GetRealVehicleName(getElementData(col,"parent")) or "Большая палатка")..")"
			else
			local smalltent = getElementData(col,"tent") or false
			if smalltent then
			local gearName = "Обыскать ("..(GetRealVehicleName(getElementData(col,"parent")) or "Палатка")..")"
			else
			local gearName = "Обыскать ("..(GetRealVehicleName(getElementData(col,"parent")) or "Транспортное средство")..")"
			end
			end
			refreshLoot(col,gearName)
			showInventoryManual()
		triggerEvent("PlaySoundDayZ",localPlayer,"InventoryOpen",0,4)
			return
			end
		end--------------------------------------------------------------------------------------

		
		if itemName == "repairvehicle" then
			triggerServerEvent("repairVehicle",localPlayer,parent)
			triggerEvent("PlaySoundDayZ",localPlayer,"repairVehicle",0,2)
			disableMenu()
			return
		end
		
		
		
	
		if itemName == "removesave" then
			triggerServerEvent("removeSave",localPlayer,parent)
			disableMenu()
			return
		end
		
		if itemName == "removetent" then
			triggerServerEvent("removeTent",localPlayer,parent,"Палатка")
			triggerEvent("PlaySoundDayZ",localPlayer,"removeTent",0,0)
			disableMenu()
			return
		end
		
		if itemName == "removebigtent" then
			triggerServerEvent("removeTent",localPlayer,parent,"Большая палатка")
			triggerEvent("PlaySoundDayZ",localPlayer,"removeTent",0,0)
			disableMenu()
			return
		end
		
		if itemName == "removeadmintent" then
			triggerServerEvent("removeTent",localPlayer,parent,false)
			triggerEvent("PlaySoundDayZ",localPlayer,"removeTent",0,0)
			disableMenu()
			return
		end
		
		if itemName == "fireplace" then
			triggerServerEvent("addPlayerCookMeat",localPlayer,localPlayer,1)
			disableMenu()
			return
		end
		
		if itemName == "fireplace1" then
			triggerServerEvent("addPlayerCookMeat",localPlayer,localPlayer,2)
			disableMenu()
			return
		end
		
		--if itemName == "goold" then
		--	triggerServerEvent("addPlayerGoold",localPlayer)
		--	disableMenu()
		--	return
		--end
		
		if itemName == "bandage" then
			triggerServerEvent("onPlayerGiveMedicObject",localPlayer,itemName,parent)
			triggerEvent("PlaySoundDayZ",localPlayer,"Bandage",0,3)
			disableMenu()
			return
		end
		
		if itemName == "inviteToGroup" then
			local group = getElementData(localPlayer,"group") or false
			if not group then
			disableMenu()
			return
			end
			triggerServerEvent("invitePlayer",localPlayer,group,parent,2)
			disableMenu()
			return
		end
			
		if itemName == "giveblood" then
		--outputChatBox("awdawd: ")
			triggerServerEvent("onPlayerGiveMedicObject",localPlayer,itemName,parent)
			triggerEvent("PlaySoundDayZ",localPlayer,"Bloodbag",0,0)
			disableMenu()
			return
		end
		
		if itemName == "offerExc" then
		--outputChatBox("awdawd: ")
			triggerServerEvent("offerExc",localPlayer,parent)
			disableMenu()
			return
		end
		
		
		
		
		if itemName == "givemorph" then
			triggerServerEvent("onPlayerGiveMedicObject",localPlayer,itemName,parent)
			triggerEvent("PlaySoundDayZ",localPlayer,"Morphine",0,0)
			disableMenu()
			return
		end
		
		if itemName == "giveobezb" then
			triggerServerEvent("onPlayerGiveMedicObject",localPlayer,itemName,parent)
			triggerEvent("PlaySoundDayZ",localPlayer,"Painkiller",0,3)
			disableMenu()
			return
		end
		
		if itemName == "dead" then
			local gearName = "Обыскать ("..getElementData(col,"playername")..")"
			refreshLoot(col,gearName)
			playerInCol = getElementData(col,"PlayerInCol")
			if playerInCol then
			if getElementType(playerInCol) == "player"  then
			if playerInCol ~= localPlayer then
			disableMenu()
			return
			end
			end
			end
			showInventoryManual()
			triggerEvent("PlaySoundDayZ",localPlayer,"InventoryOpen",0,4)
			disableMenu()
			return
		end
		
		if itemName == "deadreason" then
			outputChatBox(getElementData(col,"deadreason"),255,255,255,true)
			disableMenu()
			return
		end
		
		if itemName == "deadbury" then
			triggerServerEvent("deadbury",localPlayer,localPlayer,col)
			disableMenu()
			return
		end
		
		if itemName == "zombieR" then
			destroyElement(col)
			destroyElement(parent)
			triggerServerEvent("zombieR",localPlayer,localPlayer,col)
			disableMenu()
			return
		end
		
		if itemName == "patrolstation" then
			setElementData(localPlayer,"Пустая Канистра",(getElementData(localPlayer,"Пустая Канистра") or 0)-1) --server
			setElementData(localPlayer,"Galão de Combútivel Completo",(getElementData(localPlayer,"Galão de Combútivel Completo") or 0)+1) --server
			triggerEvent ("displayClientInfo",localPlayer,"Станция заправки","Вы заправили одну канистру!",22,255,0)
			disableMenu()
			return
		end
		
		if itemName == "upwater" then
			setElementData(localPlayer,"Пустая Фляга",(getElementData(localPlayer,"Пустая Фляга") or 0)-1) --server
			setElementData(localPlayer,"Полная Фляга",(getElementData(localPlayer,"Полная Фляга") or 0)+1) --server
			triggerEvent ("displayClientInfo",localPlayer,"Станция заправки","Вы наполнили флягу!",22,255,0)
			disableMenu()
			return
		end
		
		if itemName == "treepos" then
			triggerServerEvent("firewood",localPlayer,localPlayer,col)
			disableMenu()
			return
		end

			if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots()+PlusSlots() then	
			local col = getElementData(localPlayer,"currentCol")
			
			if not getElementData(col,"user") then

			setElementData(col,"user",localPlayer)
			return
			else
			if getElementData(col,"user") == localPlayer then
			else
			outputChatBox("Вы не можете подобрать этот предмет!")
			return
			end
			end
			
			
			
		
		
		itemPlus = 1
for i,weaponData in ipairs(weaponAmmoTable["Weapons"]) do
if itemName == weaponData[3] then
itemPlus = weaponData[5] 
break
end
end	
for i,weaponData in ipairs(weaponAmmoTable["others"]) do
if weaponData[3] then
if itemName == weaponData[3] then
itemPlus = weaponData[5] 
break
end
end
end	
if getElementData(col,"plus") then
if itemPlus > getElementData(col,"plus") then
	itemPlus = getElementData(col,"plus")
	end
end
		trigger = 	triggerServerEvent("onPlayerTakeItemFromGround",localPlayer,itemName,col,itemPlus)
				disableMenu()
			if trigger then
	unbindOnLootGr("unbind")
	setTimer(function()
	unbindOnLootGr("bind")
	end,2000,1)
	  end	
			else
				startRollMessage2("Инвентарь", "Этот предмет весит "..getItemSlots(itemName).."кг!", 255, 22, 0 )
			end
	end
end
bindKey ( "mouse3", "down", onPlayerPressMiddleMouse )
bindKey ( "-", "down", onPlayerPressMiddleMouse )

function unbindOnLootGr(state)
if (state=="unbind") then 
unbindKey("/")
unbindKey(",")
unbindKey(".")
unbindKey("mouse3","down")
unbindKey("-","down")
elseif (state=="bind") then 
bindKey("/","down",bindTheKeys)
bindKey(",","down",bindTheKeys)
bindKey(".","down",bindTheKeys)
bindKey ( "mouse3", "down", onPlayerPressMiddleMouse )
bindKey ( "-", "down", onPlayerPressMiddleMouse )
end
end

local keysOK = true

function bindTheKeys (key,state)
if keysOK then
keysOK = false
if key =="/" then
triggerServerEvent("PlayerActions",localPlayer,localPlayer,"greeting")
elseif key =="," then
triggerServerEvent("PlayerActions",localPlayer,localPlayer,"funcBindHandsup")
elseif key =="." then
triggerServerEvent("PlayerActions",localPlayer,localPlayer,"funcBindSit")
end
setTimer(function()
keysOK = true
end,2000,1)
else
outputChatBox("Не нажимайте слишком часто")
end
end
bindKey("/","down",bindTheKeys)
bindKey(",","down",bindTheKeys)
bindKey(".","down",bindTheKeys)


saveWindows = guiCreateWindow(500, 450, 200, 100, "Открыть сейф", false) 
guiSetVisible(saveWindows, false)
function openSave(col)

 if guiGetVisible (saveWindows) then 
 return
 else  
 
 local isHackSave = getElementData(col,"hackSave") or false

if isHackSave then
refreshLoot(col,"Сейф")
showInventoryManual()
showCursor(true)
return
end

 showCursor(not isCursorShowing()) 
guiSetVisible(saveWindows, true)
centerWindow(saveWindows)
editBox = guiCreateEdit( 50, 40, 100, 20, "", false,saveWindows )
guiEditSetMaxLength  (  editBox, 4 )
guiEditSetMasked (  editBox, true )
    buttonOK = guiCreateButton(35, 70, 60, 20, "Ок", false,saveWindows)
buttonCANCEL = guiCreateButton(110, 70, 60, 20, "Отмена", false,saveWindows)
end

addEventHandler ( "onClientGUIClick", buttonOK,function() 
if guiGetText (editBox) == getElementData(col,"pass") then
refreshLoot(col,"Сейф")
showInventoryManual()
showCursor(not isCursorShowing())
 guiSetVisible(saveWindows, false)
 else
 outputChatBox("Неверный пароль")
 end
 end,false)
 
addEventHandler ( "onClientGUIClick", buttonCANCEL,function() 
 guiSetVisible(saveWindows, false)
 showCursor(false)

 end,false)

end


function autoPatrolStantionAction(act)
local economist = getElementData(localPlayer,"progress.economist") or 0
veh = getPedOccupiedVehicle(localPlayer)
if act ==1 then
 health = getElementHealth ( veh )
local cena = math.floor((1000-health)*3)
 local cena1 = cena - cena*(economist*0.9)/100
 
text = "Вы действительно хотите починить "..( GetRealVehicleName(veh) or "транспортное средство").." ? \nЦена:"..math.floor(cena1)
elseif act ==2 then
maxfuel = getElementData(veh,"maxfuel") or 0 
fuel = getElementData(getElementData(veh,"parent"),"fuel") or 0 
local cena = math.floor((maxfuel-fuel)*10)
 local cena1 = cena - cena*(economist*0.9)/100
text = "Вы действительно хотите полностью заправить "..(GetRealVehicleName(veh) or "транспортное средство" ).." ? \nЦена:"..math.floor(cena1)..""
end


 if guiGetVisible (saveWindows) then 
 return
 else  showCursor(not isCursorShowing()) 
saveWindows = guiCreateWindow(300, 450, 600, 100, "Станция заправки", false) 
centerWindow(saveWindows)
local labl  = guiCreateLabel ( 0, 23, 600, 100, text, false, saveWindows )
guiLabelSetHorizontalAlign (labl,"center")
    buttonOK = guiCreateButton(200, 70, 60, 20, "Да", false,saveWindows)
buttonCANCEL = guiCreateButton(350, 70, 60, 20, "Отмена", false,saveWindows)
end

addEventHandler ( "onClientGUIClick", buttonOK,function() 
if not isPedInVehicle(localPlayer) then
outputChatBox("Вы не в машине!")

 guiSetVisible(saveWindows, false)
 showCursor(false)
 setCursorPosition (0, 0)
return
end

 if act == 1 then
local economist = getElementData(localPlayer,"progress.economist") or 0
 local cena = math.floor((1000-health)*3)
 cena = cena - (cena*(economist*0.9)/100)
 if (getElementData(localPlayer,"Деньги") or 0) >= cena then 
 setElementData(localPlayer,"Деньги",(getElementData(localPlayer,"Деньги") or 0)-math.floor((1000-health)*3))
 setElementHealth(veh,1000)
 outputChatBox(""..(GetRealVehicleName(veh) or "Транспортное средство").." был  поолностью восстановлен!")
 else
 outputChatBox("У вас не хватает денег!")
 end
 end
 
  if act == 2 then
   local cena = math.floor((maxfuel-fuel)*10)
 cena = cena - (cena*(economist*0.9)/100)
 if (getElementData(localPlayer,"Деньги") or 0) >= cena then 
 setElementData(localPlayer,"Деньги",(getElementData(localPlayer,"Деньги") or 0)-math.floor((maxfuel-fuel)*10))
 setElementData(getElementData(veh,"parent"),"fuel",maxfuel)
 outputChatBox(""..( GetRealVehicleName(veh) or "Транспортное средство").." был  поолностью заправлен!")
 else
 outputChatBox("У вас не хватает денег!")
 end
 end
 
 guiSetVisible(saveWindows, false)
 showCursor(false)
 setCursorPosition (0, 0)
 end,false)
 
addEventHandler ( "onClientGUIClick", buttonCANCEL,function() 
 guiSetVisible(saveWindows, false)
 showCursor(false)
 setCursorPosition (0, 0)

 end,false)

end


local SELLPRICECAR = {
{ "UH-60 Black Hawk",1400000,417 },
{ "Экскурсионный вертолёт",900000,488 },
{ "Chevrolet Suburban FBI",660000,490 },
{ "Zombie chopper",400000,463 },
{ "BMW M3 E36",500000,422 },
{ "Hummer H1",770000,470 },
{ "Dodge Challenger 1971",720000,542 },
{ "AM General М-939A2",540000,433 },
{ "Robinson R44 Raven II NC",1500000,487 },
{ "Police Maverick",1700000,497 },
{ "Ford Mustang Sandroadster",500000,424 },
{ "Oshkosh SandCat",680000,528 },
{ "Subaru Impreza WRX STI",880000,402 },
--{ "Shamal",519,900000 },
{ "McLaren MP4-12c",1000000,541 },
{ "Chevrolet Camaro SS 1968",890000,602 },
{ "Phoenix",840000,603 },
--{ "Reefer",453,200000 },
--{ "Mercedes-Benz E63",950000,516 },
--{ "Топливо",584,600000 },
--{ "Прицеп",591,650000 },
{ "Kenworth W 900L",970000,403 },
{ "Bati MIX",670000,461 },
{ "Malice",940000,504 },
{ "Ambulance",610000,416 },
{ "БРДМ 2",990000,601 },
{ "Plymouth Roadrunner RM23",980000,536 },
{ "Kawasaki 150 SE",420000,468 },
{ "ATV",380000,471 },
{ "Jeep Wrangler",620000,500 },
{ "MBB Bo-105",980000,469 },
{ "Robinson R44 Clipper",1100000,447 },
{ "MH-X Silenthawk",1200000,563 },
{ "Frontline",520000,428 },
{ "Ford Crown Victoria Police",900000,596 },
{ "BMX",20000,481 },
{ "Bike",10000,509 },
{ "Mountain Bike",30000,510 },
{ "Dodge Challenger 440",1600000,411}
}


function autoTradeAction(act)
local economist = getElementData(localPlayer,"progress.economist") or 0
veh = getPedOccupiedVehicle(localPlayer)
if act ==1 then
if getElementData(veh,"owner") == getElementData(localPlayer,"userAccount") then
 	for i,car in ipairs(SELLPRICECAR) do
	local modelCar = getElementModel(veh)
		if car[3] == modelCar then
			carSellPrice = car[2]
		end
	end
 
 
text = "Вы действительно хотите продать "..(GetRealVehicleName(veh) or "Транспортное средство").." ? \nЦена продажи:"..math.floor(carSellPrice/2+(carSellPrice/2)*(economist*0.5)/100)
end
end


 if guiGetVisible (saveWindows) then 
 return
 else  showCursor(not isCursorShowing()) 
saveWindows = guiCreateWindow(300, 450, 600, 100, "Торговец: транспорт", false) 
centerWindow(saveWindows)
local labl  = guiCreateLabel ( 0, 23, 600, 100, text, false, saveWindows )
guiLabelSetHorizontalAlign (labl,"center")
    buttonOK = guiCreateButton(200, 70, 60, 20, "Да", false,saveWindows)
buttonCANCEL = guiCreateButton(350, 70, 60, 20, "Отмена", false,saveWindows)
end

addEventHandler ( "onClientGUIClick", buttonOK,function() 
if not isPedInVehicle(localPlayer) then
outputChatBox("Вы не в машине!")

 guiSetVisible(saveWindows, false)
 showCursor(false)
 setCursorPosition (0, 0)
return
end

 if act == 1 then
 veh = getPedOccupiedVehicle(localPlayer)
if getElementData(veh,"owner") == getElementData(localPlayer,"userAccount") then
 
 if getElementData(getRootElement(),"checkPing") and getPlayerPing(localPlayer)  < gameplayVariables["pingMAX"] then
 local traded = getElementData(veh,"traded") or false
 if traded then 
 return
 end
 setElementData(veh,"traded",true,false)
triggerServerEvent("sellCar",localPlayer,veh)
setElementData(localPlayer,"Деньги",(getElementData(localPlayer,"Деньги") or 0)+math.floor(carSellPrice/2+(carSellPrice/2)*(economist*0.5)/100))
 outputChatBox("Вы продали "..(GetRealVehicleName(veh) or "транспортное средство").." за "..math.floor(carSellPrice/2+(carSellPrice/2)*(economist*0.5)/100))
else
startRollMessage2("Инвентарь", "Пинг превышает норму!", 255, 22, 0 )
		end
else
outputChatBox("Это не ваша машина")
 end
 end
 
 
 guiSetVisible(saveWindows, false)
 showCursor(false)
 setCursorPosition (0, 0)
 end,false)
 
addEventHandler ( "onClientGUIClick", buttonCANCEL,function() 
 guiSetVisible(saveWindows, false)
 showCursor(false)
 setCursorPosition (0, 0)

 end,false)

end


addEventHandler("onClientVehicleExit", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == localPlayer then
            if getElementData(localPlayer,"inAutoPatrilStantion") or getElementData(localPlayer,"inTraderCar") or getElementData(localPlayer,"inCarMechanicGarage")  then
	showClientMenuItem("stop")
	setElementData(localPlayer,"loot",false,false)
	setElementData(localPlayer,"currentCol",false,false)
	setNewbieInfo (false,"","")
	setShowItemIcon(false,"")
	isInFirePlace = false
	setElementData(localPlayer,"inAutoPatrilStantion",nil) 
	setElementData(localPlayer,"inTraderCar",nil) 
	setElementData(localPlayer,"inCarMechanicGarage",nil)
			end
        end
    end
)


function unbindOnReloot()
unbindKey("mouse3","down")
unbindKey("-","down")
outputChatBox("Средняя кнопка мыши была отключена")
end
addEvent("onClientUnBind",true)
addEventHandler("onClientUnBind",getRootElement(),unbindOnReloot)





function bindOffReloot()
bindKey ( "mouse3", "down", onPlayerPressMiddleMouse )
bindKey ( "-", "down", onPlayerPressMiddleMouse )
		outputChatBox("Средняя кнопка мыши  кнопка была включена")
end

function bindOffRelootTimer()

setTimer(bindOffReloot,60000,1)

end
addEvent("onClientBind",true)
addEventHandler("onClientBind",getRootElement(),bindOffRelootTimer)













function getMenuMarkedItem() 
	for i,guiItem in ipairs(spalteGuiText) do
		if getElementData(guiItem,"markedMenuItem") then
			return getElementData(guiItem,"usedItem") 
		end
	end
end


function playerPressedKey(button, press)
    if (button) then
		

			if  button ~="mouse3" and button ~="-" and press then

				triggerServerEvent("onClientMovesWhileAnimation",localPlayer,localPlayer)
				rapireStopVH()
			end	
		end
    end


function rapireVH(player) 

if source == localPlayer then

addEventHandler("onClientKey", root, playerPressedKey)
end
end
addEvent("rapireVH",true)
addEventHandler("rapireVH",getRootElement(),rapireVH)



function rapireStopVH(player) 
if source == localPlayer then
removeEventHandler("onClientKey", root, playerPressedKey) 	
end
end
addEvent("rapireStopVH",true)
addEventHandler("rapireStopVH",getRootElement(),rapireStopVH)





function vehDetals(act,col,detal)
local car = getElementData(col,"parent") or false
local model = getElementModel(car)
if act == 1  then
if not getElementData(car,"kowh") then
for theKey,datas in ipairs(VehDetals) do
		if model == datas[1]  then
		if detal == "kowh1" then
		local kowh1 = getElementData(localPlayer,"Металлический ковш 1") or 0
		if kowh1 >=1 then
		setElementData(localPlayer,"Металлический ковш 1",kowh1-1)
triggerServerEvent("VehDetals",localPlayer,car,col,2704,datas[2].size,datas[2][1],datas[2][2],datas[2][3],datas[2][4],datas[2][5],datas[2][6],"Металлический ковш 1")
else
outputChatBox("У вас нет этой детали")
end
		elseif detal == "kowh2" then
		local kowh2 = getElementData(localPlayer,"Металлический ковш 2") or 0
		if kowh2 >=1 then
		setElementData(localPlayer,"Металлический ковш 2",kowh2-1)
triggerServerEvent("VehDetals",localPlayer,car,col,2705,datas[3].size,datas[3][1],datas[3][2],datas[3][3],datas[3][4],datas[3][5],datas[3][6],"Металлический ковш 2")
else
outputChatBox("У вас нет этой детали")
end
		end
		end
	end
end
end

if act == 2  then

if getElementData(car,"kowh") then
local kowh = getElementData(car,"kowh") or false
triggerServerEvent("VehDetalsDestr",localPlayer,car,kowh)	
end
end

end


function vehicleAction(act,col)
if getPlayerCurrentSlots() < getElementData(localPlayer,"MAX_Slots")+PlusSlots() then
local whinVh = getElementData(col,"Колесо_inVehicle")
local whinUser = getElementData(localPlayer,"Колесо") or 0
local enginVh = getElementData(col,"Мотор_inVehicle")
local enginUser = getElementData(localPlayer,"Мотор") or 0
local fuelVh = getElementData(col,"fuel")
local fuelUser = getElementData(localPlayer,"Galão de Combútivel Completo") or 0
if act == 1 and whinVh >=1  then
setElementData(col,"Колесо_inVehicle",whinVh-1) --server
setElementData(localPlayer,"Колесо",whinUser+1) --server
triggerServerEvent("setWheelStates2",localPlayer,getElementData(col,"parent"),whinVh-1,"-")
end
if act == 2 and enginVh >=1 then

setElementData(col,"Мотор_inVehicle",enginVh-1) --server
setElementData(localPlayer,"Мотор",enginUser+1) --server
end

if act == 3  then

setElementData(col,"fuel",fuelVh-20) --server
setElementData(localPlayer,"Galão de Combútivel Completo",fuelUser+1) --server
setElementData(localPlayer,"Пустая Канистра",(getElementData(localPlayer,"Пустая Канистра") or 0)-1) --server
end

if act == 4  then
local maxFuel= getElementData(getElementData(col,"parent"),"maxfuel") or 0
if getElementData(col,"fuel")+20 < tonumber(maxFuel) then

	setElementData(col,"fuel",getElementData(col,"fuel")+20) --server
	setElementData(localPlayer,"Galão de Combútivel Completo",(getElementData(localPlayer,"Galão de Combútivel Completo") or 0)-1) --server
	setElementData(localPlayer,"Пустая Канистра",(getElementData(localPlayer,"Пустая Канистра") or 0)+1) --server
	triggerEvent ("displayClientInfo", localPlayer,"Транспортное средство","Бензин был залит в бак!",0,255,0)

else
triggerEvent ("displayClientInfo", localPlayer,"Транспортное средство","Бак заполнен!",255,0,0)
end

end

if act == 5  then
local car = getElementData(col,"parent") or false
if not car then return end 
local steelList= getElementData(car,"steelList") or 0
if steelList<1000 then
	if steelList+100 <=1000 then
	setElementData(car,"steelList",steelList+100) --server
	else
	setElementData(car,"steelList",1000) --server
	end
	setElementData(localPlayer,"Стальной лист",(getElementData(localPlayer,"Стальной лист") or 0)-1) --server
	triggerEvent ("displayClientInfo", localPlayer,"Транспортное средство","Стальной лист был установлен!",0,255,0)

else
return
end

end

else
outputChatBox("Рюкзак переполнен")
end

end

function standInWater() -- функция проверяет находится ли игрок на береге 
  if isPedOnGround(localPlayer) then
        local px, py, pz = getElementPosition(localPlayer)
        if testLineAgainstWater(px, py, pz+1, px, py, pz - 2) then
            return true
        else
            return false
        end
    end
	return false
end

timerFish = nil
function fishing(act)
if  getElementData(localPlayer,"fishing") then

if act =="start" then
randTimer = math.random(30000,120000)
if isTimer(timerFish) then 
killTimer(timerFish)
end
timerFish = setTimer(function() 
if  getElementData(localPlayer,"fishing") then
outputChatBox("Клюёт!")
setElementData(localPlayer,"checkFishing",false,false)
showClientMenuItem("checkFishing")
else
return
end
end,randTimer,1)

elseif act =="check" then
checkKeysStop()
			local matFsh = math.random(1,5)
			if matFsh == 1 or matFsh == 2 or matFsh == 3  then
			
local curslots = getElementData(localPlayer,"current_SLOTS") or 0
local maxslots = getElementData(localPlayer,"MAX_Slots") or 0
if curslots+1 >= maxslots+PlusSlots() then
triggerEvent ("displayClientInfo",localPlayer,"Рыбалка","В рюкзаке не хватает места!",255,0,0)
return
end	
			
			outputChatBox("Вы поймали 1 рыбу")
			local riba = getElementData(localPlayer,"Сырая рыба") or 0 
			setElementData(localPlayer,"Сырая рыба",riba+1)
			--setElementData(localPlayer,"Наживка",getElementData(localPlayer,"Наживка") -1)
			--elseif matFsh == 4 then
			--outputChatBox("Снасти порвались!")
			--setElementData(localPlayer,"Снасти",getElementData(localPlayer,"Снасти") -1)
			--setElementData(localPlayer,"Наживка",getElementData(localPlayer,"Наживка") -1)
			elseif matFsh == 4 or matFsh == 5 then 
			outputChatBox("Рыба сорвалась!")
			--setElementData(localPlayer,"Наживка",getElementData(localPlayer,"Наживка")-1)
			end


end
else
return
end
end


function checkKeyState(butt,press)
if butt ~= "mouse3" and butt ~= "1" then
if isTimer(timerFish) then 
killTimer(timerFish)
end
		triggerServerEvent("startFishing",localPlayer,localPlayer,"stop")
			disableMenu()
			checkKeysStop()
			showClientMenuItem("startFishing")
			end
end 
function checkKeysStart()
if  getElementData(localPlayer,"fishing") then
checkKeysStop()
addEventHandler("onClientKey", root, checkKeyState)
addEventHandler("onClientPlayerDamage", root, checkKeyState)
else
return
end
end 
function checkKeysStop()
removeEventHandler("onClientKey", root, checkKeyState)
removeEventHandler("onClientPlayerDamage", root, checkKeyState) 	

end 




 
 
 
 function handleInterrupt( status, ticks )
	if (status == 0) then
		setElementData(localPlayer,"networkStatus",true,false)

	elseif (status == 1) then
		setElementData(localPlayer,"networkStatus",false,false)

	end
end
addEventHandler( "onClientPlayerNetworkStatus", root, handleInterrupt)















local timerUnbug= nil
local unbugWindow = guiCreateWindow(0, 0, 200, 200, "UNBUG", false) 	
local cancelUnbug = guiCreateButton(200/2-70/2, 150, 70, 30, "Отменить", false,unbugWindow)
--local bebasFont = guiCreateFont  (  "BEBAS", 30  )
guiCreateLabel(10, 50, 200, 60,"Дождитесь окончания таймера",false,unbugWindow)
local lableTimer = guiCreateLabel(0, 100, 200, 60,"0:00",false,unbugWindow)
 --guiSetFont ( lableTimer, bebasFont )
 guiLabelSetColor  (  lableTimer, 255, 0, 0 )
guiLabelSetHorizontalAlign (lableTimer,"center")
centerWindow(unbugWindow)
guiSetVisible(unbugWindow,false)

function cancelUnbugFunc()
killTimer(timerUnbug)
showCursor(false)
guiSetVisible(unbugWindow,false)
end
addEventHandler ( "onClientGUIClick", cancelUnbug,cancelUnbugFunc,false)

function unbugCommanmd()
if isTimer(timerUnbug) then
killTimer(timerUnbug)
timerUnbug=nil
end
 timerSec = 60
 guiSetText(lableTimer,roundTimeSec(timerSec))
 timerUnbug = setTimer(function() 
guiSetText(lableTimer,roundTimeSec(timerSec))
 if timerSec>0 then
if not isCursorShowing ( ) then
showCursor(true)
end
	timerSec=timerSec-1
	else
	guiSetVisible(unbugWindow,false)
	timerUnbug=nil
	triggerServerEvent("spawnATDPlayer",localPlayer,localPlayer,false,true)
	showCursor(false)
	end
 
end,1000,tonumber(timerSec+1))

guiSetVisible(unbugWindow,true)

end

addCommandHandler ( "unbug", unbugCommanmd )



function checkPlayerUnderWaterBug()


  if isPedOnGround(localPlayer) then
        local px, py, pz = getElementPosition(localPlayer)
        if testLineAgainstWater(px, py, pz+10, px, py, pz +500) then
           triggerServerEvent("spawnATDPlayer",localPlayer,localPlayer,false,true)
        end
    end
end
setTimer(checkPlayerUnderWaterBug,10000,0)

