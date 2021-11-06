function checkResolutionOnStart ()
	local x,y = guiGetScreenSize() 
	 triggerServerEvent ( "setScreenResolution", resourceRoot, x.."x"..y)
end
addEventHandler ( "onClientResourceStart", resourceRoot, checkResolutionOnStart )