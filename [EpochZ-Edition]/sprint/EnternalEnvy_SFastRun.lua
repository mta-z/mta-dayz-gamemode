addEvent("setFastSprintStatus", true)
addEventHandler("setFastSprintStatus", resourceRoot, function(status)
   if type(status) == "boolean" then
      setGlitchEnabled("fastsprint", status)
   end
end)