local shader, technique = dxCreateShader ( "imagequality.fx" )
cswpScreenWidth, cswpScreenHeight = guiGetScreenSize()
cswpScreenSource = dxCreateScreenSource(cswpScreenWidth, cswpScreenHeight)

local saturation = 0.8
function updateShaders()
	local blood = getElementData(localPlayer,"blood") or 0
	local progressMedik = getElementData(localPlayer,"progress.medik") or 0
	local progressBoec = getElementData(localPlayer,"progress.boec") or 0
	local maxBlood = (12000+((progressMedik*60)+(progressBoec*20)))
	bloodPercent = blood*100/maxBlood
	if bloodPercent<=30 and bloodPercent>= 0 then
	saturation = bloodPercent*0.8/30
	dxSetShaderValue ( shader, "saturation", saturation)
	--outputDebugString(bloodPercent)
	elseif bloodPercent>=30 and saturation~=0.8 then
	saturation = 0.8
	dxSetShaderValue ( shader, "saturation", saturation)
	end
dxUpdateScreenSource(cswpScreenSource)
dxSetShaderValue ( shader, "godray", cswpScreenSource)

dxDrawImage(0, 0, cswpScreenWidth, cswpScreenHeight, shader)
--dxDrawRectangle  (  0, 0, cswpScreenWidth, cswpScreenHeight ,tocolor(0,15,30 ,80)  )
end
addEventHandler("onClientPreRender", root, updateShaders)