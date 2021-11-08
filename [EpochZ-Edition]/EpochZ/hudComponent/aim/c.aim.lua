local texture,sh

sh = dxCreateShader(":EpochZ/hudComponent/aim/texreplace.fx")
	engineApplyShaderToWorldTexture(sh, "siteM16")

function selectAIM(aim)

		if not aim then aim=1 end
		texture = dxCreateTexture(":EpochZ/hudComponent/aim/img/"..aim..".png","argb",false);
		dxSetShaderValue(sh, "gTexture", texture)
end	


	
