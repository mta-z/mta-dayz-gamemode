function loadBansMuts(typeExport )
local exportBansMuts = false
--outputChatBox("SERVER: loadBansMuts typeaa:"..typeExport)
if tonumber(typeExport)==1 then
--outputDebugString("getBanans")
exportBansMuts = exports.epz_siteinter:getBanans()
else
--outputDebugString("getMutes")
exportBansMuts = exports.epz_siteinter:getMutes()
end

triggerClientEvent( source, "onloadBansMuts", source, exportBansMuts,typeExport )
end

addEvent( "loadBansMuts", true )
addEventHandler( "loadBansMuts", getRootElement(), loadBansMuts )


