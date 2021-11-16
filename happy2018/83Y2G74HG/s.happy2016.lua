local happyRANDOM = {
    {"Garrafa de agua"},
    {"Lata de Marcarrão"},
    {"Lata de Feijão"},
    {"Hambúrguer"},
    {"Pizza"},
    {"Garrafa de Água Com Gás Completo"},
    {"Cola"},
    {"Carne grelhada"},
    {"Peixe Frito"},
    {"Ração Seca Grande"},
    {"Ração Seca Pequena"},
    {"Vara de Pesca"},
    {"Ôculos de Visão Noturna"},
    {"Ôculos de Visão Infravermelha"},
    {"Mapa"},
    {"GPS"},
    {"Caixa de Ferramentas"},
    {"Algema"},

}
local gifts={
{"Mk 48 Mod 0",1},
{"KSVK",1},
{"G36C-SD",1},
{"M4A1 SD",1},
{"Money",500000},
{"M4A1 mag",400},
{"KSVK mag",200},
{"G36 mag",400},
{"M240 Belt",1000},
{"MAX_Slots",500},
}

function setGift(player)

for id, item in ipairs(happyRANDOM) do
local rgift = math.random(1,3)
if rgift ==2 then
local rvalue = math.random(1,5)
local elementsInPlayer= getElementData(player,item[1]) or 0
setElementData(player,item[1],elementsInPlayer+rvalue)
outputChatBox("Feliz Ano Novo!Presente: "..rvalue.."Pacotes. "..item[1],player)
end

end

for id, item in ipairs(gifts) do
local elementsInPlayer= getElementData(player,item[1]) or 0
setElementData(player,item[1],elementsInPlayer+item[2])
outputChatBox("Feliz Ano Novo!Presente: "..item[2].."Pacotes "..item[1],player)
end
local sanki = exports.epz_carspawner:CarSpawner ( player, "spawnCar", 571 )

setElementData(sanki,"owner",getAccountName(getPlayerAccount ( player )))
setElementData(sanki,"ownerNick",getPlayerName(player))
setElementData(sanki,"ownerSerial",getPlayerSerial(player))

setTimer( function() warpPedIntoVehicle(player,sanki) end,100,1)

end




addEventHandler("onResourceStart", resourceRoot, function()

executeSQLQuery("CREATE TABLE IF NOT EXISTS `happySerials` (`serial` TEXT)")

end)




function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

function checkSerial()
local serial = getPlayerSerial(source)
local serialOK = executeSQLQuery("SELECT * FROM `happySerials` WHERE `serial` =?",tostring(serial))
if table.size(serialOK) >0 then -- esse serial já está na database
outputChatBox("Você já recebeu seu presente!",source,255,0,0)
else
setGift(source)
executeSQLQuery("INSERT INTO `happySerials`(`serial`) VALUES(?)", tostring(serial) )
end
end

addEvent("checkSerial", true)
addEventHandler("checkSerial", getRootElement(), checkSerial)