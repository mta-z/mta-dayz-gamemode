local texture,sh

sh = dxCreateShader(":DayZATD/hudComponent/aim/texreplace.fx")
	engineApplyShaderToWorldTexture(sh, "siteM16")

function selectAIM(aim)

		if not aim then aim=1 end
		texture = dxCreateTexture(":DayZATD/hudComponent/aim/img/"..aim..".png","argb",false);
		dxSetShaderValue(sh, "gTexture", texture)
end	


	
