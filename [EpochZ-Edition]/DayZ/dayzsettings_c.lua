function setSettingsClient()
setBirdsEnabled ( false )
setPedTargetingMarkerEnabled(false)
setTrafficLightState("disabled")
end


addEventHandler( "onClientResourceStart", resourceRoot,setSettingsClient)

