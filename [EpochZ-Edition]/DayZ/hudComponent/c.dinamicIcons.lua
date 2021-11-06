local iconsSizes = {
{"small",40},
{"standart",50},
{"big",60}
}





local iconsRight = 10-9
local iSiz = 50 
local bottonTop = 30
local topPlus = iSiz+20
local iconTextColor = {255,255,255,255}
local fading = 0
local fading2 = "up"
local textSize = 1
local textFont = "default"
local screenWidth,screenHeight = gameplayVariables["screenSize"][1],gameplayVariables["screenSize"][2]

function updateIcons ()
if not getElementData(localPlayer,"logedin") then return end
if getElementData(localPlayer,"isDead") then return end


	--fading
	if fading >= 0 and fading2 == "up" then
		fading = fading + 5
	elseif fading <= 255 and fading2 == "down" then
		fading = fading - 5
	end
	--fading math.
	if fading == 0 then
		fading2 = "up"
	elseif fading == 255 then
		fading2 = "down"
	end
	
	


	--food
	r,g,b = 78,107,58
	local food = getElementData(localPlayer,"food") or 0 
	local r = (93 - 134)/100
	local newr = 134+r*food
	
	local g = (141 - 89)/100
	local newg = 89+g*food
	
	local b = (72 - 69)/100
	local newb = 69+b*food
	r,g,b = math.floor(newr),math.floor(newg),math.floor(newb)
			local FoodTextDraw = math.floor(food).."%"
		local textDrawWidth = dxGetTextWidth ( FoodTextDraw,textSize , textFont, false )
		local fontHeight = dxGetFontHeight ( textSize , textFont )


height=math.floor(food*iSiz/100) -- высота 100*48/100 = 48 
rcox=math.floor(food*iSiz/100-iSiz) -- позиция отрисовки сверху
vsize=math.floor(food*50/100)
v=math.floor(50-food*50/100)
if food<=10 then r,g,b,a = 255,0,0,fading elseif food<=20 then r,g,b,a = r,g,b,fading else r,g,b,a=r,g,b,255 end
dxDrawImage ( screenWidth-iconsRight-iSiz , screenHeight-(iSiz+bottonTop), iSiz, iSiz, "images/dayzicons/eat/0.png",0,0,0,tocolor(r,g,b,a))

dxDrawImageSection ( screenWidth-iconsRight-iSiz , screenHeight-(iSiz+bottonTop)-rcox, iSiz,height,0,v, 50,vsize, "images/dayzicons/eat/100.png",0,0,0,tocolor(r,g,b,a) )

dxDrawText ( FoodTextDraw , (((screenWidth-iSiz/2)-iconsRight)-textDrawWidth/2), screenHeight-(iSiz+bottonTop)+iSiz, (screenWidth-iconsRight),screenHeight-(iSiz+bottonTop)+iSiz+fontHeight, tocolor ( iconTextColor[1],iconTextColor[2],iconTextColor[3],iconTextColor[4] ), textSize, textFont,"left","top",false,false,false,true)
		
		
	--blood
	r,g,b = 0,255,0
	
	local blood = getElementData(localPlayer,"blood") or 0
	local progressMedik = getElementData(localPlayer,"progress.medik") or 0
	local progressBoec = getElementData(localPlayer,"progress.boec") or 0
	local maxBlood = (12000+((progressMedik*60)+(progressBoec*20)))
	bloodPercent = blood*100/maxBlood

	local r = (93 - 134)/100
	local newr = 134+r*bloodPercent
	
	local g = (141 - 89)/100
	local newg = 89+g*bloodPercent
	
	local b = (72 - 69)/100
	local newb = 69+b*bloodPercent
	r,g,b = math.floor(newr),math.floor(newg),math.floor(newb)
		local BloodTextDraw = math.floor(blood)
		local textDrawWidth = dxGetTextWidth ( BloodTextDraw, textSize, textFont, false )

height=math.floor(bloodPercent*iSiz/100) -- высота 100*48/100 = 48 
rcox=math.floor(bloodPercent*iSiz/100-iSiz) -- позиция отрисовки сверху
vsize=math.floor(bloodPercent*50/100)
v=math.floor(50-bloodPercent*50/100)
if bloodPercent<=10 then r,g,b,a = 255,0,0,fading elseif bloodPercent<=20 then r,g,b,a = r,g,b,fading else r,g,b,a=r,g,b,255 end
dxDrawImage ( screenWidth-iconsRight-iSiz , screenHeight-(iSiz+bottonTop)-topPlus*1, iSiz, iSiz, "images/dayzicons/blood/0.png",0,0,0,tocolor(r,g,b,a))

