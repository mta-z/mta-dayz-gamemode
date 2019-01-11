local ping = getPlayerPing(getLocalPlayer())
local x, y = guiGetScreenSize ( )

r,g,b=0,0,0
alpha=150


local root = getRootElement()
local counter = 0
local fps = 0
local starttick
local currenttick
addEventHandler("onClientRender",root,
	function()
		if not starttick then
			starttick = getTickCount()
		end
		counter = counter + 1
		currenttick = getTickCount()
		if currenttick - starttick >= 1000 then
		fps=counter
		setElementData(getLocalPlayer(),"FPS",fps)
			counter = 0
			starttick = false
		end
		local Text= "FPS:"..fps.." | PING:"..getPlayerPing(getLocalPlayer())
		
	local floatText= dxGetTextWidth ( Text )
		dxDrawText ( Text, x-floatText-10, 1, 100, 100, tocolor ( 255, 255, 255, 255 ), 0.9, "default","left", "top",false, false, true )
	end
)

function setPINGFPS()
setElementData(getLocalPlayer(),"FPS",fps)
end
setTimer(setPINGFPS,5000,0)




