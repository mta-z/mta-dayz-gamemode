
function setDayzSettings ()

setElementData(getRootElement(),"checkPing",true)
setElementData(getRootElement(),"checkBTNFLOOD",true) 
setElementData(getRootElement(),"checkPacketlossLastSecond",true)
setElementData(getRootElement(),"checkMessagesInResendBuffer",false)

setElementData(getRootElement(),"pingMAX",1000)
setElementData(getRootElement(),"MAXpacketlossLastSecond",30)
setElementData(getRootElement(),"MAXmessagesInResendBuffer",20)

setTrafficLightState("disabled") -- desligando semáforos

setFPSLimit ( 65 )     

setModelHandling ( 481, "maxVelocity", 50 ) -- BMX
setModelHandling ( 510, "maxVelocity", 50 ) -- montanha 
setModelHandling(516, "engineAcceleration", 10) -- andando
setModelHandling ( 516, "maxVelocity", 200 ) -- andando
setModelHandling(471, "engineAcceleration", 14) -- quádrica
setModelHandling ( 471, "maxVelocity", 120 ) -- quádrica
setModelHandling ( 509, "maxVelocity", 40 ) -- обычный велик
setWaterColor (111,255,255,120) --cor da água
setWaveHeight ( 0.5) -- altura da onda
setGlitchEnabled ( "hitanim", true ) -- animação de sucesso
setGlitchEnabled ( "fastsprint", true ) -- corre 
setCloudsEnabled ( false ) -- nuvens


end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), setDayzSettings)