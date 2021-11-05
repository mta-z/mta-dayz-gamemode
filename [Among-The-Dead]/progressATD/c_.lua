
local headline = {}
local gridlistItems = {}
local buttonItems = {}


function getTextHeight(sText)	 
	 sLength = 0 
for k, v in string.gmatch  (sText, "(\r?\n)") do
           sLength =sLength+1
         end
		 
return sLength
		
end

function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    guiSetPosition(center_window, x, y, false)
end


inventoryWindows = guiCreateWindow(0, 0,750, 520, "Навыки", false) 
guiWindowSetSizable ( inventoryWindows, false )
centerWindow(inventoryWindows)

local tabPanel = guiCreateTabPanel ( 0, 25, 750, 500, false, inventoryWindows )
local tab1 = guiCreateTab( "Навыки", tabPanel )
local tab2 = guiCreateTab( "Статистика", tabPanel )
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
    function ( startedRes )
 headline["ochko1_img"] = guiCreateStaticImage ( 1, 10, 730, 17, "gray.png", false, tab2 )
headline["ochko1"] = guiCreateLabel(5, 0, 750, 100,"Свободно очков навыков",false,headline["ochko1_img"])
headline["ochko1_t"] = guiCreateLabel(0, 0, 725, 100,"-",false,headline["ochko1_img"])
guiSetFont (headline["ochko1"] , "default-bold-small" )
guiSetFont (headline["ochko1_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko1_t"],"right")


 headline["ochko2_img"] = guiCreateStaticImage ( 1, 30, 730, 17, "gray.png", false, tab2 )
headline["ochko2"] = guiCreateLabel(5, 0, 750, 100,"Потрачено очков навыков",false,headline["ochko2_img"])
headline["ochko2_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko2_img"])
guiSetFont (headline["ochko2"] , "default-bold-small" )
guiSetFont (headline["ochko2_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko2_t"],"right")

 headline["ochko3_img"] = guiCreateStaticImage ( 1, 60, 730, 17, "gray.png", false, tab2 )
headline["ochko3"] = guiCreateLabel(5, 0, 750, 100,"Уровень",false,headline["ochko3_img"])
headline["ochko3_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko3_img"])
guiSetFont (headline["ochko3"] , "default-bold-small" )
guiSetFont (headline["ochko3_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko3_t"],"right")

 headline["ochko4_img"] = guiCreateStaticImage ( 1, 80, 730, 17, "gray.png", false, tab2 )
headline["ochko4"] = guiCreateLabel(5, 0, 750, 100,"Опыт",false,headline["ochko4_img"])
headline["ochko4_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko4_img"])
guiSetFont (headline["ochko4"] , "default-bold-small" )
guiSetFont (headline["ochko4_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko4_t"],"right")

 headline["ochko5_img"] = guiCreateStaticImage ( 1, 100, 730, 17, "gray.png", false, tab2 )
headline["ochko5"] = guiCreateLabel(5, 0, 750, 100,"Опыт следующего уровня",false,headline["ochko5_img"])
headline["ochko5_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko5_img"])
guiSetFont (headline["ochko5"] , "default-bold-small" )
guiSetFont (headline["ochko5_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko5_t"],"right")

headline["ochko6_img"] = guiCreateStaticImage ( 1, 130, 730, 17, "gray.png", false, tab2 )
headline["ochko6"] = guiCreateLabel(5, 0, 750, 100,"Максимум убито зомби за один раз",false,headline["ochko6_img"])
headline["ochko6_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko6_img"])
guiSetFont (headline["ochko6"] , "default-bold-small" )
guiSetFont (headline["ochko6_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko6_t"],"right")

headline["ochko7_img"] = guiCreateStaticImage ( 1, 150, 730, 17, "gray.png", false, tab2 )
headline["ochko7"] = guiCreateLabel(5, 0, 750, 100,"Максимум убито игроков за один раз",false,headline["ochko7_img"])
headline["ochko7_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko7_img"])
guiSetFont (headline["ochko7"] , "default-bold-small" )
guiSetFont (headline["ochko7_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko7_t"],"right")

headline["ochko8_img"] = guiCreateStaticImage ( 1, 170, 730, 17, "gray.png", false, tab2 )
headline["ochko8"] = guiCreateLabel(5, 0, 750, 100,"Максимум убито мародёров за один раз",false,headline["ochko8_img"])
headline["ochko8_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko8_img"])
guiSetFont (headline["ochko8"] , "default-bold-small" )
guiSetFont (headline["ochko8_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko8_t"],"right")

