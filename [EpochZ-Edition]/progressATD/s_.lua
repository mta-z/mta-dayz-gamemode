
local STAT ={
{"stat.murders"},
{"stat.zombieskilled"},
{"stat.banditskilled"},
{"stat.alivetime"},
{"stat.murdersMax"},
{"stat.zombieskilledMax"},
{"stat.banditskilledMax"},
{"stat.alivetimeMax"},

{"progress.medik"},
{"progress.attacker"},
{"progress.sniper"},
{"progress.clicks"},
{"progress.enginer"},
{"progress.economist"},
{"progress.djagernaut"},
{"progress.automech"},
{"progress.boec"},
{"progress.clicksOFF"},
}
function STATo()

local account = getPlayerAccount(source)
				for i,data in ipairs(STAT) do
					local elementData = getAccountData(account,data[1])
					
				
					setElementData(source,data[1],elementData)
				end

end
addEventHandler("onPlayerLogin", root,STATo)


function STATn()

				local account = getPlayerAccount(source)
	if account then
	for i,data in ipairs(STAT) do
		setAccountData(account,data[1],getElementData(source,data[1]))
	end

end
end
addEventHandler("onPlayerQuit", root,STATn)