dxDrawImageSection ( screenWidth-iconsRight-iSiz , screenHeight-(iSiz+bottonTop)-topPlus*1-rcox, iSiz,height,0,v, 50,vsize, "images/dayzicons/blood/100.png",0,0,0,tocolor(r,g,b,a) )

dxDrawText ( BloodTextDraw , (((screenWidth-iSiz/2)-iconsRight)-textDrawWidth/2), screenHeight-(iSiz+bottonTop)+iSiz-topPlus*1, (screenWidth-iconsRight),screenHeight-(iSiz+bottonTop)+iSiz+fontHeight, tocolor ( iconTextColor[1],iconTextColor[2],iconTextColor[3],iconTextColor[4] ), textSize, textFont,"left","top",false,false,false,true)
	

	if getElementData(localPlayer,"bleeding") > 0 then
		dxDrawImage ( screenWidth-iconsRight-iSiz , screenHeight-(iSiz+bottonTop)-topPlus*1, iSiz, iSiz, "images/dayzicons/medic.png",0,0,0,tocolor(255,255,255,fading))
	end


	--thirsty
	r,g,b = 0,255,0
	
	local thirst = getElementData(localPlayer,"thirst") or 0
	local r = (93 - 134)/100
	local newr = 134+r*thirst
	
	local g = (141 - 89)/100
	local newg = 89+g*thirst
	
	local b = (72 - 69)/100
	local newb = 69+b*thirst
	r,g,b = math.floor(newr),math.floor(newg),math.floor(newb)
			local ThirstTextDraw = math.floor(thirst).."%"
		local textDrawWidth = dxGetTextWidth ( ThirstTextDraw, textSize, textFont, false )
		

height=math.floor(thirst*iSiz/100) -- высота 100*48/100 = 48 
rcox=math.floor(thirst*iSiz/100-iSiz) -- позиция отрисовки сверху
vsize=math.floor(thirst*50/100)
v=math.floor(50-thirst*50/100)
if thirst<=10 then r,g,b,a = 255,0,0,fading elseif thirst<=20 then r,g,b,a = r,g,b,fading else r,g,b,a=r,g,b,255 end
dxDrawImage ( screenWidth-iconsRight-iSiz , screenHeight-(iSiz+bottonTop)-topPlus*2, iSiz, iSiz, "images/dayzicons/drink/0.png",0,0,0,tocolor(r,g,b,a))

dxDrawImageSection ( screenWidth-iconsRight-iSiz , screenHeight-(iSiz+bottonTop)-topPlus*2-rcox, iSiz,height,0,v, 50,vsize, "images/dayzicons/drink/100.png",0,0,0,tocolor(r,g,b,a) )

dxDrawText ( ThirstTextDraw , (((screenWidth-iSiz/2)-iconsRight)-textDrawWidth/2), screenHeight-(iSiz+bottonTop)+iSiz-topPlus*2, (screenWidth-iconsRight),screenHeight-(iSiz+bottonTop)+iSiz+fontHeight, tocolor ( iconTextColor[1],iconTextColor[2],iconTextColor[3],iconTextColor[4] ), textSize, textFont,"left","top",false,false,false,true)
	

	--bandit	
local drawhumanity	= getElementData(localPlayer,"humanity") or 0
if drawhumanity>=-1000 and drawhumanity<2500 then
	dxDrawImage ( screenWidth-iconsRight-iSiz+1.5 , screenHeight-(iSiz+bottonTop)-topPlus*3, iSiz, iSiz, "images/dayzicons/bandit/0.png",0,0,0,tocolor(93,141,72))
elseif drawhumanity>=2500 and drawhumanity<3500 then
	dxDrawImage ( screenWidth-iconsRight-iSiz+1.5 , screenHeight-(iSiz+bottonTop)-topPlus*3, iSiz, iSiz, "images/dayzicons/bandit/2500.png",0,0,0,tocolor(93,141,72))
elseif drawhumanity>=3500 and drawhumanity<5000 then
	dxDrawImage ( screenWidth-iconsRight-iSiz+1.5 , screenHeight-(iSiz+bottonTop)-topPlus*3, iSiz, iSiz, "images/dayzicons/bandit/3500.png",0,0,0,tocolor(93,141,72))
elseif drawhumanity>=5000 then
	dxDrawImage ( screenWidth-iconsRight-iSiz+1.5 , screenHeight-(iSiz+bottonTop)-topPlus*3, iSiz, iSiz, "images/dayzicons/bandit/5000.png",0,0,0,tocolor(93,141,72))
elseif drawhumanity<=-1000 and drawhumanity>-2500  then
	dxDrawImage ( screenWidth-iconsRight-iSiz+1.5 , screenHeight-(iSiz+bottonTop)-topPlus*3, iSiz, iSiz, "images/dayzicons/bandit/-1000.png",0,0,0,tocolor(93,141,72))	
