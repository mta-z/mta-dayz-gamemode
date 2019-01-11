
function setDayzSettings ()

setElementData(getRootElement(),"checkPing",true)
setElementData(getRootElement(),"checkBTNFLOOD",true) 
setElementData(getRootElement(),"checkPacketlossLastSecond",true)
setElementData(getRootElement(),"checkMessagesInResendBuffer",false)

setElementData(getRootElement(),"pingMAX",1000)
setElementData(getRootElement(),"MAXpacketlossLastSecond",30)
setElementData(getRootElement(),"MAXmessagesInResendBuffer",20)

setTrafficLightState("disabled") -- отключение светофоров

setFPSLimit ( 80 )     

setModelHandling ( 481, "maxVelocity", 50 ) -- BMX
setModelHandling ( 510, "maxVelocity", 50 ) -- горный 
setModelHandling(516, "engineAcceleration", 10) -- mers
setModelHandling ( 516, "maxVelocity", 200 ) -- mers
setModelHandling(471, "engineAcceleration", 14) -- квадрик
setModelHandling ( 471, "maxVelocity", 120 ) -- квадрик
setModelHandling ( 509, "maxVelocity", 40 ) -- обычный велик
setWaterColor (111,255,255,120) --цвет воды 
setWaveHeight ( 0.5) -- высота волн
setGlitchEnabled ( "hitanim", true ) -- анимация при попадении
setGlitchEnabled ( "fastsprint", true ) -- бег 
setCloudsEnabled ( false ) -- облака


end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), setDayzSettings)