headline["ochko9_img"] = guiCreateStaticImage ( 1, 190, 730, 17, "gray.png", false, tab2 )
headline["ochko9"] = guiCreateLabel(5, 0, 750, 100,"Максимум прожито за один раз",false,headline["ochko9_img"])
headline["ochko9_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko9_img"])
guiSetFont (headline["ochko9"] , "default-bold-small" )
guiSetFont (headline["ochko9_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko9_t"],"right")

headline["ochko10_img"] = guiCreateStaticImage ( 1, 220, 730, 17, "gray.png", false, tab2 )
headline["ochko10"] = guiCreateLabel(5, 0, 750, 100,"Убито зомби за все время игры",false,headline["ochko10_img"])
headline["ochko10_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko10_img"])
guiSetFont (headline["ochko10"] , "default-bold-small" )
guiSetFont (headline["ochko10_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko10_t"],"right")

headline["ochko11_img"] = guiCreateStaticImage ( 1, 240, 730, 17, "gray.png", false, tab2 )
headline["ochko11"] = guiCreateLabel(5, 0, 750, 100,"Убито игроков за все время игры",false,headline["ochko11_img"])
headline["ochko11_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko11_img"])
guiSetFont (headline["ochko11"] , "default-bold-small" )
guiSetFont (headline["ochko11_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko11_t"],"right")

headline["ochko12_img"] = guiCreateStaticImage ( 1, 260, 730, 17, "gray.png", false, tab2 )
headline["ochko12"] = guiCreateLabel(5, 0, 750, 100,"Убито мародёров за все время игры",false,headline["ochko12_img"])
headline["ochko12_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko12_img"])
guiSetFont (headline["ochko12"] , "default-bold-small" )
guiSetFont (headline["ochko12_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko12_t"],"right")

headline["ochko13_img"] = guiCreateStaticImage ( 1, 280, 730, 17, "gray.png", false, tab2 )
headline["ochko13"] = guiCreateLabel(5, 0, 750, 100,"Прожито за все время игры",false,headline["ochko13_img"])
headline["ochko13_t"] = guiCreateLabel(0, 0, 725, 17,"-",false,headline["ochko13_img"])
guiSetFont (headline["ochko13"] , "default-bold-small" )
guiSetFont (headline["ochko13_t"] , "default-bold-small" )
guiLabelSetHorizontalAlign (headline["ochko13_t"],"right")
end
)

guiSetAlpha(inventoryWindows,0.7)
guiSetVisible(inventoryWindows,false )
local img = {}
local img2 ={}
local img3 ={}
local img4 ={}
local img5 ={}
local img6 ={}
local img7 ={}
local img8 ={}

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
    function ( startedRes )
--local img = {}
local pos1 = 70