elseif drawhumanity<=-2500 then
	dxDrawImage ( screenWidth-iconsRight-iSiz+1.5 , screenHeight-(iSiz+bottonTop)-topPlus*3, iSiz, iSiz, "images/dayzicons/bandit/-2500.png",0,0,0,tocolor(93,141,72))	
end
					
		local humanityTextDraw = tostring(math.floor(drawhumanity))
		local textDrawWidth = dxGetTextWidth ( humanityTextDraw, textSize, textFont, false )	
		dxDrawText ( humanityTextDraw , (((screenWidth-iSiz/2)-iconsRight)-textDrawWidth/2), screenHeight-(iSiz+bottonTop)+iSiz-topPlus*3, (screenWidth-iconsRight),screenHeight-(iSiz+bottonTop)+iSiz+fontHeight, tocolor ( iconTextColor[1],iconTextColor[2],iconTextColor[3],iconTextColor[4] ), textSize, textFont,"left","top",false,false,false,true )
		
	
	--helmet
	local helmetPlayer = getElementData(localPlayer,"clotType_1") or false
	if helmetPlayer and helmetPlayer~=0 then
	
	local profit = getElementData(localPlayer,"clotProfit_1") or 0
		dxDrawImage ( screenWidth-iconsRight-iSiz-(iSiz+5) , screenHeight-(iSiz+bottonTop), iSiz, iSiz, "images/dayzicons/helmet.png",0,0,0,tocolor(93,141,72))
	local helmetTextDraw = math.floor(profit).."%"
	local textDrawWidth = dxGetTextWidth ( helmetTextDraw, textSize, textFont, false )
	dxDrawText ( helmetTextDraw  , (((screenWidth-iSiz/2)-iconsRight)-textDrawWidth/2)-(iSiz+5), screenHeight-(iSiz+bottonTop)+iSiz, (screenWidth-iconsRight),screenHeight-(iSiz+bottonTop)+iSiz+fontHeight, tocolor ( iconTextColor[1],iconTextColor[2],iconTextColor[3],iconTextColor[4] ), textSize, textFont,"left","top",false,false,false,true )
	end
	
	--armor
	local armorPlayer = getElementData(localPlayer,"clotType_2") or false
	if armorPlayer and armorPlayer~=0 then
	local profit = getElementData(localPlayer,"clotProfit_2") or 0
		dxDrawImage ( screenWidth-iconsRight-iSiz-(iSiz+5) , screenHeight-(iSiz+bottonTop)-topPlus*1, iSiz, iSiz, "images/dayzicons/armor.png",0,0,0,tocolor(93,141,72))
	local armorTextDraw = math.floor(profit).."%"
	local textDrawWidth = dxGetTextWidth ( armorTextDraw, textSize, textFont, false )
	dxDrawText ( armorTextDraw  , (((screenWidth-iSiz/2)-iconsRight)-textDrawWidth/2)-(iSiz+5), screenHeight-(iSiz+bottonTop)+iSiz-topPlus*1, (screenWidth-iconsRight),screenHeight-(iSiz+bottonTop)+iSiz+fontHeight, tocolor ( iconTextColor[1],iconTextColor[2],iconTextColor[3],iconTextColor[4] ), textSize, textFont,"left","top",false,false,false,true )
	
	end
	
	--infection	
	local infection = getElementData(localPlayer,"infection") or false
	if infection then
		dxDrawImage ( screenWidth-iconsRight-iSiz-(iSiz+5) , screenHeight-(iSiz+bottonTop)-topPlus*2, iSiz, iSiz, "images/dayzicons/bio.png",0,0,0,tocolor(200,0,0,fading))
	end
	
	if getElementData(localPlayer,"brokenbone") then
		dxDrawImage ( screenWidth-iconsRight-iSiz-(iSiz+5) , screenHeight-(iSiz+bottonTop)-topPlus*3, iSiz, iSiz, "images/dayzicons/brokenbone.png",0,0,0,tocolor(255,255,255,fading))
	end

end
addEventHandler ( "onClientRender", getRootElement(), updateIcons )


function setSize(cm,r,s)
 iconsRight = r-9
 iSiz = s 
 textSize = iSiz*1/50
 topPlus = iSiz+20
end
addCommandHandler("iconsSize",setSize)


function setIconsSize(size)
for index, iconsSize in ipairs(iconsSizes) do
			if size== iconsSize[1] then
			iSiz = iconsSize[2] 
			textSize = iSiz*1/50
			topPlus = iSiz+20
			
	local showingIcons  = isEventHandlerAdded('onClientRender', getRootElement(), updateIcons)
	if not showingIcons  then
	addEventHandler ( "onClientRender", getRootElement(), updateIcons )
	end
	
				return
			end
		end
end