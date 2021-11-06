local function setPlayerMoveSpeed()
if getElementData(localPlayer,"brokenbone") then return end
   if getKeyState("space") then
      if getKeyState("w") or getKeyState("a") or getKeyState("s") or getKeyState("d") then
         setPedControlState("sprint", not getPedControlState("sprint"))
      end
   end
end

addEventHandler("onClientResourceStart", getResourceRootElement( getThisResource() ), function()
   triggerServerEvent("setFastSprintStatus", resourceRoot, true)
   setTimer(
            function()
               addEventHandler("onClientRender", root, setPlayerMoveSpeed)
            end
   , 2000, 1)
end)

addEventHandler("onClientResourceStop", getResourceRootElement( getThisResource() ), function()
   triggerServerEvent("setFastSprintStatus", resourceRoot, false)
   removeEventHandler("onClientRender", root, setPlayerMoveSpeed)
end)