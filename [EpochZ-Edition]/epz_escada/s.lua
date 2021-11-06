function setStairAnima(typeanim,player)
if typeanim ==1 then
setPedAnimation ( player, "ped", "FIGHTIDLE", -1, true, true, false, false )
elseif typeanim ==2 then
setPedAnimation(player)
end
end

addEvent("setStairAnima", true)
addEventHandler("setStairAnima", getRootElement(), setStairAnima)


addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
		setPedAnimation(source)
	end
)