headline["attack_plane"] = guiCreateLabel(0, 15, 750, 100,"Штурмовик",false,tab1)
guiSetFont (headline["attack_plane"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["attack_plane"],"center")

headline["attack_planeProgress"] = guiCreateLabel(20, 35, 50, 40,"0/100",false,tab1)
guiSetFont (headline["attack_planeProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["attack_planeProgress"],"center")

	
	
  for i=1,100,1 do 
  pos1 =pos1+ 6
 img[i] = guiCreateStaticImage ( pos1, 35, 5, 20, "prgsBar.nil.png", false, tab1 )


  
addEventHandler( "onClientMouseEnter", img[i], 
    function(aX, aY)
		local posx,posy = guiGetPosition(img[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		
		guiMoveToBack(inventoryWindows)
		guiSetText(headline["toolTipText"],i.."/100")
		
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Урон штурмового оружия +"..(i*30).."\nПереносимый вес +"..(i*0.2).."кг\nТопор")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)
		guiSetVisible(toolTip,true )
		
		
	--	guiMoveToBack(toolTip)
		guiSetSize(img[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img[i], 
    function(aX, aY)
	guiSetVisible(toolTip,false )
	guiMoveToBack(toolTip)
	local attack_plane = getElementData(getLocalPlayer(),"progress.attacker") or 0
	if attack_plane<i then
       guiSetSize(img[i],5,20,false)
    else
	guiSetSize(img[i],5,25,false)
	end
	end,false)	

  end
  
  
  
local attack_planePlus= guiCreateStaticImage ( 690, 35, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", attack_planePlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( attack_planePlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", attack_planePlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( attack_planePlus, "plus.png" )
    end,false) 
 
addEventHandler( "onClientGUIClick", attack_planePlus, 
    function()
	local attack_plane = getElementData(getLocalPlayer(),"progress.attacker") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	
	if attack_plane >= 100 then return end
	--outputChatBox("click")
	guiSetText(headline["attack_planeProgress"],(attack_plane+1).."/100")
       reloadATDProgressBar(img,attack_plane,attack_plane+1)
	    setElementData(getLocalPlayer(),"progress.attacker",attack_plane+1)
    end,false) 


  --local img2 ={}
    local pos2 = 70

headline["medik"] = guiCreateLabel(0, 70, 750, 100,"Медик",false,tab1)
guiSetFont (headline["medik"] , "default-bold-small" )   
guiLabelSetHorizontalAlign (headline["medik"],"center")
headline["medikProgress"] = guiCreateLabel(20, 90, 50, 40,"0/100",false,tab1)
guiSetFont (headline["medikProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["medikProgress"],"center")



	
	
  
  for i=1,100,1 do 
	  pos2 =pos2+ 6
  img2[i] = guiCreateStaticImage ( pos2, 90, 5, 20, "prgsBar.nil.png", false, tab1 )

  
  addEventHandler( "onClientMouseEnter", img2[i], 
    function(aX, aY)
	local posx,posy = guiGetPosition(img2[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		guiSetText(headline["toolTipText"],i.."/100")
		guiSetVisible(toolTip,true )
		
			guiMoveToBack(inventoryWindows)
		
		
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин\nВозможность дать Morfina и Analgésico")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин\Kit de Primeiros Socorros")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Увеличение крови +"..(i*60).."ед\nРегенерация +"..(i*3).."ед в мин\nВозможность перелить кровь себе")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)

		
		guiSetSize(img2[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img2[i], 
    function(aX, aY)
	guiSetVisible(toolTip,false )
	guiMoveToBack(toolTip)
	local medik = getElementData(getLocalPlayer(),"progress.medik") or 0
	if medik<i then
       guiSetSize(img2[i],5,20,false)
    else
	guiSetSize(img2[i],5,25,false)
	end
	end,false)	
	
  end
local medikPlus = guiCreateStaticImage ( 690, 90, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", medikPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( medikPlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", medikPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( medikPlus, "plus.png" )
    end,false)   
 addEventHandler( "onClientGUIClick", medikPlus, 
    function()
	local medik = getElementData(getLocalPlayer(),"progress.medik") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	if medik >= 100 then return end
	--outputChatBox("click")
	guiSetText(headline["medikProgress"],(medik+1).."/100")
       reloadATDProgressBar(img2,medik,medik+1)
	   setElementData(getLocalPlayer(),"progress.medik",medik+1)
    end,false) 
  
 local pos3 = 70
local sniper = getElementData(getLocalPlayer(),"progress.sniper") or 0
--local img3 ={};
  headline["sniper"] = guiCreateLabel(0, 125, 750, 100,"Снайпер",false,tab1)
guiSetFont (headline["sniper"] , "default-bold-small" )   
guiLabelSetHorizontalAlign (headline["sniper"],"center")
headline["sniperProgress"] = guiCreateLabel(20, 145, 50, 40,"/0100",false,tab1)
guiSetFont (headline["sniperProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["sniperProgress"],"center")




    for i=1,100,1 do 
	  pos3 =pos3+ 6
 img3[i] = guiCreateStaticImage ( pos3, 145, 5, 20, "prgsBar.nil.png", false, tab1 )

    addEventHandler( "onClientMouseEnter", img3[i], 
    function(aX, aY)
	local posx,posy = guiGetPosition(img3[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		guiSetText(headline["toolTipText"],i.."/100")
		guiSetVisible(toolTip,true )
		
		guiMoveToBack(inventoryWindows)
		
		
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Урон снайперского оружия +"..(i*30).."\nДальность видимости в прицел +"..(i*5).."м")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)
		
		guiSetSize(img3[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img3[i], 
    function(aX, aY)
	
		guiSetVisible(toolTip,false )
	guiMoveToBack(toolTip)
	local sniper = getElementData(getLocalPlayer(),"progress.sniper") or 0
	if sniper<i then
       guiSetSize(img3[i],5,20,false)
    else
	guiSetSize(img3[i],5,25,false)
	end
	end,false)
  
  end
local sniperPlus = guiCreateStaticImage ( 690, 145, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", sniperPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( sniperPlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", sniperPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( sniperPlus, "plus.png" )
    end,false) 
 addEventHandler( "onClientGUIClick", sniperPlus, 
    function()
	local sniper = getElementData(getLocalPlayer(),"progress.sniper") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	if sniper >= 100 then return end
--	outputChatBox("click")
	guiSetText(headline["sniperProgress"],(sniper+1).."/100")
       reloadATDProgressBar(img3,sniper,sniper+1)
	   setElementData(getLocalPlayer(),"progress.sniper",sniper+1)
    end,false) 	
	
	
	
	
	
	
	
	
	
	
	
  local pos4 = 70
local enginer = getElementData(getLocalPlayer(),"progress.enginer") or 0
--local img4 ={};
  headline["enginer"] = guiCreateLabel(0, 180, 750, 100,"Инженер",false,tab1)
guiSetFont (headline["enginer"] , "default-bold-small" )   
guiLabelSetHorizontalAlign (headline["enginer"],"center")
headline["enginerProgress"] = guiCreateLabel(20, 200, 50, 40,"0/100",false,tab1)
guiSetFont (headline["enginerProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["enginerProgress"],"center")




    for i=1,100,1 do 
	  pos4 =pos4+ 6
 img4[i] = guiCreateStaticImage ( pos4, 200, 5, 20, "prgsBar.nil.png", false, tab1 )

    addEventHandler( "onClientMouseEnter", img4[i], 
    function(aX, aY)
	local posx,posy = guiGetPosition(img4[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		guiSetText(headline["toolTipText"],i.."/100")
		guiSetVisible(toolTip,true )
	
	guiMoveToBack(inventoryWindows)
		
		
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг\nУстановка запчастей без инструментов")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг\nСнятие запчастей без инструментов")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Скорость починки тс -"..(i*0.5).."сек\nПереносимый вес +"..(i*0.2).."кг")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)
	
		guiSetSize(img4[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img4[i], 
    function(aX, aY)
	guiMoveToBack(toolTip)
	guiSetVisible(toolTip,false )
	local enginer = getElementData(getLocalPlayer(),"progress.enginer") or 0
	if enginer<i then
       guiSetSize(img4[i],5,20,false)
    else
	guiSetSize(img4[i],5,25,false)
	end
	end,false)
  
  end
local enginerPlus = guiCreateStaticImage ( 690, 200, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", enginerPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( enginerPlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", enginerPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( enginerPlus, "plus.png" )
    end,false) 
 addEventHandler( "onClientGUIClick", enginerPlus, 
    function()
	local enginer = getElementData(getLocalPlayer(),"progress.enginer") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	if enginer >= 100 then return end
	--outputChatBox("click")
	guiSetText(headline["enginerProgress"],(enginer+1).."/100")
       reloadATDProgressBar(img4,enginer,enginer+1)
	   setElementData(getLocalPlayer(),"progress.enginer",enginer+1)
    end,false)	
	
	
	
	
	
	
	
	
	
	
	
	
  local pos5 = 70
local economist = getElementData(getLocalPlayer(),"progress.economist") or 0
--local img5 ={};
  headline["economist"] = guiCreateLabel(0, 235, 750, 100,"Экономист",false,tab1)
guiSetFont (headline["economist"] , "default-bold-small" )   
guiLabelSetHorizontalAlign (headline["economist"],"center")
headline["economistProgress"] = guiCreateLabel(20, 255, 50, 40,"0/100",false,tab1)
guiSetFont (headline["economistProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["economistProgress"],"center")




    for i=1,100,1 do 
	  pos5 =pos5+ 6
 img5[i] = guiCreateStaticImage ( pos5, 255, 5, 20, "prgsBar.nil.png", false, tab1 )

    addEventHandler( "onClientMouseEnter", img5[i], 
    function(aX, aY)
	local posx,posy = guiGetPosition(img5[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		guiSetText(headline["toolTipText"],i.."/100")
		guiSetVisible(toolTip,true )
	
		guiMoveToBack(inventoryWindows)
		
		
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Стоимость продажи предмета +"..(i*0.5).."%\nАвтозаправка/Автопочинка -"..(i*0.9).."%")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)
	
	
	
		guiSetSize(img5[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img5[i], 
    function(aX, aY)
	guiMoveToBack(toolTip)
		guiSetVisible(toolTip,false )
	
	local economist = getElementData(getLocalPlayer(),"progress.economist") or 0
	if economist<i then
       guiSetSize(img5[i],5,20,false)
    else
	guiSetSize(img5[i],5,25,false)
	end
	end,false)
  
  end
local economistPlus = guiCreateStaticImage ( 690, 255, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", economistPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( economistPlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", economistPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( economistPlus, "plus.png" )
    end,false) 
 addEventHandler( "onClientGUIClick", economistPlus, 
    function()
	local economist = getElementData(getLocalPlayer(),"progress.economist") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	if economist >= 100 then return end
	--outputChatBox("click")
	guiSetText(headline["economistProgress"],(economist+1).."/100")
       reloadATDProgressBar(img5,economist,economist+1)
	   setElementData(getLocalPlayer(),"progress.economist",economist+1)
    end,false)
	
	
	
	
	
	
	
	
	-- джаггер 
	
	  local pos6 = 70
local djagernaut = getElementData(getLocalPlayer(),"progress.djagernaut") or 0
--local img5 ={};
  headline["djagernaut"] = guiCreateLabel(0, 290, 750, 100,"Джаггернаут",false,tab1)
guiSetFont (headline["djagernaut"] , "default-bold-small" )   
guiLabelSetHorizontalAlign (headline["djagernaut"],"center")
headline["djagernautProgress"] = guiCreateLabel(20, 310, 50, 40,"0/100",false,tab1)
guiSetFont (headline["djagernautProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["djagernautProgress"],"center")




    for i=1,100,1 do 
	  pos6 =pos6+ 6
 img6[i] = guiCreateStaticImage ( pos6, 310, 5, 20, "prgsBar.nil.png", false, tab1 )

    addEventHandler( "onClientMouseEnter", img6[i], 
    function(aX, aY)
	local posx,posy = guiGetPosition(img6[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		guiSetText(headline["toolTipText"],i.."/100")
		guiSetVisible(toolTip,true )
	
		guiMoveToBack(inventoryWindows)
		
		
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Получаемый урон -"..(i*0.2).."%\nУрон пулеметов +"..(i*20).."")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)
	
	
	
		guiSetSize(img6[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img6[i], 
    function(aX, aY)
	guiMoveToBack(toolTip)
		guiSetVisible(toolTip,false )
	
	local djagernaut = getElementData(getLocalPlayer(),"progress.djagernaut") or 0
	if djagernaut<i then
       guiSetSize(img6[i],5,20,false)
    else
	guiSetSize(img6[i],5,25,false)
	end
	end,false)
  
  end
local djagernautPlus = guiCreateStaticImage ( 690, 310, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", djagernautPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( djagernautPlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", djagernautPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( djagernautPlus, "plus.png" )
    end,false) 
 addEventHandler( "onClientGUIClick", djagernautPlus, 
    function()
	local djagernaut = getElementData(getLocalPlayer(),"progress.djagernaut") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	if djagernaut >= 100 then return end
	--outputChatBox("click")
	guiSetText(headline["djagernautProgress"],(djagernaut+1).."/100")
       reloadATDProgressBar(img6,djagernaut,djagernaut+1)
	   setElementData(getLocalPlayer(),"progress.djagernaut",djagernaut+1)
    end,false)
	
	
	
	
	
	
	
	
	
		-- Боец 
	
	  local pos7 = 70
local boec = getElementData(getLocalPlayer(),"progress.boec") or 0
--local img5 ={};
  headline["boec"] = guiCreateLabel(0, 345, 750, 100,"Боец",false,tab1)
guiSetFont (headline["boec"] , "default-bold-small" )   
guiLabelSetHorizontalAlign (headline["boec"],"center")
headline["boecProgress"] = guiCreateLabel(20, 365, 50, 40,"0/100",false,tab1)
guiSetFont (headline["boecProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["boecProgress"],"center")




    for i=1,100,1 do 
	  pos7 =pos7+ 6
 img7[i] = guiCreateStaticImage ( pos7, 365, 5, 20, "prgsBar.nil.png", false, tab1 )

    addEventHandler( "onClientMouseEnter", img7[i], 
    function(aX, aY)
	local posx,posy = guiGetPosition(img7[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		guiSetText(headline["toolTipText"],i.."/100")
		guiSetVisible(toolTip,true )
	
		guiMoveToBack(inventoryWindows)
		
		
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Урон оружия ближнего боя +"..(i*30).."\nУвеличение крови +"..(i*20).."")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)
	
	
	
		guiSetSize(img7[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img7[i], 
    function(aX, aY)
	guiMoveToBack(toolTip)
		guiSetVisible(toolTip,false )
	
	local boec = getElementData(getLocalPlayer(),"progress.boec") or 0
	if boec<i then
       guiSetSize(img7[i],5,20,false)
    else
	guiSetSize(img7[i],5,25,false)
	end
	end,false)
  
  end
local boecPlus = guiCreateStaticImage ( 690, 365, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", boecPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( boecPlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", boecPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( boecPlus, "plus.png" )
    end,false) 
 addEventHandler( "onClientGUIClick", boecPlus, 
    function()
	local boec = getElementData(getLocalPlayer(),"progress.boec") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	if boec >= 100 then return end
	--outputChatBox("click")
	guiSetText(headline["boecProgress"],(boec+1).."/100")
       reloadATDProgressBar(img7,boec,boec+1)
	   setElementData(getLocalPlayer(),"progress.boec",boec+1)
    end,false)
	
	
	
	--- Автомеханик
	
	  local pos8 = 70
local automech = getElementData(getLocalPlayer(),"progress.automech") or 0
--local img5 ={};
  headline["automech"] = guiCreateLabel(0, 400, 750, 100,"Автомеханик",false,tab1)
guiSetFont (headline["automech"] , "default-bold-small" )   
guiLabelSetHorizontalAlign (headline["automech"],"center")
headline["automechProgress"] = guiCreateLabel(20, 420, 50, 40,"0/100",false,tab1)
guiSetFont (headline["automechProgress"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["automechProgress"],"center")




    for i=1,100,1 do 
	  pos8 =pos8+ 6
 img8[i] = guiCreateStaticImage ( pos8, 420, 5, 20, "prgsBar.nil.png", false, tab1 )

    addEventHandler( "onClientMouseEnter", img8[i], 
    function(aX, aY)
	local posx,posy = guiGetPosition(img8[i],false)
		local wposx,wposy = guiGetPosition(inventoryWindows,false)
		guiSetPosition(toolTip,posx+wposx-110,posy+wposy+80,false)
		guiSetText(headline["toolTipText"],i.."/100")
		guiSetVisible(toolTip,true )
	
		guiMoveToBack(inventoryWindows)
		
		
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%\n")
		if i==10 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==20 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==30 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==40 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==50 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==60 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==70 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==80 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==90 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%")
		elseif i ==100 then
		guiSetText(headline["toolTipTextT"],"Вероятность взлома ТС +"..(i*0.2).."%\nАвтомеханик")
		end
		local Theight = getTextHeight(guiGetText(headline["toolTipTextT"]))
		guiSetSize(toolTip,250,20+(Theight+1)*19,false)
	
	
	
		guiSetSize(img8[i],5,30,false)
		end,false)
	
addEventHandler( "onClientMouseLeave", img8[i], 
    function(aX, aY)
	guiMoveToBack(toolTip)
		guiSetVisible(toolTip,false )
	
	local automech = getElementData(getLocalPlayer(),"progress.automech") or 0
	if automech<i then
       guiSetSize(img8[i],5,20,false)
    else
	guiSetSize(img8[i],5,25,false)
	end
	end,false)
  
  end
local automechPlus = guiCreateStaticImage ( 690, 420, 20, 20, "plus.png", false, tab1 )
addEventHandler( "onClientMouseEnter", automechPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( automechPlus, "plus.hover.png" )
    end,false)
addEventHandler( "onClientMouseLeave", automechPlus, 
    function(aX, aY)
        guiStaticImageLoadImage ( automechPlus, "plus.png" )
    end,false) 
 addEventHandler( "onClientGUIClick", automechPlus, 
    function()
	local automech = getElementData(getLocalPlayer(),"progress.automech") or 0
	local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
    if clicks <=0 then 
  outputChatBox("У вас нет очков навыков!")
return
  end
	if automech >= 100 then return end
	--outputChatBox("click")
	guiSetText(headline["automechProgress"],(automech+1).."/100")
       reloadATDProgressBar(img8,automech,automech+1)
	   setElementData(getLocalPlayer(),"progress.automech",automech+1)
    end,false)
	
	
end)

function reloadATDProgressBar(tableBar,oldDataBar,newdataBar)

  if oldDataBar >newdataBar then
  
 local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
  setElementData(getLocalPlayer(),"progress.clicks",clicks+1)
  outputChatBox("Осталось очков навыков:"..clicks+1)
  
  guiStaticImageLoadImage ( tableBar[oldDataBar], "prgsBar.nil.png" )
guiSetSize(tableBar[oldDataBar],5,20,false)
   local posx,posy = guiGetPosition(tableBar[oldDataBar],false)
  guiSetPosition(tableBar[oldDataBar],posx,posy+2.4,false)

  else

   local clicks=  getElementData(getLocalPlayer(),"progress.clicks") or 0
  setElementData(getLocalPlayer(),"progress.clicks",clicks-1)
  local clicksOFF=  getElementData(getLocalPlayer(),"progress.clicksOFF") or 0
  setElementData(getLocalPlayer(),"progress.clicksOFF",clicksOFF+1)

  outputChatBox("Осталось очков навыков:"..clicks-1)
  
   guiStaticImageLoadImage ( tableBar[newdataBar], "prgsBar.full.png" )
  guiSetSize(tableBar[newdataBar],5,25,false)
  local posx,posy = guiGetPosition(tableBar[newdataBar],false)
  guiSetPosition(tableBar[newdataBar],posx,posy-2.5,false)
  end
end
  function createProgressWin()

if guiGetVisible(inventoryWindows) then
guiSetVisible(inventoryWindows,false )
guiSetVisible(toolTip,false )
showCursor(false)
return
else
guiSetVisible(inventoryWindows,true )
showCursor(true)
end
local nick = getPlayerName ( getLocalPlayer())
guiSetText(inventoryWindows,"Игрок:"..nick)

	local attack_plane = getElementData(getLocalPlayer(),"progress.attacker") or 0
  for i=1,100,1 do 
 if attack_plane >=i then
 guiStaticImageLoadImage ( img[i], "prgsBar.full.png" )
 
   guiSetSize(img[i],5,25,false)
  local posx,posy = guiGetPosition(img[i],false)
  guiSetPosition(img[i],posx,35-2.5,false)
end

end
guiSetText(headline["attack_planeProgress"],attack_plane.."/100")

	local medik = getElementData(getLocalPlayer(),"progress.medik") or 0
  for i=1,100,1 do 
 if medik >=i then
 guiStaticImageLoadImage ( img2[i], "prgsBar.full.png" )
 
   guiSetSize(img2[i],5,25,false)
  local posx,posy = guiGetPosition(img2[i],false)
  guiSetPosition(img2[i],posx,90-2.5,false)
end

end
guiSetText(headline["medikProgress"],medik.."/100")

local sniper = getElementData(getLocalPlayer(),"progress.sniper") or 0

  for i=1,100,1 do 
 if sniper >=i then
 guiStaticImageLoadImage ( img3[i], "prgsBar.full.png" )
 
   guiSetSize(img3[i],5,25,false)
  local posx,posy = guiGetPosition(img3[i],false)
  guiSetPosition(img3[i],posx,145-2.5,false)
end

end
guiSetText(headline["sniperProgress"],sniper.."/100")

local enginer = getElementData(getLocalPlayer(),"progress.enginer") or 0 
  for i=1,100,1 do 
 if enginer >=i then
 guiStaticImageLoadImage ( img4[i], "prgsBar.full.png" )
 
   guiSetSize(img4[i],5,25,false)
  local posx,posy = guiGetPosition(img4[i],false)
  guiSetPosition(img4[i],posx,200-2.5,false)
end

end
guiSetText(headline["enginerProgress"],enginer.."/100")

local economist = getElementData(getLocalPlayer(),"progress.economist") or 0 
  for i=1,100,1 do 
 if economist >=i then
 guiStaticImageLoadImage ( img5[i], "prgsBar.full.png" )
 
   guiSetSize(img5[i],5,25,false)
  local posx,posy = guiGetPosition(img5[i],false)
  guiSetPosition(img5[i],posx,255-2.5,false)
end

end
guiSetText(headline["economistProgress"],economist.."/100")


local djagernaut = getElementData(getLocalPlayer(),"progress.djagernaut") or 0 
  for i=1,100,1 do 
 if djagernaut >=i then
 guiStaticImageLoadImage ( img6[i], "prgsBar.full.png" )
 
   guiSetSize(img6[i],5,25,false)
  local posx,posy = guiGetPosition(img6[i],false)
  guiSetPosition(img6[i],posx,310-2.5,false)
end

end
guiSetText(headline["djagernautProgress"],djagernaut.."/100")


local boec = getElementData(getLocalPlayer(),"progress.boec") or 0 
  for i=1,100,1 do 
 if boec >=i then
 guiStaticImageLoadImage ( img7[i], "prgsBar.full.png" )
 
   guiSetSize(img7[i],5,25,false)
  local posx,posy = guiGetPosition(img7[i],false)
  guiSetPosition(img7[i],posx,365-2.5,false)
end




end
guiSetText(headline["boecProgress"],boec.."/100")



local automech = getElementData(getLocalPlayer(),"progress.automech") or 0 
  for i=1,100,1 do 
 if automech >=i then
 guiStaticImageLoadImage ( img8[i], "prgsBar.full.png" )
 
   guiSetSize(img8[i],5,25,false)
  local posx,posy = guiGetPosition(img8[i],false)
  guiSetPosition(img8[i],posx,420-2.5,false)
end

end
guiSetText(headline["automechProgress"],automech.."/100")





local clicks = getElementData(getLocalPlayer(),"progress.clicks") or 0
guiSetText(headline["ochko1_t"],clicks)
local clicks = getElementData(getLocalPlayer(),"progress.clicksOFF") or 0
guiSetText(headline["ochko2_t"],clicks)

local lvl = getElementData(getLocalPlayer(),"playerlvl") or 0
guiSetText(headline["ochko3_t"],lvl)
local playerexp = getElementData(getLocalPlayer(),"playerexp") or 0
guiSetText(headline["ochko4_t"],playerexp)
guiSetText(headline["ochko5_t"],(lvl*1200)+1200)

local accZombieskilledMax = getElementData ( getLocalPlayer(), "stat.zombieskilledMax") or 0
guiSetText(headline["ochko6_t"],accZombieskilledMax)
local accMurdersMax = getElementData ( getLocalPlayer(), "stat.murdersMax") or 0
guiSetText(headline["ochko7_t"],accMurdersMax)
local accBanditskilledMax = getElementData ( getLocalPlayer(), "stat.banditskilledMax") or 0
guiSetText(headline["ochko8_t"],accBanditskilledMax)
local accAlivetimeMax = getElementData ( getLocalPlayer(), "stat.alivetimeMax") or 0
guiSetText(headline["ochko9_t"],roundTime(accAlivetimeMax))

local accZombieskilled = getElementData ( getLocalPlayer(), "stat.zombieskilled") or 0
guiSetText(headline["ochko10_t"],accZombieskilled)
local accMurders = getElementData ( getLocalPlayer(), "stat.murders") or 0
guiSetText(headline["ochko11_t"],accMurders)
local accBanditskilled = getElementData ( getLocalPlayer(), "stat.banditskilled") or 0
guiSetText(headline["ochko12_t"],accBanditskilled)
local accAlivetime = getElementData ( getLocalPlayer(), "stat.alivetime") or 0
guiSetText(headline["ochko13_t"],roundTime(accAlivetime))
end

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),
    function ( startedRes )
	toolTip = guiCreateStaticImage ( 0, 0, 250, 100, "black.png", false )
headline["toolTipText"] = guiCreateLabel(0, 0, 250, 20,"ТЕКСТ",false,toolTip)
guiSetFont (headline["toolTipText"] , "default-bold-small" ) 
guiLabelSetHorizontalAlign (headline["toolTipText"],"center")

headline["toolTipTextT"] = guiCreateLabel(0, 20, 250, 80,"ТЕКСТ",false,toolTip)
guiSetFont (headline["toolTipTextT"] , "default-bold" ) 
guiLabelSetHorizontalAlign (headline["toolTipTextT"],"center")
guiSetVisible(toolTip,false )
	end
	)



	

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function roundTime(value)
	if value then
local hours = math.floor(value/60) -- Получаем количество полных часов
local minutes = value - (hours*60) -- Получаем оставшиеся минуты	
	if minutes <= 9 then 
	minutes = "0"..minutes
	end
		value = hours..":"..minutes
		return value
	end
	return false
end

local antiSpamTimer2 = {}
function setAntiSpamActive2()
  if not isTimer(antiSpamTimer2) then
    antiSpamTimer2 = setTimer(killAntiSpamTimer2, 1000, 1)
  else
    killTimer(antiSpamTimer2)
    antiSpamTimer2 = setTimer(killAntiSpamTimer2, 1000, 1)
  end
end
function isSpamTimer2()
  if isTimer(antiSpamTimer2) then
    do
   --   local t = getTimerDetails(antiSpamTimer2)
      outputChatBox("Не нажимайте слишком часто!")
      return true
    end
  else
    return false
  end
end
function killAntiSpamTimer2()
  killTimer(antiSpamTimer2)
end



function showInventory (key,keyState)
if getElementData(getLocalPlayer(),"logedin") then
	if ( keyState == "down" ) then
	
			 if isSpamTimer2() then
      return
	  else
	   setAntiSpamActive2()
    end
	
	createProgressWin()
	end
end	
end
bindKey ( "f3", "down", showInventory ) 