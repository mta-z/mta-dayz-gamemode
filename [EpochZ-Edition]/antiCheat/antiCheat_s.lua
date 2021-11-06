function isAdmin(player)
local acc = getPlayerAccount(player)
local accName = getAccountName(acc)
			local isAdmin = isObjectInACLGroup("user."..accName,aclGetGroup("Admin"))
			if isAdmin then
				return true
			end
			return false
end

function cheaterBan(reason,reasonId)
local cheaterSerial = getPlayerSerial( source )
if not isAdmin(source) then
addBan( nil, nil, cheaterSerial, nil, "Trapaceiro("..reasonId.."), Para sempre, sem uma pausa" )
end
outputDebugString("BanCheater("..reason.."): "..cheaterSerial)
exports.logger:setLog("BanCheater("..reason.."): "..cheaterSerial)
end
addEvent( "cheaterBan", true )
addEventHandler( "cheaterBan", getRootElement(), cheaterBan )



function checkTimeCheat()
local serverTime = getRealTime()
triggerClientEvent("checkTimeCheat",resourceRoot,serverTime.hour,serverTime.minute)
end
--setTimer(checkTimeCheat,30000,0)
